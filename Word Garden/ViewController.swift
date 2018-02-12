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
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    var guessCount = 0
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
        
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord += " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        
        // decrements wrong answers remaining
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed.uppercased()) {
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, you're all out of guesses. Try again?"
        } else if !revealedWord.contains("_") {
            // you've won
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "Congratulations! It took you \(guessCount) tries to guess the word!"
        } else {
            let guess = (guessCount==1 ? "guess" : "guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
        }
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = String(letterGuessed)
            lettersGuessed += String(letterGuessed).uppercased()
            guessLetterButton.isEnabled = true
        } else {
            // disable button if no letter in the letter field
            guessLetterButton.isEnabled = false
        }
    }
    @IBAction func doneKeyPressed(_ sender: Any) {
        guessALetter()
        updateUIAfterGuess()
        guessLetterButton.isEnabled = false
    }
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
        guessLetterButton.isEnabled = false
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        guessCountLabel.text = "You've made 0 guesses"
        guessCount = 0
        formatUserGuessLabel()
    }
    
    
    
}

