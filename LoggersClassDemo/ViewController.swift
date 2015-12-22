//
//  ViewController.swift
//  LoggersClassDemo
//
//  Created by Sushil Mishra on 12/22/15.
//  Copyright © 2015 Sushil Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let dataArray:NSArray = ["ABC","BCD"]
        print(dataArray.objectAtIndex(3))
     
        DLog("lorem lipsum ");
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

