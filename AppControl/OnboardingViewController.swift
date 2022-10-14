//
//  OnboardingViewController.swift
//  AppControl
//
//  Created by រស្មី on 13/10/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var promoCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var promoArr = ["girl1", "girl2", "girl3", "girl4"]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == promoArr.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        promoCollectionView.dataSource = self
        promoCollectionView.delegate = self
        
        pageControl.numberOfPages = promoArr.count

    }
    

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == promoArr.count - 1 {
            /// go to home screen
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            promoCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promoArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.promoImageView.image = UIImage(named: promoArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentPage = indexPath.row
    }
    
    
}
