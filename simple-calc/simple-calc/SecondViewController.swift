//
//  SecondViewController.swift
//  simple-calc-ios2
//
//  Created by Julia Zaratan on 2/1/18.
//  Copyright © 2018 Julia Zaratan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var calculationsBank : [String] = []

    @IBOutlet weak var scrollBox: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...calculationsBank.count - 1 {
            let label = UILabel(frame: CGRect(x: 50, y: index * 25 + 50, width: 300, height: 40))
            label.text = calculationsBank[index]
            scrollBox.addSubview(label)
        }

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        scrollBox.isScrollEnabled = true
        scrollBox.contentSize = CGSize(width: 300, height: 1000)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        Get the new view controller using segue.destinationViewController.
//        Pass the selected object to the new view controller.
        let mainView = segue.destination as! ViewController
        mainView.calculationsBank = calculationsBank
    }


}
