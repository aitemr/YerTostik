//
//  ProfileTableViewCell.swift
//  YerTostik
//
//  Created by Islam on 25.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Reusable
import EasyPeasy

class ProfileCollectionViewCell: UICollectionViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.textAlignment = .center
            $0.text = "Алдар Көсе"
            $0.textColor = .pickledBluewood
            $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
            $0.adjustsFontSizeToFitWidth = true
        }
    }()
    
    lazy var heroImageView: UIImageView = {
        return UIImageView().then {
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .gray
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configreConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Constraints
    
    func configreConstraints() {
        heroImageView.easy.layout(Width(contentView.bounds.width), Height(contentView.bounds.height - 60))
        titleLabel.easy.layout(Left(10), Right(10), Bottom(22))
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.addSubviews(heroImageView, titleLabel)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 2
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.5
    }
}
