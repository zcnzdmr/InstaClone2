//
//  FifthPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 8.05.2024.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class ThirdPage: UIViewController {
    
    var imageViewm = UIImageView()
    var textFieldm = UITextField()
    var uploadButton = UIButton()
    var uploadProfileButton = UIButton()
    
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
        imageViewm.image = UIImage(named: "selectPhoto")
        imageViewm.layer.borderWidth = 0.6
        imageViewm.layer.cornerRadius = 6
        view.addSubview(imageViewm)
        
        textFieldm.frame = CGRect(x: 10, y: 460, width: screenWidth - 20, height: 50)
        textFieldm.borderStyle = .roundedRect
        textFieldm.placeholder = "Enter your comment"
        view.addSubview(textFieldm)
        
        uploadButton.frame = CGRect(x: 20, y: 540, width: 150, height: 40)
        uploadButton.setTitle("UpLoad Str", for: UIControl.State.normal)
        uploadButton.setTitleColor(.white, for: UIControl.State.normal)
        uploadButton.layer.cornerRadius = 6
        uploadButton.backgroundColor = .orange
        uploadButton.addTarget(self, action: #selector(upLoadPhoto), for: UIControl.Event.touchUpInside)
        view.addSubview(uploadButton)
        
        
        uploadProfileButton.frame = CGRect(x: (screenWidth - 170), y: 540, width: 150, height: 40)
        uploadProfileButton.setTitle("UpLoad Profile", for: UIControl.State.normal)
        uploadProfileButton.setTitleColor(.white, for: UIControl.State.normal)
        uploadProfileButton.layer.cornerRadius = 6
        uploadProfileButton.backgroundColor = .orange
        uploadProfileButton.addTarget(self, action: #selector(upLoadProfilePhoto), for: UIControl.Event.touchUpInside)
        view.addSubview(uploadProfileButton)
    }
    
    func gestureFonk() {
        imageViewm.isUserInteractionEnabled = true
        let gR = UITapGestureRecognizer(target: self, action: #selector(showImagePickerController))
        imageViewm.addGestureRecognizer(gR)
    }
    
    func alertt(title:String,message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    @objc func upLoadProfilePhoto() {
        
        let storage = Storage.storage()
        let reference = storage.reference()
        let mediaFolder = reference.child("profile")
        let uuid = UUID().uuidString
        
        if let photo = imageViewm.image?.pngData() {
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(photo, metadata: nil) { (metadata, error) in
                
                if error != nil {
                    self.alertt(title: "Error", message: error?.localizedDescription ?? "Profile kayit hatasi")
                }else{
                    
                    imageReference.downloadURL { url, error in
                        if error != nil {
                            self.alertt(title: "Error", message: error?.localizedDescription ?? "Profile Url alma hatasi")
                        }else{
                            if let profileUrl = url?.absoluteString {
                                
                                //Firebase FireStore data kaydetme kısmı
                                
                                let db = Firestore.firestore()
                                let profileDict : [String:Any] = ["url" : profileUrl]
                                
                                db.collection("ProfilePicture").addDocument(data: profileDict) { error in
                                    if error != nil {
                                        self.alertt(title: "Error", message: error?.localizedDescription ?? "firestore saving error")
                                    }else{
                                        self.imageViewm.image = UIImage(named: "selectPhoto")
                                        self.textFieldm.text = ""
                                        self.tabBarController?.selectedIndex = 4
                                        
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    @objc func upLoadPhoto() {
        
        let storage = Storage.storage()
        let reference = storage.reference()
        let mediaFolder = reference.child("media")
        let uuid = UUID().uuidString
        
        if let photo = imageViewm.image?.pngData() {
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(photo, metadata: nil) { (metadata, error) in
                
                if error != nil {
                    self.alertt(title: "Error", message: error?.localizedDescription ?? "kayit hatasi")
                }else{
                    
                    imageReference.downloadURL { url, error in
                        if error != nil {
                            self.alertt(title: "Error", message: error?.localizedDescription ?? "Url alma hatasi")
                        }else{
                            if let imageUrl = url?.absoluteString {
                                
                                //Firebase FireStore data kaydetme kısmı
                                
                                let db = Firestore.firestore()
                                let dataDict : [String:Any] = ["comment"   : self.textFieldm.text!,
                                                               "date"      : FieldValue.serverTimestamp(),
                                                               "like"      : 0,
                                                               "imageUrl"  : imageUrl,
                                                               "postedBy"  : Auth.auth().currentUser!.email!]
                                
                                db.collection("Posts").addDocument(data: dataDict) { error in
                                    if error != nil {
                                        self.alertt(title: "Error", message: error?.localizedDescription ?? "firestore saving error")
                                    }else{
                                        self.imageViewm.image = UIImage(named: "selectPhoto")
                                        self.textFieldm.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                        
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                }
            }
            
        }
        
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
