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
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var pickerData: [String] = [String]()
    var searching = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewNegra.isHidden = true;
        self.tableView.reloadData()
        let seta = Mushroom(context: self.context)
        seta.name = "NADA"
        seta.lower = "nose"
        seta.odor = "popo"
        seta.rings = 1
        seta.upper = "Nose"
        seta.spore = "Negro"
        seta.type = true
        setasFiltered = [seta]
        pickerData = ["Venenosa", "Comestible"]
        nombre.text = usuario.username

        self.typeSeta.delegate = self
        self.typeSeta.dataSource = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.searchBar.delegate = self
        
        //Añadir setas
        /*
        let seta1 = Mushroom(context: self.context)
        seta1.name = "Abc"
        seta1.lower = "nose"
        seta1.odor = "popo"
        seta1.rings = 1
        seta1.upper = "Nose"
        seta1.spore = "Negro"
        seta1.type = true
        usuario.addToSetas(seta1)
        
        let seta2 = Mushroom(context: self.context)
        seta2.name = "Bcde"
        seta2.lower = "nose"
        seta2.odor = "popo"
        seta2.rings = 1
        seta2.upper = "Nose"
        seta2.spore = "Negro"
        seta2.type = false
        usuario.addToSetas(seta2)*/
        
        try! self.context.save()
        fetchSetas()
    }
    
    func fetchSetas()
    {
        self.setas = usuario.setas?.allObjects as? [Mushroom]
        if searching
        {
            self.tableView.reloadData()
            searching = false
        }else{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func quitarInformacion(_ sender: UIButton) {
        viewNegra.isHidden = true
    }
    @IBAction func btnSearch(_ sender: Any)
    {
        let texto = searchBar.text
        let tipo = typeSeta.selectedRow(inComponent: 0)
        var flag = false
        
        if tipo == 1
        {
            flag = true
        }
        
        if setas == nil
        {
            for i in setas!
            {
                if i.type == flag
                {
                    searching = true
                    setasFiltered?.append(i)
                }
            }
        }
        fetchSetas()
        
        /*for i in setas!
        {
            
            /*if i.type == flag
            {
                if texto?.isEmpty ?? false
                {
                }else{
                    if i.name?.range(of: texto!) != nil
                    {
                        searching = true
                        setasFiltered?.append(i)
                    }
                    
                }
            }*/
        }*/
        
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
        if searching
        {
            return setasFiltered?.count ?? 0
        }
        return setas?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seta = self.setas![indexPath.row]
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
        if searching
        {
            seta = self.setasFiltered![indexPath.row]
        }
        else
        {
            seta = self.setas![indexPath.row]
        }
        
        cell.nombre.text = seta.name
        
        if seta.type
        {
            cell.imagen.image = UIImage(named: "tick")
        }else{
            cell.imagen.image = UIImage(named: "Logo")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        if searching{
            return nil
        }
        let action = UIContextualAction(style: .destructive, title: "Borrar seta")
        {
            (action, view, completionHandler) in
            let setaToRemove = self.setas![indexPath.row]
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
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("The search text is: ’\(searchBar.text!)’")
        for i in setas!{
            if ((i.name!.contains(searchBar.text!))) {
                print(i.name!)
                setasFiltered?.append(i)
                print(setasFiltered?.count)
                searching = true
            }
        }
        //
        fetchSetas()
    }
}
