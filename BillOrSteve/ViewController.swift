//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var steveButton: UIButton!
    
    @IBOutlet weak var billButton: UIButton!
    
    // Create your stored properties here
    var billAndSteveTrivia: [String: [String]] = [:]
    var correctPerson: String = ""
    var numCorrectGuesses:Int = 0
    
    @IBAction func steveAction(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            numCorrectGuesses += 1
            scoreLabel.text = String(numCorrectGuesses)
        }
        showFact()
    }
    
    @IBAction func billAction(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            numCorrectGuesses += 1
            scoreLabel.text = String(numCorrectGuesses)
        }
        showFact()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
   
    func showFact() {
        let (person,fact) = getRandomFact()
        correctPerson = person
        factLabel.text = fact
    }
    
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.","He scored 1590 (out of 1600) on his SATs.","His foundation spends more on global health each year than the United Nation's World Health Organization.","The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.","In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.","Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.","He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.","He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveTrivia["Bill Gates"] = billFacts
        billAndSteveTrivia["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        //randomly select key from dictionary, then randomly select fact from array from that key
        let randomPers = randomPerson()
        let randomFactIndex = randomIndex(fromArray: billAndSteveTrivia[randomPers]!)
        return (randomPers,billAndSteveTrivia[randomPers]![randomFactIndex])
    }
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
}
