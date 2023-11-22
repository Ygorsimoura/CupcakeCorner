//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 22/11/23.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("You total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize) // precisamos deixar nosso Scrollview para que nossa tela de adapte a diversos dispositivos, mas em dispositivos pequenos caso a funcão de rolagem não for necessária então a desativamos.
    }
}

#Preview {
    CheckoutView(order: Order())
}
