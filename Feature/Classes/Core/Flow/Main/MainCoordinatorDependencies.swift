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
    
    typealias MainProfileVM = MainProfileViewModel
    typealias MainProfileVC = MainProfileViewController<MainProfileVM>
    typealias MainProfileProvider = MainProfileViewModelProvider
    
    typealias MainSettingVM = MainSettingViewModel
    typealias MainSettingVC = MainSettingViewController<MainSettingVM>
    typealias MainSettingProvider = MainSettingViewModelProvider
}
