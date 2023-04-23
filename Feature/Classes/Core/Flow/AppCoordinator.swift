import Foundation
import RxRelay
import RxSwift
import Swinject

public enum CoordinatorFlow {
    case login
    case main
}

public protocol CoordinatorRouteDependencies {
    var current: CoordinatorFlow? { get set }
    var flow: PublishRelay<CoordinatorFlow> { get }
    var login: PublishRelay<Void> { get }
    var main: PublishRelay<Void> { get }
}

struct AppCoordinatorRoute: CoordinatorRouteDependencies {
    var current: CoordinatorFlow?
    var flow: PublishRelay<CoordinatorFlow> = .init()
    var login: PublishRelay<Void> = .init()
    var main: PublishRelay<Void> = .init()
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
    
    // MARK: - Properties
    public var flow: CoordinatorRouteDependencies

    // MARK: - Router

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
        flow.flow
            .debug()
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: flowBinder)
            .disposed(by: disposeBag)
    }

    private func initialRootView() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        loginFlow()
    }

    func loginFlow() {
        let coordinator: LoginCoordinatorDependencies = container.resolve(
            arguments: flow,
            navigationController)
        coordinator.start()
        flow.current = .login
        childCoordinator.append(coordinator)
    }

    func mainFlow() {
        let coordinator: MainCoordinatorDependencies = container.resolve(
            arguments: flow,
            navigationController)
        coordinator.start()
        flow.current = .main
        childCoordinator.append(coordinator)
    }
}

// MARK: - Action
extension AppCoordinator {
    private var flowBinder: Binder<CoordinatorFlow> {
        return Binder(self, binding: { target, value in
            target.flowChanged(value)
        })
    }
}

// MARK: - Helper
extension AppCoordinator {
    private func flowChanged(_ next: CoordinatorFlow) {
        childCoordinator.removeFlow(flow.current)
        let new = UINavigationController()
        window?.switchRootViewController(to: new) { [weak self] in
            print("before childCoordinator.count: \(String(describing: self?.childCoordinator.count))")
            self?.navigationController = new
            switch next {
            case .login:
                self?.loginFlow()
            case .main:
                self?.mainFlow()
            }
            
            print("after childCoordinator.count: \(String(describing: self?.childCoordinator.count))")
        }
    }
}

private extension Array where Element == DefaultCoordinator {
    mutating func removeFlow(_ flow: CoordinatorFlow?) {
        guard let flow = flow else {
            self.removeAll()
            return
        }
        
        switch flow {
        case .login:
            remove(LoginCoordinator.self)

        case .main:
            remove(MainCoordinator.self)
        }
    }

    private mutating func remove<T: DefaultCoordinator>(_ type: T.Type) {
        self.removeAll { coordinator in
            if let _ = coordinator as? T {
                print("coordinator: \(String(describing: type)) has been removed")
                return true
            } else {
                return false
            }
        }
    }
}
