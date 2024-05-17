//
//  SearchCell.swift
//  InstaCloneFireBase
//
//  Created by Özcan on 14.05.2024.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    var imageViewm = UIImageView()
    
    func setUIS() {
        
        imageViewm.frame = contentView.bounds
        imageViewm.layer.borderWidth = 0.3
        contentView.addSubview(imageViewm)
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setUIS()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
