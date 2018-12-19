//
//  AsynchronousOperation.swift
//  AsynchronousOperation
//
//  Created by Gaétan Zanella on 19/12/2018.
//

import Foundation

// Inspirated by https://developer.apple.com/videos/play/wwdc2015/226/
public class AsynchronousOperation: Operation {

    @objc private class func keyPathsForValuesAffectingIsReady() -> Set<String> {
        return ["state"]
    }

    @objc private class func keyPathsForValuesAffectingIsExecuting() -> Set<String> {
        return ["state"]
    }

    @objc private class func keyPathsForValuesAffectingIsFinished() -> Set<String> {
        return ["state"]
    }

    private enum State: Int {
        case initialized
        case executing
        case finished

        func canTransition(to target: State) -> Bool {
            switch (self, target) {
            case (.initialized, .executing):
                return true
            case (.executing, .finished):
                return true
            default:
                return false
            }
        }
    }

    private let stateLock = NSLock()

    private var _state: State = .initialized

    private var state: State {
        get {
            return stateLock.withCriticalScope {
                _state
            }
        }
        set(newState) {
            willChangeValue(forKey: "state")
            stateLock.withCriticalScope {
                guard _state != .finished else { return }
                assert(_state.canTransition(to: newState), "Performing invalid state transition.")
                _state = newState
            }
            didChangeValue(forKey: "state")
        }
    }

    // MARK: - Operation

    public override var isExecuting: Bool {
        return state == .executing
    }

    public override var isReady: Bool {
        return state == .initialized
    }

    public override var isFinished: Bool {
        return state == .finished
    }

    public override final func main() {
        state = .executing
        if isCancelled {
            finish()
        } else {
            execute()
        }
    }

    // MARK: - AsynchronousOperation

    public func execute() {
        // override
        finish()
    }

    public final func finish() {
        state = .finished
    }
}

private extension NSLock {
    func withCriticalScope<T>(_ block: () -> T) -> T {
        lock()
        let value = block()
        unlock()
        return value
    }
}
