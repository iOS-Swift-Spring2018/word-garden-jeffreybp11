//
//  ViewController.swift
//  Word Garden
//
//  Created by Jeffrey Barros Peña on 2/3/18.
//  Copyright © 2018 Barros Peña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = String(letterGuessed)
            guessLetterButton.isEnabled = true
        } else {
            // disable button if no letter in the letter field
            guessLetterButton.isEnabled = false
        }
    }
    @IBAction func doneKeyPressed(_ sender: Any) {
        updateUIAfterGuess()
        guessLetterButton.isEnabled = false
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
        guessLetterButton.isEnabled = false
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
}

