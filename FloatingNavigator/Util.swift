//
//  Util.swift
//  FloatingNavigator
//
//  Created by Yeltsin Suares Lobato Gama on 10/11/16.
//  Copyright © 2016 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

@objc
protocol FNViewControllerDataSource {
    
    func numberTabsInSegmentControl() -> Int
    func controllerOfTabViewAtIndex(index: Int) -> UIViewController
    @objc optional func titleForTabViewAtIndex(index: Int) -> String
    @objc optional func imageForTabViewAtIndex(index: Int) -> UIImage
}

@objc
protocol FNViewControllerDelegate {
    
    @objc optional func addSearchBar() -> Bool
    @objc optional func setTabViewsHeigth() -> CGFloat
    @objc optional func setTabViewIndicatorHeigth() -> CGFloat
    @objc optional func setScaleFactorOfImageInTabView() -> CGFloat
    @objc optional func setDistanceBetweenTabViewComponents() -> CGFloat
    @objc optional func setDistanceTabViewComponentsToSideBounds() -> CGFloat
    
    /* Customization Methods */
    @objc optional func setColorOfTabViewIndicator() -> UIColor
    @objc optional func setColorOfTabViewTitlesInActiveState() -> UIColor
    @objc optional func setColorOfTabViewTitlesInInactiveState() -> UIColor
}

@objc
protocol FNViewControllerSearchBarCustomize {
    
    @objc optional func colorOfSearchBarBox(searchBar: UISearchBar) -> UIColor
    @objc optional func colorOfSearchBarText(searchBar: UISearchBar) -> UIColor
    @objc optional func colorOfSearchBarIcon(searchBar: UISearchBar) -> UIColor
    @objc optional func colorOfSearchBarTextField(searchBar: UISearchBar) -> UIColor
    @objc optional func colorOfSearchBarPlaceholder(searchBar: UISearchBar) -> UIColor
}
