//
//  HomeViewController.swift
//  Nightingale
//
//  Created by Krishnil Bhojani on 01/03/20.
//  Copyright © 2020 AppFactory. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

//    var audioPlayer: AVAudioPlayer!
//    var isPlaying: Bool = false
    
    fileprivate let cellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        tabBarItem.image = UIImage(named: "home")
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellID)
        
//        setUpAudioPlayer()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryCell
        cell.homeViewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 230)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print(contentOffsetY)
    }
    
//    func setUpAudioPlayer(){
//        
////        let songURL = Bundle.main.url(forResource: "Indila - Dernière Danse (Clip Officiel)", withExtension: "mp3")
//        let senoritaURl = Bundle.main.url(forResource: "Camila Cabello - Señorita", withExtension: "mp3")
//        
//        do{
//            audioPlayer = try AVAudioPlayer(contentsOf: senoritaURl!)
//            audioPlayer.prepareToPlay()
//            
//            let audioSession = AVAudioSession.sharedInstance()
//            
//            do{
//                try audioSession.setCategory(AVAudioSession.Category.playback)
//            }catch{
//                
//            }
//            
//        }catch{
//            print(error)
//        }
//        
//    }
    
//    func playSong(){
//        
//        if isPlaying{
//            audioPlayer.pause()
//            self.isPlaying = false
//        }else{
//            audioPlayer.play()
//            self.isPlaying = true
//        }
//        
//    }
    
    func goToSongViewController(){
        
        let soundVC = SoundDetailsViewController()
//        soundVC.modalPresentationStyle = .overCurrentContext
//        soundVC.modalTransitionStyle = .crossDissolve
        
        navigationController?.pushViewController(soundVC, animated: false)
//        present(soundVC, animated: true, completion: nil)
        
    }
    
}

