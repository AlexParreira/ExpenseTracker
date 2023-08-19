//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
   // var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    // MARK: TITLE
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    let totalExpense = data.last?.1 ?? 0
                    CardView {
                        VStack{
                            ChartLabel(totalExpense.formatted(.currency(code: "BRL")), type: .title)
                                
                            LineChart()
                        }
                        .background(Color.systemBackgroud)
                    }
                    .data(data)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackgroud, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    
                    
                    
                    //MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.backgroud)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
              // MARK: NOTIFICATION ICON
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
        
    }
}
