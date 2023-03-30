//
//  ContentView.swift
//  InstaFilterTutorial
//
//  Created by Danjuma Nasiru on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    var foregroundColorArray : [Color] = [.black, .white, .blue, .gray, .purple]
    @State private var foregroundColor = Color.black
    @State private var foregroundColorChange = false
    
    
    
    
    
    var body: some View {
        
                Text("Hello, World!")
                    .frame(width: 300, height: 300)
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .onChange(of: foregroundColorChange, perform: {newValue in
                        foregroundColor = foregroundColorArray.randomElement() ?? .blue
                    })
                    .onTapGesture {
                        showingConfirmation = true
                        foregroundColorChange.toggle()
                    }
                    .confirmationDialog("Change Background", isPresented: $showingConfirmation){
                        Button("Red") { backgroundColor = .red }
                        Button("Green") { backgroundColor = .green }
                        Button("Blue") { backgroundColor = .blue }
                        Button("Cancel", role: .cancel) {}
                    } message: {
                        Text("Select a new color")
                    }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
