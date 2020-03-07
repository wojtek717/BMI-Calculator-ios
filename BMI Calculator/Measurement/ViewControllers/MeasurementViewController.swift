//
//  MeasurementViewController.swift
//  BMI Calculator

import UIKit

protocol MeasurementViewControllerPresenter: NSObject {
    func updateHeight(with value: String)
    func updateWeight(with value: String)
}

final class MeasurementViewController: UIViewController {

    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    
    @IBOutlet private weak var heightSlider: UISlider!
    @IBOutlet private weak var weightSlider: UISlider!
    
    lazy var viewModel = MeasurementViewModel(presenter: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateHeight(with: heightSlider.value)
        viewModel.updateWeight(with: weightSlider.value)
    }

    @IBAction private func heightSliderChange(_ sender: UISlider) {
        viewModel.updateHeight(with: sender.value)
    }
    
    @IBAction private func weightSliderChange(_ sender: UISlider) {
        viewModel.updateWeight(with: sender.value)
    }
    
    @IBAction private func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResult",
            let destinationVC = segue.destination as? ResultViewController else {
                return
        }
        let measurement = self.viewModel.measurement(forHeight: heightSlider.value, andWeight: weightSlider.value)
        destinationVC.viewModel = ResultViewModel(measurement: measurement, presenter: destinationVC)
    }
}

extension MeasurementViewController: MeasurementViewControllerPresenter {
    func updateHeight(with value: String) {
        heightLabel.text = value
    }
    
    func updateWeight(with value: String) {
        weightLabel.text = value
    }
}
