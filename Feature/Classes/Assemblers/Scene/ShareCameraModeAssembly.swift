//
//  ShareCameraModeAssembly.swift
//  Avatar
//
//  Created by Warakorn Chanprasopchai on 27/9/22.
//

import Foundation
import Swinject

//class ShareCameraModeAssembly: Assembly {
//
//    private typealias ViewModel = ShareCameraModeViewModel
//
//    func assemble(container: Container) {
//        registerUseCase(container)
//        registerViewModel(container)
//        registerViewController(container)
//    }
//
//    private func registerUseCase(_ container: Container) {
//        container.register(
//            ShareCameraModeViewModelUseCases.self,
//            factory: { _ in
//                ShareCameraModeViewModelProvider.UseCases()
//            })
//            .inObjectScope(.transient)
//    }
//
//    private func registerViewModel(_ container: Container) {
//        container.register(
//            ShareCameraModeViewModel.self,
//            factory: { _, context, useCases in
//                ShareCameraModeViewModel(context, useCases)
//            })
//            .inObjectScope(.transient)
//    }
//
//    private func registerViewController(_ container: Container) {
//        container.register(
//            ShareCameraModeViewController<ViewModel>.self,
//            factory: { _, viewModel in
//                ShareCameraModeViewController<ViewModel>(viewModel)
//            })
//            .inObjectScope(.transient)
//    }
//}
