//
//  ConfiViewController.swift
//  mushroom
//
//  Created by Alex on 09/12/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class ConfiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func backAction(_ sender: Any) { dismiss(animated: true, completion: nil) }
    
    @IBAction func SaveAction(_ sender: Any) {
        //TODO
        dismiss(animated: true, completion: nil)
    }
}
