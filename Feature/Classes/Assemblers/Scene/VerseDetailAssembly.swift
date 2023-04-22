//
//  VerseDetailAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 9/6/22.
//

import Foundation
import Swinject

//final class VerseDetailAssembly: Assembly, BaseSceneAssemblyDependencies {
//    typealias ViewModel = VerseDetailViewModel
//
//    func assemble(container: Container) {
//        registerUseCase(container)
//        registerViewModel(container)
//        registerViewController(container)
//    }
//
//    private func registerUseCase(_ container: Container) {
//        container.register(
//            VerseDetailViewModelUseCases.self,
//            factory: { resolver in
//                VerseDetailViewModelProvider.UseCases(
//                    verse: resolver.resolve(),
//                    location: resolver.resolve())
//            })
//        .inObjectScope(.transient)
//    }
//
//    private func registerViewModel(_ container: Container) {
//        container.register(
//            VerseDetailViewModel.self,
//            factory: { _, context, useCases in
//                VerseDetailViewModel(context, useCases)
//            })
//        .inObjectScope(.transient)
//    }
//
//    private func registerViewController(_ container: Container) {
//        container.register(
//            VerseDetailViewController<ViewModel>.self,
//            factory: { _, viewModel in
//                VerseDetailViewController<ViewModel>(viewModel)
//            })
//        .inObjectScope(.transient)
//    }
//}
