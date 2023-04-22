//
//  BaseView.swift

//
//  Created by KniGht ThanaKorn on 9/3/22.
//

import Foundation
import RxSwift

protocol BaseView {
    func setup()
    func setupProperties()
    func setupNavigation()
    func setupHierarchies()
    func setupConstraints()
    func setupLocalizes()
    func setupEvent()
    func setupAccessibilityIds()
}

open class DefaultBaseView: UIView, BaseView {

    // MARK: - Constants
    var isRoundedCorners: Bool = false

    // MARK: - Rx
    let disposeBag = DisposeBag()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Life cycle
    open override func layoutSubviews() {
        super.layoutSubviews()
        setupRoundCorner()
    }

    // MARK: - Setup
    func setup() {
        setupHierarchies()
        setupConstraints()
        setupProperties()
        setupNavigation()
        setupLocalizes()
        setupEvent()
        setupAccessibilityIds()
    }

    func setupProperties() {
        backgroundColor = .clear
    }

    func setupNavigation() {
        let array = Array.init(repeating: PersonDomain(id: "", firstName: "", surName: "", age: 0, suspend: true), count: 10)
        
    }

    func setupHierarchies() {
    }

    func setupConstraints() {
    }

    func setupLocalizes() {
    }

    func setupEvent() {
    }

    func setupAccessibilityIds() {
    }
}

extension DefaultBaseView {
    private func setupRoundCorner() {
        guard isRoundedCorners else {
            return
        }

        roundCorners()
    }
}
