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
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
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
                ForEach(viewModel.shoppingLists, id: \.id) { shoppingList in
                    NavigationLink(destination: ShoppingListDetailsView(modelContext: modelContext, shoppingList: shoppingList)) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(shoppingList.name).font(.headline)
                            Text("\(shoppingList.amountOfDoneGroceries)/\(shoppingList.amountOfAllGroceries)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
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
