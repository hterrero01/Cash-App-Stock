//
//  SearchTextFieldView.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/25/23.
//

import SwiftUI

struct SearchTextFieldView: View {
    @Binding var searchStock: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search Again", text: $searchStock)
                .padding()
            Spacer()
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(5)
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView(searchStock: .constant(""))
    }
}
