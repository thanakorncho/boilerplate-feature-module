import Foundation
import SwifterSwift
import Swinject

public protocol ContainerDependencies {
    var container: Container { get }
    func inject(_ window: UIWindow?)
}

public final class AppContainer: ContainerDependencies {

    var assembler: Assembler = .init()
    public let container: Container

    public init(_ container: Container = .init()) {
        self.container = container
    }

    public func inject(_ window: UIWindow?) {
        initialApplication(window)
    }

    private func initialApplication(_ window: UIWindow? = nil) {
//        assembler = Assembler(
//            [
//                AppAssembly(self, window),
//                AppDelegateAssembly(),
//                UtilityAssembly(),
//                CoordinatorAssembly(),
//                UnityAssembly(),
//                UseCaseAssembly(),
//                SceneAssembly()
//            ],
//            container: container
//        )
    }
}
