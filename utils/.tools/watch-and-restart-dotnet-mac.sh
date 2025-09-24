#!/bin/zsh

PORT=${1:-5093}      # Allow port override via first argument
DEBOUNCE=2           # Seconds to wait after a change before restarting

kill_dotnet_port() {
    PIDS=($(lsof -ti tcp:$PORT))
    if [[ ${#PIDS[@]} -gt 0 ]]; then
        echo "Killing process(es) on port $PORT: ${PIDS[@]}"
        kill -9 ${PIDS[@]}
    fi
}

restart_dotnet_run() {
    kill_dotnet_port
    # dotnet clean
    dotnet run &
    RUN_PID=$!
}

# Initial start
restart_dotnet_run

# Watch .cs files recursively and debounce rapid events
while true; do
    # Wait for a file event
    fswatch -r --event Updated --event Created --event Removed --include '.*\.cs$' --exclude '.*' . | head -n 1
    # Debounce (wait for possible further events)
    sleep $DEBOUNCE
    # Restart app
    kill "$RUN_PID" 2>/dev/null
    wait "$RUN_PID" 2>/dev/null
    restart_dotnet_run
done
