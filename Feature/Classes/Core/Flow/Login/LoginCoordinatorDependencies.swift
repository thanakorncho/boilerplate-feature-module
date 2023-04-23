//
//  LoginCoordinatorDependencies.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 21/4/2566 BE.
//

import Foundation

protocol LoginCoordinatorType {
    typealias LoginVM = LoginViewModel
    typealias LoginVC = LoginViewController<LoginVM>
    typealias LoginProvider = LoginViewModelProvider
    
    typealias ForgotPasswordVM = ForgotPasswordViewModel
    typealias ForgotPasswordVC = ForgotPasswordViewController<ForgotPasswordVM>
    typealias ForgotPasswordProvider = ForgotPasswordViewModelProvider
}
