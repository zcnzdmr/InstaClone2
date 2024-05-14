import UIKit
import FirebaseAuth

class FivePage: UIViewController {

    var collectionView: UICollectionView!
    
    var imagem1 = UIImageView()
    var profileImage = UIImageView()
    var buton = UIButton()
    var followersLabel = UILabel()
    var followingsLabel = UILabel()
    var nameLabel = UILabel()
    var followersitself = UILabel()
    var followingitself = UILabel()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
        barButonItem()
        collectionViewFonk()
    }
    
    func barButonItem() {
        let rightButon = UIBarButtonItem(image: UIImage(systemName: "increase.indent"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(ayarlar))
        rightButon.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButon
        let leftButon = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOut))
//        let leftButon = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(signOut))
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
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        // UICollectionView'i layout ile başlatın
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 375, width: screenWidth, height: (screenHeight - 325)), collectionViewLayout: layout)
        collectionView.layer.borderWidth = 0.7
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectCell.self, forCellWithReuseIdentifier: "hucre")
        
        view.addSubview(collectionView)
    }
    
    func setUpUIs() {
        navigationItem.title = "Profile"
        
        followersLabel.frame = CGRect(x: 23, y: 225, width: 80, height: 30)
        followersLabel.textAlignment = .center
        followersLabel.textColor = UIColor.systemOrange
        followersLabel.font = UIFont(name: "Chalkduster", size: 17)
        followersLabel.text = "1"
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
        
        imagem1.frame = CGRect(x: 0, y: 0, width: screenWidth , height: 220)
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
        
//        view.backgroundColor = .white
//        buton.frame = CGRect(x: 10, y: screenHeight - 140 , width: screenWidth - 20, height: 40)
//        buton.setTitle("Sign Out", for: UIControl.State.normal)
//        buton.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buton.backgroundColor = .orange
//        buton.layer.borderWidth = 0.5
//        buton.layer.cornerRadius = 7
//        buton.addTarget(self, action: #selector(signOut), for: UIControl.Event.touchUpInside)
//        view.addSubview(buton)
    }
    
    @objc func signOut() {
        do {
            try Auth.auth().signOut()
            self.navigationController?.pushViewController(SignPage(), animated: true)
        } catch {
            print("Hata")
        }
    }
}

extension FivePage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hucre", for: indexPath) as! CollectCell
        cell.backgroundColor = .white
        cell.imageView.image = UIImage(named: "_") // Hücre içeriği ayarlama
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth - 13 ) / 3, height: (screenWidth - 13 ) / 3) // Örnek hücre boyutu
    }
}
