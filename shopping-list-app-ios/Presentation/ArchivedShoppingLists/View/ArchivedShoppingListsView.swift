//
//  ArchivedShoppingListsView.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 09/08/2024.
//

import SwiftUI
import SwiftData

struct ArchivedShoppingListsView: View {
    @State private var viewModel: ArchivedShoppingListsViewModel
    
    init(modelContext: ModelContext) {
            let viewModel = ArchivedShoppingListsViewModel(modelContext: modelContext)
            _viewModel = State(initialValue: viewModel)
        }

    var body: some View {
        List(viewModel.archivedShoppingLists, id: \.id) { item in
            Text(item.name)
        }.navigationTitle("Archived")
    }
}
