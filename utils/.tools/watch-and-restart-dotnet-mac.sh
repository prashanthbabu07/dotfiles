#!/bin/zsh

# This script recursively watches for changes to .cs files in the current directory and subdirectories,
# runs dotnet clean, and restarts dotnet run.
# macOS version using fswatch.
# Linux version (commented out) uses inotifywait.

kill_dotnet_run() {
    if [[ -n "$RUN_PID" ]]; then
        kill "$RUN_PID" 2>/dev/null
        wait "$RUN_PID" 2>/dev/null
    fi
}

while true; do
    dotnet run &
    RUN_PID=$!

    # macOS: Recursively watch for .cs changes using fswatch
    fswatch -r --event Updated --event Created --event Removed --include '.*\.cs$' --exclude '.*' . | head -n 1

    # Linux (commented out):
    # inotifywait -r -e modify -e create -e delete --include '\.cs$' . >/dev/null

    kill_dotnet_run
    dotnet clean
done
