//
//  ProfileRepositoryDependencies.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation

protocol ProfileRepositoryDependencies {
    func fetch() -> ProfileFetchQuery.Response
    func update(
        _ request: ProfileUpdateQuery.Request
    ) -> ProfileUpdateQuery.Response
    func delete(
        _ request: ProfileDeleteQuery.Request
    ) -> ProfileDeleteQuery.Response
}
