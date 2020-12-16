//
//  NewSetaViewController.swift
//  mushroom
//
//  Created by Alex on 24/11/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class NewSetaViewController: UIViewController {

    @IBOutlet weak var imagenEsporada: UIImageView!
    @IBOutlet weak var viewOlor: UIView!
    @IBOutlet weak var viewNegra: UIView!
    @IBOutlet weak var viewForma: UIView!
    @IBOutlet weak var viewColor: UIView!
    @IBAction func seleccionarOlor(_ sender: Any) {
        viewNegra.isHidden = false;
        viewOlor.isHidden = false;
    }
    @IBAction func esporadaAmarilla(_ sender: UITapGestureRecognizer) {
        imagenEsporada.image = UIImage(named:"esporada-amarillo");
        viewNegra.isHidden = true;
        viewColor.isHidden = true;
    }
    @IBAction func seleccionarColor(_ sender: UITapGestureRecognizer) {
        viewNegra.isHidden = false;
        viewColor.isHidden = false;
    }
    @IBAction func seleccionarFormaSuperior(_ sender: Any) {
        viewNegra.isHidden = false;
        viewForma.isHidden = false;
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNegra.isHidden = true;
        viewOlor.isHidden = true;
        viewColor.isHidden = true;
        viewForma.isHidden = true;
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
    @IBAction func cancelarBtn(_ sender: Any) { dismiss(animated: true, completion: nil) }
    @IBAction func AñadirBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil) }
    
}
