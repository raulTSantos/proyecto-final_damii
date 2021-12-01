//
//  HomeViewController.swift
//  AppFarmacia_proyectodamii
//
//  Created by RaulMacOS on 11/30/21.
//  Copyright © 2021 RaulMacOS. All rights reserved.
//

import UIKit
import FirebaseAuth
//import GoogleSignIn
//import FacebookLogin
import FirebaseFirestore

enum ProviderType: String {
    case basic
    //case google
   // case facebook
}

class HomeViewController: UIViewController {
    private let email: String
    private let provider: ProviderType
    
    
    
    init(email: String , provider: ProviderType){
        
        self.email = email
        self.provider = provider
        
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set(email , forKey:"email" )
        defaults.set(provider.rawValue , forKey: "provider")
        defaults.synchronize()
    }
    

    @IBAction func btnLogOutAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        
        
        switch provider {
            
        case .basic :
            firebaseLogOut()
            
        /*case .google:
            firebaseLogOut()
            GIDSignIn.sharedInstance()?.signOut()
            
        case .facebook:
            firebaseLogOut()
            let loginManager = LoginManager()
            loginManager.logOut()*/
        }
        navigationController?.popViewController(animated: true)

    }
    private func firebaseLogOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            //se ha producido un error
            
        }
    }
}
