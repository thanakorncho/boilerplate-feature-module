//
//  AppAssembly.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import Swinject
import UIKit

public final class AppAssembly: Assembly {

    private var appContainer: ContainerDependencies
    private var window: UIWindow?

    init(
        _ container: ContainerDependencies,
        _ window: UIWindow? = nil
    ) {
        self.appContainer = container
        self.window = window
    }

    public func assemble(container: Container) {
        registerAppContainer(container)
        registerWindow(container)
    }

    private func registerWindow(_ container: Container) {
        container.register(
            UIWindow.self,
            factory: { [weak self] _ in
                if let window = self?.window {
                    return window
                } else {
                    return UIWindow(frame: UIScreen.main.bounds)
                }
            })
            .inObjectScope(.container)

        //        container.register(
        //            LazyWindow.self,
        //            factory: { resolver in
        //                let window = resolver.resolve(Lazy<UIWindow>.self)!
        //                return LazyWindow(window: window)
        //            })
    }

    private func registerAppContainer(_ container: Container) {
        container.register(
            ContainerDependencies.self,
            factory: { _ in
                return self.appContainer
            })
            .inObjectScope(.container)
    }
}

struct LazyWindow {
    let window: Lazy<UIWindow>
}
