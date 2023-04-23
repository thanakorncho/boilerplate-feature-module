//
//  UseCaseAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation
import Swinject

final class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        let assembies: [Assembly] = [
            ProfileUseCaseAssembly()
        ]
        assembies.forEach({ $0.assemble(container: container) })
    }
}
