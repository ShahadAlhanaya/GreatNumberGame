//
//  ViewController.swift
//  GreatNumberGame
//
//  Created by Shahad Nasser on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guessTextField: UITextField!
    
    var greatNumber: Int = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitPressed(_ sender: UIButton) {
        if(guessTextField.text != ""){
            if(guessTextField.text!.isNumeric){
                let guessedNumber: Int? = Int(guessTextField.text!)
                if(guessedNumber == greatNumber){
                    let alert = UIAlertController(title: "Correct!", message: "\(greatNumber) was correct!", preferredStyle: UIAlertController.Style.alert)
                    alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.green
                    alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: {action in self.playAgain()}))
                           self.present(alert, animated: true, completion: nil)
                }else{
                    var message = "\(guessedNumber!) is too low"
                    if(guessedNumber! > greatNumber){
                        message = "\(guessedNumber!) is too high"
                    }
                    let alert = UIAlertController(title: "Incorrect!", message: message, preferredStyle: UIAlertController.Style.alert)
                    alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.red
                    alert.addAction(UIAlertAction(title: "Guess Again", style: UIAlertAction.Style.default, handler: nil))
                           self.present(alert, animated: true, completion: nil)
                    guessTextField.text = ""
                }
            }
        }
    }
    
    func playAgain(){
        guessTextField.text = ""
        greatNumber = Int.random(in: 1...100)
    }
    
}

extension String
{
    var isNumeric: Bool
    {
        let range = self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)
        return (range == nil)
    }
}



