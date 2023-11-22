//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 21/11/23.
//

import SwiftUI
import Foundation

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                
                
                Section {
                    NavigationLink("Checkout") {
                        CheckoutView(order: order)
                    }
                }
                .disabled(order.hasValidAddress)
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}

