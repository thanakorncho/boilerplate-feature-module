//
//  MainSettingModels.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct MainSettingModels {
    struct Displayed {

    }
}

struct MainSettingViewModelProvider {
    struct UseCases: MainSettingViewModelUseCases {

    }

    struct Context {

    }
}

struct MainSettingStreams {
    struct Input: MainSettingViewModelInput {
        let onLoad: PublishRelay<Void>
    }

    struct Output: MainSettingViewModelOutput {
        var didLoad: Driver<MainSettingModels.Displayed>
        var didLoading: Driver<Bool>
    }
    
    struct Action: MainSettingViewModelAction {
        var tapSomething: PublishSubject<Void>
        var dismiss: PublishRelay<Void>
    }
}
