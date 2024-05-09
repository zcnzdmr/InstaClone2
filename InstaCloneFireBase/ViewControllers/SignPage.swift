//
//  SignPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 7.05.2024.
//

import UIKit
import FirebaseAuth

class SignPage: UIViewController {
    
    var titleLabel = UILabel()
    var emailTF = UITextField()
    var passwordTF = UITextField()
    var signInButon = UIButton()
    var signUpButon = UIButton()
    var viewImage = UIImageView()
    var viewModelNesnesi = SigninVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUIS()
        currentUserFonk()
    }
    
    func currentUserFonk() {
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            viewModelNesnesi.gecis()
        }
    }
    
    private func setUpUIS() {
        
        let screenWidth = view.frame.size.width
        print(screenWidth)
        viewImage.frame = view.bounds
        viewImage.image = UIImage(named: "bugs")
        view.addSubview(viewImage)
        
        titleLabel.frame = CGRect(x: 20, y: 100, width: (screenWidth - 40), height: 70)
        titleLabel.text = "Instagram Clone"
        titleLabel.font  = UIFont(name: "ChalkDuster", size: 35)
        titleLabel.textColor = .white
        titleLabel.layer.borderWidth = 0.7
        titleLabel.layer.cornerRadius = 6
        titleLabel.backgroundColor = .orange
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        emailTF.frame = CGRect(x: 20, y: 240, width: screenWidth - 40, height: 45)
        emailTF.placeholder = "Enter your email"
        emailTF.borderStyle = UITextField.BorderStyle.roundedRect
        emailTF.layer.borderWidth = 0.6
        view.addSubview(emailTF)
        
        passwordTF.frame = CGRect(x: 20, y: 300, width: screenWidth - 40, height: 45)
        passwordTF.placeholder = "Enter your password"
        passwordTF.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTF.layer.borderWidth = 0.6
        view.addSubview(passwordTF)
        
        signInButon.frame = CGRect(x: 35, y: 390, width: 120, height: 50)
        signInButon.setTitle("Sign in", for: UIControl.State.normal)
        signInButon.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signInButon.backgroundColor = .orange
        signInButon.layer.borderWidth = 1
        signInButon.layer.cornerRadius = 10
        signInButon.addTarget(self, action: #selector(signInFonk), for: UIControl.Event.touchUpInside)
        view.addSubview(signInButon)
        
        signUpButon.frame = CGRect(x: (screenWidth - 155), y: 390, width: 120, height: 50)
        signUpButon.setTitle("Sign up", for: UIControl.State.normal)
        signUpButon.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signUpButon.backgroundColor = .orange
        signUpButon.layer.borderWidth = 1
        signUpButon.layer.cornerRadius = 10
        signUpButon.addTarget(self, action: #selector(signUpClicked), for: UIControl.Event.touchUpInside)
        view.addSubview(signUpButon)
        
    }
    
    @objc func signInFonk() {
        
        if emailTF.text != "" && passwordTF.text != "" {
            
            Auth.auth().signIn(withEmail: String(emailTF.text!), password: String(passwordTF.text!)) { AuthDataResult, Error in
                
                if Error != nil {
                    self.alertt(title: "Error", message: Error?.localizedDescription ?? "Error")
                }else{
                    SigninVM().gecis()
                    self.navigationController?.pushViewController(HomePage(), animated: true)
                }
            }
            
        }else{
            alertt(title: "Error", message: "User name/Password not entered")
        }
        
        
    }
    
    @objc func signUpClicked() {
        
        if emailTF.text != "" && passwordTF.text != "" {
            
            Auth.auth().createUser(withEmail: String(emailTF.text!), password: String(passwordTF.text!)) { AuthDataResult, error in
                if error != nil {
                    self.alertt(title: "Error", message: error?.localizedDescription ?? "Error")
                }else {
                    SigninVM().gecis()
                    //                    self.navigationController?.pushViewController(HomePage(), animated: true)
                }
            }
            
        }else{
            alertt(title: "Error", message: "No Message/Password entered")
            
        }
        
    }
    
    func alertt(title:String,message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
}
