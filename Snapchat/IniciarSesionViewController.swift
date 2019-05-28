//
//  IniciarSesionViewController.swift
//  Snapchat
//
//  Created by Alejandro Quesada on 21/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print("Intentamos Inciar Sesión")
            if error != nil {
                print("Tenemos el siguiente error:\(String(describing: error))")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
                    print("Intentamos crear un Usuario")
                    if error != nil{
                        print("Tenemos el siguiente error:\(String(describing: error))")
                    } else {
                        print("El usuario fue creado exitosamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Inicio de Sesión Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }
    

}

