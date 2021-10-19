# stacktrace-plugin

To make a Haskell program to generate and log stacktraces due exceptions module top level function
should declare HasCallStack constrait.
haskell-stack-trace-plugin injects the constraint during build time.

Also an app should be run with following flags:

```
stack run --profile  --resolver=ghc-9.0.1 -- +RTS  -xc
```
