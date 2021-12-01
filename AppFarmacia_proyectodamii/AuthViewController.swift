//
//  AuthViewController.swift
//  AppFarmacia_proyectodamii
//
//  Created by RaulMacOS on 11/30/21.
//  Copyright © 2021 RaulMacOS. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
//import GoogleSignIn
//import FacebookLogin

class AuthViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtClave: UITextField!
    
    @IBOutlet weak var btnAcceder: UIButton!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!
    
    @IBOutlet weak var txtTelefono: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
     private let db = Firestore.firestore()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnAccederAction(_ sender: Any) {
        if txtEmail.text?.isEmpty == true {
            print("Ingrese email")
            let alert = UIAlertController ( title: "Error", message: "Ingrese un correo valido", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if txtClave.text?.isEmpty == true {
            print("Ingrese un password ")
            let alert = UIAlertController ( title: "Error", message: "Ingrese un password", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        login();
    }
    
    
    @IBAction func btnRegistrarAction(_ sender: Any) {
       if txtNombre.text?.isEmpty == true {
            print("Ingrese un su nombre")
            let alert = UIAlertController ( title: "Campo Vacio", message: "Ingrese un nombre", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if txtApellido.text?.isEmpty == true {
            print("Ingrese un apellido")
            let alert = UIAlertController ( title: "Campo Vacio", message: "Ingrese un apellido", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if txtTelefono.text?.isEmpty == true {
            let alert = UIAlertController ( title: "Campo Vacio", message: "Ingrese un telefono", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if txtEmail.text?.isEmpty == true {
            print("Ingrese email")
            let alert = UIAlertController ( title: "Error", message: "Ingrese un correo valido", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if txtClave.text?.isEmpty == true || (txtClave.text?.characters.count)! <= 8{
            let alert = UIAlertController ( title: "Error", message: "Ingrese un password de minimo 8 caracteres", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if (txtConfirmPassword.text != txtClave.text ) {
            let alert = UIAlertController ( title: "Error", message: "Contraseña no coincide", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        signUp();
    }
    
    
    
    @IBAction func googleAuthAction(_ sender: Any) {
    }
    
    
    @IBAction func facebookAuthAction(_ sender: Any) {
    }
    
    
    
    func signUp(){
        
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtClave.text!) {(authResult ,error) in
            if let result = authResult  , error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewc = storyboard.instantiateViewController(withIdentifier: "homeController")
                viewc.modalPresentationStyle = .overFullScreen
                self.present(viewc, animated: true)
            }else{
                let alert = UIAlertController ( title: "Error", message: "Se ha producido un Error", preferredStyle: .alert)
                alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
            }
        }
        
    }
    func login(){
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtClave.text!){
            (result ,error) in
            if let result = result , error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewc = storyboard.instantiateViewController(withIdentifier: "homeController")
                viewc.modalPresentationStyle = .overFullScreen
                self.present(viewc, animated: true)
            }else{
                let alert = UIAlertController ( title: "Error", message: "Se ha producido un Error", preferredStyle: .alert)
                alert.addAction(UIAlertAction (title: "Aceptar", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    
}

