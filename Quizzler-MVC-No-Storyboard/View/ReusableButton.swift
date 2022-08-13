//
//  ReusableButton.swift
//  Quizzler-MVC-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/13.
//

import Foundation
import UIKit

class ReusableButton: UIButton {

    init(title: String, type: UIButton.ButtonType){
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
                self.setTitle(title, for: .normal)
                self.tintColor = .white
                self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
                self.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
                self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
