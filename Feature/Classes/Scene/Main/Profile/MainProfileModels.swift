//
//  MainProfileModels.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct MainProfileModels {
    struct Displayed {

    }
}

struct MainProfileViewModelProvider {
    struct UseCases: MainProfileViewModelUseCases {

    }

    struct Context {

    }
}

struct MainProfileStreams {
    struct Input: MainProfileViewModelInput {
        let onLoad: PublishRelay<Void>
    }

    struct Output: MainProfileViewModelOutput {
        var didLoad: Driver<MainProfileModels.Displayed>
        var didLoading: Driver<Bool>
    }

    struct Action: MainProfileViewModelAction {
        var tapSomething: PublishSubject<Void>
        var dismiss: PublishRelay<Void>
    }
}
