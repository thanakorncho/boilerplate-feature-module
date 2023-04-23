//
//  MainProfileDependencies.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxRelay
import RxSwift

protocol MainProfileViewModelInput: BaseViewModelInput {

}

protocol MainProfileViewModelOutput: BaseViewModelOutput {
    var didLoad: Driver<MainProfileModels.Displayed> { get }
}

protocol MainProfileViewModelAction: BaseViewModelAction {
    var tapSomething: PublishSubject<Void> { get }
}

protocol MainProfileViewModelDriven: BaseViewModelDriven where
Input == MainProfileViewModelInput,
Output == MainProfileViewModelOutput,
Action == MainProfileViewModelAction {

}

protocol MainProfileViewModelUseCases {

}

protocol MainProfileViewModelDependencies: BaseViewModelDependencies where
Context == MainProfileViewModelProvider.Context,
UseCases == MainProfileViewModelUseCases {

}
