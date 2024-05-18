import UIKit
import FirebaseAuth
import FirebaseFirestore
import SDWebImage


class FivePage: UIViewController {
    
    var collectionView: UICollectionView!
    var userImageArray = [String]()
    var documentIDArray = [String]()
    
    var imagem1 = UIImageView()
    var profileImage = UIImageView()
    var buton1 = UIButton()
    var buton2 = UIButton()
    var buton3 = UIButton()
    var followersLabel = UILabel()
    var followingsLabel = UILabel()
    var nameLabel = UILabel()
    var followersitself = UILabel()
    var followingitself = UILabel()
    var ageLabel = UILabel()
    var jobLabel = UILabel()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
        barButonItem()
        collectionViewFonk()
        getData()
    }
    
    func barButonItem() {
        let rightButon = UIBarButtonItem(image: UIImage(systemName: "increase.indent"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(ayarlar))
        rightButon.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButon
        //        let leftButon = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOut))
        //        let leftButon = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(signOut))
        let leftButon = UIBarButtonItem(image: UIImage(systemName: "bell"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(signOut))
        leftButon.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButon
    }
    
    @objc func ayarlar() {
        print("ayarlar sayfasına gidildi")
    }
    
    func collectionViewFonk() {
        
        // Layout nesnesini oluşturma kısmı
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        // UICollectionView'i layout ile başlatın
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 400, width: screenWidth, height: (screenHeight - 325)), collectionViewLayout: layout)
        collectionView.layer.borderWidth = 0.7
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: "hucre")
        
        view.addSubview(collectionView)
    }
    
    func setUpUIs() {
        navigationItem.title = "Profile"
        view.backgroundColor = .systemBackground
        
        followersLabel.frame = CGRect(x: 23, y: 225, width: 80, height: 30)
        followersLabel.textAlignment = .center
        followersLabel.textColor = UIColor.systemOrange
        followersLabel.font = UIFont(name: "Chalkduster", size: 17)
        followersLabel.text = "1119"
        view.addSubview(followersLabel)
        
        followersitself.frame = CGRect(x: 3, y: 252, width: 120, height: 30)
        followersitself.textColor = UIColor.systemOrange
        followersitself.textAlignment = .center
        followersitself.font = UIFont(name: "Chalkduster", size: 13)
        followersitself.text = "Followers"
        view.addSubview(followersitself)
        
        followingsLabel.frame = CGRect(x: (screenWidth - 103), y: 225, width: 80, height: 30)
        followingsLabel.textColor = UIColor.systemOrange
        followingsLabel.textAlignment = .center
        followingsLabel.font = UIFont(name: "Chalkduster", size: 17)
        followingsLabel.text = "1235"
        view.addSubview(followingsLabel)
        
        followingitself.frame = CGRect(x: ((screenWidth - 123)), y: 252, width: 120, height: 30)
        followingitself.textAlignment = .center
        followingitself.textColor = UIColor.systemOrange
        followingitself.font = UIFont(name: "Chalkduster", size: 13)
        followingitself.text = "Followings"
        view.addSubview(followingitself)
        
        nameLabel.frame = CGRect(x: (screenWidth - 200) / 2, y: 295, width: 200, height: 30)
        nameLabel.font = UIFont(name: "Chalkduster", size: 18)
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.gray
        nameLabel.text = "Özcan ÖZDEMİR"
        view.addSubview(nameLabel)
        
        ageLabel.frame = CGRect(x: 115, y: 325, width: 50, height: 30)
        ageLabel.font = UIFont(name: "Papyrus", size: 13)
        ageLabel.textAlignment = .left
        //        ageLabel.layer.borderWidth = 1
        ageLabel.textColor = UIColor.gray
        ageLabel.text = "30 yo."
        view.addSubview(ageLabel)
        
        jobLabel.frame = CGRect(x: 165, y: 325, width: 150, height: 30)
        jobLabel.font = UIFont(name: "Papyrus", size: 13)
        jobLabel.textAlignment = .left
        //        jobLabel.layer.borderWidth = 1
        jobLabel.textColor = UIColor.gray
        jobLabel.text = "Geomatic Engineer"
        view.addSubview(jobLabel)
        
        
        imagem1.frame = CGRect(x: 0, y: 0, width: screenWidth , height: 220)
        imagem1.layer.borderWidth = 0.4
        imagem1.clipsToBounds = true
        imagem1.image = UIImage(named: "skyscrappers")
        view.addSubview(imagem1)
        
        profileImage.frame = CGRect(x: (screenWidth - 140) / 2, y: 150, width: 140, height: 140)
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
        profileImage.image = UIImage(named: "siay2")
        view.addSubview(profileImage)
        
        view.backgroundColor = .white
        buton1.frame = CGRect(x: 2, y: 365, width: (screenWidth - 7) / 3, height: 35)
        buton1.setImage(UIImage(systemName: "camera.badge.clock"), for: .normal)
        buton1.tintColor = .black
        //        buton1.layer.borderWidth = 0.5
        //        buton1.layer.cornerRadius = 7
        buton1.addTarget(self, action: #selector(signOut), for: UIControl.Event.touchUpInside)
        view.addSubview(buton1)
        
        
        view.backgroundColor = .white
        buton2.frame = CGRect(x: 133, y: 365, width: (screenWidth - 7) / 3, height: 35)
        buton2.setImage(UIImage(systemName: "square.grid.3x3"), for: UIControl.State.normal)
        buton2.tintColor = .black
        //        buton2.setTitleColor(UIColor.white, for: UIControl.State.normal)
        //        buton2.backgroundColor = .orange
        //        buton2.layer.borderWidth = 0.5
        //        buton2.layer.cornerRadius = 7
        buton2.addTarget(self, action: #selector(signOut), for: UIControl.Event.touchUpInside)
        view.addSubview(buton2)
        
        view.backgroundColor = .white
        buton3.frame = CGRect(x: 264, y: 365, width: (screenWidth - 7) / 3, height: 35)
        buton3.setImage(UIImage(systemName: "person.2"), for: UIControl.State.normal)
        buton3.tintColor = .black
        //        buton3.backgroundColor = .orange
        //        buton3.layer.borderWidth = 0.5
        //        buton3.layer.cornerRadius = 7
        buton3.addTarget(self, action: #selector(signOut), for: UIControl.Event.touchUpInside)
        view.addSubview(buton3)
    }
    
    @objc func signOut() {
        do {
            try Auth.auth().signOut()
            self.navigationController?.pushViewController(SignPage(), animated: true)
        } catch {
            print("Hata")
        }
    }
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("ProfilePicture")/*.order(by: "date", descending: true)*/.addSnapshotListener { snapShot, error in
            if error != nil {
                print(error?.localizedDescription ?? "record pulling error")
            }else{
                if snapShot?.isEmpty != true {
                    
                    self.userImageArray.removeAll()
                    
                    for document in snapShot!.documents {
                        if let imageUrl = document.get("url") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                }
                
            }
            self.collectionView.reloadData()
        }
    }
}





extension FivePage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hucre", for: indexPath) as! ProfileCell
        cell.backgroundColor = .white
        //        cell.imageView.image = UIImage(named: "_") // Hücre içeriği ayarlama
        if let url = URL(string: self.userImageArray[indexPath.row]) {
            DispatchQueue.main.async {
                cell.imageView.sd_setImage(with: url)
                
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth - 7 ) / 3, height: (screenWidth - 7 ) / 3) // Örnek hücre boyutu
    }
}
