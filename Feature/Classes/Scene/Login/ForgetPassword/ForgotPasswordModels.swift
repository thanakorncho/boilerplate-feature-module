//
//  ForgotPasswordModels.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct ForgotPasswordModels {
    struct Displayed {

    }
}

struct ForgotPasswordViewModelProvider {
    struct UseCases: ForgotPasswordViewModelUseCases {

    }

    struct Context {

    }
}

struct ForgotPasswordStreams {
    struct Input: ForgotPasswordViewModelInput {
        let onLoad: PublishRelay<Void>
    }

    struct Output: ForgotPasswordViewModelOutput {
        var didLoad: Driver<ForgotPasswordModels.Displayed>
        var didLoading: Driver<Bool>
    }

    struct Action: ForgotPasswordViewModelAction {
        var tapSomething: PublishSubject<Void>
        var dismiss: PublishRelay<Void>
    }
}
