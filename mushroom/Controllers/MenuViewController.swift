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
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nombreSeta: UILabel!
    @IBOutlet weak var olorSeta: UILabel!
    @IBOutlet weak var formaSuperior: UILabel!
    @IBOutlet weak var formaInferior: UILabel!
    @IBOutlet weak var imagenEsporada: UIImageView!
    @IBOutlet weak var numeroAnillos: UILabel!
    @IBOutlet weak var clasificacion: UILabel!
    @IBOutlet weak var viewNegra: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var typeSeta: UIPickerView!
    @IBOutlet weak var boton: UIButton!
    
    var setas:[Mushroom]?
    var setasFiltered:[Mushroom]?
    var pickerData: [String] = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        fetchSetas()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewNegra.isHidden = true;
        fetchSetas()
        let seta = Mushroom(context: self.context)
        seta.name = "NADA"
        seta.lower = "nose"
        seta.odor = "popo"
        seta.rings = 1
        seta.upper = "Nose"
        seta.spore = "Negro"
        seta.type = true
        pickerData = ["Venenosa", "Comible"]
        nombre.text = usuario.username

        self.typeSeta.delegate = self
        self.typeSeta.dataSource = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.searchBar.delegate = self
        
        
    }
    
    func fetchSetas()
    {
        self.setas = usuario.setas?.allObjects as? [Mushroom]
        self.setasFiltered = self.setas
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

    @IBAction func quitarInformacion(_ sender: UIButton) {
        viewNegra.isHidden = true
    }
    
    @IBAction func btnSearch(_ sender: Any)
    {
        self.setasFiltered = self.setas
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ConfiViewController
        {
            let uLog = segue.destination as? ConfiViewController
            uLog?.usuario = usuario
        }
        if segue.destination is NewSetaViewController
        {
            let uLog = segue.destination as? NewSetaViewController
            uLog?.usuario = usuario
        }
    }
    
}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource
{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setasFiltered?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seta = self.setasFiltered![indexPath.row]
        nombreSeta.text = seta.name
        olorSeta.text = seta.odor
        formaInferior.text = seta.lower
        formaSuperior.text = seta.upper
        numeroAnillos.text = String.init(seta.rings)
        clasificacion.text = seta.type == true ? "Comestible" : "Venenosa";
        switch seta.spore{
            case "black": imagenEsporada.image = UIImage(named: "esporada-negro");
            case "green": imagenEsporada.image = UIImage(named: "esporada-verde");
            case "white": imagenEsporada.image = UIImage(named: "esporada-blanco");
            case "orange": imagenEsporada.image = UIImage(named: "esporada-naranja");
            case "yellow": imagenEsporada.image = UIImage(named: "esporada-amarillo");
            case "buff": imagenEsporada.image = UIImage(named: "esporada-buff");
            case "chocolate": imagenEsporada.image = UIImage(named: "esporada-chocolate");
            case "purple": imagenEsporada.image = UIImage(named: "esporada-morado");
            default: imagenEsporada.image = UIImage(named: "esporada-marron");
        }
        viewNegra.isHidden = false;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SetaTableViewCell
        let seta: Mushroom
        seta = self.setasFiltered![indexPath.row]
        
        cell.nombre.text = seta.name
        
        if seta.type
        {
            cell.imagen.image = UIImage(named: "Seta_Comestible")
        }else{
            cell.imagen.image = UIImage(named: "Seta_Venenosa")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let action = UIContextualAction(style: .destructive, title: "Borrar seta")
        {
            (action, view, completionHandler) in
            let setaToRemove = self.setasFiltered![indexPath.row]
            self.context.delete(setaToRemove)
            try! self.context.save()
            self.fetchSetas()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}

extension MenuViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
}
extension MenuViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.setasFiltered = self.setas?.filter{(seta: Mushroom) -> Bool in
            //Aqui meto lo del picker Ven Com
            var flag = false
            if typeSeta.selectedRow(inComponent: 0) == 0
            {
                flag = false
            }else if(typeSeta.selectedRow(inComponent: 0) == 1)
            {
                flag = true
            }
            
            if(seta.type == flag)
            {
                return true
            }
            return false
        }
        
        if(searchBar.text?.count == 0)
        {
            tableView.reloadData()
            return
        }
        
        self.setasFiltered = self.setasFiltered?.filter{(seta: Mushroom) -> Bool in
            if((seta.name?.lowercased().contains(searchBar.text!.lowercased()))!){
                return true
            }
            return false
        }
        tableView.reloadData()
    }
}
