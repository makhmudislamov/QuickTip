//
//  ViewController.swift
//  TipCalcMakhmud
//
//  Created by Makhmud Islamov on 12/4/15.
//  Copyright © 2015 Makhmud Islamovccsf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var split2Label: UILabel!
    @IBOutlet weak var split3Label: UILabel!
    @IBOutlet weak var split4Label: UILabel!
    

    
    

     override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        split2Label.text = "$0.00"
        split3Label.text = "$0.00"
        split4Label.text = "$0.00"
        
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        billField.text = defaults.stringForKey("savedField")
        tipLabel.text = defaults.stringForKey("savedTipLabel")
        totalLabel.text = defaults.stringForKey("savedTotalLabel")
        split2Label.text = defaults.stringForKey("savedS2")
        split3Label.text = defaults.stringForKey("savedS3")
        split4Label.text = defaults.stringForKey("savedS4")
        tipControl.selectedSegmentIndex = defaults.integerForKey("savedPercententage")
        
        
        
        
        billField.becomeFirstResponder()
    }
    
        
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        //TODO: read the 3 tip values from the defaults
        let firstTip = userDefaults.floatForKey("lowtip")
        let secTip = userDefaults.floatForKey("medtip")
        let thirdTip = userDefaults.floatForKey("hightip")
        
        print("\(firstTip)")
        print("\(secTip)")
        print("\(thirdTip)")
        
        let lowTitle = Int(firstTip * 100)
        let medTitle = Int(secTip * 100)
        let highTitle = Int(thirdTip * 100)
        
 
        
        
        tipControl.setTitle("\(lowTitle)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(medTitle)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(highTitle)%", forSegmentAtIndex: 2)
        

        
        
        
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
            
            
        
    
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
       
        let lastText = billField.text
        let lastTip = tipLabel.text
        let lastTotal = totalLabel.text
        let lastS2 = split2Label.text
        let lastS3 = split3Label.text
        let lastS4 = split4Label.text
        let lastPerc = tipControl.selectedSegmentIndex
        
        
        NSUserDefaults.standardUserDefaults().setObject(lastText, forKey: "savedField")
        NSUserDefaults.standardUserDefaults().setObject(lastTip, forKey: "savedTipLabel")
        NSUserDefaults.standardUserDefaults().setObject(lastTotal, forKey: "savedTotalLabel")
        NSUserDefaults.standardUserDefaults().setObject(lastPerc, forKey: "savedPercentage")
        
        NSUserDefaults.standardUserDefaults().setObject(lastS2, forKey: "savedS2")
        NSUserDefaults.standardUserDefaults().setObject(lastS3, forKey: "savedS3")
        NSUserDefaults.standardUserDefaults().setObject(lastS4, forKey: "savedS4")
        
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
         print("View will disappear")
        
    
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        
        var tipPercentages = [0.10, 0.15, 0.20]
        
     
        
     
        let savedLowTip = defaults.doubleForKey("lowtip")
        let savedMidTip = defaults.doubleForKey("medtip")
        let savedHiTip = defaults.doubleForKey("hightip")
        
        if savedLowTip > 0.0 && savedMidTip > 0.0 && savedHiTip > 0.0 {
            
            tipPercentages = [ savedLowTip, savedMidTip, savedHiTip ]
        }
        
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        let split2Value = total / 2
        let split3Value = total / 3
        let split4Value = total / 4
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        split2Label.text = "$\(split2Value )"
        split3Label.text = "$\(split3Value )"
        split4Label.text = "$\(split4Value )"
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        split2Label.text = String(format: "$%.2f", split2Value)
        split3Label.text = String(format: "$%.2f", split3Value)
        split4Label.text = String(format: "$%.2f", split4Value)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
   

}

