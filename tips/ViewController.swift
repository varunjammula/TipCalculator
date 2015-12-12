//
//  ViewController.swift
//  tips
//
//  Created by Varun Chandra Jammula on 12/11/15.
//  Copyright © 2015 Varun Chandra Jammula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    var currency = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol)!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = (currency as! String) + "0.00"
        totalLabel.text = (currency as! String) + "0.00"
        self.billField .becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipIndex = defaults.integerForKey("defaultTipIndex")
        tipSelector.selectedSegmentIndex = tipIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let billAmount = (billField.text! as NSString).doubleValue
        let tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipSelector.selectedSegmentIndex]
        let tip = billAmount * tipPercentage
        let totalAmount = billAmount + tip
        tipLabel.text = String(format: (currency as! String) + "%.2f", tip)
        totalLabel.text = String(format: (currency as! String) + "%.2f", totalAmount)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

