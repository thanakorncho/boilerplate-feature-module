//
//  ViewController.swift
//  Feature
//
//  Created by Thanakorn Chongcharoenthanakul on 04/20/2023.
//  Copyright (c) 2023 Thanakorn Chongcharoenthanakul. All rights reserved.
//

import UIKit
import SnapKit
import Feature

class ViewController: UIViewController {
    
    var label: UILabel!
    let myClass = MyClass()
    
    override func loadView() {
        let view = UIView(frame: .zero)
        view.backgroundColor = FeatColor.white.color
        label = .init(frame: .zero)
        view.addSubview(label)
        label.snp.makeConstraints({ make in
            make.center.equalToSuperview()
            make.height.equalTo(20)
        })
        self.view = view
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.backgroundColor = FeatColor.dark.color
        label.textColor = FeatColor.white.color
        label.text = "TESETTTT"
//        label.font = FeatFont.Kanit.medium.font(size: 16)
        myClass.perform()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
