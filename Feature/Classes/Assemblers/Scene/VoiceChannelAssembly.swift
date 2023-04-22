//
//  VoiceChannelAssembly.swift
//  Avatar
//
//  Created by Chareef Whungpakdee on 11/8/2565 BE.
//

import Foundation
import Swinject

//class VoiceChannelAssembly: Assembly {
//
//    private typealias ViewModel = VoiceChannelViewModel
//
//    func assemble(container: Container) {
//        registerUseCase(container)
////        registerViewModel(container)
//        registerViewController(container)
//    }
//
//    private func registerUseCase(_ container: Container) {
//        container.register(
//            VoiceChannelViewModelUseCases.self,
//            factory: { _ in
//                VoiceChannelViewModelProvider.UseCases()
//            })
//            .inObjectScope(.transient)
//    }
//
//    private func registerViewModel(_ container: Container) {
//        container.register(
//            VoiceChannelViewModel.self,
//            factory: { resolver, context in
//                VoiceChannelViewModel(context, resolver.resolve())
//            })
//            .inObjectScope(.transient)
//    }
//
//    private func registerViewController(_ container: Container) {
//        container.register(
//            VoiceChannelViewController<ViewModel>.self,
//            factory: { resolver, context in
//                VoiceChannelViewController<ViewModel>(.init(context, resolver.resolve()))
//            })
//            .inObjectScope(.transient)
//    }
//}
