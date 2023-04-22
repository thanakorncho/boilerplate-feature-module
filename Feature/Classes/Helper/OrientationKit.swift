//
//  AppUtility.swift

//
//  Created by KniGht ThanaKorn on 19/3/22.
//

import Foundation

protocol OrientationKitDependencies {
    func lockOrientation(_ orientation: UIInterfaceOrientationMask)
    func lockOrientation(
        _ orientation: UIInterfaceOrientationMask,
        andRotateTo rotateOrientation: UIInterfaceOrientation)
    func resetOrientation()
}

class OrientationKit: OrientationKitDependencies {

    @available(iOS 16.0, *)
    private typealias GeometryPreferences = UIWindowScene.GeometryPreferences

    private var container: ContainerAppDelegateDependencies

    init(_ container: ContainerAppDelegateDependencies) {
        self.container = container
    }

    func lockOrientation(
        _ orientation: UIInterfaceOrientationMask
    ) {
        container.orientationLock = orientation
    }

    func lockOrientation(
        _ orientation: UIInterfaceOrientationMask,
        andRotateTo rotateOrientation: UIInterfaceOrientation
    ) {
        lockOrientation(orientation)
        if #available(iOS 16.0, *) {
            let connectedScenes = UIApplication.shared.connectedScenes
            guard let windowScene = connectedScenes.first as? UIWindowScene else {
                return
            }

            UIApplication.topViewController?.setNeedsUpdateOfSupportedInterfaceOrientations()
            let preferences: GeometryPreferences = .iOS(
                interfaceOrientations: rotateOrientation.asOrientationMask()
            )
            windowScene.requestGeometryUpdate(preferences) { error in
                // Handle denial of request.
                print("requestGeometryUpdate error: \(error)")
            }
        } else {
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }

    func resetOrientation() {
        lockOrientation(
            container.defaultOrientationLock,
            andRotateTo: container.defaultOrientationLock.asOrientation())
    }
}

private extension UIInterfaceOrientationMask {
    func asOrientation() -> UIInterfaceOrientation {
        switch self {
        case .landscapeRight:
            return .landscapeRight

        default:
            return .portrait
        }
    }
}

private extension UIInterfaceOrientation {
    func asOrientationMask() -> UIInterfaceOrientationMask {
        switch self {
        case .landscapeLeft, .landscapeRight:
            return .landscapeRight

        default:
            return .portrait
        }
    }
}
