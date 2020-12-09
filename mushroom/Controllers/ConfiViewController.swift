//
//  ConfiViewController.swift
//  mushroom
//
//  Created by Alex on 09/12/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreData

class ConfiViewController: UIViewController {
    
    var usuario: User!
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confPasswordTxt: UITextField!
    @IBOutlet weak var guardarBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nombreTxt.text = usuario.username
        emailTxt.text = usuario.mail
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backAction(_ sender: Any) { dismiss(animated: true, completion: nil) }
    
    @IBAction func SaveAction(_ sender: Any) {
        //TODO
        if passwordTxt.text != confPasswordTxt.text {
            let alertControl = UIAlertController(title: "Contraseñas no coinciden", message: "Las contraseñas no coinciden", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
            
        }else{
            usuario.username = nombreTxt.text
            usuario.mail = emailTxt.text
            if passwordTxt.text != ""{
                usuario.password = passwordTxt.text
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        usuario.username = nombreTxt.text
        usuario.mail = emailTxt.text
        if passwordTxt.text != ""{
            usuario.password = passwordTxt.text
        }
        
    }
}
