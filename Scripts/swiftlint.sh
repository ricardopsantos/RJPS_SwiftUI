execute() {
    if which swiftlint >/dev/null; then
        swiftlint --quiet
    else
        echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
        exit -1
    fi
}

if [ -n "$USER" ]; then
    if [ "$USER" == "runner" ]; then
        echo "CI build. Not running swiftlint."
        exit 0
    else
        execute
    fi
else
    echo "\$USER not set. Not running swiftlint."
fi


