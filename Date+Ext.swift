//
//  Date+Ext.swift
//  SampleSwift
//
//  Created by Ross Harding on 1/5/21.
//

import Foundation

extension Date {
    
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }

    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }

    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }

    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func toDateAtStartOfDay() -> Date? {
        let calendar = Calendar.current
        let componentFlags = Set<Calendar.Component>([.year, .month, .day, .weekOfYear, .hour, .minute, .second, .weekday, .weekdayOrdinal])
        var components = calendar.dateComponents(componentFlags, from: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)
    }

    func isSameDateAs(_ date: Date) -> Bool {
        let selfDay = self.toDateAtStartOfDay()
        let inputDay = date.toDateAtStartOfDay()
        return selfDay == inputDay
    }

    func isToday() -> Bool {
        return Date().isSameDateAs(self)
    }

}

