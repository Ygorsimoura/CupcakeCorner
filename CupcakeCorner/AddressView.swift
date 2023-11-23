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
            Form{
                Section(header: Text("Where should we delivery you order?").padding()){
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        
        Section {
            NavigationLink("Checkout") {
                CheckoutView(order: order)
            }
            .frame(width: 332, height: 70)
            .background{
                if order.hasValidAddress {
                    Color(.gray)
                } else {
                    Color(.cyan)
                }
            }
            .font(.system(size: 20).bold())
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 18.0))
        }
        .disabled(order.hasValidAddress)
        .padding(.bottom, 30)
    }
}

#Preview {
    AddressView(order: Order())
}

