//
//  ViewController.swift
//  BMI Calculator

import UIKit

class ViewController: UIViewController {
    //var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
  
  var measurement : Measurement?
  var measurementViewModel : MeasurementViewModel?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      measurement = Measurement(weight: weightSlider.value, height: heightSlider.value)
      measurementViewModel = MeasurementViewModel(measurement: measurement!)
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
      measurement?.height = sender.value
      heightLabel.text = measurementViewModel?.heightText
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
      measurement?.weight = sender.value
      weightLabel.text = measurementViewModel?.weightText
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController
          destinationVC.bmi = measurementViewModel?.bmiText
        }
    }

}

