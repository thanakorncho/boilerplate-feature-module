//
//  MainLandingAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//

import Foundation
import Swinject

class MainLandingAssembly: Assembly {

    private typealias ViewModel = MainLandingViewModel

    func assemble(container: Container) {
        useCases(container)
        viewModel(container)
        viewController(container)
    }
    
    private func useCases(_ container: Container) {
        container.register(
            MainLandingViewModelUseCases.self,
            factory: { resolver in
                MainLandingViewModelProvider.UseCases()
            })
        .inObjectScope(.transient)
    }

    private func viewModel(_ container: Container) {
        container.register(
            MainLandingViewModel.self,
            factory: { resolver, context in
                MainLandingViewModel(context, resolver.resolve())
            })
        .inObjectScope(.transient)
    }

    private func viewController(_ container: Container) {
        container.register(
            MainLandingViewController<ViewModel>.self,
            factory: { resolver, context in
                MainLandingViewController<ViewModel>(context)
            })
        .inObjectScope(.transient)
    }
}
