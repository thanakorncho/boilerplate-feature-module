//
//  SceneAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import Swinject

final class SceneAssembly: Assembly {
    func assemble(container: Container) {
        let assembies: [Assembly] = [
            LoginAssembly(),
            ForgotPasswordAssembly(),
            MainLandingAssembly(),
            MainSettingAssembly(),
            MainProfileAssembly()
        ]
        assembies.forEach({ $0.assemble(container: container) })
    }
}
