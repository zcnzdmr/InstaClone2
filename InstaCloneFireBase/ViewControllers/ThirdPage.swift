//
//  FifthPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 8.05.2024.
//

import UIKit

class ThirdPage: UIViewController {
    
    var imageViewm = UIImageView()
    var textFieldm = UITextField()
    var uploadButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIS()
        gestureFonk()
        // Do any additional setup after loading the view.
    }
    
    private func setUpUIS() {
        
        navigationItem.title = "Sharing Part"
        view.backgroundColor = .white
        let screenWidth = view.frame.size.width
        imageViewm.frame = CGRect(x: 10, y: 120, width: screenWidth - 20, height: 300)
        imageViewm.layer.borderWidth = 0.6
        imageViewm.layer.cornerRadius = 6
        view.addSubview(imageViewm)
        
        textFieldm.frame = CGRect(x: 10, y: 460, width: screenWidth - 20, height: 50)
        textFieldm.borderStyle = .roundedRect
        textFieldm.placeholder = "Enter your comment"
        view.addSubview(textFieldm)
        
        uploadButton.frame = CGRect(x: 10, y: 540, width: 373, height: 40)
        uploadButton.setTitle("UpLoad", for: UIControl.State.normal)
        uploadButton.setTitleColor(.white, for: UIControl.State.normal)
        uploadButton.layer.cornerRadius = 6
        uploadButton.backgroundColor = .orange
        uploadButton.addTarget(self, action: #selector(upLoadPhoto), for: UIControl.Event.touchUpInside)
        view.addSubview(uploadButton)
        
    }
    
    func gestureFonk() {
        imageViewm.isUserInteractionEnabled = true
        let gR = UITapGestureRecognizer(target: self, action: #selector(showImagePickerController))
        imageViewm.addGestureRecognizer(gR)
    }
    
    @objc func upLoadPhoto() {
        print("saa")
    }
}

extension ThirdPage : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
           imageViewm.image = editedImage
        }
        dismiss(animated: true)
    }
}
