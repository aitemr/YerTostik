//
//  WelcomeViewController.swift
//  YerTostik
//
//  Created by Islam on 27.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import Sugar
import EasyPeasy

class WelcomeViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var logoImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 30
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "logo")
        }
    }()
    
    lazy var titleLabel: UILabel = {
        return UILabel().then{
            $0.text = "YerTostik - \n Ғажайып ертегілер"
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
    }()
    
    lazy var signInButton: UIButton = {
        return UIButton(type: .system).then {
            $0.setTitle("Кiру", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .dodgerBlue
            $0.layer.cornerRadius = 4
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        }
    }()
    
    lazy var signUpButton: UIButton = {
        return UIButton(type: .system).then {
            $0.setTitle("Тiркелу", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .dodgerBlue
            $0.layer.cornerRadius = 4
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        }
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        signInButton.titleEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.view.backgroundColor = .white
        self.view.addSubviews(logoImageView, titleLabel, signInButton, signUpButton)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints() {
        titleLabel.easy.layout(CenterY(0), Left(20), Right(20))
        logoImageView.easy.layout(Bottom(20).to(titleLabel), Size(70), Left(20))
        signInButton.easy.layout(Left(20), Right(20), Bottom(140))
        signUpButton.easy.layout(Left(20), Right(20), Bottom(65))
    }
}
