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
    
    @IBOutlet weak var FadeLabel: UILabel!
    
    @IBOutlet weak var FadeControl: UISegmentedControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        self.FadeLabel.alpha = 0
        self.FadeControl.alpha = 1
        
        
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
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
        
 
        
        //TODO: update the tipSelectorControl with the default tip values
        tipControl.setTitle("\(lowTitle)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(medTitle)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(highTitle)%", forSegmentAtIndex: 2)
        //NSUserDefaults.standardUserDefaults().synchronize()

        
        
        
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.FadeLabel.alpha = 1.0
            self.FadeControl.alpha = 1.0
            
            
        
    })
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
       
        let myText = billField.text
        let myTip = tipLabel.text
        let myTotal = totalLabel.text
        let myPerc = tipControl.selectedSegmentIndex
        
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
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

