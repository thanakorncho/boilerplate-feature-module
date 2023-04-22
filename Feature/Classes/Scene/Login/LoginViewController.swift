//
//  LoginViewController.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import SnapKit

class LoginViewController<ViewModel: LoginViewModelDriven>:
    DefaultBaseViewController,
    BaseViewDependencies {

    internal typealias Model = LoginModels

    // MARK: - UI
    private var mainView: LoginView = .init(frame: .zero)

    // MARK: - Dependencies
    var viewModel: ViewModel!

    // MARK: - Contants

    // MARK: - Rx
    private let disposeBag = DisposeBag()

    // MARK: - Observable

    // MARK: - Cycle
    convenience init(_ viewModel: ViewModel) {
        self.init()
        self.viewModel = viewModel
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.input.onLoad.acceptVoid()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    // MARK: - Setup
    internal func setup() {
        setupProperties()
        setupHierarchies()
        setupConstraints()
        setupEvent()
    }

    internal func setupProperties() {

    }

    internal func setupHierarchies() {
        view.addSubview(mainView)
    }

    internal func setupConstraints() {
        mainView.snp.makeConstraints({ make in
            make.edges.equalTo(view)
        })
    }

    private func setupEvent() {
        disposeBag.insert([
            // For View
        ])

        disposeBag.insert([
            viewModel.output.didLoading.drive(loadingBinder),
            viewModel.output.didLoad.drive(loadBinder)
        ])

        disposeBag.insert([
            // For Other
        ])
    }
}

// MARK: - Binder
extension LoginViewController {
    private var loadingBinder: Binder<Bool> {
        return Binder(self, binding: { target, value in
            if value {
                // display loading
            } else {
                // hide loading
            }
        })
    }

    private var loadBinder: Binder<Model.Displayed> {
        return Binder(self, binding: { target, value in
            target.mainView.setupDisplayed(value)
        })
    }
}

// MARK: - Helper
extension LoginViewController {

}

// MARK: - Common
extension LoginViewController {

}
