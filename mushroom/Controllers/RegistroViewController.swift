import UIKit
import CoreData

class RegistroViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: atributos
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var contrasenaTxt: UITextField!
    @IBOutlet weak var repeatContrasenaTxt: UITextField!
    
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
    
    @IBAction func selccionarImagen(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.editedImage] as? UIImage {
            imgView.image = img
        }
        else if let img = info[.originalImage] as? UIImage {
            imgView.image = img
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func registrarBtn(_ sender: UIButton) {
        
        if contrasenaTxt.text != repeatContrasenaTxt.text {
            let alertControl = UIAlertController(title: "Contraseñas no coinciden", message: "Las contraseñas no coinciden", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
            
        }else {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
            let usuario = NSManagedObject(entity: entity, insertInto: managedContext)
            
            usuario.setValue(nombreTxt.text, forKey: "username")
            usuario.setValue(emailTxt.text, forKey: "mail")
            usuario.setValue(contrasenaTxt.text, forKey: "password")
            usuario.setValue(imgView.image, forKey: "image")
            
            dismiss(animated: true, completion: nil)
        }
    }
    
}
