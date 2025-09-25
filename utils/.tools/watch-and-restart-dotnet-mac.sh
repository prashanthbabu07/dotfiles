#!/bin/zsh

PORT=${2:-5093}        # Port to kill (default 5093 if not passed)
RUN_PATH="$1"          # Directory where dotnet run will be executed
DEBOUNCE=2             # Seconds to wait after a change before restarting

if [[ -z "$RUN_PATH" ]]; then
    echo "Usage: $0 <dotnet_run_path> [port]"
    exit 1
fi

kill_dotnet_port() {
    PIDS=($(lsof -ti tcp:$PORT))
    if [[ ${#PIDS[@]} -gt 0 ]]; then
        echo "Killing process(es) on port $PORT: ${PIDS[@]}"
        kill -9 ${PIDS[@]}
    fi
}

restart_dotnet_run() {
    kill_dotnet_port
    (cd "$RUN_PATH" && dotnet run) &
    RUN_PID=$!
}

# Initial start
restart_dotnet_run

# Watch .cs files recursively from current directory and debounce rapid events
while true; do
    fswatch -r --event Updated --event Created --event Removed --include '.*\.cs$' --exclude '.*' . | head -n 1
    sleep $DEBOUNCE
    kill_dotnet_port
    kill "$RUN_PID" 2>/dev/null
    wait "$RUN_PID" 2>/dev/null
    restart_dotnet_run
done
