//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 19/08/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                //MARK: Transaction Group
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key){ month,
                    transactions in
                    Section{
                        //MARK: TRAnsaction List
                        ForEach(transactions){ transaction in
                            TransactionRow(transacrion: transaction)
                        }
                    }header: {
                        //MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Trasactions")
        .navigationBarTitleDisplayMode(.inline)
            
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        TransactionList()
            .environmentObject(transactionListVM)
    }
}
