//
//  AppContainerDelegate.swift

//
//  Created by KniGht ThanaKorn on 8/3/22.
//

import Foundation
import SwifterSwift

public protocol ContainerAppDelegateDependencies: BaseAppDelegate {
    var defaultOrientationLock: UIInterfaceOrientationMask { get }
    var orientationLock: UIInterfaceOrientationMask { get set }
}

extension ContainerAppDelegateDependencies {
    public var defaultOrientationLock: UIInterfaceOrientationMask { .portrait }
}

public class ContainerAppDelegate: NSObject,
    ContainerAppDelegateDependencies {

    // MARK: - Data source
    public var window: UIWindow?
    public var container: ContainerDependencies?
    public var orientationLock: UIInterfaceOrientationMask = .portrait
    private var coordinator: AppCoordinatorDependencies?

    // MARK: - Setup
    convenience init(
        container: ContainerDependencies,
        window: UIWindow
    ) {
        self.init()
        self.container = container
        self.window = window
    }

    public override init() {
        super.init()
    }

    // MARK: - Setup
    private func setup() {
    }

    // MARK: - UIApplication Delegate
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setup()
        return true
    }

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        coordinator = container?.container.resolve(argument: window)
        coordinator?.start()
        return true
    }

    public func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        orientationLock
    }
}
