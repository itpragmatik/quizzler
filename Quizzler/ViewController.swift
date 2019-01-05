//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1) {
            pickedAnswer = true
        }
        if(sender.tag == 2) {
            pickedAnswer = false
        }
        checkAnswer()
        //proceed to next quetion
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        let totalNumberOfQuestions = allQuestions.list.count
        let currentQuestionNumber = questionNumber + 1
        progressLabel.text = "\(currentQuestionNumber) / \(totalNumberOfQuestions)"
        
        progressBar.frame.size.width = (view.frame.width/CGFloat(13)) * CGFloat(currentQuestionNumber)
    }
    

    func nextQuestion() {
        if(questionNumber >= allQuestions.list.count) {
            let alert = UIAlertController(title: "Congratulations", message: "You have finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart",
                                              style: .default,
                                              handler: { (UIAlertAction) in self.startOver()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score = score + 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
