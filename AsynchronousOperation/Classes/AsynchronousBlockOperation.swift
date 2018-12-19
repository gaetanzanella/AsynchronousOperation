//
//  AsynchronousOperation.swift
//  AsynchronousOperation
//
//  Created by Gaétan Zanella on 19/12/2018.
//

import Foundation

public class AsynchronousBlockOperation: AsynchronousOperation {

    public typealias Completion = () -> Void

    private let task: (@escaping Completion) -> Void

    // MARK: - Lyfe Cycle

    public init(task: @escaping (@escaping Completion) -> Void) {
        self.task = task
    }

    // MARK: - Public

    public override func execute() {
        let completion = { [weak self] in
            self?.finish()
            return
        }
        task(completion)
    }
}
