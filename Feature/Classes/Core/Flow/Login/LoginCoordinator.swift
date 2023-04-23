//
//  LoginCoordinator.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation
import RxRelay
import RxSwift
import Swinject

protocol LoginCoordinatorDependencies: DefaultCoordinator {
}

struct LoginCoordinatorRoute {
    var loggedIn: PublishRelay<Void> = .init()
}

class LoginCoordinator: LoginCoordinatorDependencies, LoginCoordinatorType {
    // MARK: - Rx
    private let disposeBag = DisposeBag()

    // MARK: - Container
    var container: Container

    // MARK: - Flow
    var flow: CoordinatorRouteDependencies

    // MARK: - Properties
    var route: LoginCoordinatorRoute = .init()
    var navigationController: UINavigationController

    // MARK: - Constants

    // MARK: - Life cycle
    deinit {
        print("deinit LoginCoordinator")
    }
    
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

    func subscribe() {
        route.loggedIn
            .map({ CoordinatorFlow.main })
            .debug()
            .bind(to: flow.flow)
            .disposed(by: disposeBag)
    }

    func start() {
        subscribe()
        routeToLogin()
    }
}

// MARK: - Routing
extension LoginCoordinator {
    private func routeToLogin() {
        print("routeToLogin")
        let login = makeLogin(.init())
        navigationController.pushViewController(login)
    }

    private func routeToSetting() {
    }
}
