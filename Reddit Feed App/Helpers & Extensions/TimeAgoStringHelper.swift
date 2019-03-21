//
//  TimeAgoStringHelper.swift
//  Reddit Feed App
//
//  Created by Lucas on 21/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

class TimeAgoStringHelper {
    static let WEEK_SECONDS = 604800
    static let DAY_SECONDS = 86400
    static let HOUR_SECONDS = 3600
    static let MINUTE_SECONDS = 60
    
    static func timeAgoString(sinceTimestamp: Int, currentTimestamp: Int) -> String {
        var amount: Int = 0
        var unit = ""
        let delta = currentTimestamp - sinceTimestamp
        if delta < 0 { return "" }
        if delta == 0 { return "now" }
        if delta >= WEEK_SECONDS {
            amount = delta / WEEK_SECONDS
            unit = amount == 1 ? "week" : "weeks"
            return string(amount: amount, unit: unit)
        }
        
        if delta >= DAY_SECONDS {
            amount = delta / DAY_SECONDS
            unit = amount == 1 ? "day" : "days"
            return string(amount: amount, unit: unit)
        }
        
        if delta >= HOUR_SECONDS {
            amount = delta / HOUR_SECONDS
            unit = amount == 1 ? "hour" : "hours"
            return string(amount: amount, unit: unit)
        }
        
        if delta >= MINUTE_SECONDS {
            amount = delta / MINUTE_SECONDS
            unit = amount == 1 ? "minute" : "minutes"
            return string(amount: amount, unit: unit)
        }
        
        return ""
    }
    
    static func string(amount: Int, unit: String) -> String {
        return String(describing: amount) + " " + unit + " ago"
    }
}
