//
//  TunerViewController.swift
//  MusicToolbox
//
//  Created by João Carlos Martins de Almeida on 03/05/22.
//

import UIKit
import AVFoundation

class TunerViewController: UIViewController {
    
    @IBOutlet weak var aKey: UIButton!
    @IBOutlet weak var aSharpKey: UIButton!
    @IBOutlet weak var bKey: UIButton!
    @IBOutlet weak var cKey: UIButton!
    @IBOutlet weak var cSharpKey: UIButton!
    @IBOutlet weak var dKey: UIButton!
    @IBOutlet weak var dSharpKey: UIButton!
    @IBOutlet weak var eKey: UIButton!
    @IBOutlet weak var fKey: UIButton!
    @IBOutlet weak var fSharpKey: UIButton!
    @IBOutlet weak var gKey: UIButton!
    @IBOutlet weak var gSharpKey: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    
    enum Notes {
        case a, b, c, d, e, f, g, aSharp, cSharp, dSharp, fSharp, gSharp
        
        func audioFile() -> String {
            switch self {
                // Use Internationalization, as appropriate.
                case .a: return "A"
                case .b: return "B"
                case .c: return "C"
                case .d: return "D"
                case .e: return "E"
                case .f: return "F"
                case .g: return "G"
                case .aSharp: return "A#"
                case .cSharp: return "C#"
                case .dSharp: return "D#"
                case .fSharp: return "F#"
                case .gSharp: return "G#"
            }
        }
    }
    
    var keyWasPressed = false
    var keyPressed: Notes = .a
    var isPlaying = false
    var audioPlayer: AVAudioPlayer?
    
    var pianoKeys = [UIButton]()
    var pianoSharpKeys = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pianoKeys = [aKey, bKey, cKey, dKey, eKey, fKey, gKey]
        pianoSharpKeys = [aSharpKey, cSharpKey, dSharpKey, fSharpKey, gSharpKey]
        
        updateLayout(pianoKeys: pianoKeys, pianoSharpKeys: pianoSharpKeys)
    }
    
    @IBAction func backSelectButton(_ sender: Any) {
        stopSaveSound()
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func keyPressed(_ sender: Any) {
        if keyWasPressed {
            switch keyPressed {
            case .a:
                aKey.backgroundColor = .systemGray4
            case .b:
                bKey.backgroundColor = .systemGray4
            case .c:
                cKey.backgroundColor = .systemGray4
            case .d:
                dKey.backgroundColor = .systemGray4
            case .e:
                eKey.backgroundColor = .systemGray4
            case .f:
                fKey.backgroundColor = .systemGray4
            case .g:
                gKey.backgroundColor = .systemGray4
            case .aSharp:
                aSharpKey.backgroundColor = .darkGray
            case .cSharp:
                cSharpKey.backgroundColor = .darkGray
            case .dSharp:
                dSharpKey.backgroundColor = .darkGray
            case .fSharp:
                fSharpKey.backgroundColor = .darkGray
            case .gSharp:
                gSharpKey.backgroundColor = .darkGray
            }
            keyWasPressed = false
        }
        if !keyWasPressed  {
            if(aKey.isTouchInside) {
                aKey.backgroundColor = .red
                keyPressed = .a
            }
            if(aSharpKey.isTouchInside) {
                aSharpKey.backgroundColor = .red
                keyPressed = .aSharp
            }
            if(bKey.isTouchInside) {
                bKey.backgroundColor = .red
                keyPressed = .b
            }
            if(cKey.isTouchInside) {
                cKey.backgroundColor = .red
                keyPressed = .c
            }
            if(cSharpKey.isTouchInside) {
                cSharpKey.backgroundColor = .red
                keyPressed = .cSharp
            }
            if(dKey.isTouchInside) {
                dKey.backgroundColor = .red
                keyPressed = .d
            }
            if(dSharpKey.isTouchInside) {
                dSharpKey.backgroundColor = .red
                keyPressed = .dSharp
            }
            if(eKey.isTouchInside) {
                eKey.backgroundColor = .red
                keyPressed = .e
            }
            if(fKey.isTouchInside) {
                fKey.backgroundColor = .red
                keyPressed = .f
            }
            if(fSharpKey.isTouchInside) {
                fSharpKey.backgroundColor = .red
                keyPressed = .fSharp
            }
            if(gKey.isTouchInside) {
                gKey.backgroundColor = .red
                keyPressed = .g
            }
            if(gSharpKey.isTouchInside) {
                gSharpKey.backgroundColor = .red
                keyPressed = .gSharp
            }
            if !isPlaying {
                playPauseButton.backgroundColor = .systemGreen
            }
            keyWasPressed = true
        }
        if keyWasPressed && isPlaying {
            stopSaveSound()
            playSaveSound(audioFile: keyPressed.audioFile())
        }
    }
    
    @IBAction func playPauseButtonPressed(_ sender: Any) {
        if !isPlaying && keyWasPressed {
            playPauseButton.backgroundColor = .systemYellow
            playPauseButton.setTitle("PAUSE", for: .normal)
            instructionLabel.text = "Caso desejar, altere a nota"
            isPlaying = true
            playSaveSound(audioFile: keyPressed.audioFile())
        } else if isPlaying {
            playPauseButton.backgroundColor = .systemGreen
            playPauseButton.setTitle("PLAY", for: .normal)
            instructionLabel.text = "Caso desejar, altere a nota e aperte play"
            isPlaying = false
            stopSaveSound()
        }
    }
    
    func playSaveSound(audioFile: String){
        let path = Bundle.main.path(forResource: "/Audio_files/\(audioFile).wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            //create your audioPlayer in your parent class as a property
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Couldn't load the file")
        }
    }
    
    func stopSaveSound(){
        audioPlayer?.setVolume(0, fadeDuration: 0.05)
    }
    
    func updateLayout(pianoKeys: [UIButton], pianoSharpKeys: [UIButton]) {
        for key in pianoKeys {
            key.backgroundColor = .systemGray4
            key.layer.cornerRadius = 5
        }
        for key in pianoSharpKeys {
            key.backgroundColor = .darkGray
            key.layer.cornerRadius = 5
        }
        playPauseButton.backgroundColor = .systemGray5
        playPauseButton.layer.cornerRadius = 125
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
