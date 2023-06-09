//
//  LoginModels.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct LoginModels {
    struct Displayed {
    }
}

struct LoginViewModelProvider {
    struct UseCases: LoginViewModelUseCases {
    }
    
    struct Context {
    }
}

struct LoginStreams {
    struct Input: LoginViewModelInput {
        let onLoad: PublishRelay<Void> = .init()
    }
    
    struct Output: LoginViewModelOutput {
        var didLoad: Driver<LoginModels.Displayed>
        var didLoading: Driver<Bool>
    }
    
    struct Action: LoginViewModelAction {
        var loggedIn: PublishSubject<Void> = .init()
        var dismiss: PublishRelay<Void> = .init()
        var forgotPass: PublishSubject<Void> = .init()
    }
}
