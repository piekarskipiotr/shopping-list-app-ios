//
//  ShoppingListDetailsVIew.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 13/08/2024.
//


import SwiftUI
import SwiftData

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}


struct ShoppingListDetailsView: View {
    @State private var viewModel: ShoppingListDetailsViewModel
    @State private var isShowingSheet = false
    private let isArchived: Bool
    
    init(modelContext: ModelContext, shoppingList: ShoppingListModel) {
        self.isArchived = shoppingList.isArchived()
        let viewModel = ShoppingListDetailsViewModel(modelContext: modelContext, shoppingList: shoppingList)
        _viewModel = State(initialValue: viewModel)
    }
    
    private func deleteGrocery(at offsets: IndexSet) {
        for index in offsets {
            let grocery = viewModel.groceries[index]
            viewModel.deleteGrocery(grocery: grocery)
        }
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.groceries, id: \.id) { grocery in
                    HStack(spacing: 8) {
                        Text(grocery.name).font(.headline)
                        Spacer()
                        Image(systemName: grocery.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                    }
                    .onTapGesture {
                        if !isArchived {
                            viewModel.toggleDone(grocery: grocery)
                        }
                    }
                }
                .if(!isArchived) { view in
                    view.onDelete(perform: deleteGrocery)
                }
            }
            .navigationTitle(viewModel.shoppingList.name)
            .navigationBarItems(trailing: Group {
                if !isArchived {
                    Button(action: {
                        isShowingSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            })
        }
        .sheet(isPresented: $isShowingSheet) {
            AddItemBottomSheetView(onAdd: { name in
                viewModel.addGrocery(name: name)
                isShowingSheet = false
            })
            .presentationDetents([.height(200)])
            .presentationDragIndicator(.visible)
        }
    }
}

