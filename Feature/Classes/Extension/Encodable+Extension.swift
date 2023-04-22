import Foundation

extension Encodable {

    private typealias JSONSerial = JSONSerialization

    private var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return encoder
    }

    var dictionary: [String: Any]? {
        guard
            let data = try? self.jsonData(),
            let json = try? JSONSerial.jsonObject(with: data, options: [])
        else {
            return nil
        }

        guard let dictionary = json as? [String: Any] else {
            return nil
        }

        return dictionary
    }

    /// Encode into JSON and return `Data`
    func jsonData() throws -> Data {
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }

    func asJsonString() -> String? {
        guard
            let data = try? encoder.encode(self),
            let string = String(data: data, encoding: .utf8)
        else {
            return nil
        }

        return string
    }
}
