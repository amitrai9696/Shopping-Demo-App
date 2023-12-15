//
//  ViewController.swift

//
//  Created by amit on 28/09/23.
//  Copyright © 2023 amit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var AgreeIconChick : Bool = false
    let passwordimage = UIImage(named: "padlock")
    let usernameimage = UIImage(named: "user")
    @IBOutlet weak var presonimage: UIImageView!
    let layer = CAGradientLayer()
    @IBOutlet weak var usernametextfield: padding!
    @IBOutlet weak var passwordtextfield: padding!
    @IBOutlet weak var rememberBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewload()
        
    }
    @IBAction func loginButton(_ sender: Any) {
        login()
          }
    func login(){
        guard let username = usernametextfield.text ,!username.isEmpty , let password = passwordtextfield.text,!password.isEmpty else{return}
        Networkservice.shared.login(username: username, password: password){ [weak self] success in
            if (success){
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                self!.navigateToHomeViewController()
                            }
        else{
            print("failed")
        }
        }
        
    }
    @IBAction func rememberme(_ sender: Any) {
        if (AgreeIconChick == false){
            if let image = UIImage(named: "check-box") {
            rememberBtn.setBackgroundImage(image, for: .normal)
        }
            AgreeIconChick = true
        }
        else{
            if let image = UIImage(named: "box") {
                rememberBtn.setBackgroundImage(image, for: .normal)
            }
            AgreeIconChick = false
        }
        
    }
    func navigateToHomeViewController() {
        DispatchQueue.main.async {
        let SearchVC = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(SearchVC, animated: true)
                       }
    }
    func viewload(){
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
              self.navigateToHomeViewController()
                 }
        usernametextfield.leftImage(image: self.usernameimage, imageWidth: 0, padding: 20)
         passwordtextfield.leftImage(image: self.passwordimage, imageWidth: 0, padding: 20)
          presonimage.layer.cornerRadius = 67
          layer.frame = view.bounds
          layer.colors = [UIColor.green.cgColor,UIColor.blue.cgColor]
          self.view.layer.insertSublayer(layer, at: 0)
    }

}

