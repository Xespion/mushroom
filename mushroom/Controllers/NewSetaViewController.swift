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
    @IBOutlet weak var viewForma: UIView!
    @IBOutlet weak var viewOlor: UIView!
    @IBOutlet weak var talloSuperior: UILabel!
    @IBOutlet weak var talloInferior: UILabel!
    @IBOutlet weak var olorSeta: UILabel!
    @IBOutlet weak var Clasificacion: UISegmentedControl!
    @IBOutlet weak var Anillos: UISegmentedControl!
    
//MARK: Olor
    @IBAction func seleccionarOlor(_ sender: Any) {
        viewOlor.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func olorPescado(_ sender: UIButton) {
        cambiarOlor(olor: "Pescado")
    }
    @IBAction func olorPicante(_ sender: UIButton) {
        cambiarOlor(olor: "Picante")
    }
    @IBAction func olorRancio(_ sender: UIButton) {
        cambiarOlor(olor: "Rancio")
    }
    @IBAction func olorAnis(_ sender: UIButton) {
        cambiarOlor(olor: "Anis")
    }
    @IBAction func olorBasura(_ sender: UIButton) {
        cambiarOlor(olor: "Basura")
    }
    @IBAction func olorAlmendra(_ sender: UIButton) {
        cambiarOlor(olor: "Almendra")
    }
    @IBAction func olorHollin(_ sender: UIButton) {
        cambiarOlor(olor: "Hollin")
    }
    @IBAction func olorDesconocido(_ sender: UIButton) {
        cambiarOlor(olor: "Desconocido")
    }
    @IBAction func olorNada(_ sender: UIButton) {
        cambiarOlor(olor: "Nada")
    }
    func cambiarOlor(olor:String){
        olorSeta.text = olor
        viewOlor.isHidden = true;
        viewNegra.isHidden = true;
    }
    
//MARK: Tallo superior e inferior
    var tallo = ""
    @IBAction func seleccionarTalloSuperior(_ sender: UIButton) {
        tallo = "superior"
        viewForma.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func seleccionarTalloInferior(_ sender: UIButton) {
        tallo = "inferior"
        viewForma.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func talloForma1(_ sender: UIButton) {
        cambiarFormaTallo(forma: "Forma 1")
    }
    @IBAction func talloForma2(_ sender: UIButton) {
        cambiarFormaTallo(forma: "Forma 2")
    }
    @IBAction func talloForma3(_ sender: UIButton) {
        cambiarFormaTallo(forma: "Forma 3")
    }
    @IBAction func talloForma4(_ sender: UIButton) {
        cambiarFormaTallo(forma: "Forma 4")
    }
    func cambiarFormaTallo(forma:String){
        if(tallo == "superior"){ talloSuperior.text = forma }
        if(tallo == "inferior"){ talloInferior.text = forma }
        viewForma.isHidden = true;
        viewNegra.isHidden = true;
    }
    
//MARK: Colores Esporada
    
    @IBAction func seleccionarColor(_ sender: UIButton) {
        viewColor.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func esporadaBuff(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-buff")
    }
    @IBAction func esporadaBlanca(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-blanco")
    }
    @IBAction func esporadaAmarilla(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-amarillo")
    }
    @IBAction func esporadaVerde(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-verde")
    }
    @IBAction func esporadaChocolate(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-chocolate")
    }
    @IBAction func esporadaMorada(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-morado")
    }
    @IBAction func esporadaNaranja(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-naranja")
    }
    @IBAction func esporadaNegra(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-negro")
    }
    @IBAction func esporadaMarron(_ sender: UIButton) {
        cambiarEsporada(esporada: "esporada-marron")
    }
    func cambiarEsporada(esporada:String){
        imagenEsporada.imageView?.image = UIImage(named: esporada);
        viewColor.isHidden = true;
        viewNegra.isHidden = true;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOlor.isHidden = true;
        viewColor.isHidden = true;
        viewForma.isHidden = true;
        viewNegra.isHidden = true;
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
