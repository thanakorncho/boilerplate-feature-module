//
//  ForgotPasswordDependencies.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxRelay
import RxSwift

protocol ForgotPasswordViewModelInput: BaseViewModelInput {

}

protocol ForgotPasswordViewModelOutput: BaseViewModelOutput {
    var didLoad: Driver<ForgotPasswordModels.Displayed> { get }
}

protocol ForgotPasswordViewModelAction: BaseViewModelAction {
    var tapSomething: PublishSubject<Void> { get }
}

protocol ForgotPasswordViewModelDriven: BaseViewModelDriven where
Input == ForgotPasswordViewModelInput,
Output == ForgotPasswordViewModelOutput,
Action == ForgotPasswordViewModelAction {

}

protocol ForgotPasswordViewModelUseCases {

}

protocol ForgotPasswordViewModelDependencies: BaseViewModelDependencies where
Context == ForgotPasswordViewModelProvider.Context,
UseCases == ForgotPasswordViewModelUseCases {

}
