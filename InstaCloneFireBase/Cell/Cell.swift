//
//  Cell.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 8.05.2024.
//

import UIKit

class Cell: UITableViewCell {
    
    var imageViewm = UIImageView()
    var label1 = UILabel()
    var buton1 = UIButton()
    var buton3 = UIButton()
    var buton2 = UIButton()
    var buton4 = UIButton()
    var buton5 = UIButton()
    var label2 = UILabel()


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpCellUI()
    }
    
    func setUpCellUI() {
        
        label1.frame = CGRect(x: 20, y: 5, width: 283, height: 30)
//        label1.layer.borderWidth = 0.1
        label1.layer.cornerRadius = 7
        addSubview(label1)
        
        
        imageViewm.frame = CGRect(x: 20, y: 40, width: 353, height: 200)
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

    }
}
