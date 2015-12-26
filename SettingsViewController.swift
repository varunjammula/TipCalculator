//
//  SettingsViewController.swift
//  tips
//
//  Created by Varun Chandra Jammula on 12/12/15.
//  Copyright © 2015 Varun Chandra Jammula. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    @IBOutlet var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipIndex = defaults.integerForKey("defaultTipIndex")
        defaultTip.selectedSegmentIndex = tipIndex
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.secondView.alpha = 0
        UIView.animateWithDuration(0.4, animations: {
            self.secondView.alpha = 1
        })
    }
    
    @IBAction func saveDefaultTip(sender: AnyObject) {
        let dTips = [18, 20, 25]
        let dTipIndex = defaultTip.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(dTipIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
        // create the alert
        let alert = UIAlertController(title: "Tipper", message: "Default tip set to: " + String(dTips[dTipIndex])+"%", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func hideKeyboard(sender: AnyObject) {
        view.endEditing(true)
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
