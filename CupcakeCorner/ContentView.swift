//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 17/11/23.
//

import SwiftUI

struct ContentView: View {

    @State private var name = ""
    @State private var emailAdress = ""
    
    var disabledForm: Bool {
        name.count < 3 || emailAdress.count < 5
    }
    
var body: some View {
    Form{
        Section{
            TextField("Name", text: $name)
            TextField("E-mail", text: $emailAdress)
        }
        
        Section{
            Button("Create acount") {
                print("Creating...")
            }
        }
        .disabled(disabledForm)
    }
    }
}

#Preview {
    ContentView()
}
