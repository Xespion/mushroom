
import UIKit
import CoreData

class ViewController: UIViewController {
    
    //Atributos
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pw: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items:[User]?
    var userLogged: User!
    
    override func viewDidAppear(_ animated: Bool) {
        fetch_users()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Añadir usuarios a la base de datos:
        
         /*let newUser = User(context: self.context)
         newUser.username = "admin"
         newUser.image = UIImage(named: "Logo")!.pngData() as NSData?
         newUser.mail = "admin@admin.com"
         newUser.password = "admin"
         try! self.context.save()*/

        fetch_users()
    }
    
    func fetch_users()
    {
        do{
            self.items = try context.fetch(User.fetchRequest())
        }catch{ }
    }
    
    //Functions
    @IBAction func signIn(_ sender: Any)
    {
        var flag = false
        for  usuario in items!
        {
            if username.text == usuario.username && pw.text == usuario.password
            {
                flag = true
                userLogged = usuario
            }
        }
        
        if flag == false{
            print(flag)
            let alert = UIAlertController(title: "Error", message: "Usuario o contraseña incorrecta", preferredStyle: .alert)
            let defaultAc = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(defaultAc)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            print(flag)
            self.performSegue(withIdentifier: "menu", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is MenuViewController
        {
            let uLog = segue.destination as? MenuViewController
            uLog?.usuario = userLogged
        }
    }
    
}


