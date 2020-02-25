//
//  ResultViewController.swift
//  BMI Calculator

import UIKit

class ResultViewController: UIViewController {
    
    var bmi : String?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var advideLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmi
    }


}
