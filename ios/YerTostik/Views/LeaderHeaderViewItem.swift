//
//  LeaderHeaderViewItem.swift
//  YerTostik
//
//  Created by Islam on 25.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import Sugar

class LeaderBoardHeaderViewItem: UIView {
    
    // MARK: Properties
    
    lazy var avatarImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 27
            $0.contentMode = .scaleAspectFill
            $0.layer.borderWidth = 3
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.image = #imageLiteral(resourceName: "gulnaz")
        }
    }()
    
    lazy var scoreLabel: UILabel = {
        return UILabel().then {
            $0.text = "3200"
            $0.textColor = .doveGray
            $0.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
            $0.textAlignment = .center
        }
    }()
    
    lazy var nameLabel: UILabel = {
        return UILabel().then {
            $0.text = "Гульназ"
            $0.textColor = .dustyGray
            $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
            $0.textAlignment = .center
        }
    }()
    
    // MARK: View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = .yellow
        configureViews()
        configureConstriants()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.addSubviews(avatarImageView, scoreLabel, nameLabel)
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        avatarImageView.easy.layout(Size(54), CenterX(0), Top(5))
        scoreLabel.easy.layout(Top(8).to(avatarImageView), CenterX(0))
        nameLabel.easy.layout(Top(3).to(scoreLabel), CenterX(0))
    }
}
