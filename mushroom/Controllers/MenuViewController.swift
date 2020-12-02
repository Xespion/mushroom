//
//  MenuViewController.swift
//  mushroom
//
//  Created by Alex on 24/11/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var usuario: User!
    @IBOutlet weak var nombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = usuario.username
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
