# Log

A solid, simple Swift debug logger that conditionally compiles logging functionality for DEBUG builds only.

### Usage

To print a trace log:

```swift
Log.trace()
// filename:function():line
```

To log a custom message:

```swift
Log.debug("success!")
// filename:function():line success!
```

### Installation

Add the Log.swift file to your project.

The precompile flag `DEBUG` can be set up under target build settings under 'Swift Compiler - Custom Flags' settings 'Other Swift Flags' using `-DDEBUG` under the Debug configuration. Unless DEBUG flag is present, log() and trace() methods will execute nothing ensuring no logging on a Release (or any non-debug) build.

### Design

Aim: To provide a simple, easy to use debug logger that will . The logs to print to the console precisely when expected were I stepping through code line by line and not printing indeterminately from some background thread. Furthermore, I don't want code executed or parameters evaluated in the log function calls unless it is a DEBUG build.
