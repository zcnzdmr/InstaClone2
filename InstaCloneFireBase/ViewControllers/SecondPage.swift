//
//  FourthPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 7.05.2024.
//

import UIKit

class SecondPage: UIViewController {
    
    var imageURLList = [String]()
    var searchBar = UISearchBar()
    var collectionViewm : UICollectionView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUIS()
        collectionViewFonk()
    }

    
    func setUpUIS(){
        let screenWidth = view.frame.size.width
        navigationItem.title = "Search"
        searchBar.frame = CGRect(x: 0, y: 100, width: screenWidth, height: 40)
        searchBar.placeholder = "Enter what you look for"
        view.addSubview(searchBar)
        searchBar.delegate = self
    }
    
    func collectionViewFonk() {
        
        let screenWidth = view.frame.size.width
        let screenHeight = view.frame.size.height
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        collectionViewm = UICollectionView(frame: CGRect(x: 0, y: 140, width: screenWidth, height: screenHeight), collectionViewLayout: layout)
        collectionViewm.register(SearchCell.self, forCellWithReuseIdentifier: "search")
        collectionViewm.delegate = self
        collectionViewm.dataSource = self
        collectionViewm.layer.borderWidth = 0.7
        view.addSubview(collectionViewm)
    }

}

extension SecondPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension SecondPage : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "search", for: indexPath) as! SearchCell
        cell.imageViewm.image  = UIImage(named: "bugs")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth - 4 ) / 3, height: (screenWidth - 4 ) / 3)
    }
    
    
}
