//
//  SearchCell.swift
//  ARTvel
//
//  Created by Juan Ceballos on 8/28/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import SnapKit

class RijksCell: UICollectionViewCell {
    static let reuseIdentifier = "rijksCell"
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupImageViewConstraints()
        setupTitleLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left)
            //make.right.equalTo(self.snp.right)
        }
    }
    
    private func setupTitleLabelConstraints()    {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(imageView.snp.right).offset(8)
            make.right.equalTo(self.snp.right).offset(-8)
        }
    }
}
