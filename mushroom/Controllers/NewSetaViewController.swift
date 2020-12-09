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
    @IBOutlet weak var mensajeSeleccion: UILabel!
    @IBOutlet weak var Imagen9: UIImageView!
    @IBOutlet weak var Imagen8: UIImageView!
    @IBOutlet weak var Imagen7: UIImageView!
    @IBOutlet weak var Imagen6: UIImageView!
    @IBOutlet weak var Imagen5: UIImageView!
    @IBOutlet weak var Imagen4: UIImageView!
    @IBOutlet weak var Imagen3: UIImageView!
    @IBOutlet weak var Imagen2: UIImageView!
    @IBOutlet weak var Imagen1: UIImageView!
    @IBOutlet weak var viewOloryColor: UIView!
    @IBOutlet weak var viewNegra: UIView!
    @IBAction func seleccionarOlor(_ sender: Any) {
        viewNegra.isHidden = false;
        viewOloryColor.isHidden = true;
        mensajeSeleccion.text! = "Seleccionar olor:"
    }
    @IBAction func seleccionarColor(_ sender: UITapGestureRecognizer) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNegra.isHidden = true;
        viewOloryColor.isHidden = true;
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
