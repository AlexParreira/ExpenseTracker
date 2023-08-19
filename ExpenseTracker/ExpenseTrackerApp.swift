//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVm = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVm)
        }
    }
}
