//
//  ShoppingListsView.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 02/08/2024.
//

import SwiftUI

struct ShoppingListsView: View {
    @StateObject private var viewModel = ShoppingListsViewModel()

    var body: some View {
        List(viewModel.items, id: \.self) { item in
            Text(item)
        }.navigationTitle("List")
            .navigationBarItems(trailing: Button(action: {
                viewModel.addItem("Test")
            }) {
                Image(systemName: "plus")
            })
    }
}
