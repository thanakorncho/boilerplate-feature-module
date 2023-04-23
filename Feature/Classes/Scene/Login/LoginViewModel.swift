//
//  LoginViewModel.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift
import RxSwiftExt

class LoginViewModel:
    DefaultBaseViewModel,
    LoginViewModelDependencies,
    LoginViewModelDriven {

    private typealias Object = LoginViewModel
    private typealias Driven = LoginStreams
    private typealias Model = LoginModels

    // MARK: - Data source
    var useCases: LoginViewModelUseCases
    var context: LoginViewModelProvider.Context

    // MARK: - Rx
    let disposeBag = DisposeBag()
    private let activityIndicator = ActivityIndicator()
    private let errorTracker = ErrorTracker()

    // MARK: - Observable
    private let loadingRelay = PublishRelay<Bool>()
    private let loadRelay = PublishRelay<Model.Displayed>()

    // MARK: - Input & Output & Router
    var input: LoginViewModelInput!
    var output: LoginViewModelOutput!
    var action: LoginViewModelAction!

    // MARK: - Setup
    init(
        _ context: Context,
        _ useCases: UseCases
    ) {
        self.context = context
        self.useCases = useCases
        super.init()
        self.setup()
    }

    private func setup() {
        input = Driven.Input(
            onLoad: .init()
        )
        output = Driven.Output(
            didLoad: loadRelay.asDriverOnErrorJustComplete(),
            didLoading: loadingRelay.asDriverOnErrorJustComplete()
        )
        action = Driven.Action(
            loggedIn: .init(),
            dismiss: .init()
        )
        subscribes()
    }

    // MARK: - Subscribes
    private func subscribes() {
        activityIndicator.asObservable()
            .bind(to: loadingRelay)
            .disposed(by: disposeBag)
        input.onLoad
            .subscribe(
                weak: self,
                onNext: Object.onLoadProcess)
            .disposed(by: disposeBag)
    }

    private func service() {

    }

    // MARK: - Process
    private func onLoadProcess(_ void: Void) {
        let displayed = Model.Displayed()
        loadRelay.accept(displayed)
    }
}

// MARK: - Helper
extension LoginViewModel {
}

// MARK: - Common
extension LoginViewModel {
}
