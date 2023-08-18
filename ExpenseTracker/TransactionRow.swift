//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Alexander Parreira on 18/08/23.
//

import SwiftUI

struct TransactionRow: View {
    var transacrion: Transaction
    
    var body: some View {
        HStack(spacing: 20){
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: 6){
                //MARK: Transaction Merchant
                Text(transacrion.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                //MARK: Transaction Category
                Text(transacrion.Category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                //MARK: Transaction Data
                Text(transacrion.dataParsed, format: .dateTime.year().month().day())
                .font(.footnote)
                .foregroundColor(.secondary)
            }
            Spacer()
            
            //MARK: Transaction Amount
            Text(transacrion.signedAmount, format: .currency(code: "BRL"))
                .bold()
                .foregroundColor(transacrion.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transacrion: transactionPreviewData)
    }
}