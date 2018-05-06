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
    
    lazy var videoPlayer: VideoPlayerView = {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let videoPlayer = VideoPlayerView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return videoPlayer
    }()
    
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
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
            $0.textAlignment = .left
            $0.numberOfLines = 2
            $0.adjustsFontSizeToFitWidth = true
        }
    }()
    
    lazy var signInButton: UIButton = {
        return UIButton(type: .system).then {
            $0.setTitle("Кiру", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .cornflowerBlue
            $0.layer.cornerRadius = 2
            $0.addTarget(self, action: #selector(signInDidPress(_:)), for: .touchUpInside)
        }
    }()

    lazy var signUpButton: UIButton = {
        return UIButton(type: .system).then {
            $0.setTitle("Тiркелу", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .cornflowerBlue
            $0.layer.cornerRadius = 2
            $0.addTarget(self, action: #selector(signUpDidPress(_:)), for: .touchUpInside)
        }
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstraints()
        signInButton.titleEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        videoPlayer.videoPlayer.pause()
//        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        videoPlayer.videoPlayer.play()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Configure Navigation Bar
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(videoPlayer)
        self.view.addSubviews(logoImageView, titleLabel, signInButton, signUpButton)
    }
    
    // MARK: Configure Constraints
    
    
    func configureConstraints() {
        titleLabel.easy.layout(CenterY(0), Left(20), Right(20))
        logoImageView.easy.layout(Bottom(20).to(titleLabel), Size(70), Left(20))
        signUpButton.easy.layout(Left(20), Right(20), Bottom(30), Height(50))
        signInButton.easy.layout(Left(20), Right(20), Bottom(10).to(signUpButton), Height(50))
    }
    
    
    // MARK: User Interaction
    
    @objc fileprivate func signInDidPress(_ sender: UIButton) {
        let vc = SignInViewController()
        let _ = navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc fileprivate func signUpDidPress(_ sender: UIButton) {
        let vc = SignUpViewController()
        let _ = navigationController?.pushViewController(vc, animated: true)
    }
    
}
