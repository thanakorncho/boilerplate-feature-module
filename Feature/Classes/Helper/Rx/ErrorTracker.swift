//
//  ErrorTracker.swift

//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import RxCocoa
import RxSwift

final class ErrorTracker: SharedSequenceConvertibleType {
    typealias SharingStrategy = DriverSharingStrategy
    private let _subject = PublishSubject<Error>()

    func trackError<O: ObservableConvertibleType>(from source: O) -> Observable<O.Element> {
        return source.asObservable().do(onError: onError)
            }

    func asSharedSequence() -> SharedSequence<SharingStrategy, Error> {
        return _subject.asObservable().asDriverOnErrorJustComplete()
    }

    func asObservable() -> Observable<Error> {
        return _subject.asObservable()
    }

    private func onError(_ error: Error) {
        _subject.onNext(error)
    }

    deinit {
        _subject.onCompleted()
    }
}

extension ObservableConvertibleType {
    func trackError(_ errorTracker: ErrorTracker) -> Observable<Element> {
        return errorTracker.trackError(from: self)
    }

    func trackError(_ errorTracker: ErrorTracker) -> Single<Element> {
        return errorTracker.trackError(from: self).asSingle()
    }
}

extension ObservableConvertibleType where Element == Never {
    func trackError(_ errorTracker: ErrorTracker) -> Completable {
        return errorTracker.trackError(from: self).asCompletable()
    }
}
