//
//  MainSettingDependencies.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxRelay
import RxSwift

protocol MainSettingViewModelInput: BaseViewModelInput {

}

protocol MainSettingViewModelOutput: BaseViewModelOutput {
    var didLoad: Driver<MainSettingModels.Displayed> { get }
}

protocol MainSettingViewModelAction: BaseViewModelAction {
    var tapSomething: PublishSubject<Void> { get }
}

protocol MainSettingViewModelDriven: BaseViewModelDriven where
Input == MainSettingViewModelInput,
Output == MainSettingViewModelOutput,
Action == MainSettingViewModelAction {

}

protocol MainSettingViewModelUseCases {

}

protocol MainSettingViewModelDependencies: BaseViewModelDependencies where
Context == MainSettingViewModelProvider.Context,
UseCases == MainSettingViewModelUseCases {

}
