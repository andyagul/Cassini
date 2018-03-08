//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Chen Weiru on 08/03/2018.
//  Copyright © 2018 ChenWeiru. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

  

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier]{
                if let imageVC = segue.destination as? ImageViewController  {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                } 
            }
//            switch identifier{
//            case "Cassini":
//            case "Earth":
//            case "Saturn":
//            default: break
//            }
        }
        
    }

}
