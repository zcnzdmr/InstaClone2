//
//  Cell.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 8.05.2024.
//

import UIKit

class Cell: UITableViewCell {
    
    var imageViewm = UIImageView()
    var imageProfile = UIImageView()
    var label1 = UILabel()
    var buton1 = UIButton()
    var buton3 = UIButton()
    var buton2 = UIButton()
    var buton4 = UIButton()
    var buton5 = UIButton()
    var label2 = UILabel()
    var label3 = UILabel()


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpCellUI()
    }
    
    func setUpCellUI() {
        
        label1.frame = CGRect(x: 60, y: 5, width: 283, height: 30)
//        label1.layer.borderWidth = 1
        label1.layer.cornerRadius = 7
        addSubview(label1)
        
        
        imageProfile.frame = CGRect(x: 10, y: 1, width: 40, height: 40)
        imageProfile.layer.borderWidth = 1
//        imageProfile.layer.masksToBounds = false
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.image = UIImage(named: "_")
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.clipsToBounds = true
        addSubview(imageProfile)
        
        imageViewm.frame = CGRect(x: 20, y: 50, width: 353, height: 200)
        imageViewm.layer.borderWidth = 0.6
        imageViewm.layer.cornerRadius = 10
        addSubview(imageViewm)
        
        buton1.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        buton1.frame = CGRect(x: 10, y: 250, width: 40, height: 40)
        addSubview(buton1)
        
        buton3.setImage(UIImage(systemName: "message"), for: UIControl.State.normal)
        buton3.frame = CGRect(x: 50, y: 250, width: 40, height: 40)
        addSubview(buton3)
        
        buton2.setImage(UIImage(systemName: "paperplane"), for: UIControl.State.normal)
        buton2.frame = CGRect(x: 90, y: 250, width: 40, height: 40)
        addSubview(buton2)
        
        buton4.setImage(UIImage(systemName: "bookmark"), for: UIControl.State.normal)
        buton4.frame = CGRect(x: 340, y: 250, width: 40, height: 40)
        addSubview(buton4)
        
        buton5.setImage(UIImage(systemName: "ellipsis"), for: UIControl.State.normal)
        buton5.frame = CGRect(x: 345, y: 5, width: 40, height: 30)
        addSubview(buton5)
        
        label2.frame = CGRect(x: 20, y: 290, width: 353, height: 40)
        label2.layer.borderWidth = 0.3
        label2.layer.cornerRadius = 7
        addSubview(label2)
        
        label3.frame = CGRect(x: 280, y: 255, width: 50, height: 30)
        label3.textAlignment = .center
        label3.layer.borderWidth = 0.3
        label3.layer.cornerRadius = 7
        addSubview(label3)

    }
}
