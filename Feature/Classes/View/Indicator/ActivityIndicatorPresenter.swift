//
//  ActivityIndicatorPresenter.swift

//
//  Created by KniGht ThanaKorn on 12/9/22.
//

import Foundation
import RxSwift
import SwiftEntryKit

 protocol ActivityIndicatorDependencies {
    /**
     Display UI blocker
     - parameter isAnimating: boolean used to display or hidden UI blocker.
     */
    func animating(_ isAnimating: Bool)
    /**
     Display UI blocker by Binder
     - parameter isAnimating: boolean used to display or hidden UI blocker.
     */
    var loadingBinder: Binder<Bool> { get }
    /**
     Display UI blocker.
     */
    func startAnimating()
    /**
     Remove UI blocker.
     */
    func stopAnimating()
}

 class ActivityIndicatorPresenter: ActivityIndicatorDependencies {
    fileprivate enum State {
        case waitingToStart
        case animating
        case waitingToStop
        case stopped
    }

    // MARK: - UI
    private let activityIndicator = ActivityIndicatorView()

    // MARK: - Rx

    // MARK: - Constant

    // MARK: - interface
     func animating(_ isAnimating: Bool) {
        if isAnimating {
            startAnimating()
        } else {
            stopAnimating()
        }
    }

     func startAnimating() {
        var attributes: EKAttributes = .loading
        attributes.name = String(describing: self)
        SwiftEntryKit.display(
            entry: activityIndicator,
            using: attributes)
    }

     func stopAnimating() {
        let entryNamed = String(describing: self)
        if SwiftEntryKit.isCurrentlyDisplaying(entryNamed: entryNamed) {
            SwiftEntryKit.dismiss(.specific(entryName: entryNamed))
        }
    }
}

// MARK: - Rx Binder
extension ActivityIndicatorPresenter {
     var loadingBinder: Binder<Bool> {
        return Binder(self, binding: { target, value in
            target.animating(value)
        })
    }
}
