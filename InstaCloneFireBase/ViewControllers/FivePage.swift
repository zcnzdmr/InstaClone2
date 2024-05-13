//
//  ThirdPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 6.05.2024.
//

import UIKit
import FirebaseAuth

class FivePage: UIViewController {
    
    var imagem1 = UIImageView()
    var profileImage = UIImageView()
    var buton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
        barButonItem()

        // Do any additional setup after loading the view.
    }
    
    func barButonItem() {
        let rightButon = UIBarButtonItem(image: UIImage(systemName: "gear"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(ayarlar))
        rightButon.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButon
    }
    @objc func ayarlar() {
        print("ayarlar sayfasına gidildi")
    }
    
    func setUpUIs() {
        navigationItem.title = "Profile"
//        navigationItem.titleView?.backgroundColor = .orange
        let screenWidth = view.frame.size.width
        let screenHeight = view.frame.size.height
        
        imagem1.frame = CGRect(x: 0, y: 0, width: screenWidth , height: 220)
//        imagem1.layer.cornerRadius = 10
        imagem1.layer.borderWidth = 0.4
        imagem1.clipsToBounds = true
        imagem1.image = UIImage(named: "skyscrappers")
        view.addSubview(imagem1)
        
        
        profileImage.frame = CGRect(x: (screenWidth - 140) / 2, y: 150, width: 140, height: 140)
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 5
        profileImage.image = UIImage(named: "siay2")
        profileImage.layer.borderColor = UIColor.white.cgColor
        view.addSubview(profileImage)
        

        view.backgroundColor = .white
        buton.frame = CGRect(x: 10, y: screenHeight - 140 , width: screenWidth - 20, height: 40)
        buton.setTitle("Sign Out", for: UIControl.State.normal)
        buton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        buton.backgroundColor = .orange
        buton.layer.borderWidth = 0.5
        buton.layer.cornerRadius = 7
        buton.addTarget(self, action: #selector(signOut), for: UIControl.Event.touchUpInside)
        view.addSubview(buton)
    }
    
    @objc func signOut() {
        
        do {
            try Auth.auth().signOut()
            self.navigationController?.pushViewController(SignPage(), animated: true)
        }catch {
            print("Hata")
        }
    }
}

