//
//  CloudCollectionViewCell.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Reusable
import EasyPeasy

class CloudCollectionViewCell: UICollectionViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.textAlignment = .center
            $0.text = "Қазақ халық ертетілері"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 16.5, weight: UIFont.Weight.bold)
            $0.numberOfLines = 2
        }
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        configureViews()
        configreConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Constraints
    
    func configreConstraints() {
        titleLabel.easy.layout(Center(0), Left(10), Right(10))
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 2
        contentView.backgroundColor = .cornflowerBlue
        contentView.layer.borderWidth = 0.5
    }
}
