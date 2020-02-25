//
//  ViewController.swift
//  BMI Calculator

import UIKit

class ViewController: UIViewController {
    var bmi : String = ""
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {

        heightLabel.text = ((String(format: "%.2f", sender.value)) + "m")
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value) + "kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmi = String(format: "%.2f", weight/(pow(height, 2)))
        
        print(bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = bmi
        }
    }

}

