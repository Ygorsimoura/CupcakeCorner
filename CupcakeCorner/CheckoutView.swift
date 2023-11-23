//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 22/11/23.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    @State private var connectionErrorMessage = ""
    @State private var showingConnectionError = false
    
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
                
                Button("Place Order") { // Não podemos passar uma função async em um botão sem antes envolvela em uma task
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize) // precisamos deixar nosso Scrollview para que nossa tela de adapte a diversos dispositivos, mas em dispositivos pequenos caso a funcão de rolagem não for necessária então a desativamos.
        .alert("Thank You!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Error!", isPresented: $showingConnectionError) {
            Button("OK") { }
        } message: {
            Text(connectionErrorMessage)
        }
    }
    
    func placeOrder() async {  // função assincrona pois pode precisar de carregamento e o app nao pode parar
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("falied to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
         
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "You order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on the way!"
            
            showingConfirmation = true
            
        } catch {
            connectionErrorMessage = "Connection Error, plase, check your connection and try again!"
            showingConnectionError = true
            print("Check out Falied: \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    CheckoutView(order: Order())
}
