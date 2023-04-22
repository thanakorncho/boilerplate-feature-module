//
//  ProfileUseCaseModel.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation
import RxSwift

struct ProfileFetch {
    typealias Request = EmptyRequest
    typealias Response = Single<PersonDomain>
    typealias Exception = DefaultException
}

struct ProfileUpdate {
    typealias Request = RequestById
    typealias Response = Single<PersonDomain>
    typealias Exception = DefaultException
}

struct ProfileDelete {
    typealias Request = RequestById
    typealias Response = Single<Void>
    typealias Exception = DefaultException
}
