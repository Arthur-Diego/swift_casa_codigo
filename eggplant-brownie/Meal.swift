//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 10/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import Foundation
/*
 Classe refeição
 Contém nome e felicidade
 E itens
 */
class Meal{
    let name: String;
    let happiness: Int;
    var items = Array<Item>();
    init(name: String, happiness: Int) {
        self.name = name;
        self.happiness = happiness;
    }
    
    func allCalories() -> Double {
        
        var total = 0.0;
        
        for i in items{
            total += i.calories;
        }
        return total
    }
    
    func details() -> String{
        var message = "Happiness: \(self.happiness)"
        
        for item in self.items {
            message += "\n * \(item.name) - calories: \(item.calories)"
        }
        return message
    }
}
