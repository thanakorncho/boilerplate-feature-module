//
//  ForgotPasswordViewController.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import SnapKit

class ForgotPasswordViewController<ViewModel: ForgotPasswordViewModelDriven>:
    DefaultBaseViewController,
    BaseViewDependencies {

    internal typealias Model = ForgotPasswordModels

    // MARK: - UI
    private var mainView: ForgotPasswordView = .init(frame: .zero)

    // MARK: - Dependencies
    var viewModel: ViewModel!

    // MARK: - Contants

    // MARK: - Rx
    private let disposeBag = DisposeBag()

    // MARK: - Observable

    // MARK: - Cycle
    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = .init(frame: .zero)
        setupHierarchies()
        setupConstraints()
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
        setupEvent()
    }

    internal func setupProperties() {
        view.backgroundColor = .clear
        navigationItem.title = "Forgot Pass"
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
extension ForgotPasswordViewController {
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
extension ForgotPasswordViewController {

}

// MARK: - Common
extension ForgotPasswordViewController {

}
