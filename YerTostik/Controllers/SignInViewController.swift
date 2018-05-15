//
//  LoginViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/5/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import Firebase
import SVProgressHUD
import Sugar

class SignInViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var textField: (_ placeholder: String, _ flag: Bool) -> PaddingTextField = {
        placeholder, flag in
        return PaddingTextField(verticalPadding: 8, horizontalPadding: 10).then {
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .white
            $0.keyboardType = (!flag ? .emailAddress : .default)
            $0.autocapitalizationType = .none
            $0.autocorrectionType = .no
            let attributes =
                [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
            $0.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
            $0.isSecureTextEntry = flag
            $0.adjustsFontSizeToFitWidth = true
        }
    }
    
    fileprivate lazy var emailTextField: PaddingTextField = {
        return self.textField("Почта", false)
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
    
    //MARK: - Configure Navbar
    
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
        self.view.addSubviews(emailTextField, passwordTextField, signInButton)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        emailTextField.easy.layout(Top(20), Left(20), Right(20), Height(50))
        passwordTextField.easy.layout(Top(15).to(emailTextField), Left(20), Right(20), Height(50))
        signInButton.easy.layout(Top(15).to(passwordTextField ), Left(20), Right(20), Height(50))
    }
    
    // MARK: User Interaction
    
    @objc fileprivate func signInButtonDidPress(_ sender: UIButton) {
        dispatch {
            self.hideKeyboard()
            guard let email = self.emailTextField.text,
                let password = self.passwordTextField.text,
                !email.isEmpty && !password.isEmpty else {
                    Drop.down("Қате", state: .error)
                    return }
            self.signInWithEmail(email: email, password: password)
        }
        
    }
    
    @objc fileprivate func signInWithEmail(email: String, password: String) {
        SVProgressHUD.show(withStatus: "Жүктелуде...")
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                guard let error = error else { return }
                Drop.down(error.localizedDescription, state: .error)
                self.refreshData()
            } else {
                (UIApplication.shared.delegate as? AppDelegate)?.loadMainPages()
                SVProgressHUD.dismiss()
            }
            SVProgressHUD.dismiss()
        }
    }
    
    @objc fileprivate func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc fileprivate func refreshData() {
        passwordTextField.text = ""
    }
    
}
