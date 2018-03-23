//
//  LibraryTableViewCell.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Sugar
import Reusable
import EasyPeasy

class LibraryTableViewCell: UITableViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var coverImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "cover")
        }
    }()
    
    lazy var backgroundImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 2
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "background")
        }
    }()
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Күнекей қыз"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
            $0.textAlignment = .center
        }
    }()
    
    lazy var subTitleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Қазақ халық ертегісі"
            $0.textColor = UIColor.white.withAlphaComponent(0.62)
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            $0.textAlignment = .center
        }
    }()
    
    lazy var descriptionLabel: UILabel = {
        return UILabel().then {
            $0.text = "Ертеде бір кемпір болыпты, оның жалғыз баласы бар …"
            $0.textColor = UIColor.white.withAlphaComponent(0.62)
            $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            $0.numberOfLines = 2
        }
    }()
    
    lazy var progressLabel: UILabel = {
        return UILabel().then {
            $0.text = "63 %"
            $0.textColor = UIColor.white.withAlphaComponent(0.62)
            $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
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
        [backgroundImageView, coverImageView, titleLabel, subTitleLabel, descriptionLabel, progressLabel].forEach{
            contentView.addSubview($0)
        }
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
        backgroundImageView.easy.layout( Height(128), Left(35), CenterY(0) )
        coverImageView.easy.layout(Left(24) ,Width(93), Height(128) )
        titleLabel.easy.layout(Left(10).to(coverImageView), Top(23))
        subTitleLabel.easy.layout(Left(10).to(coverImageView), Top(5).to(titleLabel))
        descriptionLabel.easy.layout(Left(10).to(coverImageView), Top(10).to(subTitleLabel), Right(40))
        progressLabel.easy.layout(Left(10).to(coverImageView), Top(7).to(descriptionLabel))
    }
}
