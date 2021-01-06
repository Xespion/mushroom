//
//  NewSetaViewController.swift
//  mushroom
//
//  Created by Alex on 24/11/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreData

class NewSetaViewController: UIViewController {

    @IBOutlet weak var nombreSeta: UITextField!
    @IBOutlet weak var imagenEsporada: UIButton!
    @IBOutlet weak var viewNegra: UIView!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var Clasificacion: UISegmentedControl!
    @IBOutlet weak var Anillos: UISegmentedControl!
    @IBAction func seleccionarOlor(_ sender: Any) {
        viewNegra.isHidden = false;
        viewColor.isHidden = false;
    }
//MARK: Colores Esporada
    @IBAction func seleccionarColor(_ sender: UIButton) {
        viewNegra.isHidden = false;
        viewColor.isHidden = false;
    }
    @IBAction func esporadaBuff(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-buff");
        ocultarEsporada()
    }
    @IBAction func esporadaBlanca(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-blanco");
        ocultarEsporada()
    }
    @IBAction func esporadaAmarilla(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-amarillo");
        ocultarEsporada()
    }
    @IBAction func esporadaVerde(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-verde");
        ocultarEsporada()
    }
    @IBAction func esporadaChocolate(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-chocolate");
        ocultarEsporada()
    }
    @IBAction func esporadaMorada(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-morado");
        ocultarEsporada()
    }
    @IBAction func esporadaNaranja(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-naranja");
        ocultarEsporada()
    }
    @IBAction func esporadaNegra(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-negro");
        ocultarEsporada()
    }
    @IBAction func esporadaMarron(_ sender: UIButton) {
        imagenEsporada.imageView?.image = UIImage(named: "esporada-marron");
        ocultarEsporada()
    }
    func ocultarEsporada(){
        viewNegra.isHidden = true;
        viewColor.isHidden = true;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNegra.isHidden = true;
        viewColor.isHidden = true;
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
