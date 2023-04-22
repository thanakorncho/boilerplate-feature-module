//
//  LoginCoordinator.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation
import RxSwift
import Swinject

protocol LoginCoordinatorDependencies: DefaultCoordinator {
}

struct LoginCoordinatorRoute {
}

class LoginCoordinator: LoginCoordinatorDependencies, LoginCoordinatorType {
    // MARK: - Rx
    private let disposeBag = DisposeBag()

    // MARK: - Container
    var container: Container

    // MARK: - Router
    var flow: CoordinatorRouteDependencies

    // MARK: - Properties
    var navigationController: UINavigationController

    // MARK: - Constants

    // MARK: - Setup
    init(
        _ container: Container,
        flow: CoordinatorRouteDependencies,
        navigationController: UINavigationController
    ) {
        self.container = container
        self.flow = flow
        self.navigationController = navigationController
    }

    func start() {
        routeToLogin()
    }
}

// MARK: - Routing
extension LoginCoordinator {
    private func routeToLogin() {
    }

    private func routeToSetting() {
    }
}
