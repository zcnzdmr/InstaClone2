//
//  ViewController.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 6.05.2024.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class HomePage: UIViewController {
    
    var tableView = UITableView()
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIDArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        barButton()
        getDataFromFireStore()
        
      }
    
    func barButton() {
        let add = UIBarButtonItem(image: UIImage(systemName: "message"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToProfile))
//        self.navigationItem.rightBarButtonItems = add
        add.tintColor = .orange
//        let another1 = UIBarButtonItem(image: UIImage(systemName: "heart"), style: UIBarButtonItem.Style.done, target: self, action: #selector(goToProfile))
        self.navigationItem.rightBarButtonItems = [add]
    }
    

      func setupUI(){
          view.backgroundColor = .white
          
          //tabbarItemların rengini değiştiren kısmı
          tabBarController?.view.tintColor = .black
//          tabBarController?.tabBar.backgroundColor = UIColor.systemOrange
          
          navigationItem.title = "Instagram Clone"
          tableView.frame = view.bounds
          tableView.rowHeight = CGFloat(450)
          tableView.delegate = self
          tableView.dataSource = self
          tableView.register(HomeCell.self, forCellReuseIdentifier: "hucrem")
          view.addSubview(tableView)

      }

      @objc func goToProfile(){
//          self.navigationController?.pushViewController(SignPage(), animated: false)
        tabBarController?.selectedIndex = 3
      }
    
    //Firestore veritabanından verileri field alanlarına göre çekme kısmı
    
    func getDataFromFireStore() {
        
        let db = Firestore.firestore()
        db.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapShot, error in
            if error != nil {
                print(error?.localizedDescription ?? "record pulling error")
            }else{
                if snapShot?.isEmpty != true {
                    
                    self.userEmailArray.removeAll()
                    self.likeArray.removeAll()
                    self.userImageArray.removeAll()
                    self.userCommentArray.removeAll()
                    self.documentIDArray.removeAll()
                    
                    for document in snapShot!.documents {
                        let documentID = document.documentID
                        self.documentIDArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        if let comment = document.get("comment") as? String {
                            self.userCommentArray.append(comment)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                        if let like = document.get("like") as? Int {
                            self.likeArray.append(like)
                        }
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }

    }
}

extension HomePage : UITableViewDelegate, UITableViewDataSource, HucreProtokol {
    
    func tiklandi(indexPath: IndexPath) {
        let likeCount = likeArray[indexPath.row]
        let db = Firestore.firestore()
        let likeStore : [String:Any] = ["like" : likeCount+1]
        
        //burda FireStore veritabanında ki like field'ini setData ( .. merge : true) ile güncelliyoruz.
        db.collection("Posts").document(documentIDArray[indexPath.row]).setData(likeStore, merge: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucrem", for: indexPath) as! HomeCell
        
        cell.imageViewm.image = UIImage(named: "_")
        cell.label3.text = "♥ \(self.likeArray[indexPath.row])"
        cell.label1.text = userEmailArray[indexPath.row]
        cell.label2.text = " \(userCommentArray[indexPath.row])"
        
        cell.protokolNesnesi = self
        cell.indexNesnesi = indexPath
        
        if let url = URL(string: self.userImageArray[indexPath.row]) {
            DispatchQueue.main.async {
                cell.imageViewm.sd_setImage(with: url)

            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

