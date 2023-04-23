//
//  ProfileRepository.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation
import RxCocoa

final class ProfileRepository: ProfileRepositoryDependencies {
    func fetch() -> ProfileFetchQuery.Response {
        return .never()
    }

    func update(
        _ request: ProfileUpdateQuery.Request
    ) -> ProfileUpdateQuery.Response {
        return .never()
    }

    func delete(
        _ request: ProfileDeleteQuery.Request
    ) -> ProfileDeleteQuery.Response {
        return .never()
    }
}
