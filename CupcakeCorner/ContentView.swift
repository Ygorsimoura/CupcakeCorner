//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 17/11/23.
//

import SwiftUI

struct ContentView: View {

    @State private var count = 0
    
var body: some View {
    Button("Tap to count: \(count)"){
        count += 1
        }
    .sensoryFeedback(.stop, trigger: count)
    }
}

#Preview {
    ContentView()
}
