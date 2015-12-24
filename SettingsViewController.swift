//
//  SettingsViewController.swift
//  TipCalcMakhmud
//
//  Created by Makhmud Islamov on 12/22/15.
//  Copyright © 2015 Makhmud Islamovccsf. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var counter = 1
    
    var timer = NSTimer()
    
    @IBOutlet weak var waiterImage: UIImageView!
   

    
    @IBOutlet weak var newTipControl: UISegmentedControl!
    
    @IBOutlet weak var newEditStepper: UIStepper!
    
    override func viewDidLayoutSubviews() {
        
        waiterImage.alpha = 0
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }
    
    func doAnimation() {
        
        if counter == 8 {
            counter = 1
            
        } else {
            
        counter++
            
        }
        
        waiterImage.image = UIImage(named: "bow\(counter).jpg")
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
        
                        
                        newTipControl.setTitle("\(lowTitle)%", forSegmentAtIndex: 0)
                        newTipControl.setTitle("\(medTitle)%", forSegmentAtIndex: 1)
                        newTipControl.setTitle("\(highTitle)%", forSegmentAtIndex: 2)
                        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        
        
        print("view will appear")
    }
    

    @IBAction func newTipChangedC(sender: AnyObject) {
        
        if counter == 8 {
            
            counter = 1
        } else {
            
            counter++
        }
        
        waiterImage.image = UIImage(named: "bow\(counter).jpg")
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
        
UIView.animateWithDuration(2, animations: { () -> Void in
    self.waiterImage.alpha = 1
    })
        
        
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        

        
        
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
