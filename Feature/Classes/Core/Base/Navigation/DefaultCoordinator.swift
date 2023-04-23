import Foundation
import RxSwift
import Swinject

public protocol DefaultCoordinator {
    var container: Container { get }
    var flow: CoordinatorRouteDependencies { get }
    var navigationController: UINavigationController { get set }
    func start()
}
