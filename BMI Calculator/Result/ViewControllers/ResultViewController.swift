//
//  ResultViewController.swift
//  BMI Calculator

import UIKit

protocol ResultViewControllerPresenter: NSObject {
    func updateResult(with bmi: String)
}

class ResultViewController: UIViewController {

    @IBOutlet private weak var bmiLabel: UILabel!
    @IBOutlet private weak var advideLabel: UILabel!
    
    @IBAction private func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var viewModel: ResultViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.presentResult()
    }
}

extension ResultViewController: ResultViewControllerPresenter {
    func updateResult(with bmi: String) {
        bmiLabel.text = bmi
    }
}
