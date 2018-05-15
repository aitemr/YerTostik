//
//  CloudBookListTableViewCell.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/9/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Sugar
import Reusable
import EasyPeasy

class CloudBookListTableViewCell: UITableViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var containerView: UIView = {
        return UIView().then {
            $0.clipsToBounds = false
        }
    }()
    
    lazy var coverImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "Ай астындағы Айбарша сұлу")
        }
    }()
    
    lazy var backgroundImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 2
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.image = #imageLiteral(resourceName: "background")
        }
    }()
    
    lazy var infoView: UIView = {
        return UIView().then{
            $0.clipsToBounds = true
        }
    }()
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Күнекей қыз"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
            $0.adjustsFontSizeToFitWidth = true
        }
    }()
    
    lazy var subTitleLabel: UILabel = {
        return UILabel().then {
            $0.text = "жүктеу"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            $0.textAlignment = .center
        }
    }()
    
    lazy var descriptionLabel: UILabel = {
        return UILabel().then {
            $0.text = "Ертеде бір кемпір болыпты, оның жалғыз баласы бар …"
            $0.textColor = UIColor.white.withAlphaComponent(0.62)
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            $0.numberOfLines = 3
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
        infoView.addSubviews(titleLabel, subTitleLabel, descriptionLabel)
        containerView.addSubviews(backgroundImageView, coverImageView, infoView)
        contentView.addSubview(containerView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
        containerView.easy.layout(CenterY(), Left(20), Right(20))
        backgroundImageView.easy.layout(Edges(0))
        coverImageView.easy.layout(Top(-15), Left(-10), Width(93), Height(128))
        infoView.easy.layout(Left(10).to(coverImageView), Right(10), Top(10), Bottom(15))
        titleLabel.easy.layout(Top(5), Left(0), Right(0))
        descriptionLabel.easy.layout(Top(5).to(titleLabel), Left(0), Right(10))
        subTitleLabel.easy.layout(Top(10).to(descriptionLabel), Left(0))
    }
}
