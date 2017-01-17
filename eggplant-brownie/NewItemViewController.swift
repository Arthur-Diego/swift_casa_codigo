//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 13/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import UIKit


protocol AddAnItemDelegate {
    func addNew(item:Item)
}

class NewItemViewController: UIViewController {

    let delegate2:AddAnItemDelegate?
    
    init(delegate2: AddAnItemDelegate){
        //ViewController implementa AddAnItemDelegate
        self.delegate2 = delegate2
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    
        @IBAction func addNewItem(){
    
        if(nameField == nil || caloriesField == nil){
            return
        }
        
        let name = nameField!.text
        let calories = (caloriesField!.text as! NSString).doubleValue
        
        
        let item = Item(name: name!, calories: calories)
  
            if delegate2 == nil {
                return
            }
            
            delegate2!.addNew(item: item)
            
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
            
        }else{
            Alert(controller: self).show()
            
        }
    
    }
    
    

   	

}
