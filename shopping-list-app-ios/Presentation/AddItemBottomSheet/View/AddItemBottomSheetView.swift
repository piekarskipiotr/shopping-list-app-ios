//
//  AddItemBottomSheetView.swift
//  shopping-list-app-ios
//
//  Created by Piotr Piekarski on 09/08/2024.
//

import SwiftUI

struct AddItemBottomSheetView: View {
    @State private var text: String = ""
    var onAdd: (String) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter something...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                onAdd(text)
            }) {
                Text("Add")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(text.isEmpty ? Color.black : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(text.isEmpty)
            .padding(.horizontal)
        }
        .padding(.top)
    }
}
