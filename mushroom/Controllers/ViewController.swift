//
//  ViewController.swift
//  mushroom
//
//  Created by Alex on 18/11/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //Atributos
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pw: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Functions
    @IBAction func signIn(_ sender: Any)
    {
        
    }
}

