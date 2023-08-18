//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import Foundation


struct Transaction: Identifiable{
    
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var Category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    var isEdited: Bool
    
    
    var dataParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}


enum TransactionType: String{
    
    case debit = "debit"
    case credit = "credit"
}
