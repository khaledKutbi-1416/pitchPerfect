
//  PlayBackController.swift
//  pitchPerfect
//
//  Created by Khaled Kutbi on 07/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    
   
   // MARK: Outlets
                    
   @IBOutlet weak var snailButton: UIButton!
   @IBOutlet weak var chipmunkButton: UIButton!
   @IBOutlet weak var rabbitButton: UIButton!
   @IBOutlet weak var vaderButton: UIButton!
   @IBOutlet weak var echoButton: UIButton!
   @IBOutlet weak var reverbButton: UIButton!
   @IBOutlet weak var stopButton: UIButton!
    
    //MARK: - Properties
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Setup audio came from previos view contoller through url
        self.setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureUI(.notPlaying)
    }
    //this function used to stop sound when you go back to previos ViewController and the sound still working
    override func viewDidDisappear(_ animated: Bool) {
        self.stopAudio()
    }
    // MARK: Actions

    @IBAction func playSoundForButton(_ sender: UIButton) {
       
        switch (ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                 playSound(rate: 1.5)
            case .chipmunk:
                 playSound(pitch: 1000)
            case .vader:
                 playSound(pitch: -1000)
            case .echo:
                 playSound(echo: true)
            case .reverb:
                 playSound(reverb: true)
        }
        
        configureUI(.playing)
        
        
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
        self.stopAudio()
    }
    

    

}
