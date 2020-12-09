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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var typeSeta: UIPickerView!
    @IBOutlet weak var boton: UIButton!
    
    var setas:[Mushroom]?
    var setasFiltered:[Mushroom]?
    var pickerData: [String] = [String]()
    var searching = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickerData = ["Venenosa", "Comestible"]
        nombre.text = usuario.username

        self.typeSeta.delegate = self
        self.typeSeta.dataSource = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        /*let newUser = User(context: self.context)
         newUser.username = "admin"
         newUser.image = UIImage(named: "Logo")!.pngData() as NSData?
         newUser.mail = "admin@admin.com"
         newUser.password = "admin"
         try! self.context.save()*/
        
        /*let seta1 = Mushroom(context: self.context)
        seta1.name = "a"
        seta1.lower = "nose"
        seta1.odor = "popo"
        seta1.rings = 1
        seta1.upper = "Nose"
        seta1.spore = "Negro"
        seta1.type = true
        usuario.addToSetas(seta1)
        try! self.context.save()
        fetchSetas()*/
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
            return
        }
        
        for i in setas!
        {
            if i.type == flag
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
            }
        }
        
        fetchSetas()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ConfiViewController
        {
            let uLog = segue.destination as? ConfiViewController
            //uLog?.usuario = usuario
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let seta: Mushroom
        if searching
        {
            seta = self.setasFiltered![indexPath.row]
        }
        else
        {
            seta = self.setas![indexPath.row]
        }
        
        cell.textLabel?.text = seta.odor
        if seta.type
        {
            cell.imageView?.image = UIImage(named: "noimage")
        }else{
            cell.imageView?.image = UIImage(named: "Logo")
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
