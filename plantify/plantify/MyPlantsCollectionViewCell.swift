//
//  GalleryCollectionViewCell.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import UIKit

class MyPlantCollectionViewCell: UICollectionViewCell {
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints =  false
        return label
    }()
    static let reuseId = "GalleryCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        addSubview(nameLabel)
        self.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        //mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
