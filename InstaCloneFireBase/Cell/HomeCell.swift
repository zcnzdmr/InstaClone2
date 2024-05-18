//
//  Cell.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 8.05.2024.
//

import UIKit

protocol HucreProtokol {
    func tiklandi(indexPath:IndexPath)
}

class HomeCell: UITableViewCell {
    
    var protokolNesnesi : HucreProtokol?
    var indexNesnesi : IndexPath?
    var view = UIView()
    
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
    
    // MARK: nesneleri oluşturma
    func setUpCellUI() {
        
        label1.frame = CGRect(x: 60, y: 5, width: 283, height: 30)
//        label1.layer.borderWidth = 1
        label1.layer.cornerRadius = 7
        addSubview(label1)
        
        
        imageProfile.frame = CGRect(x: 5, y: 1, width: 40, height: 40)
        imageProfile.layer.borderWidth = 1
//        imageProfile.layer.masksToBounds = false
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.image = UIImage(named: "_")
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.borderColor = UIColor.orange.cgColor
        imageProfile.clipsToBounds = true
        addSubview(imageProfile)
        
        imageViewm.frame = CGRect(x: 0, y: 50, width: 393, height: 280)
        imageViewm.clipsToBounds = true
        addSubview(imageViewm)
        
        buton1.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        buton1.tintColor = .black
        buton1.frame = CGRect(x: 5, y: 330, width: 40, height: 40)
        
        // butona efekt ekleme fonksiyonlarını ekleme kısmı
        buton1.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        buton1.addTarget(self, action: #selector(buttonTouchUp(_:)), for: .touchUpInside)
        buton1.addTarget(self, action: #selector(buttonTouchUp(_:)), for: .touchUpOutside)
        
        buton1.addTarget(self, action: #selector(likeFonk), for: UIControl.Event.touchUpInside)
        addSubview(buton1)
        
        buton3.setImage(UIImage(systemName: "message"), for: UIControl.State.normal)
        buton3.tintColor = .black
        buton3.frame = CGRect(x: 45, y: 330, width: 40, height: 40)
        addSubview(buton3)
        
        buton2.setImage(UIImage(systemName: "paperplane"), for: UIControl.State.normal)
        buton2.tintColor = .black
        buton2.frame = CGRect(x: 85, y: 330, width: 40, height: 40)
        addSubview(buton2)
        
        buton4.setImage(UIImage(systemName: "bookmark"), for: UIControl.State.normal)
        buton4.tintColor = .black
        buton4.frame = CGRect(x: 343, y: 330, width: 40, height: 40)
        addSubview(buton4)
        
        buton5.setImage(UIImage(systemName: "ellipsis"), for: UIControl.State.normal)
        buton5.tintColor = .black
        buton5.frame = CGRect(x: 345, y: 9, width: 40, height: 30)
        addSubview(buton5)
        
        label2.frame = CGRect(x: 10, y: 370, width: 373, height: 60)
//        label2.layer.borderWidth = 0.5
        label2.numberOfLines = 0
//        label2.sizeToFit()
//        label2.layer.borderColor = UIColor.gray.cgColor
        label2.layer.cornerRadius = 7
        addSubview(label2)
        
        label3.frame = CGRect(x: 295, y: 335, width: 45, height: 30)
        label3.textColor = UIColor.systemOrange
        label3.textAlignment = .left
        addSubview(label3)

    }
    
    // MARK: objc fonksiyonları
    @objc func likeFonk() {
        protokolNesnesi?.tiklandi(indexPath: indexNesnesi!)
    }
    
    
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        }
    }

    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
        }
    }

}
