//
//  MainLandingModels.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct MainLandingModels {
    struct Displayed {
    }
}

struct MainLandingViewModelProvider {
    struct UseCases: MainLandingViewModelUseCases {
    }

    struct Context {
    }
}

struct MainLandingStreams {
    struct Input: MainLandingViewModelInput {
        let onLoad: PublishRelay<Void>
    }

    struct Output: MainLandingViewModelOutput {
        var didLoad: Driver<MainLandingModels.Displayed>
        var didLoading: Driver<Bool>
    }
    
    struct Action: MainLandingViewModelAction {
        var logout: PublishSubject<Void>
        var dismiss: PublishRelay<Void>
    }
}
