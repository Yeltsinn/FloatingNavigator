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
    
    func numberOfTabsInSegmentControl() -> Int
    func controllerOfTabViewAtIndex(index: Int) -> UIViewController
    @objc optional func titleForTabViewAtIndex(index: Int) -> String
    @objc optional func imageForTabViewAtIndexInInactiveState(index: Int) -> UIImage
    @objc optional func imageForTabViewAtIndexInActiveState(index: Int) -> UIImage
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
    
    @objc optional func setColorOfSearchBarBox() -> UIColor
    @objc optional func setColorOfSearchBarText() -> UIColor
    @objc optional func setColorOfSearchBarIcon() -> UIColor
    @objc optional func setColorOfSearchBarTextField() -> UIColor
    @objc optional func setColorOfSearchBarPlaceholder() -> UIColor
}


enum TabViewSeparatorStyle {
    case none, singleLine
}
