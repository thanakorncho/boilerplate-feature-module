//
//  UIViewController+Extension.swift

//
//  Created by KniGht ThanaKorn on 31/3/22.
//

import Foundation

extension UIViewController {
    var windowSafeAreaInsets: UIEdgeInsets? {
        UIApplication.shared.keyWindow?.safeAreaInsets
    }

    func dismissOrPop(_ animated: Bool = true, completion: (() -> Void)? = nil) {
        if let navigationController = navigationController,
           navigationController.viewControllers[0] != self {
            navigationController.popViewController(animated: animated, completion)
        } else {
            dismiss(animated: animated, completion: completion)
        }
    }

    func present(
        viewControllerToPresent: UIViewController,
        transition: CommonViewController.TransitionOptions? = nil,
        animated flag: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        present(
            viewControllerToPresent: viewControllerToPresent,
            direction: transition?.direction,
            curve: transition?.curve,
            duration: transition?.duration,
            animated: flag,
            completion: completion)
    }

    func present(
        viewControllerToPresent: UIViewController,
        direction: CommonViewController.Direction? = nil,
        curve: CommonViewController.Curve? = nil,
        duration: CFTimeInterval? = nil,
        animated flag: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        if let direction = direction, let curve = curve {
            let transition = direction.transition()
            transition.duration = duration ?? 0.33
            transition.timingFunction = curve.function
            view.window?.layer.add(transition, forKey: kCATransition)
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            present(viewControllerToPresent, animated: false, completion: completion)
        } else {
            present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
}
