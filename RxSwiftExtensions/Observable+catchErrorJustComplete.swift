//
//  СatchErrorJustComplete.swift
//  Domain
//
//  Created by Oleg Marchik on 10/19/18.
//  Copyright © 2018 Raken, Inc. All rights reserved.
//

import RxSwift

public extension ObservableType {
    /**
     Dismiss errors and complete the sequence instead
     
     - returns: An observable sequence that never errors and completes when an error occurs in the underlying sequence
     */
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }
}
