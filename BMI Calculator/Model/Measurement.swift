//
//  Measurement.swift
//  BMI Calculator
//
//  Created by Wojciech Konury on 05/03/2020.
//

import Foundation

class Measurement {
  var weight : Float
  var height : Float
  
  public init(weight: Float, height: Float){
    self.weight = weight
    self.height = height
  }
  
    func calculateBMI() -> Float {
    return weight/(pow(height, 2))
  }
}
