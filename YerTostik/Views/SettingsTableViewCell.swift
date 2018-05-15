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
import Sugar

class SettingsTableViewCell: UITableViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.font = UIFont(name: "SFUIDisplay-Medium", size: 16)
            $0.textColor = .pickledBluewood
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
    }()
    
    lazy var cellIcon: UIImageView = {
        return UIImageView().then {
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.07
            $0.layer.shadowOffset = CGSize(width: 1, height: 1)
            $0.layer.shadowRadius = 3
        }
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureViews()
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.addSubviews(titleLabel, cellIcon)
        separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        layoutMargins = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
    }
    
    // MARK: Configure Consraints
    
    func setupConstraints() {
        cellIcon.easy.layout(CenterY(0), Left(15))
        titleLabel.easy.layout(CenterY(0), Left(20).to(cellIcon))
    }
}
