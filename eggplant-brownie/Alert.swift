//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Arthur Diego on 17/01/17.
//  Copyright © 2017 br.com.alura. All rights reserved.
//

import UIKit

class Alert {
    
    let controller:UIViewController
    
    //Construtor que recebe um UIViewController
    init(controller: UIViewController){
        self.controller = controller
    }
    
    //Método customizado para erro
    func show(message: String){
        let detalis = UIAlertController(title: "Lamento", message: message, preferredStyle:
        UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Entendi", style: UIAlertActionStyle.cancel, handler: nil)
        
        detalis.addAction(cancel)
        
        controller.present(detalis, animated: true, completion: nil)
    }
    
    //Método padrão de erro
    func show(message2: String = "Erro inesperado."){
        let detalis = UIAlertController(title: "Lamento", message: message2, preferredStyle:
            UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Entendi", style: UIAlertActionStyle.cancel, handler: nil)
        
        detalis.addAction(cancel)
        
        controller.present(detalis, animated: true, completion: nil)
    }
    
}
