import Foundation
import RxSwift

public enum DefaultException: Error {
    case unknown
    case nonHTTPResponse(Error)
    case httpFailed(HTTPError)
    case deserializationError(Error)

    var message: String? {
        switch self {
        case .unknown:
            return "Unknown error has occurred."

        case let .httpFailed(error):
            if let message = error.message {
                return message
            } else if let userMessage = error.userMessage {
                return userMessage
            } else {
                return nil
            }

        case .nonHTTPResponse:
            return nil

        case let .deserializationError(error):
            return "Error during deserialization of the response: \(error)"
        }
    }
}

public struct HTTPError {
    var code: Int?
    var errorNumber: Int?
    var message: String?
    var userMessage: String?

    public init(
        code: Int? = nil,
        errorNumber: Int? = nil,
        message: String? = nil,
        userMessage: String? = nil
    ) {
        self.code = code
        self.errorNumber = errorNumber
        self.message = message
        self.userMessage = userMessage
    }
}

public extension HTTPError {
    func toError() -> DefaultException {
        return .httpFailed(self)
    }
}

public extension Error {
    func asErrorException() -> DefaultException? {
        guard let error = self as? DefaultException else {
            return nil
        }

        return error
    }
}

extension ObservableType {
    func catchError() -> Observable<Element> {
        return self.catch { error in
            if let error = error.asErrorException() {
                return .error(error)
            } else {
                return .error(error)
            }
        }
    }

    func catchError<T>(
        _ type: T.Type
    ) -> Observable<Element> where T: Error {
        return self.catch { error in
            return .error(error)
        }
    }
}
