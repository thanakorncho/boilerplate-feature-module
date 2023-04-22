//
//  ProfileUseCase.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation

class ProfileUseCase: ProfileUseCaseDependencies {
    
    private let profileRepository: ProfileRepositoryDependencies

    init(_ profileRepository: ProfileRepositoryDependencies = ProfileRepository()) {
        self.profileRepository = profileRepository
    }
    
    func fetchProfile() -> ProfileFetch.Response {
        profileRepository.fetch()
    }
    
    func updateProfile(
        _ request: ProfileUpdate.Request
    ) -> ProfileUpdate.Response {
        profileRepository.update(request)
    }
    
    func deleteProfile(
        _ request: ProfileDelete.Request
    ) -> ProfileDelete.Response {
        profileRepository.delete(request)
    }
}
