//
//  PortfolioListView.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/25/23.
//

import SwiftUI

/// enum for specifying the filtering options for the stock list
public enum FilterOptions: String {
    case price
    case ticker
    case name
}

struct PortfolioListView: View {
    @State private var selectedFilter: FilterOptions?
    @State var presentErrorAlert: Bool = false
    @State private var isloading = false
    @StateObject var stockViewModel: PortfolioListViewModel
//    @State var searchStock: String = ""
    
    
    /// returns a string readable of current date (today)
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            if isloading {
                EmptyView()
            } else {
                VStack(alignment: .leading) {
                    Text(currentDate)
                        .font(.title)
    //TODO: implement search feature
    //              SearchTextFieldView(searchStock: $searchStock)
                    if stockViewModel.listOfStocks.isEmpty {
                        Spacer()
                        HStack(alignment: . center) {
                            Spacer()
                            Text("NO STOCKS AVAILABLE!")
                                .font(.largeTitle)
                            Spacer()
                        }
                        Spacer()
                    } else {
                        List {
                            Section(header: Text("Stocks").font(.headline)) {
                                ForEach(stockViewModel.filterStockList, id: \.ticker) { stock in
                                    StockRowView(stock: StockViewModel(stock: stock))
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                        .background(Color.clear)
                    }
                }
                .padding()
            }
            if isloading {
                LoadingOverlayView(isLoading: $isloading)
            }
        }
        .edgesIgnoringSafeArea(Edge.Set(.bottom))
        .onChange(of: selectedFilter ?? FilterOptions.name) { newValue in
            stockViewModel.filterStockList(filter: newValue)
        }
        .navigationTitle("My Portfolio")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                filterButton
                    .accessibilityLabel("Filter")
            }
        }
        .alert(stockViewModel.errorMessage, isPresented: $presentErrorAlert, actions: {
            Button("Try Again") {
                fetchData()
            }
        })
        .onAppear {
            fetchData()
        }
    }
    
    /// fetches  stock form endpoint and uses a dispatch timer to simulate loading time...
    private func fetchData() {
        isloading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            stockViewModel.fetchStocks(completion: { error in
                if error == nil {
                    isloading = false
                } else {
                    presentErrorAlert = true
                }
            })
        })
    }
    
    /// returns a nav bar Button View to display for filtering options
    private var filterButton: some View {
        let filterOptions = [
            FilterOptions.price,
            FilterOptions.ticker,
            FilterOptions.name
        ]
       return Menu {
            ForEach(filterOptions, id: \.self) { filter in
                Button {
                    if selectedFilter == filter {
                        selectedFilter = nil
                    } else {
                        selectedFilter = filter
                    }
                } label: {
                    HStack {
                        Text("\(filter.rawValue)")
                            .accessibilityLabel("Filter by: \(filter.rawValue)")
                            
                        if selectedFilter == filter {
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .accessibilityAddTraits(selectedFilter == filter ? [.isSelected] : [.isButton])
            }
        } label: {
            HStack {
            }
            Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                .accessibilityHidden(true)
        }
    }

}

struct PortfolioListView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioListView(stockViewModel: PortfolioListViewModel())
    }
}
