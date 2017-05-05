//
//  ViewController.swift
//  GestureDemo-Swift3
//  Copyright © 2017 iOSDevCenters. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UIGestureRecognizerDelegate , UITextFieldDelegate{
    
    
    @IBOutlet weak var viewDrag: UIView!
    
    var panGesture  = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
        viewDrag.isUserInteractionEnabled = true
        viewDrag.addGestureRecognizer(panGesture)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: viewDrag)
        let translation = sender.translation(in: self.view)
        viewDrag.center = CGPoint(x: viewDrag.center.x + translation.x, y: viewDrag.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }


}

