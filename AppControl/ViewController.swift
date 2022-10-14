//
//  ViewController.swift
//  AppControl
//
//  Created by រស្មី on 12/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    
    
    @IBOutlet weak var cardImage: UIImageView!
    
    
    
    @IBOutlet weak var mySegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    @objc func didTapButton() {
        print("btn clicked")
    }
    
    
    @IBAction func didChangeSection(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
            case 0:
            cardImage.image = UIImage(named: "bc")
            case 1:
            cardImage.image = UIImage(systemName: "envelope")
            default:
            cardImage.image = UIImage(systemName: "locked")
        }
    }
    
    
}

class SecondView: UIViewController{
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        sliderLabel.text = String(format: "%.2f", self.mySlider.value)
    }
}

class ThirdView: UIViewController{
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didChangeSwitch(_ sender: Any) {
        if mySwitch.isOn{
            myLabel.text = "My Switch is On"
        }else{
            myLabel.text = "My Switch is Off"
        }
    }
}

class FourthView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    
    @IBOutlet weak var myPage: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollection.dataSource = self
        myCollection.delegate = self
        myPage.currentPage = 0
        myPage.numberOfPages = 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionCell
        
        cell.myImage.image = UIImage(named: "bc")
        
        return cell
    }
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.row
    }
    
    
    
    

}

class myCollectionCell: UICollectionViewCell{
    @IBOutlet weak var myImage: UIImageView!
}

