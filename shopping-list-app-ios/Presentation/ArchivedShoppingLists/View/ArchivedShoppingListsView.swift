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
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        let viewModel = ArchivedShoppingListsViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.archivedShoppingLists, id: \.id) { shoppingList in
                    NavigationLink(destination: ShoppingListDetailsView(modelContext: modelContext, shoppingList: shoppingList)) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(shoppingList.name).font(.headline)
                            Text("\(shoppingList.amountOfDoneGroceries)/\(shoppingList.amountOfAllGroceries)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
            }.navigationTitle("Archived")
        }
    }
}
