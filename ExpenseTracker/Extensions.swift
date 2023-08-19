//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import Foundation
import SwiftUI

extension Color{
    
    static let backgroud = Color("Backgroud")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackgroud = Color(uiColor: .systemBackground)
    
}


extension DateFormatter{
    static let allNumericaBR: DateFormatter = {
        print("initializing DataFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}


extension String{
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumericaBR.date(from: self) else { return Date() }
        return parsedDate
    }
}

extension Date: Strideable{
    func formatted() -> String{
        return self.formatted(.dateTime.year().month().day())
    }
}


extension Double{
    
    func roundedTo2Digits() -> Double{
        return (self * 100).rounded() / 100
    }
}
