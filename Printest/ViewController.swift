//
//  ViewController.swift
//  Printest
//
//  Created by Red Nguyen on 9/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let indentifier = "CustomCollectionViewCell"
    
    private let images: [UIImage] = [UIImage(named: "liquor1")!, UIImage(named: "liquor2")!, UIImage(named: "liquor3")!, UIImage(named: "liquor4")!, UIImage(named: "liquor5")!, UIImage(named: "liquor6")!, UIImage(named: "liquor7")!, UIImage(named: "liquor8")!, UIImage(named: "liquor9")!, UIImage(named: "liquor10")!, UIImage(named: "liquor11")!, UIImage(named: "liquor12")!, UIImage(named: "liquor13")!, UIImage(named: "liquor14")!, UIImage(named: "liquor15")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set background color
        //self.searchBar.searchBarStyle = UISearchBar.Style.prominent
        self.view.backgroundColor = .black
        self.searchBar.isTranslucent = false
        self.searchBar.barTintColor = UIColor.black
        self.searchBar.searchTextField.textColor = .white
        self.searchBar.layer.borderColor = UIColor.systemPink.cgColor
        self.searchBar.layer.borderWidth = 0.5
        self.searchBar.searchTextField.leftView?.tintColor = .systemPink
       
        
        //set cornor radius
//        self.searchBar.searchTextField.layer.cornerRadius = 30
//        self.searchBar.searchTextField.layer.masksToBounds = true
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.clipsToBounds = true
        
        
    
        self.view.backgroundColor = .black
        self.collectionView.backgroundColor = .black
        self.collectionView.register(UINib(nibName: indentifier, bundle: nil), forCellWithReuseIdentifier: indentifier)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as? CustomCollectionViewCell
        cell?.imageView.image = self.images[indexPath.row]
        cell?.layer.cornerRadius = 10.0
        cell?.clipsToBounds = true
        return cell ?? CustomCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var heightAtIndexpath = 100
        switch indexPath.row % 3 {
        case 0:
            heightAtIndexpath = 100
        case 1:
            heightAtIndexpath = 120
        case 2:
            heightAtIndexpath = 150
        default:
            heightAtIndexpath = 100
        }
        
        var rowAtIndexpath = self.view.frame.width/2
        
        switch indexPath.row % 3 {
        case 0:
            rowAtIndexpath = self.view.frame.width/2 - 5
        case 1:
            rowAtIndexpath = self.view.frame.width/2 - 15
        case 2:
            rowAtIndexpath = self.view.frame.width/2 - 30
        default:
            rowAtIndexpath = self.view.frame.width/2
        }
        
        return CGSize(width: Int(rowAtIndexpath), height: heightAtIndexpath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImageViewController(item: images[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
