//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 12/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate  {
    
    
    var meals = [Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)];
    
    
    func add(meal: Meal){
       
        meals.append(meal) //Adiciona no array
        tableView.reloadData()// Redesenha a tabela
        
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.began{
         let cell = recognizer.view as! UITableViewCell // Recepera uma view
            let indexPath = tableView.indexPath(for: cell )// Recupera uma cell da tableView
            
            if indexPath == nil{
                return
            }
            
            let row = indexPath!.row
            let meal = meals[row]
            
            //Uma outra forma de passar um metodo para a função show
//            func removeSelected(action: UIAlertAction){
//                meals.remove(at: row)
//                tableView.reloadData()
//            }
            
            //Função da classe RemoveMealController passando um closure para remover
            RemoveMealController(controller: self).show(meal: meal, handler: {action in self.meals.remove(at: row); self.tableView.reloadData()})
            
        }
    }
    
    //Setinha no main story board q liga as telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        			//Assim que eu navego da minha MealsTableViewControoler para ViewController eu recupero a intancia da classe ViewController e atribuo ao delegate
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
    
    //Criação de célula da table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil) //Intancia o componente CEll
        //Instancia o UILongPressGestureRecognizer
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.showDetails(recognizer:)))
        
        cell.addGestureRecognizer(longPress)
        cell.textLabel!.text = meal.name //Atribui o valo do atributo name do objeto meal
        
        return cell
        
    }
    
   
    
    
}
