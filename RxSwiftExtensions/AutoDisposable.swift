//
//  AutoDisposable.swift
//  Raken
//
//  Created by Siarhei Yakushevich on 10/23/18.
//  Copyright © 2018 Raken, Inc. All rights reserved.
//

import RxSwift

public extension Disposable {
    var autoDisposable: AutoDisposable {
        return AutoDisposable(disposable: self)
    }
    
}

public final class AutoDisposable: Disposable {
    private var disposable: Disposable? {
        didSet {
            oldValue?.dispose()
        }
    }
    
    public convenience init() {
        self.init(disposable: nil)
    }
    
    public init(disposable: Disposable?) {
        self.disposable = disposable
    }
    
    @available(*, deprecated, message: "Don't use it. We unable to detect right status if disposable if it disposes by other way instead if our dispose() method")
    public var isDisposed: Bool {
        return disposable == nil
    }
    
    public func dispose() {
        disposable = nil
    }
    
    deinit {
        dispose()
    }
}
