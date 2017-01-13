//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 12/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    
    
    var meals = [Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)];
    
    
    func add(meal: Meal){
       
        meals.append(meal) //Adiciona no array
        tableView.reloadData()// Redesenha a tabela
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        			
        if(segue.identifier == "addMeal"){ //identifica pelo id o segue
            let view = segue.destination as! ViewController //recupera o segue de destino
            
            view.delegate = self //seta a intancia de MealsTableViewController ao delegate
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count // Retorna quantidade de linhas que a tabela possuir  com base no tamanho do array
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil) //Intancia o componente CEll
        
        cell.textLabel!.text = meal.name //Atribui o valo do atributo name do objeto meal
        
        return cell
        
    }
    
   
    
    
}
