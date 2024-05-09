//
//  ThirdPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 6.05.2024.
//

import UIKit
import FirebaseAuth

class FivePage: UIViewController {
    
    var buton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()

        // Do any additional setup after loading the view.
    }
    
    func setUpUIs() {
        
        let screenWidth = view.frame.size.width
        let screenHeight = view.frame.size.height
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

