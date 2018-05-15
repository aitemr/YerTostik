//
//  AudioViewController.swift
//  YerTostik
//
//  Created by Islam Temirbek on 5/14/18.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import EasyPeasy
import Sugar
import DZNEmptyDataSet
import AVFoundation

class AudioViewController: UIViewController {
    
    // MARK: Properties
    
    var audios: [Book] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var songPlayer = AVAudioPlayer()
    
    lazy var tableView: UITableView = {
        return UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: AudioTableViewCell.self)
            $0.emptyDataSetSource = self as DZNEmptyDataSetSource
            $0.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
            $0.rowHeight = 120
            $0.tableFooterView = UIView(frame: CGRect.zero)
        }
    }()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        configureConstraints()
        prepareSongAndSession()
        loadData()
    }
    
    //MARK: - Configure Navbar
    
    func configureNavigationBar() {
        self.navigationItem.title = "Аудио"
    }
    
    // MARK: Configure Views
    
    func configureViews(){
        self.view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    // MARK: Configure Constraints
    
    func configureConstraints(){
        tableView.easy.layout(Edges(0))
    }
    
    // MARK: Audio Configurations
    
    func prepareSongAndSession() {
        do {
            if let path = Bundle.main.path(forResource: "auid", ofType: "mp3") {
                songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: path))
                songPlayer.prepareToPlay()
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                } catch let sessionError {
                    print(sessionError)
                }
            }
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }
    
    func loadData() {
        Book.fetch { [unowned self]  (result, error) in
            if error == nil {
                guard let result = result else { return }
                self.audios = result
            }
        }
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension AudioViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as AudioTableViewCell
        let audio = audios[indexPath.row]
        cell.titleLabel.text = audio.name
        cell.subTitleLabel.text = audio.category
        cell.coverImageView.image = UIImage(named: audio.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) as? AudioTableViewCell else { return }
        if songPlayer.isPlaying {
            songPlayer.pause()
            cell.playPauseImageView.image = #imageLiteral(resourceName: "play")
        } else {
            songPlayer.play()
            cell.playPauseImageView.image = #imageLiteral(resourceName: "pause")
        }
    }
}

// MARK: DZNEmptyDataSet

extension AudioViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Ештене табылмады"
        let attribute = [NSAttributedStringKey.foregroundColor: UIColor.pickledBluewood]
        let attributedString = NSAttributedString(string: title, attributes: attribute)
        return attributedString
    }
}


