#!/bin/zsh

DEBOUNCE=2      # Seconds to wait after a change before rebuilding

build_dotnet_no_incremental() {
    echo "Running: dotnet build --no-incremental"
    dotnet build --no-incremental
}

# Initial build
build_dotnet_no_incremental

# Watch .cs files recursively and debounce rapid events
while true; do
    # Wait for a file event
    fswatch -r --event Updated --event Created --event Removed --include '.*\.cs$' --exclude '.*' . | head -n 1
    # Debounce (wait for possible further events)
    sleep $DEBOUNCE
    # Run build
    build_dotnet_no_incremental
done
