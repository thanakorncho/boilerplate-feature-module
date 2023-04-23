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
    var settings: PublishRelay<Void> = .init()
}

class MainCoordinator: MainCoordinatorDependencies, MainCoordinatorType {
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
        routeToLanding()
    }

    // MARK: - Action
    func subscribes(
        _ disposeBag: DisposeBag
    ) -> MainCoordinatorRoute {
        let route = MainCoordinatorRoute()
        route.settings
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.routeToSetting()
            })
            .disposed(by: disposeBag)
        return route
    }
}

// MARK: - Routing
extension MainCoordinator {
    private func routeToLanding() {
        print("routeToLanding")
        let mainLanding = makeMainLanding()
        navigationController.pushViewController(mainLanding)
    }

    private func routeToSetting() {
    }
}
