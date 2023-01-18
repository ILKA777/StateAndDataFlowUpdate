//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(UserDefaults.standard.string(forKey: "userName") ?? "")")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer(minLength: 50)
            
            ButtonView(timer: timer)
            Spacer(minLength: 250)
            
            ButtonLogOutView()
            
            Spacer(minLength: 40)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        
    }
}

struct ButtonLogOutView: View {
    @EnvironmentObject private var userManager: UserManager
    var body: some View {
        
        
        Button(action:{userManager.isRegistered = false}) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        
    }
}


