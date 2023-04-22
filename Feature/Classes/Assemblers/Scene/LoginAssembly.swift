//
//  LoginAssembly.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//

import Foundation
import Swinject

class LoginAssembly: Assembly {
    private typealias ViewModel = LoginViewModel
    
    func assemble(container: Container) {
        viewModel(container)
        viewController(container)
    }
    
    
    private func viewModel(_ container: Container) {
        container.register(
            LoginViewModel.self,
            factory: { resolver, context in
                LoginViewModel(context, resolver.resolve())
            })
        .inObjectScope(.transient)
    }
    
    private func viewController(_ container: Container) {
        container.register(
            LoginViewController<ViewModel>.self,
            factory: { resolver, context in
                LoginViewController<ViewModel>(.init(context, resolver.resolve()))
            })
        .inObjectScope(.transient)
    }
}
