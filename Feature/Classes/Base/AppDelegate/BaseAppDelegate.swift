//
//  BaseAppDelegate.swift

//
//  Created by KniGht ThanaKorn on 19/3/22.
//

import Foundation

public protocol BaseAppDelegate: UIApplicationDelegate {
    var container: ContainerDependencies? { get set }
}
