//
//  FNViewController+ScrollViewSetup.swift
//  FloatingNavigator
//
//  Created by Yeltsin Suares Lobato Gama on 10/7/16.
//  Copyright © 2016 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

extension FNViewController {
    
    func setupFNScrollView(numberOfPagesInScroll: Int) {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.panGestureRecognizer.delaysTouchesBegan = true
        scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(numberOfPagesInScroll), height: 0)
        
        self.mainView.addSubview(scrollView)
    }
    
    /* MARK: ScrollView Delegate Methods */
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        distanceTabIndicatorToMarginLeftConstraint.constant = scrollView.contentOffset.x/CGFloat(tabViewsControllers.count)
        self.view.layoutIfNeeded()
        
        let intPart = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
        let decimalPart = scrollView.contentOffset.x/scrollView.frame.size.width - CGFloat(intPart)
        
        var currentPage: Int!
        if decimalPart > 0.5 {
            currentPage = intPart + 1
        } else {
            currentPage = intPart
        }
        
        for (index, label) in tabViewsTitlesLabels.enumerated() {
            if index == currentPage {
                label.textColor = colorOfTabViewTitlesInActiveState
                currentControllerInFocus = tabViewsControllers[index]
                updateSearchBarDelegate()
            } else {
                label.textColor = colorOfTabViewTitlesInInactiveState
            }
        }
        
        for (index, imageView) in tabViewsImages.enumerated() {
            if index == currentPage {
                guard !tabViewsImagesActiveState.isEmpty else { return }
                imageView.image = tabViewsImagesActiveState[index]
            } else {
                guard !tabViewsImagesInactiveState.isEmpty else { return }
                imageView.image = tabViewsImagesInactiveState[index]
            }
        }
    }
}
