//
//  LoginCoordinatorFactory.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation
import RxSwift

extension LoginCoordinator {
    internal func makeLogin(_ context: LoginProvider.Context) -> LoginVC {
        func bind(_ viewModel: LoginVM) {
            viewModel.action.dismiss
                .observe(on: MainScheduler.asyncInstance)
                .debug()
                .subscribe()
                .disposed(by: viewModel.disposeBag)
            viewModel.action.loggedIn
                .debug()
                .bind(to: route.loggedIn)
                .disposed(by: viewModel.disposeBag)
            viewModel.action.forgotPass
                .debug()
                .bind(to: route.forgotPass)
                .disposed(by: viewModel.disposeBag)
        }
        
        let viewModel: LoginVM = container.resolve(argument: context)
        let viewController: LoginVC = container.resolve(argument: viewModel)
        bind(viewModel)
        return viewController
    }
    
    internal func makeForgotPassword(
        _ context: ForgotPasswordProvider.Context = .init()
    ) -> ForgotPasswordVC {
        func bind(_ viewModel: ForgotPasswordVM) {

        }
        
        let viewModel: ForgotPasswordVM = container.resolve(argument: context)
        let viewController: ForgotPasswordVC = container.resolve(argument: viewModel)
        bind(viewModel)
        return viewController
    }
}
