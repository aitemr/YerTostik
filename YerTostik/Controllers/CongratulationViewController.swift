//
//  CongratulationViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/14/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import Sugar

class CongratulationViewController: UIViewController {
    
    // MARK: Properties
    
    var name: String?
    
    lazy var backgroundImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "bg")
        }
    }()
    
    lazy var cupImageView: UIImageView = {
        return UIImageView().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.contentMode = .scaleAspectFill
            $0.image = #imageLiteral(resourceName: "trophy")
        }
    }()
    
    lazy var titleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Тамаша!"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold)
        }
    }()
    
    lazy var subTitleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Сіз «Тазша бала» ертегісін толық оқып бітірдіңіз"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        }
    }()
    
    fileprivate lazy var openHeroButton: UIButton = {
        return UIButton(type: .system).then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .white
            $0.setTitleColor(.white, for: .normal)
            $0.setTitle("Кейіпкерді ашу", for: .normal)
            $0.setTitleColor(.monaLisa, for: .normal)
            $0.addTarget(self, action: #selector(openHeroButtonDidPress(_:)), for: .touchUpInside)
        }
    }()
    
    fileprivate lazy var closeButton: UIButton = {
        return UIButton(type: .system).then {
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(closeButtonDidPress(_:)), for: .touchUpInside)
            $0.setImage(#imageLiteral(resourceName: "close-white"), for: .normal)
            $0.tintColor = .white
        }
    }()
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstriants()
    }
    
    //MARK: - Configure Navbar
    
    func configureNavigationBar() {
//        closeButton.setImage(#imageLiteral(resourceName: "close-white"), for: .normal)
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.view.addSubviews(backgroundImageView, closeButton, cupImageView, titleLabel, subTitleLabel, openHeroButton)
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        backgroundImageView.easy.layout(Edges(0))
        closeButton.easy.layout(Size(50), Top(32), Left(20))
        cupImageView.easy.layout(Top(160), Size(130), CenterX(0))
        titleLabel.easy.layout(Top(40).to(cupImageView), CenterX(0))
        subTitleLabel.easy.layout(Top(10).to(titleLabel), CenterX(0), Left(20), Right(20))
        openHeroButton.easy.layout(Top(10).to(subTitleLabel), Left(20), Right(20), Height(50))
    }
    
    // MARK: User Interaction
    
    @objc fileprivate func openHeroButtonDidPress(_ sender: UIButton) {
        guard let name = name else { return }
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondViewController = storyboard.instantiateViewController(withIdentifier: "arviewcontroller") as? ARViewController {
            secondViewController.name = name
            present(secondViewController, animated: true, completion: nil)
        }
    }
    
    @objc func closeButtonDidPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
