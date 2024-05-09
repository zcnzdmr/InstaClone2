//
//  ViewController.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 6.05.2024.
//

import UIKit

class HomePage: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        barButton()
      }
    
    func barButton() {
        let add = UIBarButtonItem(image: UIImage(systemName: "message"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToProfile))
//        self.navigationItem.rightBarButtonItems = add
        add.tintColor = .brown
//        let another1 = UIBarButtonItem(image: UIImage(systemName: "heart"), style: UIBarButtonItem.Style.done, target: self, action: #selector(goToProfile))
        self.navigationItem.rightBarButtonItems = [add]
    }

      func setupUI(){
//        view.backgroundColor = .white
          navigationItem.title = "Instagram Clone"
          tableView.frame = view.bounds
          tableView.rowHeight = CGFloat(350)
          tableView.delegate = self
          tableView.dataSource = self
          tableView.register(Cell.self, forCellReuseIdentifier: "hucrem")
          view.addSubview(tableView)

      }

      @objc func goToProfile(){
//          self.navigationController?.pushViewController(SignPage(), animated: false)
        tabBarController?.selectedIndex = 2
      }
}

extension HomePage : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucrem", for: indexPath) as! Cell
        
        cell.imageViewm.image = UIImage(named: "arkaplan")
        cell.label1.text = " ozcanozdemir001@gmail.com"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
