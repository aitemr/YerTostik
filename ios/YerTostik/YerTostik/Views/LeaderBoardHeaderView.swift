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
            $0.scoreLabel.text = "3200"
            $0.backgroundColor = .green
        }
    }()
    
    lazy var bronzeContainer: LeaderBoardHeaderViewItem = {
        return LeaderBoardHeaderViewItem().then {
            $0.scoreLabel.text = "3100"
        }
    }()
    
    // MARK: View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        configureViews()
        configureConstriants()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        [silverContainer].forEach{
            self.addSubview($0)
        }
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        silverContainer.easy.layout(Left(42), Size(110))
//        bronzeContainer.easy.layout(Top(36), Left(10).to(silverContainer))
    }
}
