//
//  SelectVerseUseCaseDependencies.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation

protocol ProfileUseCaseDependencies {
    func fetchProfile() -> ProfileFetch.Response
    func updateProfile(
        _ request: ProfileUpdate.Request
    ) -> ProfileUpdate.Response
    func deleteProfile(
        _ request: ProfileDelete.Request
    ) -> ProfileDelete.Response
}
