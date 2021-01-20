import UIKit
import CoreData

class RegistroViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: atributos
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var contrasenaTxt: UITextField!
    @IBOutlet weak var repeatContrasenaTxt: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // MARK: Actions
    
    @IBAction func registrarBtn(_ sender: UIButton) {
        
        if contrasenaTxt.text != repeatContrasenaTxt.text {
            let alertControl = UIAlertController(title: "Contraseñas no coinciden", message: "Las contraseñas no coinciden", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
            
        }else if contrasenaTxt.text == ""{
            let alertControl = UIAlertController(title: "Contraseñas vacía", message: "Las contraseñas no pueden estar vacías", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
            
        }else {
            
            let newUser = User(context: self.context)
            newUser.username = nombreTxt.text
            newUser.mail = emailTxt.text
            newUser.password = contrasenaTxt.text

            try! self.context.save()
            
            
            dismiss(animated: true, completion: nil)
        }
    }
    
}
