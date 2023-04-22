//
//  TimeInterval+Extension.swift

//
//  Created by KniGht ThanaKorn on 22/6/22.
//

import Foundation

public extension TimeInterval {

    var milliToSeconds: Int {
        return Int(self / 1000)
    }

    var milliToMinutes: Int {
        return milliToSeconds / 60
    }

    var milliToHours: Int {
        return milliToMinutes / 60
    }

    var milliToDays: Int {
        return milliToHours / 24
    }

    var milliseconds: Int {
        let truncating = truncatingRemainder(dividingBy: 1)
        return Int(truncating * 1000)
    }

    var seconds: Int {
        return Int(self) % 60
    }

    var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

    var hours: Int {
        return Int(self) / 3600
    }

    var stringTime: String {
        if hours.isPositive {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if minutes.isPositive {
            return "\(minutes)m \(seconds)s"
        } else if milliseconds.isPositive {
            return "\(seconds)s \(milliseconds)ms"
        } else {
            return "\(seconds)s"
        }
    }

    func stringTime(
        _ style: DateComponentsFormatter.UnitsStyle
    ) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
        formatter.unitsStyle = style
        return formatter.string(from: self)
    }
}
