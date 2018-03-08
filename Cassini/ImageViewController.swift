//
//  ImageViewController.swift
//  Cassini
//
//  Created by Chen Weiru on 06/03/2018.
//  Copyright © 2018 ChenWeiru. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {
    
    var imageURL:URL? {
        didSet{
            image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    private var image:UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView? .contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil{
            fetchImage()
        }
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    
    var imageView = UIImageView()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private func fetchImage(){
        if let url = imageURL{
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {[weak self] in
                let urlContent = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if  let imageData = urlContent, url == self? .imageURL{
                        self?.image = UIImage(data:imageData)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil{
//            imageURL = DemoURLs.stanford 
//        }
    }
    
}
