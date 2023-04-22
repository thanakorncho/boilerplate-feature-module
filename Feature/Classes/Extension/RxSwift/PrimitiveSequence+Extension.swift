//
//  PrimitiveSequence+Extension.swift

//
//  Created by KniGht ThanaKorn on 17/6/22.
//

import Foundation
import RxSwift

extension PrimitiveSequence where Trait == SingleTrait {
    public func asMaybe() -> PrimitiveSequence<MaybeTrait, Element> {
        return self.asObservable().asMaybe()
    }

    public func asCompletable() -> PrimitiveSequence<CompletableTrait, Never> {
        return self.asObservable().flatMap { _ in
            Observable<Never>.empty()
        }.asCompletable()
    }
}

extension PrimitiveSequence where Trait == CompletableTrait, Element == Swift.Never {
    public func asMaybe() -> PrimitiveSequence<MaybeTrait, Element> {
        return self.asObservable().asMaybe()
    }
}

extension PrimitiveSequenceType where Trait == MaybeTrait, Element == Void {
    static func justVoid() -> Maybe<Element> {
        return .just(())
    }
}

extension PrimitiveSequenceType where Trait == SingleTrait, Element == Void {
    static func justVoid() -> Single<Element> {
        return .just(())
    }
}
