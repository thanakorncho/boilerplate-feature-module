//
//  LandingCoordinatorDependencies.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation

protocol MainCoordinatorType {
    typealias MainLandingVM = MainLandingViewModel
    typealias MainLandingVC = MainLandingViewController<MainLandingVM>
    typealias MainLandingProvider = MainLandingViewModelProvider
}
