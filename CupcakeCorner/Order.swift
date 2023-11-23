//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ygor Simoura on 21/11/23.
//

import Foundation

//class com os nosso pedido

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "Type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
        
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet { // monitora e reage caso o valor for modificado
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool { //Verifica se existe algum conteudo em todo o nosso formulário
        if name.isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.isEmpty || zip.isEmpty {
            return true
        }
        
        return false
    }
    
    var cost: Decimal {
        //$2 por cupcake
        var cost = Decimal(quantity) * 2
        
        //complicated cakes cost more
        cost += Decimal(type) / 2
        
        //$1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        //$0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    
}
