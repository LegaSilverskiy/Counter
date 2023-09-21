//
//  ViewController.swift
//  Counter
//
//  Created by Олег Серебрянский on 21.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backViewColor: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
     var countNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        backViewColor.backgroundColor = .gray
        countLabel.text = "Значение счётчика: \(countNumber)"
        countLabel.backgroundColor = .black
        countLabel.textColor = .white
        plusButton.backgroundColor = .green
        plusButton.tintColor = .white
        // Do any additional setup after loading the view.
    }

    @IBAction func increaseButton(_ sender: Any) {
        countNumber += 1
        countLabel.text = "Значение счётчика: \(countNumber)"
    }
}
