//
//  ProfileHeaderView.swift
//  YerTostik
//
//  Created by Islam on 25.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

class ProfileHeaderView: UICollectionReusableView {

    // MARK: Properties
    
    lazy var avatarImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 27
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "gulnaz")
        }
    }()
    
    lazy var nameLabel: UILabel = {
        return UILabel().then {
            $0.text = "Гульназ Кассымова"
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        }
    }()
    
    lazy var phoneNumberLabel: UILabel = {
        return UILabel().then {
            $0.text = "+77082020155"
            $0.textColor = .gray
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        }
    }()
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Менің кейіпкерлерім"
            $0.textColor = .pickledBluewood
            $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        }
    }()
    
    lazy var arrowImageView: UIImageView = {
        return UIImageView().then {
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "arrow")
        }
    }()
    
    // MARK: View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstriants()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.addSubviews(avatarImageView, nameLabel, phoneNumberLabel, titleLabel, arrowImageView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        avatarImageView.easy.layout(Left(20), Top(15), Size(54))
        nameLabel.easy.layout(Left(10).to(avatarImageView), Top(20))
        phoneNumberLabel.easy.layout(Left(10).to(avatarImageView), Top(5).to(nameLabel))
        titleLabel.easy.layout(Left(20), Top(20).to(phoneNumberLabel))
        arrowImageView.easy.layout(Right(20), Top(35))
    }
}
