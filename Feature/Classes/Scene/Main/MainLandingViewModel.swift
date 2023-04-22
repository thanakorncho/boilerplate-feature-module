//
//  MainLandingViewModel.swift
//  Pods
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftExt
import RxRelay

class MainLandingViewModel:
    DefaultBaseViewModel,
    MainLandingViewModelDependencies,
    MainLandingViewModelDriven {

    private typealias Object = MainLandingViewModel
    private typealias Driven = MainLandingStreams
    private typealias Model = MainLandingModels

    // MARK: - Data source
    var useCases: MainLandingViewModelUseCases
    var context: MainLandingViewModelProvider.Context

    // MARK: - Rx
    let disposeBag = DisposeBag()
    private let activityIndicator = ActivityIndicator()
    private let errorTracker = ErrorTracker()

    // MARK: - Observable
    private let loadingRelay = PublishRelay<Bool>()
    private let loadRelay = PublishRelay<Model.Displayed>()

    // MARK: - Input & Output & Router
    var input: MainLandingViewModelInput!
    var output: MainLandingViewModelOutput!

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
extension MainLandingViewModel {

}

// MARK: - Common
extension MainLandingViewModel {

}
