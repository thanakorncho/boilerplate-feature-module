//
//  ShoppingBagAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 5/8/22.
//

import Foundation
import Swinject

//class ShoppingBagAssembly: Assembly, BaseSceneAssemblyDependencies {
//    typealias ViewModel = ShoppingBagViewModel
//
//    func assemble(container: Container) {
//        registerUseCase(container)
//        registerViewModel(container)
//        registerViewController(container)
//    }
//
//    private func registerUseCase(_ container: Container) {
//        container.register(
//            ShoppingBagViewModelUseCases.self,
//            factory: { _, user, character in
//                ShoppingBagViewModelProvider.UseCases(user: user, character: character)
//            })
//        .inObjectScope(.transient)
//    }
//
//    private func registerViewModel(_ container: Container) {
//        container.register(
//            ShoppingBagViewModel.self,
//            factory: { _, context, useCases in
//                ShoppingBagViewModel(context, useCases)
//            })
//        .inObjectScope(.transient)
//    }
//
//    private func registerViewController(_ container: Container) {
//        container.register(
//            ShoppingBagViewController<ViewModel>.self,
//            factory: { _, viewModel in
//                ShoppingBagViewController<ViewModel>(viewModel)
//            })
//        .inObjectScope(.transient)
//    }
//}
