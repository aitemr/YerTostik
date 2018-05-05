//
//  LeaderBoardTableViewCell.swift
//  YerTostik
//
//  Created by Islam on 24.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Sugar
import Reusable
import EasyPeasy

class LeaderBoardTableViewCell: UITableViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var placeLabel: UILabel = {
        return UILabel().then {
            $0.text = "4"
            $0.textColor = .dustyGray
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
            $0.textAlignment = .center
        }
    }()
    
    lazy var avatarImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 16
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "gulnaz")
        }
    }()
    
    lazy var nameLabel: UILabel = {
        return UILabel().then {
            $0.text = "Саят Сериков"
            $0.textColor = .doveGray
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
            $0.textAlignment = .center
        }
    }()
    
    lazy var scoreLabel: UILabel = {
        return UILabel().then {
            $0.text = "1300"
            $0.textColor = .trout
            $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
            $0.textAlignment = .center
        }
    }()
    
    
    // MARK: View LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        contentView.addSubviews(placeLabel, avatarImageView, nameLabel, scoreLabel)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
        placeLabel.easy.layout(Left(20), CenterY(0))
        avatarImageView.easy.layout(Left(20).to(placeLabel), CenterY(0), Size(32))
        nameLabel.easy.layout(Left(10).to(avatarImageView), CenterY(0))
        scoreLabel.easy.layout(Right(20), CenterY(0))
    }
}
