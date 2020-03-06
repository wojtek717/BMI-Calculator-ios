//
//  CalculatorBrain.swift
//  BMI Calculator


import Foundation

struct CalculatorBrain{
    var bmi : Float?
    
    mutating func calculateBMI(height: Float, weight: Float) -> Void {
        bmi = weight/(pow(height, 2))
    }
    
    func getBMIText() -> String {
        return String(format: "%.2f", bmi ?? 0.0)
    }
}
