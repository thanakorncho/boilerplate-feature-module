//
//  FeatOverlayView.swift

//
//  Created by KniGht ThanaKorn on 17/3/22.
//

import Foundation
import RxCocoa
import RxGesture
import RxSwift
import UIKit

class FeatOverlayView: FeatView {

    private typealias Completion = (() -> Void)?

    // MARK: - UI
    private let backdropView: UIView = .init(frame: .zero)

    // MARK: - Constraints

    // MARK: - Controller

    // MARK: - Constants
    var maxDimmedAlpha: CGFloat = 0.4
    var backdropColor: UIColor = ThemeColor.background

    // MARK: - Data source

    // MARK: - Rx
    let onTapDismissRelay = PublishRelay<Void>()

    // MARK: - Cycle

    // MARK: - Setup
    override func setupProperties() {
        backdropView.alpha = maxDimmedAlpha
        backdropView.backgroundColor = backdropColor
    }

    override func setupHierarchies() {
        addSubview(backdropView)
        backdropView.sendSubviewToBack(backdropView)
    }

    override func setupConstraints() {
        backdropView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }

    override func setupEvent() {
        backdropView.rx.tapGesture()
            .mapToVoid()
            .skip(1)
            .debug()
            .bind(to: onTapDismissRelay)
            .disposed(by: disposeBag)
    }

    private func animateShowDimmedView() {
        backdropView.alpha = 0
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            self.backdropView.alpha = self.maxDimmedAlpha
        }
    }

    private func animateDismissView(_ completion: Completion = nil) {
        // hide blur view
        backdropView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.backdropView.alpha = 0
        } completion: { [weak self] _ in
            // once done, dismiss without animation
            completion?()
//            self?.dismiss(animated: false, completion: completion)
        }
        // hide main view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
//            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.layoutIfNeeded()
        }
    }
}
