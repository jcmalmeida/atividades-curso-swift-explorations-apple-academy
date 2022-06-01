//
//  ViewController.swift
//  memeMaker
//
//  Created by João Carlos Martins de Almeida on 19/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let  🛒 = CaptionOption(emoji: "🛒", caption: "Hoje vou às compras")
    let  🎧 = CaptionOption(emoji: "🎧", caption: "Coloca essa música no volume máximo")
    let  🙈 = CaptionOption(emoji: "🙈", caption: "Não quero ver isso")
    
    let  🚂 = CaptionOption(emoji: "🚂", caption: "Olha o trem fumaceando")
    let  😒 = CaptionOption(emoji: "😒", caption: "Sem paciência para bizarrices")
    let  🙀 = CaptionOption(emoji: "🙀", caption: "Mas gente, que isso?")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        let topChoices = [🛒, 🎧, 🙈]
        let bottomChoices = [🚂, 😒, 🙀]
        
        // Do any additional setup after loading the view.
        insertSegments(choices: topChoices, control: topSegmentedControl)
        
        insertSegments(choices: bottomChoices, control: bottomSegmentedControl)
    }
    
    func insertSegments(choices: [CaptionOption], control: UISegmentedControl) {
        for choice in choices {
            control.insertSegment(withTitle: choice.emoji, at: choices.count, animated: false)
        }
    }

    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        switch (sender.titleForSegment(at: sender.selectedSegmentIndex)) {
        case "🛒":
            topCaptionLabel.text = 🛒.caption
        case "🎧":
            topCaptionLabel.text = 🎧.caption
        case "🙈":
            topCaptionLabel.text = 🙈.caption
        case "🚂":
            bottomCaptionLabel.text = 🚂.caption
        case "😒":
            bottomCaptionLabel.text = 😒.caption
        case "🙀":
            bottomCaptionLabel.text = 🙀.caption
        default:
            fatalError()
        }
    }

    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
}

