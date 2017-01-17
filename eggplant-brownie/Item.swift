//
//  Item.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 10/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import Foundation
/*
    Classe Item, 
    Tem nome e calorias
 */
class Item: Equatable{
    
    let name: String;
    let calories: Double;
    
    init(name: String, calories: Double){
        self.name = name;
        self.calories = calories;
    }
}
func ==(first:Item, second:Item) -> Bool {
    
    return first.name == second.name && first.calories == second.calories
}
