//
//  SettingsTableViewCell.swift
//  YerTostik
//
//  Created by Islam on 25.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Reusable
import EasyPeasy

class SettingsTableViewCell: UITableViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "SFUIDisplay-Medium", size: 16)
        titleLabel.textColor = .pickledBluewood
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var cellIcon: UIImageView = {
        let cellIcon = UIImageView()
        cellIcon.layer.shadowColor = UIColor.black.cgColor
        cellIcon.layer.shadowOpacity = 0.07
        cellIcon.layer.shadowOffset = CGSize(width: 1, height: 1)
        cellIcon.layer.shadowRadius = 3
        return cellIcon
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.addSubviews(titleLabel, cellIcon)
        separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        layoutMargins = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Consraints
    
    func setupConstraints() {
        cellIcon.easy.layout(CenterY(0), Left(15))
        titleLabel.easy.layout(CenterY(0), Left(20).to(cellIcon))
    }
}
