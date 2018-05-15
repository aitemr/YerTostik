//
//  AudioTableViewCell.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/16/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Sugar
import Reusable
import EasyPeasy

class AudioTableViewCell: UITableViewCell, Reusable {
    
    // MARK: Properties
    
    lazy var coverImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "Ай астындағы Айбарша сұлу")
        }
    }()

    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Күнекей қыз"
            $0.textColor = .pickledBluewood
            $0.numberOfLines = 0
            $0.adjustsFontSizeToFitWidth = true
            $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        }
    }()
    
    lazy var subTitleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Қазақ халық ертегісі"
            $0.textColor = .pickledBluewood
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            $0.adjustsFontSizeToFitWidth = true
        }
    }()
    
    lazy var playPauseImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "play")
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
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        titleLabel.text = nil
//        subTitleLabel.text = nil
//        playPauseImageView.image = nil
//    }
    
    // MARK: Configure Views
    
    func configureViews() {
        contentView.addSubviews(coverImageView, titleLabel, subTitleLabel, playPauseImageView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
        coverImageView.easy.layout(Width(80), Height(100), Left(20), CenterY(0))
        playPauseImageView.easy.layout(CenterY(0), Right(20), Size(40))
        titleLabel.easy.layout(Left(10).to(coverImageView), Right(10).to(playPauseImageView), CenterY(0))
        subTitleLabel.easy.layout(Left(10).to(coverImageView), Right(10).to(playPauseImageView), Top(5).to(titleLabel))
    }
}
