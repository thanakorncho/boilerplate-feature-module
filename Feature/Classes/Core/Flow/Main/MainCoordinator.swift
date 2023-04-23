//
//  MainCoordinator.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation
import RxRelay
import RxSwift
import Swinject

protocol MainCoordinatorDependencies: DefaultCoordinator {
}

struct MainCoordinatorRoute {
    var logout: PublishRelay<Void> = .init()
    var settings: PublishRelay<Void> = .init()
}

class MainCoordinator: MainCoordinatorDependencies, MainCoordinatorType {
    // MARK: - Rx
    private let disposeBag = DisposeBag()

    // MARK: - Container
    var container: Container

    // MARK: - Flow
    var flow: CoordinatorRouteDependencies

    // MARK: - Properties
    let route = MainCoordinatorRoute()
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
        subscribes()
        routeToLanding()
    }

    // MARK: - Action
    func subscribes() {
        route.settings
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.routeToSetting()
            })
            .disposed(by: disposeBag)
        route.logout
            .map({ CoordinatorFlow.login })
            .debug()
            .bind(to: flow.flow)
            .disposed(by: disposeBag)
    }
}

// MARK: - Routing
extension MainCoordinator {
    private func routeToLanding() {
        let mainLanding = makeMainLanding()
        navigationController.pushViewController(mainLanding)
    }

    private func routeToSetting() {
        let setting = makeMainSetting()
        navigationController.pushViewController(setting)
    }
    
    private func routeToProfile() {
        let profile = makeMainProfile()
        navigationController.pushViewController(profile)
    }
}
