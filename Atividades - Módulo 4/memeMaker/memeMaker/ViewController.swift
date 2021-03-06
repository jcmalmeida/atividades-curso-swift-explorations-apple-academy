//
//  ViewController.swift
//  memeMaker
//
//  Created by JoΓ£o Carlos Martins de Almeida on 19/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let  π = CaptionOption(emoji: "π", caption: "Hoje vou Γ s compras")
    let  π§ = CaptionOption(emoji: "π§", caption: "Coloca essa mΓΊsica no volume mΓ‘ximo")
    let  π = CaptionOption(emoji: "π", caption: "NΓ£o quero ver isso")
    
    let  π = CaptionOption(emoji: "π", caption: "Olha o trem fumaceando")
    let  π = CaptionOption(emoji: "π", caption: "Sem paciΓͺncia para bizarrices")
    let  π = CaptionOption(emoji: "π", caption: "Mas gente, que isso?")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        let topChoices = [π, π§, π]
        let bottomChoices = [π, π, π]
        
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
        case "π":
            topCaptionLabel.text = π.caption
        case "π§":
            topCaptionLabel.text = π§.caption
        case "π":
            topCaptionLabel.text = π.caption
        case "π":
            bottomCaptionLabel.text = π.caption
        case "π":
            bottomCaptionLabel.text = π.caption
        case "π":
            bottomCaptionLabel.text = π.caption
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

