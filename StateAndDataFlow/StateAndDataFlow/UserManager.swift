//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegistered: Bool {
        didSet {
            UserDefaults.standard.set(isRegistered, forKey: "register")
        }
    }
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "userName")
        }
    }
    
    
    
    init() {
        self.isRegistered = false
        self.name = ""
    }
    
}
