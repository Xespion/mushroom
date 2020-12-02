import UIKit
import CoreData

class RegistroViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: atributos
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var contrasenaTxt: UITextField!
    @IBOutlet weak var repeatContrasenaTxt: UITextField!
    
    @IBOutlet weak var imgView: UIImageView!
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
    
    @IBAction func selccionarImagen(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
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
        
        picker.dismiss(animated: true)
    }
    
    
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
            
            /*if let imageData = imgView.image?.pngData() {
                newUser.image = imageData as NSData
            }*/
            
            newUser.image = imgView.image?.pngData() as NSData?

            try! self.context.save()
            
            
            dismiss(animated: true, completion: nil)
        }
    }
    
}
