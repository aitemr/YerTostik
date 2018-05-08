//
//  LeaderBoardHeaderView.swift
//  YerTostik
//
//  Created by Islam on 25.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import Sugar

class LeaderBoardHeaderView: UIView {
    
    // MARK: Properties
    
    lazy var silverContainer: LeaderBoardHeaderViewItem = {
        return LeaderBoardHeaderViewItem().then {
            $0.scoreLabel.text = "25"
            $0.nameLabel.text = "Ислам"
            $0.avatarImageView.image = #imageLiteral(resourceName: "islam")
//            $0.backgroundColor = .green
            $0.nameLabel.textColor = .silverColor
            $0.avatarImageView.layer.borderColor = UIColor.silverColor.cgColor
            $0.layer.masksToBounds = true
            $0.clipsToBounds = true
        }
    }()
    
    lazy var goldContainer: LeaderBoardHeaderViewItem = {
        return LeaderBoardHeaderViewItem().then {
            $0.scoreLabel.text = "31"
            $0.nameLabel.text = "Гульназ"
            $0.nameLabel.textColor = .goldColor
//            $0.backgroundColor = .orange
            $0.layer.masksToBounds = true
            $0.avatarImageView.layer.borderColor = UIColor.goldColor.cgColor
            $0.clipsToBounds = true
        }
    }()
    
    lazy var bronzeContainer: LeaderBoardHeaderViewItem = {
        return LeaderBoardHeaderViewItem().then {
            $0.scoreLabel.text = "23"
            $0.nameLabel.text = "Даурен"
            $0.avatarImageView.image = #imageLiteral(resourceName: "dauren")
            $0.nameLabel.textColor = .bronzeColor
            $0.avatarImageView.layer.borderColor = UIColor.bronzeColor.cgColor
//            $0.backgroundColor = .blue
            $0.layer.masksToBounds = true
            $0.clipsToBounds = true
        }
    }()
    
    // MARK: View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .red
        configureViews()
        configureConstriants()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.addSubviews(goldContainer, silverContainer, bronzeContainer)
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        let itemSize = Constant.width / 3 - 20
        goldContainer.easy.layout(Width(itemSize), Height(110), Center(0))
        silverContainer.easy.layout(Width(itemSize), Height(110), Right(10).to(goldContainer), CenterY(0))
        bronzeContainer.easy.layout(Width(itemSize), Height(110), Left(10).to(goldContainer), CenterY(0))
    }
}
