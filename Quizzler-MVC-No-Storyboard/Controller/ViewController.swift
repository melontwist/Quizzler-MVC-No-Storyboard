//
//  ViewController.swift
//  Quizzler-MVC-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/13.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: MainView!
    
    var quizBrain = QuizBrain()
    
    override func loadView() {
        super.loadView()
        self.mainView = MainView(frame: .zero)
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [mainView.firstButton, mainView.secondButton, mainView.thirdButton].forEach{
            $0.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
        
        mainView.resetButton.addTarget(self, action: #selector(showAlert1), for: .touchUpInside)
        
        updateUI()
    }
    
    @objc func showAlert1() {
        let alert = UIAlertController(title: "Reset the Quiz!", message: "Are you sure to reset the quiz", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { _ in
            self.quizBrain.resetGame()
            self.updateUI()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
        
    }
    
    func showAlert2() {
        let alert = UIAlertController(title: "Quiz Finished", message: "Your score is \(quizBrain.getScore())", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again!", style: .default, handler: { _ in
            self.quizBrain.resetGame()
            self.updateUI()
        }))
        
        present(alert, animated: true)
    }
    
    @objc func answerButtonPressed(_ sender: UIButton){
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.isLastQuestion() ? showAlert2() : quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.updateUI()
        }
    }
    
    func updateUI(){
        mainView.questionLabel.text = quizBrain.getQuestionText()
        
        mainView.firstButton.setTitle(quizBrain.getAnswerText(choice: 0), for: .normal)
        mainView.secondButton.setTitle(quizBrain.getAnswerText(choice: 1), for: .normal)
        mainView.thirdButton.setTitle(quizBrain.getAnswerText(choice: 2), for: .normal)
        
        mainView.progressBar.progress = quizBrain.getProgress()
        mainView.scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        mainView.firstButton.backgroundColor = UIColor.clear
        mainView.secondButton.backgroundColor = UIColor.clear
        mainView.thirdButton.backgroundColor = UIColor.clear
    }
}


