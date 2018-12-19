# AsynchronousOperation

[![Version](https://img.shields.io/cocoapods/v/AsynchronousOperation.svg?style=flat)](https://cocoapods.org/pods/AsynchronousOperation)
[![License](https://img.shields.io/cocoapods/l/AsynchronousOperation.svg?style=flat)](https://cocoapods.org/pods/AsynchronousOperation)
[![Platform](https://img.shields.io/cocoapods/p/AsynchronousOperation.svg?style=flat)](https://cocoapods.org/pods/AsynchronousOperation)

## Requirements

## Installation

AsynchronousOperation is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AsynchronousOperation'
```

## Usage

`AsynchronousOperation` is a lightweight version of the sample code presented at the WWDC [Advanced NSOperation session](https://developer.apple.com/videos/play/wwdc2015/226/).

Its main purpose is to make it easier to create `Operation` wrapping asynchronous tasks such as a HTTP request.


Subclass `AsynchronousOperation` or directly instanciate a `AsynchronousBlockOperation`.

``` swift
let operationQueue = OperationQueue()

let operation = AsynchronousBlockOperation(task: { completion in
    httpManager.fetch(User.self, using: request) { result in
        // ... Handle result
        completion()
    }
})

operationQueue.addOperation(operation)

// OR

class FetchUserOperation: AsynchronousOperation {

    override func execute() {
        httpManager.fetch(User.self, using: request) { [weak self] result in
            // ... Handle result
            self?.finish()
        }
    }
}

```

I mainly use it to chain multiple promises that are not initialized at the same time.


## Author

gaetanzanella, gaetan.zanella@fabernovel.com

## License

AsynchronousOperation is available under the MIT license. See the LICENSE file for more info.
