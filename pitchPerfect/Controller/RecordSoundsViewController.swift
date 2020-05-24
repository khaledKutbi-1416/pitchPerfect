
//  RecordingController.swift
//  pitchPerfect
//
//  Created by Khaled Kutbi on 06/09/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.

import UIKit
import AVFoundation

class RecordSoundsViewConroller: UIViewController , AVAudioRecorderDelegate {

    //MARK:- ProPerties
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var recordLabel: RecordLabel!
    var audioRecorder: AVAudioRecorder!
    
  

    //MARK:- Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initailizeRecordState()
    }
    
    
    //MARK: - Actions
    @IBAction func recordAction(_ sender: Any) {
        //Rest record stat
        self.recordState(isRecording: true)
        //start record function
        configurRecorder()
    }
    @IBAction func stopRecordAction(_ sender: Any) {
        //Rest record stat
        self.recordState(isRecording: false)
        //Stop record
        self.stopRecorder()

    }
    
    //MARK:- The function For configuring recorder and recall it again 
    func configurRecorder(){
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    func stopRecorder (){
        self.audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    func recordState(isRecording: Bool){
        
        self.recordButton.isEnabled = !isRecording
        self.stopRecordButton.isEnabled = isRecording
        self.recordLabel.text = isRecording ? "Record in Progress":"Tap to Record..."
    
    }
    func initailizeRecordState(){
        self.stopRecordButton.isEnabled = false
        self.recordLabel.text = "Tap to Record..."
    }
    
    
    //MARK:- Handelrs
    
    // MARK: - Audio Recorder Delegate
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            self.performSegue(withIdentifier: "toPlayPlaySoundsViewController", sender: audioRecorder.url)
              print("Finish recording")
        }else{
            print("recording was't successfull")
        }
      
        
    }
    
    //MARK:- prepare for segue function for passing data from view contoller to another
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlayPlaySoundsViewController"{

            let playSouundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSouundsVC.recordedAudioURL = recordedAudioURL
        }

    }

    
    

}
