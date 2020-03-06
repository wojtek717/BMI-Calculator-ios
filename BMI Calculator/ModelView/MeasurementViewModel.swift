//
//  MeasurementViewModel.swift
//  BMI Calculator
//
//  Created by Wojciech Konury on 05/03/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

class MeasurementViewModel {
  private let measurement : Measurement
  
  public init(measurement: Measurement){
    self.measurement = measurement
  }
  
  public var weightText: String{
    return (String(format: "%.0f", measurement.weight) + "kg")
  }
  
  public var heightText: String{
    return (String(format: "%.2f", measurement.height) + "m")
  }
  
  public var bmiText: String{
    let bmi = measurement.calculateBMI()
    
    return String(format: "%.2f", bmi)
  }
}

