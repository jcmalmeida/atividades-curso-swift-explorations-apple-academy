//
//  ViewController.swift
//  MusicToolbox
//
//  Created by João Carlos Martins de Almeida on 02/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tunerSelectButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "tunerVC") as! TunerViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func metronomeSelectButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "metronomeVC") as! MetronomeViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
}

