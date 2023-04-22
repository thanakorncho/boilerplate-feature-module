//
//  Observable+Extension.swift

//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import RxCocoa
import RxSwift

public extension ObservableType where Element == Bool {
    /// Boolean not operator
    func not() -> Observable<Bool> {
        return self.map(!)
    }
}

public extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

public extension ObservableType {
    func catchErrorJustComplete() -> Observable<Element> {
        return `catch` { _ in
            return .empty()
        }
    }

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}

public extension ObserverType where Element == Void {
    func onNextVoid() {
        onNext(())
    }
}

public extension PublishRelay where Element == Void {
    func acceptVoid() {
        accept(())
    }
}

public extension BehaviorRelay where Element == Void {
    func acceptVoid() {
        accept(())
    }
}

public extension ObserverType where Element == Bool? {
    func onNextNil() {
        onNext(nil)
    }
}

public extension PublishRelay where Element == Bool? {
    func acceptNil() {
        accept(nil)
    }
}

public extension BehaviorRelay where Element == Bool? {
    func acceptNil() {
        accept(nil)
    }
}
