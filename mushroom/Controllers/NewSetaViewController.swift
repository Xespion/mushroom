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
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var usuario: User!
    
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
    var colorEsporada = "brown"
    @IBAction func seleccionarColor(_ sender: UIButton) {
        viewColor.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func esporadaBuff(_ sender: UIButton) {
        colorEsporada = "buff"
        cambiarEsporada(esporada: "esporada-buff")
    }
    @IBAction func esporadaBlanca(_ sender: UIButton) {
        colorEsporada = "white"
        cambiarEsporada(esporada: "esporada-blanco")
    }
    @IBAction func esporadaAmarilla(_ sender: UIButton) {
        colorEsporada = "yellow"
        cambiarEsporada(esporada: "esporada-amarillo")
    }
    @IBAction func esporadaVerde(_ sender: UIButton) {
        colorEsporada = "green"
        cambiarEsporada(esporada: "esporada-verde")
    }
    @IBAction func esporadaChocolate(_ sender: UIButton) {
        colorEsporada = "chocolate"
        cambiarEsporada(esporada: "esporada-chocolate")
    }
    @IBAction func esporadaMorada(_ sender: UIButton) {
        colorEsporada = "purple"
        cambiarEsporada(esporada: "esporada-morado")
    }
    @IBAction func esporadaNaranja(_ sender: UIButton) {
        colorEsporada = "orange"
        cambiarEsporada(esporada: "esporada-naranja")
    }
    @IBAction func esporadaNegra(_ sender: UIButton) {
        colorEsporada = "black"
        cambiarEsporada(esporada: "esporada-negro")
    }
    @IBAction func esporadaMarron(_ sender: UIButton) {
        colorEsporada = "brown"
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
        
        #if LPS1
        #endif
        
        #if LPS2
        Clasificacion.isHidden = true
        #endif
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
        if nombreSeta.text == ""{
            let alertControl = UIAlertController(title: "Nombre vacio", message: "Debes indicar un nombre para la seta.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
        } else if(talloSuperior.text == "Nada" || talloInferior.text == "Nada"){
            let alertControl = UIAlertController(title: "Indica la forma", message: "Debes indicar la forma del tallo superior e inferior.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
        }else {
            let anillos = Anillos.titleForSegment(at: Anillos.selectedSegmentIndex)
            let clasificacion = Clasificacion.titleForSegment(at: Clasificacion.selectedSegmentIndex)
            let seta = Mushroom(context: self.context)
            seta.name = nombreSeta.text
            seta.lower = talloInferior.text
            seta.odor = olorSeta.text
            seta.upper = talloSuperior.text
            seta.spore = colorEsporada
            switch anillos{
                case "0": seta.rings = 0;
                case "1": seta.rings = 1;
                case "2": seta.rings = 2;
                default: seta.rings = 0;
            }
            #if LPS1
            switch clasificacion{
                case "Comestible": seta.type = true;
                case "Venenosa": seta.type = false;
                default: seta.type = false;
            }
            #endif
            #if LPS2
            //Algoritmo
            #endif
            usuario.addToSetas(seta)
            try! self.context.save()
        }
        dismiss(animated: true, completion: nil)
        
    }
    
}
