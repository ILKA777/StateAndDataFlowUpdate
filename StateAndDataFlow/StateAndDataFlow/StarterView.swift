//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.isRegistered {
                ContentView()
                    .environmentObject(userManager)
            
            } else {
                if UserDefaults.standard.bool(forKey: "register") == true {
                    ContentView()
                        .environmentObject(userManager)
                } else {
                    RegisterView()
                }

            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
