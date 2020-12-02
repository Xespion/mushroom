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
    var setas:[Mushroom]?
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
    }
    
    func fetchSetas()
    {
        self.setas = usuario.setas?.allObjects as? [Mushroom]
        if searching
        {
            let pred = NSPredicate(format: <#T##String#>, <#T##args: CVarArg...##CVarArg#>)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource
{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let seta = self.setas![indexPath.row]
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
