//
//  SoundDetailsViewController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 20/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit
import AVFoundation

class SoundDetailsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var isPlaying: Bool = false
    
    let songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.image = #imageLiteral(resourceName: "senorita")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Senorita"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let songArtistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shawn Mendes, Camila Cabello"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let songSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .lightGray
        return slider
    }()

    let playbackStatusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
    }()
    
    let nextSongButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.end.fill"), for: UIControl.State.normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNextSong), for: .touchUpInside)
        return button
    }()
    
    let previousSongButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.end.fill"), for: UIControl.State.normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePreviousSong), for: .touchUpInside)
        return button
    }()
    
    let shuffleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shuffle"), for: UIControl.State.normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleShuffle), for: .touchUpInside)
        return button
    }()
    
    let repeatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "repeat"), for: UIControl.State.normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleRepeat), for: .touchUpInside)
        return button
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let finalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUpAudioPlayer()
        handleSongPlayback()
        
        setUpNavigationBar()
        setUpViews()
    }
    
    private func setUpNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        title = "Senorita"
        
        let dismissButton = UIBarButtonItem(image: UIImage(named: "expandArrow.filled"), style: .plain, target: self, action: #selector(handleDismiss))
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu.vertical.filled"), style: .plain, target: self, action: #selector(handleMore))

        
        navigationItem.leftBarButtonItems = [dismissButton]
        navigationItem.rightBarButtonItems = [menuButton]
    }
    
    private func setUpViews(){
        view.addSubview(songImageView)
        view.addSubview(finalStack)
        
        finalStack.addArrangedSubview(labelStackView)
        finalStack.addArrangedSubview(songSlider)
        finalStack.addArrangedSubview(buttonsStackView)
        
        labelStackView.addArrangedSubview(songNameLabel)
        labelStackView.addArrangedSubview(songArtistNameLabel)

        buttonsStackView.addArrangedSubview(shuffleButton)
        buttonsStackView.addArrangedSubview(previousSongButton)
        buttonsStackView.addArrangedSubview(playbackStatusButton)
        buttonsStackView.addArrangedSubview(nextSongButton)
        buttonsStackView.addArrangedSubview(repeatButton)

        let contentWidth = view.frame.width * 0.8
        
        songImageView.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        songImageView.heightAnchor.constraint(equalToConstant: contentWidth).isActive = true
        songImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        songImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        finalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        finalStack.heightAnchor.constraint(equalToConstant: contentWidth/5).isActive = true
        finalStack.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        finalStack.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: 70).isActive = true
                
        songNameLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        songArtistNameLabel.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        
        songSlider.heightAnchor.constraint(equalToConstant: 29).isActive = true
        songSlider.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
        
        buttonsStackView.leadingAnchor.constraint(equalTo: finalStack.leadingAnchor).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: finalStack.trailingAnchor).isActive = true
        buttonsStackView.heightAnchor.constraint(equalToConstant: contentWidth/5).isActive = true
        
        let height = contentWidth/5
        playbackStatusButton.heightAnchor.constraint(equalToConstant: height).isActive = true
        playbackStatusButton.layer.cornerRadius = height/2
        
    }
    
    @objc func handleDismiss(){
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: false)
    }
    
    @objc func handleMore(){
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: false)
    }
    
    @objc func handlePause(){
        handleSongPlayback()
    }
    
    @objc func handleNextSong(){
        print("next song")
    }
    
    @objc func handlePreviousSong(){
        print("previous song")
    }
    
    @objc func handleShuffle(){
        print("shuffle song")
    }
    
    @objc func handleRepeat(){
        print("repeat song")
    }
    
    func setUpAudioPlayer(){
        
//        let songURL = Bundle.main.url(forResource: "Indila - Dernière Danse (Clip Officiel)", withExtension: "mp3")
        let senoritaURl = Bundle.main.url(forResource: "Camila Cabello - Señorita", withExtension: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: senoritaURl!)
            audioPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()

            do{
                try audioSession.setCategory(AVAudioSession.Category.playback)
            }catch{
                print(error)
            }
            
        }catch{
            print(error)
        }
        
    }
    
    func handleSongPlayback(){
        
        if isPlaying{
            audioPlayer.pause()
            playbackStatusButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
            self.isPlaying = false
        }else{
            audioPlayer.play()
            playbackStatusButton.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
            self.isPlaying = true
        }
        
    }
    
}
