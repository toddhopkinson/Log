//
//  ViewController.swift
//  LogDemo
//
//  Created by Todd Hopkinson on 11/7/15.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Log.debug("Be sure to drink your Ovaltine. - Orphan Annie")
        Log.trace()
        
        Log.debug("Note that both debug() and trace() automatically provide for you the class name, function, and line number.")
    }
    
    override func viewDidAppear(animated: Bool) {
        Log.debug("If you haven't already, check the console!")
        
        Log.debug("💻 In 🇺🇸.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

