//
//  ActivityData.swift

//
//  Created by KniGht ThanaKorn on 9/9/22.
//

import Foundation
import NVActivityIndicatorView

struct ActivityData {
    /// Size of activity indicator view.
    let size: CGSize

    /// Message displayed under activity indicator view.
    let message: String?

    /// Font of message displayed under activity indicator view.
    let messageFont: UIFont

    /// Message spacing to activity indicator view.
    let messageSpacing: CGFloat

    /// Animation type.
    let type: NVActivityIndicatorType

    /// Color of activity indicator view.
    let color: UIColor

    /// Color of text.
    let textColor: UIColor

    /// Padding of activity indicator view.
    let padding: CGFloat

    /// Display time threshold to actually display UI blocker.
    let displayTimeThreshold: Int

    /// Minimum display time of UI blocker.
    let minimumDisplayTime: Int

    /// Background color of the UI blocker
    let backgroundColor: UIColor

    /**
     Create information package used to display UI blocker.
     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.
     - parameter size:                 size of activity indicator view.
     - parameter message:              message displayed under activity indicator view.
     - parameter messageFont:          font of message displayed under activity indicator view.
     - parameter messageSpacing:       message spacing to activity indicator view.
     - parameter type:                 animation type.
     - parameter color:                color of activity indicator view.
     - parameter padding:              padding of activity indicator view.
     - parameter displayTimeThreshold: display time threshold to actually display UI blocker.
     - parameter minimumDisplayTime:   minimum display time of UI blocker.
     - parameter textColor:            color of the text below the activity indicator view. Will match color parameter if not set, otherwise DEFAULT_TEXT_COLOR if color is not set.
     - returns: The information package used to display UI blocker.
     */
}
