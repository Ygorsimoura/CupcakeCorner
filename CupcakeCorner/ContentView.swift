//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var order = Order()  //Instancia do nosso pedido
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self){ //indices são os indices dentro do nosso array
                            Text(Order.types[$0]) // Pega todos o item do array com base no index[$0]
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                // Nossa sessão de pedidos especiais sómente irá aparecer se ela for hábilitada
                
                Section{
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra Frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)  
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
