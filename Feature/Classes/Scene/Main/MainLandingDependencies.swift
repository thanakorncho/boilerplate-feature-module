//
//  MainLandingDependencies.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxRelay
import RxSwift

protocol MainLandingViewModelInput: BaseViewModelInput {
}

protocol MainLandingViewModelOutput: BaseViewModelOutput {
    var didLoad: Driver<MainLandingModels.Displayed> { get }
}

protocol MainLandingViewModelAction: BaseViewModelAction {
    var tapSomething: PublishSubject<Void> { get }
}

protocol MainLandingViewModelDriven: BaseViewModelDriven where
Input == MainLandingViewModelInput,
Output == MainLandingViewModelOutput,
Action == MainLandingViewModelAction {
}

protocol MainLandingViewModelUseCases {
}

protocol MainLandingViewModelDependencies: BaseViewModelDependencies where
Context == MainLandingViewModelProvider.Context,
UseCases == MainLandingViewModelUseCases {
}
