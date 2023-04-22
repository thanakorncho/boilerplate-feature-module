//
//  ProfileQuery.swift
//  Avatar
//
//  Created by KniGht ThanaKorn on 6/6/22.
//

import Foundation
import RxSwift

struct ProfileFetchQuery {
    typealias Request = EmptyRequest
    typealias Response = Single<PersonDomain>
    typealias Exception = DefaultException
}

struct ProfileUpdateQuery {
    typealias Request = RequestById
    typealias Response = Single<PersonDomain>
    typealias Exception = DefaultException
}

struct ProfileDeleteQuery {
    typealias Request = RequestById
    typealias Response = Single<Void>
    typealias Exception = DefaultException
}
