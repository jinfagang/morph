//
//  ClauseDarenViewController.swift
//  Morph
//
//  Created by JinTian on 8/6/16.
//  Copyright © 2016 JinTian. All rights reserved.
//

import UIKit

class ClauseDarenViewController: UIViewController {

    @IBAction func didTapDone(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
