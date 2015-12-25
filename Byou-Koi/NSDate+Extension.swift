//
//  NSDate+Extension.swift
//  Byou-Koi
//
//  Created by 松下慶大 on 2015/12/25.
//  Copyright © 2015年 matsushita keita. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension NSDate {
    class func distanceOfTimeInWords(fromDate:NSDate, toDate:NSDate) -> String {
        
        let MINUTE_IN_SECONDS = 60.0
        let HOUR_IN_SECONDS = MINUTE_IN_SECONDS * 60.0
        let DAY_IN_SECONDS = HOUR_IN_SECONDS * 24.0
        let MONTH_IN_SECONDS = DAY_IN_SECONDS * 30.0
        let YEAR_IN_SECONDS = DAY_IN_SECONDS * 365.0
        
        let deltaSeconds = abs(toDate.timeIntervalSinceDate(fromDate))
        var timeAgo = ""
        
        switch deltaSeconds {
            // 0 <-> 29 secs                                                             # => less than a minute
        case 0..<30:
            timeAgo = "数秒前"
            
            // 30 secs ..< 1 min, 30 secs                                                # => 1 minute
        case 30..<90:
            timeAgo = "一分前"
            
            // 1 min, 30 secs ..< 44 mins, 30 secs                                       # => [2..44] minutes
        case 90..<(44 * MINUTE_IN_SECONDS + 30):
            let minutes = Int(round(deltaSeconds / MINUTE_IN_SECONDS))
            timeAgo = "\(minutes)分前"
            
            // 44 mins, 30 secs ..< 89 mins, 30 secs                                     # => about 1 hour
        case (44 * MINUTE_IN_SECONDS + 30)..<(89 * MINUTE_IN_SECONDS + 30):
            timeAgo = "1時間"
            
            // 89 mins, 30 secs ..< 23 hrs, 59 mins, 30 secs                             # => about [2..24] hours
        case (89 * MINUTE_IN_SECONDS + 30)..<(23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30):
            let hours = Int(round(deltaSeconds / HOUR_IN_SECONDS))
            timeAgo = "\(hours)時間前"
            
            // 23 hrs, 59 mins, 30 secs ..< 41 hrs, 59 mins, 30 secs                     # => 1 day
        case (23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30)..<(41 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30):
            timeAgo = "1日前"
            
            // 41 hrs, 59 mins, 30 secs  ..< 29 days, 23 hrs, 59 mins, 30 secs           # => [2..29] days
        case (41 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30)..<(29 * DAY_IN_SECONDS + 23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30):
            let days = Int(round(deltaSeconds / DAY_IN_SECONDS))
            timeAgo = "\(days)日前"
            
            // 29 days, 23 hrs, 59 mins, 30 secs ..< 44 days, 23 hrs, 59 mins, 30 secs   # => about 1 month
        case (29 * DAY_IN_SECONDS + 23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30)..<(44 * DAY_IN_SECONDS + 23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30):
            timeAgo = "1ヶ月前"
            
            // 44 days, 23 hrs, 59 mins, 30 secs ..< 59 days, 23 hrs, 59 mins, 30 secs   # => about 2 months
        case (44 * DAY_IN_SECONDS + 23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30)..<(59 * DAY_IN_SECONDS + 23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30):
            timeAgo = "2ヶ月前"
            
            // 59 days, 23 hrs, 59 mins, 30 secs ..< 1 yr                                # => [2..12] months
        case (59 * DAY_IN_SECONDS + 23 * HOUR_IN_SECONDS + 59 * MINUTE_IN_SECONDS + 30)..<(1 * YEAR_IN_SECONDS):
            let months = Int(round(deltaSeconds / MONTH_IN_SECONDS))
            timeAgo = "\(months)ヶ月前"
            
            // 1 yr ..< 1 yr, 3 months                                                   # => about 1 year
        case (1 * YEAR_IN_SECONDS)..<(1 * YEAR_IN_SECONDS + 3 * MONTH_IN_SECONDS):
            timeAgo = "1 year"
            
            // 1 yr, 3 months ..< 1 yr, 9 months                                         # => over 1 year
        case (1 * YEAR_IN_SECONDS + 3 * MONTH_IN_SECONDS)..<(1 * YEAR_IN_SECONDS + 9 * MONTH_IN_SECONDS):
            timeAgo = "1年以上"
            
            // 1 yr, 9 months ..< 2 yr minus                                             # => almost 2 years
        case (1 * YEAR_IN_SECONDS + 9 * MONTH_IN_SECONDS)..<(2 * YEAR_IN_SECONDS):
            timeAgo = "2年前"
            
            // 2 yrs <-> max time or date                                                # => (same rules as 1 yr)
        default:
            let years = Int(round(deltaSeconds / YEAR_IN_SECONDS))
            timeAgo = "\(years)年前"
        }
        
        return timeAgo
    }
    
    func timeAgoInWords() -> String {
        return NSDate.distanceOfTimeInWords(self, toDate: NSDate())
    }
    
    
    class func convertToNSDate(timeString: String) -> NSDate {
        let str = timeString.stringByReplacingOccurrencesOfString("T", withString: " ")
        let str2 = str.stringByReplacingOccurrencesOfString(".000Z", withString: "") + " +0000"
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzzz"
        let date: NSDate! = dateFormatter.dateFromString(str2)
        return date
    }
    
    
}