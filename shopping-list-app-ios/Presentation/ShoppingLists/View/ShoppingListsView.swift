//
//  ShoppingListsView.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import SwiftUI
import SwiftData

struct ShoppingListsView: View {
    @State private var viewModel: ShoppingListsViewModel
    @State private var isShowingSheet = false
    
    init(modelContext: ModelContext) {
        let viewModel = ShoppingListsViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
    
    private func deleteShoppingList(at offsets: IndexSet) {
        for index in offsets {
            let shoppingList = viewModel.shoppingLists[index]
            viewModel.deleteShoppingList(shoppingList: shoppingList)
        }
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.shoppingLists, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.name).font(.headline)
                        Text("\(item.amountOfDoneGroceries)/\(item.amountOfAllGroceries)").font(.subheadline).foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteShoppingList)
            }.navigationTitle("List")
                .navigationBarItems(trailing: Button(action: {
                    isShowingSheet = true
                }) {
                    Image(systemName: "plus")
                })
        }
        .sheet(isPresented: $isShowingSheet) {
            AddItemBottomSheetView(onAdd: { name in
                viewModel.addShoppingList(name: name)
                isShowingSheet = false
            })
            .presentationDetents([.height(200)])
            .presentationDragIndicator(.visible)
        }
    }
}
