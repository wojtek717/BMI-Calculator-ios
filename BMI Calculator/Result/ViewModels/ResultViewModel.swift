//
//  ResultViewModel.swift
//  BMI Calculator
//
//  Created by Łukasz Lech on 07/03/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

final class ResultViewModel {
    
    private let measurement: Measurement
    private weak var presenter: ResultViewControllerPresenter?
    
    init(measurement: Measurement,
         presenter: ResultViewControllerPresenter?) {
        self.measurement = measurement
        self.presenter = presenter
    }
    
    func presentResult() {
        let result = String(format: "%.2f", getBMI(fromMeasurement: measurement))
        presenter?.updateResult(with: result)
    }
    
    private func getBMI(fromMeasurement measurement: Measurement) -> Float {
        measurement.weight / (pow(measurement.height, 2))
    }
}
