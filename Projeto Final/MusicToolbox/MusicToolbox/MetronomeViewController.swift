//
//  MetronomeViewController.swift
//  MusicToolbox
//
//  Created by João Carlos Martins de Almeida on 03/05/22.
//

import UIKit
import AVFoundation

class MetronomeViewController: UIViewController {

    @IBOutlet weak var bpmLabel: UILabel!
    @IBOutlet weak var decrementBPMButton: UIButton!
    @IBOutlet weak var incrementBPMButton: UIButton!
    @IBOutlet weak var timeSignatureLabel: UILabel!
    @IBOutlet weak var decrementTimeSignatureButton: UIButton!
    @IBOutlet weak var incrementTimeSignatureButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var indicatorOne: UIButton!
    @IBOutlet weak var indicatorTwo: UIButton!
    @IBOutlet weak var indicatorThree: UIButton!
    @IBOutlet weak var indicatorFour: UIButton!
    @IBOutlet weak var indicatorFive: UIButton!
    
    var bpmSelected = 60
    let minBPM = 20
    let maxBPM = 180
    var newBPM = false
    let timeSignatures = ["1/4", "2/4", "3/4", "4/4"]
    var timeSignatureSelectedIndex = 2
    var beatIndex = 0
    var isPlaying = false
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    var metronomeButtons = [UIButton]()
    var timeSignatureIndicators = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        metronomeButtons = [decrementBPMButton, incrementBPMButton, decrementTimeSignatureButton, incrementTimeSignatureButton]
        timeSignatureIndicators = [indicatorOne, indicatorTwo, indicatorThree, indicatorFour, indicatorFive]
        
        updateLayout(metronomeButtons: metronomeButtons)
        updateTimeSignature()
        
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        //print("Timer fired!")
        if newBPM {
            timer?.invalidate()
            let newTimeInterval = 60.0 / Float(bpmSelected)
            //print(newTimeInterval)
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(newTimeInterval), target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            newBPM = false
        }
        if isPlaying {
            playSaveSound(audioPath: "/Audio_files/metronome_beep.m4a")
            updateTimeSignature()
        } else {
            print("timer invalidado")
            timer?.invalidate()
        }
    }
    
    @IBAction func backSelectButton(_ sender: Any) {
        timer?.invalidate()
        stopSaveSound()
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func decrementBPM(_ sender: Any) {
        if bpmSelected > minBPM {
            if bpmSelected == maxBPM {
                incrementBPMButton.backgroundColor = .systemGray5
            }
            bpmSelected -= 1
            bpmLabel.text = String(bpmSelected)
            if bpmSelected == minBPM {
                decrementBPMButton.backgroundColor = .darkGray
            }
            newBPM = true
        }
    }
    
    @IBAction func incrementBPM(_ sender: Any) {
        if bpmSelected < maxBPM {
            if bpmSelected == minBPM {
                decrementBPMButton.backgroundColor = .systemGray5
            }
            bpmSelected += 1
            bpmLabel.text = String(bpmSelected)
            if bpmSelected == maxBPM {
                incrementBPMButton.backgroundColor = .darkGray
            }
            newBPM = true
        }
    }
    
    @IBAction func decrementTimeSignature(_ sender: Any) {
        if timeSignatureSelectedIndex > 0 {
            if timeSignatureSelectedIndex == timeSignatures.count - 1 {
                incrementTimeSignatureButton.backgroundColor = .systemGray5
            }
            timeSignatureSelectedIndex -= 1
            timeSignatureLabel.text = String(timeSignatures[timeSignatureSelectedIndex])
            if timeSignatureSelectedIndex == 0 {
                decrementTimeSignatureButton.backgroundColor = .darkGray
            }
        }
        beatIndex = 0
        updateTimeSignature()
    }
    
    @IBAction func incrementTimeSignature(_ sender: Any) {
        if timeSignatureSelectedIndex < timeSignatures.count - 1 {
            if timeSignatureSelectedIndex == 0 {
                decrementTimeSignatureButton.backgroundColor = .systemGray5
            }
            timeSignatureSelectedIndex += 1
            timeSignatureLabel.text = String(timeSignatures[timeSignatureSelectedIndex])
            if timeSignatureSelectedIndex == timeSignatures.count - 1 {
                incrementTimeSignatureButton.backgroundColor = .darkGray
            }
        }
        beatIndex = 0
        updateTimeSignature()
    }
    
    @IBAction func playPauseButtonPressed(_ sender: Any) {
        if !isPlaying {
            isPlaying = true
            updateTimeSignature()
            let newTimeInterval = 60.0 / Float(bpmSelected)
            //print(newTimeInterval)
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(newTimeInterval), target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            playPauseButton.backgroundColor = .systemYellow
            playPauseButton.setTitle("PAUSE", for: .normal)
            instructionLabel.text = "Caso desejar, altere a velocidade e o compasso"
            playSaveSound(audioPath: "/Audio_files/metronome_beep.m4a")
        } else if isPlaying {
            isPlaying = false
            beatIndex = 0
            stopSaveSound()
            updateTimeSignature()
            playPauseButton.backgroundColor = .systemGreen
            playPauseButton.setTitle("PLAY", for: .normal)
            instructionLabel.text = "Caso desejar, altere a velocidade e o compasso, e aperte play"
        }
    }
    
    func playSaveSound(audioPath: String) {
        let path = Bundle.main.path(forResource: audioPath, ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            //create your audioPlayer in your parent class as a property
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Couldn't load the file")
        }
    }
    
    func stopSaveSound() {
        audioPlayer?.setVolume(0, fadeDuration: 0.05)
    }
    
    func updateLayout(metronomeButtons: [UIButton]) {
        for button in metronomeButtons {
            button.backgroundColor = .systemGray4
            button.layer.cornerRadius = 25
        }
        for button in timeSignatureIndicators {
            button.layer.cornerRadius = 20
        }
        playPauseButton.backgroundColor = .systemGreen
        playPauseButton.layer.cornerRadius = 85
    }
    
    func updateTimeSignature() {
        let timeSignature = timeSignatures[timeSignatureSelectedIndex]
        for indicator in timeSignatureIndicators {
            indicator.backgroundColor = .clear
        }
        if !isPlaying {
            switch timeSignature {
            case "1/4":
                indicatorThree.backgroundColor = .systemGray4
            case "2/4":
                indicatorOne.backgroundColor = .systemGray4
                indicatorFive.backgroundColor = .systemGray4
            case "3/4":
                indicatorOne.backgroundColor = .systemGray4
                indicatorThree.backgroundColor = .systemGray4
                indicatorFive.backgroundColor = .systemGray4
            case "4/4":
                indicatorOne.backgroundColor = .systemGray4
                indicatorTwo.backgroundColor = .systemGray4
                indicatorFour.backgroundColor = .systemGray4
                indicatorFive.backgroundColor = .systemGray4
            default:
                break
            }
        } else {
            switch timeSignatures[timeSignatureSelectedIndex] {
            case "1/4":
                indicatorThree.backgroundColor = .red
            case "2/4":
                switch(beatIndex) {
                case 0:
                    indicatorOne.backgroundColor = .red
                    indicatorFive.backgroundColor = .systemGray4
                    beatIndex += 1
                case 1:
                    indicatorOne.backgroundColor = .systemGray4
                    indicatorFive.backgroundColor = .red
                    beatIndex = 0
                default:
                    break
                }
            case "3/4":
                switch(beatIndex) {
                case 0:
                    indicatorOne.backgroundColor = .red
                    indicatorThree.backgroundColor = .systemGray4
                    indicatorFive.backgroundColor = .systemGray4
                    beatIndex += 1
                case 1:
                    indicatorOne.backgroundColor = .systemGray4
                    indicatorThree.backgroundColor = .red
                    indicatorFive.backgroundColor = .systemGray4
                    beatIndex += 1
                case 2:
                    indicatorOne.backgroundColor = .systemGray4
                    indicatorThree.backgroundColor = .systemGray4
                    indicatorFive.backgroundColor = .red
                    beatIndex = 0
                default:
                    break
                }
            case "4/4":
                switch(beatIndex) {
                case 0:
                    indicatorOne.backgroundColor = .red
                    indicatorTwo.backgroundColor = .systemGray4
                    indicatorFour.backgroundColor = .systemGray4
                    indicatorFive.backgroundColor = .systemGray4
                    beatIndex += 1
                case 1:
                    indicatorOne.backgroundColor = .systemGray4
                    indicatorTwo.backgroundColor = .red
                    indicatorFour.backgroundColor = .systemGray4
                    indicatorFive.backgroundColor = .systemGray4
                    beatIndex += 1
                case 2:
                    indicatorOne.backgroundColor = .systemGray4
                    indicatorTwo.backgroundColor = .systemGray4
                    indicatorFour.backgroundColor = .red
                    indicatorFive.backgroundColor = .systemGray4
                    beatIndex += 1
                case 3:
                    indicatorOne.backgroundColor = .systemGray4
                    indicatorTwo.backgroundColor = .systemGray4
                    indicatorFour.backgroundColor = .systemGray4
                    indicatorFive.backgroundColor = .red
                    beatIndex = 0
                default:
                    break
                }
            default:
                break
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
