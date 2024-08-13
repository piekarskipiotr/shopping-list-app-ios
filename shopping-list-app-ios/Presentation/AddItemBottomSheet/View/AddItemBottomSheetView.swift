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
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                    .background(Color.black)
                    .cornerRadius(8)
                
                TextField("Enter something...", text: $text)
                    .padding(.horizontal)
                    .font(.system(size: 18))
            }
            .padding()
            
            
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
