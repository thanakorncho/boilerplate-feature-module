//
//  LandingCoordinatorFactory.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation

extension MainCoordinator {
    internal func makeMainLanding(
        _ context: MainLandingProvider.Context = .init()
    ) -> MainLandingVC {
        func bind(_ viewModel: MainLandingVM) {
            viewModel.action.logout
                .debug()
                .bind(to: route.logout)
                .disposed(by: viewModel.disposeBag)
        }
        
        let viewModel: MainLandingVM = container.resolve(argument: context)
        let viewController: MainLandingVC = container.resolve(argument: viewModel)
        bind(viewModel)
        return viewController
    }
    
    internal func makeMainProfile(
        _ context: MainProfileProvider.Context = .init()
    ) -> MainProfileVC {
        func bind(_ viewModel: MainProfileVM) {
            
        }
        
        let viewModel: MainProfileVM = container.resolve(argument: context)
        let viewController: MainProfileVC = container.resolve(argument: viewModel)
        bind(viewModel)
        return viewController
    }
    
    internal func makeMainSetting(
        _ context: MainSettingProvider.Context = .init()
    ) -> MainSettingVC {
        func bind(_ viewModel: MainProfileVM) {
            
        }
        
        let viewModel: MainProfileVM = container.resolve(argument: context)
        let viewController: MainSettingVC = container.resolve(argument: viewModel)
        bind(viewModel)
        return viewController
    }
}
