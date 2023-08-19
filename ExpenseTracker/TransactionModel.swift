//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable{
    
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    var isEdited: Bool
    
    
    var icon: FontAwesomeCode{
        if let category =  Category.all.first(where: {$0.id == categoryId}) {
            return category.icon
        }
        return .question
    }
    
    var dataParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String{
        dataParsed.formatted(.dateTime.year().month(.wide))
    }
}


enum TransactionType: String{
    
    case debit = "debit"
    case credit = "credit"
}

struct Category{
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoreyId: Int?
}


extension Category{
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "food & Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .car_alt)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Tranfer", icon: .exchange_alt)
    
    
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoreyId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoreyId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoreyId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .film, mainCategoreyId: 3)
    static let BankFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoreyId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoreyId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoreyId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoreyId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoreyId: 6)
    static let homeSupplien = Category(id: 602, name: "Home Supplien", icon: .lightbulb, mainCategoreyId: 6)
    static let payCheque = Category(id: 701, name: "PayCheque", icon: .dollar_sign, mainCategoreyId: 7)
    static let software = Category(id: 801, name: "Software", icon: .bus, mainCategoreyId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoreyId: 9)

}

extension Category{
    
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .BankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplien,
        .payCheque,
        .software,
        .creditCardPayment

    ]
    
    static let all: [Category] =  categories + subCategories
}
