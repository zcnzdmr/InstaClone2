//
//  FourthPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 7.05.2024.
//

import UIKit

class SecondPage: UIViewController {
    
    var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUIS()

        // Do any additional setup after loading the view.
    }
    
    func setUpUIS(){
        navigationItem.title = "Search"
        let screenWidth = view.frame.size.width
        searchBar.frame = CGRect(x: 0, y: 100, width: screenWidth, height: 40)
        searchBar.placeholder = "Enter what you look for"
        view.addSubview(searchBar)
        searchBar.delegate = self
    }

}

extension SecondPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
