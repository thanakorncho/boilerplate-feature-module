import Foundation
import Swinject

extension Container {
}

public extension Resolver {
    func resolve<T>() -> T {
        guard let resolvedType = self.resolve(T.self) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T>(registrationName: String?) -> T {
        guard let resolvedType = self.resolve(T.self, name: registrationName) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg>(argument: Arg) -> T {
        guard let resolvedType = self.resolve(T.self, argument: argument) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let resolvedType = self.resolve(T.self, arguments: arg1, arg2) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2, Arg3>(arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> T {
        guard let resolvedType = self.resolve(T.self, arguments: arg1, arg2, arg3) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2, Arg3, Arg4>(arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) -> T {
        guard let resolvedType = self.resolve(T.self, arguments: arg1, arg2, arg3, arg4) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg>(name: String?, argument: Arg) -> T {
        guard let resolvedType = self.resolve(T.self, name: name, argument: argument) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(name: String?, arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard let resolvedType = self.resolve(T.self, name: name, arguments: arg1, arg2) else {
            fatalError()
        }
        return resolvedType
    }
}
