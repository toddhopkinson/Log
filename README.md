# Log

A solid, simple Swift debug logger that conditionally compiles logging functionality for DEBUG builds only.

### Usage

To print a trace log:

```swift
Log.trace()
// [TRACE]filename:function():line
```

To log a custom message:

```swift
Log.debug("success!")
// [DEBUG]filename:function():line success!
```

### Installation

Add the Log.swift file to your project.

The precompile flag `DEBUG` can be set up under target build settings under 'Swift Compiler - Custom Flags' settings 'Other Swift Flags' using `-DDEBUG` under the Debug configuration. Unless DEBUG flag is present, log() and trace() methods will execute nothing ensuring no logging on a Release (or any non-debug) build.

### Design

Aim: To provide a simple, easy to use debug logger with the following characteristics:
- The logs print to the console precisely when expected and not indeterminately from some background thread.
- Code will not be executed nor parameters evaluated in the log function calls unless it is a DEBUG build, i.e., logs will never appear in Release builds.
- Interfaces are intuitive .
- Two types of logs can be printed to the console - trace and debug logs.
- In all cases logs print the filename, function name, and line number of the log invocation.
