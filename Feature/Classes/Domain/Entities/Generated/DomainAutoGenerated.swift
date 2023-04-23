// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
private func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    switch (lhs, rhs) {
    case let (lValue?, rValue?):
        return compare(lValue, rValue)

    case (nil, nil):
        return true

    default:
        return false
    }
}

private func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (idx, lhsItem) in lhs.enumerated() {
        guard compare(lhsItem, rhs[idx]) else { return false }
    }

    return true
}

// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - PersonDomain AutoEquatable
extension PersonDomain: Equatable {}
internal func == (lhs: PersonDomain, rhs: PersonDomain) -> Bool {
    guard lhs.firstName == rhs.firstName else { return false }
    guard lhs.surName == rhs.surName else { return false }
    guard lhs.age == rhs.age else { return false }
    guard lhs.suspend == rhs.suspend else { return false }
    return true
}

// MARK: - AutoEquatable for Enums

// swiftlint:disable all


// MARK: - AutoHashable for classes, protocols, structs

// MARK: - AutoHashable for Enums
