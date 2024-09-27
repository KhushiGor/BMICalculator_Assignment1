//
//  ViewController.swift
//  BMICalculator_Assignment1
//
//  Created by Khushi Mineshkumar Gor on 2024-09-26.
//

import UIKit
    
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch1.isOn = true
        height2Input.isHidden = true
        weightInput.placeholder = "kgs"
        height1Input.placeholder = "cms"
    }
    
    

    @IBOutlet weak var heightLable: UILabel!
    
    @IBOutlet weak var height1Input: UITextField!
    
    @IBOutlet weak var height2Input: UITextField!
    
    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var switchLable: UILabel!
    
    @IBOutlet weak var weightLable: UILabel!
    
    @IBOutlet weak var bmiNumber: UILabel!
    
    @IBOutlet weak var weightInput: UITextField!
    
    @IBOutlet weak var conclusion: UILabel!
    
    @IBAction func switch1_Action(_ sender: Any) {
        if switch1.isOn {
            height2Input.isHidden = true
            weightInput.placeholder = "kgs"
            height1Input.placeholder = "cms"
            
        } else {
            height2Input.isHidden = false
            height1Input.placeholder = "feets"
            height2Input.placeholder = "inches"
            weightInput.placeholder = "pounds"
            switchLable.text = "in feet,inches/pounds"
        }
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        if switch1.isOn {
            if let height = height1Input.text, let weight = weightInput.text {
                if !height.isEmpty && !weight.isEmpty {
                    if let numHeight = Double(height), let numWeight = Double(weight){
                        if numHeight >= 0 && numWeight >= 0 {
                            let bmi : Double = (numWeight / ((numHeight / 100) * (numHeight / 100)))
                            
                            bmiNumber.text = String(format: "%.2f", bmi)
                            if bmi <= 18.5 {
                                conclusion.text = "UnderWeight"
                            } else if bmi > 18.5 && bmi < 24.9 {
                                conclusion.text = "Normal Weight"
                            } else if bmi > 25 && bmi < 29.9 {
                                conclusion.text = "OverWeight"
                            } else {
                                conclusion.text = "Obese"
                            }
                        }else {bmiNumber.text = "Invalid Input"}
                        
                    }
                    
                }
            }
        } else {
            if let heightInFeet = height1Input.text, let heightInInches = height2Input.text, let weight = weightInput.text {
                if !heightInFeet.isEmpty && !heightInInches.isEmpty && !weight.isEmpty {
                    if let numHeightInFeet = Double(heightInFeet), let numHeightInInches = Double(heightInInches), let numWeight = Double(weight){
                        if numHeightInFeet >= 0 && numWeight >= 0 && numHeightInInches >= 0 {
                            let totalInches = (numHeightInFeet * 12) + numHeightInInches
                            let heightInMeters = totalInches * 0.0254
                            let bmi : Double = (numWeight * 0.435) / ((heightInMeters) * (heightInMeters))
                            bmiNumber.text = String(format: "%.2f", bmi)
                            if bmi <= 18.5 {
                                conclusion.text = "UnderWeight"
                            } else if bmi > 18.5 && bmi < 24.9 {
                                conclusion.text = "Normal Weight"
                            } else if bmi > 25 && bmi < 29.9 {
                                conclusion.text = "OverWeight"
                            } else {
                                conclusion.text = "Obese"
                            }
                        }else {bmiNumber.text = "Invalid Input"}
                        
                    }
                    
                }
            }
        }
    }
    
    
    
    

}

