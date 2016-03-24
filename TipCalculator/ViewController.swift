//
//  ViewController.swift
//  TipCalculator
//
//  Created by Wong, Kapunahele on 3/19/16.
//  Copyright © 2016 Wong, Kapunahele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var split2: UILabel!
    @IBOutlet weak var split3: UILabel!
    @IBOutlet weak var split4: UILabel!

    
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitAmount: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        tipLabel.text = "$0.00"
        totalAmount.text = "0.00"
        split2.text = "$0.00"
        split3.text = "$0.00"
        split4.text = "$0.00"

        splitSlider.value = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let amountEntered = NSString(string: billAmount.text!).doubleValue
        let tip = amountEntered * tipPercentage
        let total = amountEntered + tip
        let total2 = total/2
        let total3 = total/3
        let total4 = total/4


        
        tipLabel.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        split2.text = String(format: "$%.2f", total2)
        split3.text = String(format: "$%.2f", total3)
        split4.text = String(format: "$%.2f", total4)

        
        func slider(sender: UISlider) {
            
            let currentValue = Int(sender.value)
            let splitBill = total/Double(currentValue)
            let splitBillFormatted = String(format: "$%.2f", splitBill)
            splitAmount.text = "Split \(currentValue) ways: \(splitBillFormatted)"
        }
        
        slider(splitSlider)
        
    }
    

    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

