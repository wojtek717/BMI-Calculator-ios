//
//  MeasurementViewModel.swift
//  BMI Calculator
//
//  Created by Wojciech Konury on 05/03/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

class MeasurementViewModel {
  
    private weak var presenter: MeasurementViewControllerPresenter?
    
    init(presenter: MeasurementViewControllerPresenter?) {
        self.presenter = presenter
    }
    
    func updateHeight(with value: Float) {
        let height = String(format: "%.2f", value) + "m"
        presenter?.updateHeight(with: height)
    }
    
    func updateWeight(with value: Float) {
        let weight = String(format: "%.0f", value) + "kg"
        presenter?.updateWeight(with: weight)
    }
    
    func measurement(forHeight height: Float, andWeight weight: Float) -> Measurement {
        Measurement(weight: weight, height: height)
    }
}
