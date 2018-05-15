//
//  DetailedBookViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/14/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy

class DetailedBookViewController: UIViewController {
    
    // MARK: Properties
    
    var book: Book?
    
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
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        }
    }()
    
    lazy var subTitleLabel: UILabel = {
        return UILabel().then {
            $0.text = "Қазақ халық ертегісі"
            $0.textColor = .pickledBluewood
            $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            $0.textAlignment = .center
        }
    }()
    
    lazy var descriptionLabel: UILabel = {
        return UILabel().then {
            $0.text = "Ерте заманда Ерназар деген кісі болыпты. Ерназардың өзі бай болыпты. Қора толған қойлары болыпты. Матау толған түйелері болыпты. Өріс толған жылқылары болыпты. Ерназардың сегіз ұлы болыпты. Бір жылы үлкен жұт болып, ел малын алысқа, отарға айдап кетіпті. Ерназардың сегіз ұлы соның ішінде кетіпті. Бір қыстық азығын алып, кемпірі мен Ерназар үйінде қалыпты. Ерназардың сегіз ұлы сол кеткеннен хабарсыз кетеді, айлар өтеді - келмейді, жылдар өтеді - келмейді."
            $0.textColor = .pickledBluewood
            $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
            $0.numberOfLines = 0
        }
    }()
    
    fileprivate lazy var openHeroButton: UIButton = {
        return UIButton(type: .system).then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .cornflowerBlue
            $0.setTitleColor(.white, for: .normal)
            $0.setTitle("Кейіпкерді ашу", for: .normal)
            $0.addTarget(self, action: #selector(openHeroButtonDidPress(_:)), for: .touchUpInside)
        }
    }()
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstriants()
        configureInformation()
    }
    
    //MARK: - Configure Navbar
    
    func configureNavigationBar() {
        guard let book = book else { return }
        self.navigationItem.title = book.name
    }
    
    // MARK: Configure Views
    
    func configureViews() {
        edgesForExtendedLayout = []
        self.view.backgroundColor = .alabaster
        self.view.addSubviews(coverImageView, titleLabel, subTitleLabel, descriptionLabel, openHeroButton)
    }
    
    // MARK: Configure Constraints
    
    func configureConstriants() {
        coverImageView.easy.layout(Top(20), Width(150), Height(200), CenterX(0))
//        titleLabel.easy.layout(Top(10).to(coverImageView), CenterX(0))
        subTitleLabel.easy.layout(Top(10).to(coverImageView), CenterX(0))
        descriptionLabel.easy.layout(Top(10).to(subTitleLabel), CenterX(0), Left(20), Right(20))
        openHeroButton.easy.layout(Top(10).to(descriptionLabel), Left(20), Right(20), Height(50))
    }
    
    // MARK: User Interaction
    
    @objc fileprivate func openHeroButtonDidPress(_ sender: UIButton) {
        let vc = CongratulationViewController()
        guard let book = book else { return }
        vc.name = book.name
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Configure Information
    
    func configureInformation() {
        guard let book = book else { return }
        coverImageView.image = UIImage(named: book.image)
        subTitleLabel.text = book.category
        descriptionLabel.text = book.depiction
    }
}
