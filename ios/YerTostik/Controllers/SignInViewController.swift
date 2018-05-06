//
//  LoginViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/5/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

class SignInViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var textField: (_ placeholder: String, _ flag: Bool) -> PaddingTextField = {
        placeholder, flag in
        return PaddingTextField(verticalPadding: 8, horizontalPadding: 10).then {
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .white
            $0.keyboardType = (!flag ? .phonePad : .default)
            $0.autocapitalizationType = .none
            $0.autocorrectionType = .no
            let attributes =
                [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
            $0.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
            $0.isSecureTextEntry = flag
            $0.adjustsFontSizeToFitWidth = true
        }
    }
    
    fileprivate lazy var phoneNumberTextField: PaddingTextField = {
        return self.textField("Телефон номер", false)
    }()
    
    fileprivate lazy var passwordTextField: PaddingTextField = {
        return self.textField("Пароль", true)
    }()
    
    fileprivate lazy var signInButton: UIButton = {
        return UIButton(type: .system).then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .cornflowerBlue
            $0.setTitleColor(.white, for: .normal)
            $0.setTitle("Кiру", for: .normal)
            $0.addTarget(self, action: #selector(signInButtonDidPress(_:)), for: .touchUpInside)
        }
    }()
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstriants()
    }
    
    //MARK: - Setup Navbar
    
    func configureNavigationBar() {
        self.navigationItem.title = "Кiру"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .pickledBluewood
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = false
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        self.view.backgroundColor = .alabaster
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        self.view.addSubviews(phoneNumberTextField, passwordTextField, signInButton)
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        phoneNumberTextField.easy.layout(Top(20), Left(20), Right(20), Height(50))
        passwordTextField.easy.layout(Top(15).to(phoneNumberTextField), Left(20), Right(20), Height(50))
        signInButton.easy.layout(Top(15).to(passwordTextField ), Left(20), Right(20), Height(50))
    }
    
    // MARK: User Interaction
    
    @objc fileprivate func signInButtonDidPress(_ sender: UIButton) {
    }
    
    @objc fileprivate func hideKeyboard() {
        view.endEditing(true)
    }
    
}
