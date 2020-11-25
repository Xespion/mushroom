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
    var items:[User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch_users()
    }
    
    func fetch_users()
    {
        do{
            self.items = try context.fetch(User.fetchRequest())
        }catch{ }
    }
    
    //Functions
    @IBAction func signIn(_ sender: Any)
    {
        for  usuario in items!
        {
            //if username == usuario.username
            //{
                //if pw == usuario.pw
                //{
                    
                //}
            //}
        }
    }
}

