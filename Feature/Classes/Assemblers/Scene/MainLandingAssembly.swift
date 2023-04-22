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
        viewModel(container)
        viewController(container)
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
                MainLandingViewController<ViewModel>(.init(context, resolver.resolve()))
            })
        .inObjectScope(.transient)
    }
}
