//
//  ViewController.swift
//  test
//
//  Created by Nuraini Aguse on 12/30/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var bilField: UITextField!
    
    @IBOutlet weak var plusSign: UILabel!
    
    @IBOutlet weak var equalsLabel: UILabel!
    
    @IBOutlet weak var dividedTotalLabel: UILabel!
 
    
    @IBOutlet weak var totalPeopleLabel: UILabel!
    
    @IBOutlet weak var percSeg: UISegmentedControl!
    
    
    @IBOutlet weak var stepper: UIStepper!
   
    @IBOutlet weak var leBox: UIView!
    
    let container = UIView()
    let initial = UIView()
    let calc = UIView()
    
    var total = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bilField.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
        
     /*   self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
       self.view.addSubview(container)
        self.initial.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        */
    
      //  self.tipLabel.alpha = 0
        //self.totalLabel.alpha = 0
      //  self.equalsLabel.alpha = 0
       // self.plusSign.alpha = 0
        self.percSeg.alpha = 0
        self.leBox.alpha = 0
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
       // bilField.fra
        self.bilField.center.y = 220.0
        stepper.autorepeat = true
        stepper.minimumValue = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func onEditChange(sender: AnyObject) {
     
        if (bilField.text!.isEmpty){
            UIView.animateWithDuration(0.3, animations: {
       //     self.tipLabel.alpha = 0
      //      self.totalLabel.alpha = 0
    //        self.equalsLabel.alpha = 0
      //      self.plusSign.alpha = 0
            self.percSeg.alpha = 0
                 self.leBox.alpha = 0
                self.bilField.center.y = 220.0
                self.stepper.value = 1.0
            })
            
        }
        else if ( self.leBox.alpha != 1.0){
        UIView.animateWithDuration(0.3, animations: {
      //  self.tipLabel.alpha = 1.0
      // self.totalLabel.alpha = 1.0
       // self.equalsLabel.alpha = 1.0
      //  self.plusSign.alpha = 1.0
        self.percSeg.alpha = 1.0
        self.bilField.center.y = 120.0
             self.leBox.alpha = 1.0
        })
        }
        var tipPercentages = [0.1, 0.15, 0.2]
        var tipPerc = tipPercentages[percSeg.selectedSegmentIndex]
        
        var billAmount = NSString(string: bilField.text!).doubleValue
        
        var tip = tipPerc * billAmount
        total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip
        )
        totalLabel.text = String(format:"$%.2f", total)
        
        stepperValueChanged(stepper)
        
    }
    

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
   
  
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
         totalPeopleLabel.text = Int(sender.value).description
        var divided = total / sender.value
        dividedTotalLabel.text = String(format:"$%.2f", divided)
        
    }
    
}

