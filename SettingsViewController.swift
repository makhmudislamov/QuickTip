//
//  SettingsViewController.swift
//  TipCalcMakhmud
//
//  Created by Makhmud Islamov on 12/22/15.
//  Copyright © 2015 Makhmud Islamovccsf. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var newTipControl: UISegmentedControl!
    
    @IBOutlet weak var newEditStepper: UIStepper!
    
//    var firsTip = Float!
//    var secTip = Float!
//    var thirdTip = Float!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
                        let userDefaults = NSUserDefaults.standardUserDefaults()
        
                        //TODO: read the 3 tip values from the defaults
                        let firstTip = userDefaults.doubleForKey("lowtip")
                        let secTip = userDefaults.doubleForKey("medtip")
                        let thirdTip = userDefaults.doubleForKey("hightip")
        
                        print("\(firstTip)")
                        print("\(secTip)")
                        print("\(thirdTip)")
        
                        let lowTitle = Int(firstTip * 100)
                        let medTitle = Int(secTip * 100)
                        let highTitle = Int(thirdTip * 100)
        
                        //TODO: update the tipSelectorControl with the default tip values
                        newTipControl.setTitle("\(lowTitle)%", forSegmentAtIndex: 0)
                        newTipControl.setTitle("\(medTitle)%", forSegmentAtIndex: 1)
                        newTipControl.setTitle("\(highTitle)%", forSegmentAtIndex: 2)
                        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        
        
        print("view will appear")
    }
    

    @IBAction func newTipChangedC(sender: AnyObject) {
    }
    
    
    @IBAction func editingTips(sender: AnyObject) {
        
        
        
        let newTitle = "\(Int(newEditStepper.value))%"
        newTipControl.setTitle(newTitle, forSegmentAtIndex: newTipControl.selectedSegmentIndex)
        
        print(newTitle)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let newFloatValue : Float = Float(newEditStepper.value) / 100.0
        if (newTipControl.selectedSegmentIndex == 0)
        {
            userDefaults.setFloat(newFloatValue, forKey: "lowtip")
        }
        else if (newTipControl.selectedSegmentIndex == 1)
        {
            userDefaults.setFloat(newFloatValue, forKey: "medtip")
            
        }
        else if (newTipControl.selectedSegmentIndex == 2)
        {
            userDefaults.setFloat(newFloatValue, forKey: "hightip")
        }
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        

        
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
//        NSUserDefaults.standardUserDefaults().setObject(String(lowtip), forKey: "lowtip")
//        NSUserDefaults.standardUserDefaults().setObject(String(), forKey: "medtip")
//        NSUserDefaults.standardUserDefaults().setObject(String(), forKey: "hightip")
//        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
