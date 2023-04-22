import Foundation

public struct DateTimeFormats {
    static var all: [String] {
        return [dateTime, date, time].flatMap { $0 }
    }

    static var dateTime: [String] = [
        "MM-dd-yyyy HH:mm",
        "MMM d, h:mm a",
        "E, d MMM yyyy HH:mm:ss Z",
        "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        "yyyy-MM-dd'T'HH:mm:ssZ",
        "yyyy-MM-dd HH:mm:ss"
    ]

    static var date: [String] = [
        "EEEE, MMM d, yyyy",
        "MM/dd/yyyy",
        "yyyy-MM-dd",
        "MMMM yyyy",
        "MMM d, yyyy",
        "dd.MM.yy"
    ]

    static var time: [String] = [
        "HH:mm:ss.SSS"
    ]
}
