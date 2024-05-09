//
//  SecondPage.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 6.05.2024.
//

import UIKit

class FourPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      }

      func setupUI(){
        view.backgroundColor = .white

        let profileLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = "This is profile screen"
          return label
        }()

        let profileButton: UIButton = {
          let button = UIButton()
          button.setTitle("Go to home", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.backgroundColor = .systemOrange
          button.translatesAutoresizingMaskIntoConstraints = false
          button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
          return button
        }()

        view.addSubview(profileButton)
        view.addSubview(profileLabel)

        NSLayoutConstraint.activate([
            profileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            profileButton.heightAnchor.constraint(equalToConstant: 72),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

      }

      @objc func goToHome(){
        tabBarController?.selectedIndex = 0
      }

    }
