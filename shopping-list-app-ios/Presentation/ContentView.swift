import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        TabView {
            NavigationView {
                ShoppingListsView(modelContext: modelContext)
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("List")
            }

            NavigationView {
                ArchivedShoppingListsView(modelContext: modelContext)
            }
            .tabItem {
                Image(systemName: "archivebox")
                Text("Archived")
            }
        }
    }
}
