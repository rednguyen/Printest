//
//  ImageViewController.swift
//  Printest
//
//  Created by Red Nguyen on 9/12/21.
//

import UIKit

class ImageViewController: UIViewController {
    let imageView: UIImageView!
    
    init(item: UIImage) {
        self.imageView = UIImageView(image: item)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.frame.size.width =  self.view.frame.width
        self.imageView.frame.size.height = 200
        imageView.center = self.view.center
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
}
