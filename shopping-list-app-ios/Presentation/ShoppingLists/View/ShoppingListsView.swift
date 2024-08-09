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
    
    init(modelContext: ModelContext) {
            let viewModel = ShoppingListsViewModel(modelContext: modelContext)
            _viewModel = State(initialValue: viewModel)
        }

    var body: some View {
        List(viewModel.shoppingLists, id: \.id) { item in
            Text(item.name)
        }.navigationTitle("List")
            .navigationBarItems(trailing: Button(action: {
                
            }) {
                Image(systemName: "plus")
            })
    }
}
