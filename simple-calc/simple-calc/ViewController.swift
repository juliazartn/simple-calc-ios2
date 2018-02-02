//
//  ViewController.swift
//  simple-calc
//
//  Created by Julia Zaratan on 1/26/18.
//  Copyright © 2018 Julia Zaratan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateLabel: UILabel!
    
    var calculationsBank : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculateLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        self.calculateLabel.text = self.calculateLabel.text! + String(sender.tag)
    }
    
    @IBAction func clearLabel(_ sender: Any) {
        self.calculateLabel.text = ""
    }
    
    @IBAction func operations(_ sender: UIButton) {
        var opString : String = ""
        
        switch sender.tag {
        case 10 : //equals
            var newCalculation = self.calculateLabel.text! + " = "
            let result = equals(self.calculateLabel.text!)
            var newLabel : String = String(result)
            if !isDecimal(result) { //if result is a int
                newLabel = String(Int(result))
            }
            newCalculation += newLabel
            calculationsBank.append(newCalculation)
            self.calculateLabel.text = newLabel
        case 11: //plus
            opString = " + "
        case 12: //minus
            opString = " - "
        case 13: //multiply
            opString = " x "
        case 14: //divide
            opString = " / "
        case 15: //mod
            opString = " % "
        case 16: //avg
            opString = " avg "
        case 17: //count
            opString = " count "
        case 18: //fact
            var newCalculation = self.calculateLabel.text! + " fact "
            var arr : [String] = self.calculateLabel.text!.split(separator: " ").map({ substr in String(substr) })
            var num = Double(arr[0])! - 1
            var ans = Double(arr[0])!
            
            if isDecimal(num) {
                num = floor(num)
                ans = floor(ans)
            }
            
            while num > 0 {
                ans = ans * num
                num = num - 1
            }
            self.calculateLabel.text = String(Int(ans))
            newCalculation = self.calculateLabel.text!
            calculationsBank.append(newCalculation)
        case 19: //decimal point
            opString = "."
        default:
            opString = " "
        }
        self.calculateLabel.text = self.calculateLabel.text! + opString
    }
    
    //takes current state of calculateLabel and returns result in Double
    func equals( _ args: String) -> Double {
        var arr : [String] = args.split(separator: " ").map({ substr in String(substr) })
        
        if arr[1] == "count" {
            var count : Int = 0
            for n in arr {
                if n != "count" {
                    count += 1
                }
            }
            return Double(count)
        }
        else if arr[1] == "avg" {
            var count : Double = 0
            var avg : Double = 0
            for n in arr {
                if n != "avg" {
                    avg += Double(n)!
                    count += 1
                }
            }
            return avg / count
        }
        else if arr.count == 3 {
            let op = arr[1]
            let firstNum = Double(arr[0])
            let secondNum = Double(arr[2])
            
            switch op {
            case "-":
                return firstNum! - secondNum!
            case "+":
                return firstNum! + secondNum!
            case "/":
                return firstNum! / secondNum!
            case "%":
                return firstNum!.truncatingRemainder(dividingBy: secondNum!)
            case "x":
                return firstNum! * secondNum!
            default:
                print("not an operation")
            }
        }
        
        return 0
    }
    
    //helper function to check if a double is an integer
    func isDecimal(_ n: Double) -> Bool {
        if floor(n) == n { //if result is a int
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyView = segue.destination as! SecondViewController
        historyView.calculationsBank = calculationsBank
    }
    
}



