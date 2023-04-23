//
//  MainSettingViewModel.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 23/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class MainSettingViewModel:
    DefaultBaseViewModel,
    MainSettingViewModelDependencies,
    MainSettingViewModelDriven {

    private typealias Object = MainSettingViewModel
    private typealias Driven = MainSettingStreams
    private typealias Model = MainSettingModels

    // MARK: - Data source
    var useCases: MainSettingViewModelUseCases
    var context: MainSettingViewModelProvider.Context

    // MARK: - Rx
    let disposeBag = DisposeBag()
    private let activityIndicator = ActivityIndicator()
    private let errorTracker = ErrorTracker()

    // MARK: - Observable
    private let loadingRelay = PublishRelay<Bool>()
    private let loadRelay = PublishRelay<Model.Displayed>()

    // MARK: - Input & Output & Router
    var input: MainSettingViewModelInput!
    var output: MainSettingViewModelOutput!
    var action: MainSettingViewModelAction!

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
            tapSomething: .init(),
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
extension MainSettingViewModel {

}

// MARK: - Common
extension MainSettingViewModel {

}
