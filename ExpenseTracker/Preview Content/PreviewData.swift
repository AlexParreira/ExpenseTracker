//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import Foundation
import SwiftUI


var transactionPreviewData =  Transaction(id: 1, date: "18/09/2023", institution: "Padaria", account: "Visa Padaria", merchant: "Pão", amount: 11.49, type: "debit", categoryId: 801, Category: "Alimento", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
