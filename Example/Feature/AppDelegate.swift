//
//  AppDelegate.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 04/20/2023.
//  Copyright (c) 2023 Thanakorn Chongcharoenthanakul. All rights reserved.
//

import UIKit
import Swinject
import IQKeyboardManagerSwift
import Feature

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    var container: Container = .init()
    var appContainer: AppContainer
    var containerAppDelegate: ContainerAppDelegateDependencies!
    var applicationDelegates: [UIApplicationDelegate] {
        [
            containerAppDelegate
        ]
    }
    
    override init() {
        self.appContainer = .init(container)
        super.init()
    }
    
    private func setup() {
        appContainer.inject(window)
        containerAppDelegate = container.resolve()
    }
    
    func setupIQKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setup()
        let delegateResults = applicationDelegates
            .map({
                $0.application?(
                    application,
                    willFinishLaunchingWithOptions: launchOptions)
            })
            .contains(false)
        return true && !delegateResults
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupIQKeyboard()
        #if DEBUG
        /// Debugging memory leak
        _ = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                print("Resource count \(RxSwift.Resources.total)")
            })
        #endif
        let delegateResults = applicationDelegates
            .map({
                $0.application?(
                    application,
                    didFinishLaunchingWithOptions: launchOptions)
            })
            .contains(false)
        return true && !delegateResults
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        applicationDelegates.forEach({
            $0.applicationWillResignActive?(application)
        })
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        applicationDelegates.forEach({
            $0.applicationWillEnterForeground?(application)
        })
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        applicationDelegates.forEach({
            $0.applicationWillEnterForeground?(application)
        })
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        applicationDelegates.forEach({
            $0.applicationDidBecomeActive?(application)
        })
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        applicationDelegates.forEach({
            $0.applicationWillTerminate?(application)
        })
    }
}

