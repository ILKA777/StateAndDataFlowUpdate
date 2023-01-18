//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var userManager: UserManager
    @State private var isReggister = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                if (name.count >= 3) {
                    Text("\(name.count)")
                        .foregroundColor(.green)
                } else {
                    Text("\(name.count)")
                        .foregroundColor(.red)
                }
            }
            .padding()
            
            
            Button(action: registerUser) {
                HStack {
                    if name.count < 3 {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.gray)
                        Text("Ok")
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.blue)
                        Text("Ok")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    private func registerUser() {
        if (!name.isEmpty && name.count >= 3) {
            userManager.name = name
            userManager.isRegistered.toggle()
        }
            
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
