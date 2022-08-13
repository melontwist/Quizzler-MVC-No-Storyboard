//
//  MainView.swift
//  Quizzler-MVC-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/13.
//

import Foundation
import UIKit

class MainView: UIView {
    
    //Component for the background image
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    //Component to keep your score
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    //Button to reset the quiz
    let resetButton = ReusableButton(title: "Reset Quiz", type: .system)
    
    //Horizontal stackView a the top of the screen
    lazy var topStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [scoreLabel, resetButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    //Component for the question's text
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Question Text"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
        
    //Component to choice the answer
    let firstButton = ReusableButton(title: "Choice 1", type: .system)
    let secondButton = ReusableButton(title: "Choice 2", type: .system)
    let thirdButton = ReusableButton(title: "Choice 3", type: .system)
    
    //Component to know our progression
    let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.progress = 0.5
        progress.progressTintColor = UIColor(red: 0.99, green: 0.47, blue: 0.65, alpha: 1.00)
        progress.trackTintColor = .white
        
        return progress
    }()
    
    //Stack all the components
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [topStack, questionLabel, firstButton,secondButton, thirdButton, progressBar])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.contentMode = .scaleToFill
        
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0.20, green: 0.23, blue: 0.35, alpha: 1.00)
        
        setComponent()
        setConstraint()
    }
    
    private func setComponent(){
        [backgroundImage, stackView].forEach{
            addSubview($0)
        }
    }
    
    private func setConstraint(){
        NSLayoutConstraint.activate([
            
            backgroundImage.heightAnchor.constraint(equalToConstant: 102),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            thirdButton.heightAnchor.constraint(equalToConstant: 80),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
