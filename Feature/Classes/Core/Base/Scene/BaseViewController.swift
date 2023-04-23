//
//  BaseViewController.swift

//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import SwiftEntryKit

protocol BaseTest {
    associatedtype ViewModel = BaseViewModelDriven
    var viewModel: ViewModel? { get set }
}

protocol BaseViewController {
    var loading: ActivityIndicatorDependencies? { get }
    var sceneTracker: SceneTrackerDependencies? { get }
}

protocol NameDescribable {
    var typeName: String { get }
}

extension NameDescribable {
    var typeName: String {
        let named = String(describing: type(of: self))
        let range = named.range(of: "\u{003C}")
        guard let range = range else { return named }
        let name = named.prefix(upTo: range.lowerBound)
        return name.string
    }
}

open class DefaultBaseViewController: UIViewController, BaseViewController, NameDescribable, AnalyticSceneableScreen {

    // MARK: - Constants
    var screenType: AnalyticsScreenType? {
        return nil
    }

    var classType: String? {
        return typeName
    }

    // MARK: - Dependencies
    var loading: ActivityIndicatorDependencies?
    var sceneTracker: SceneTrackerDependencies?

    // MARK: - Life Cycle
    // For setup navigation & common state
    open override func viewDidLoad() {
        super.viewDidLoad()
        sceneTracker = SceneTracker(screen: self)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sceneTracker?.trackScreen(parameters: makeAnalyticsParameters())
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    public func dismiss(_ onDismiss: (() -> Void)? = nil) {
        if SwiftEntryKit.isCurrentlyDisplaying {
            SwiftEntryKit.dismiss(with: onDismiss)
        } else {
            dismissOrPop(completion: onDismiss)
        }
    }
}

extension BaseViewController {
    func makeAnalyticsParameters() -> AnalyticsParameter {
        return .init(contentGroup: AnalyticsConstants.contentGroup)
    }
}
