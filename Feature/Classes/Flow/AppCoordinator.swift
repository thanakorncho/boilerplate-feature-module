import Foundation
import RxRelay
import RxSwift
import Swinject

public protocol CoordinatorRouteDependencies {
    var avatarLaunch: PublishRelay<Void> { get }
    var metaverse: PublishRelay<Bool> { get }
}

struct AppCoordinatorRoute: CoordinatorRouteDependencies {
    var avatarLaunch: PublishRelay<Void> = .init()
    var metaverse: PublishRelay<Bool> = .init()
}

public protocol AppCoordinatorDependencies: DefaultCoordinator {
    var window: UIWindow? { get }
}

public final class AppCoordinator: AppCoordinatorDependencies {

    private typealias Object = AppCoordinator

    // MARK: - Rx
    public var disposeBag: DisposeBag

    // MARK: - Data source
    public var window: UIWindow?
    public var navigationController: UINavigationController
    private var childCoordinator: [DefaultCoordinator] = []

    // MARK: - Router
    public var flow: CoordinatorRouteDependencies

    // MARK: - Container
    public var container: Container

    public init(
        _ container: Container,
        _ window: UIWindow?
    ) {
        self.disposeBag = .init()
        self.container = container
        self.window = window
        self.navigationController = .init()
        self.flow = AppCoordinatorRoute()
    }

    public func start() {
        subscribes()
        initialRootView()
    }

    private func subscribes() {
//        flow.avatarLaunch
//            .subscribe(
//                weak: self,
//                onNext: Object.avatarLaunchProcess)
//            .disposed(by: disposeBag)
//        flow.metaverse
//            .subscribe(
//                weak: self,
//                onNext: Object.metaverseProcess)
//            .disposed(by: disposeBag)
    }

    private func initialRootView() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func loginProcess() {
        let coordinator: LoginCoordinatorDependencies = container.resolve(
            arguments: flow, navigationController)
        coordinator.start()
    }

    func landingProcess() {
        var coordinator: MainCoordinatorDependencies = container.resolve(
            arguments: flow,
            navigationController)
        coordinator.start()
    }
}
