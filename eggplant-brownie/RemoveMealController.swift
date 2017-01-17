//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 17/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import UIKit
//Classe Criada para remover as responsabilidades do MealsTableViewController
class RemoveMealController{
    
    
    let controller:UIViewController
    //Construtor que recebe como parâmetro o controller de MealsTableViewController
    init(controller: UIViewController){
        self.controller = controller
    }
    /*Função para mostrar os detalhrs da refeição
       Abrir um dialogo
        e excluir uma refeição da tabela usando um handler passando um closure
     */
    func show(meal: Meal, handler:@escaping (UIAlertAction!) -> Void){
        let detalis = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title:  "Cancelar", style: UIAlertActionStyle.cancel, handler: nil)
        let remove = UIAlertAction(title:  "Remove", style: UIAlertActionStyle.destructive, handler: handler)//Closure
        
        detalis.addAction(cancel)
        detalis.addAction(remove)
        
        controller.present(detalis, animated: true, completion: nil)//Show dialog
    }
}
