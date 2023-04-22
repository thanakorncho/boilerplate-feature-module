//
//  LoginDependencies.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxRelay
import RxSwift

protocol LoginViewModelInput: BaseViewModelInput {

}

protocol LoginViewModelOutput: BaseViewModelOutput {
    var didLoad: Driver<LoginModels.Displayed> { get }
}

protocol LoginViewModelAction: BaseViewModelAction {
    var tapSomething: PublishSubject<Void> { get }
}

protocol LoginViewModelDriven: BaseViewModelDriven where
Input == LoginViewModelInput,
Output == LoginViewModelOutput {

}

protocol LoginViewModelUseCases {

}

protocol LoginViewModelDependencies: BaseViewModelDependencies where
Context == LoginViewModelProvider.Context,
UseCases == LoginViewModelUseCases {

}
