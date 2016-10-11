//
//  FNViewController.swift
//  FloatingNavigator
//
//  Created by Yeltsin Suares Lobato Gama on 10/6/16.
//  Copyright © 2016 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class FNViewController: UIViewController, UIScrollViewDelegate {
    
    /* TabViews Structural Attributes */
    internal var tabViewsHeigth: CGFloat = 50
    internal var tabViewIndicatorHeigth: CGFloat = 2
    internal var scaleFactorOfImageInTabView: CGFloat = 1
    internal var distanceBetweenTabViewComponents: CGFloat = 2
    internal var distanceTabViewComponentsToSideBounds: CGFloat = 10
    
    /* TabViews Customization Attributes */
    internal var colorOfTabViewIndicator: UIColor = UIColor.red
    internal var colorOfTabViewTitlesInActiveState: UIColor = UIColor.black
    internal var colorOfTabViewTitlesInInactiveState: UIColor = UIColor.lightGray
    
    /* SearchBar Customization Attributes */
    internal var colorOfSearchBarText: UIColor = UIColor.blue
    internal var colorOfSearchBarIcon: UIColor = UIColor.lightGray
    internal var colorOfSearchBarTextField: UIColor = UIColor.white
    internal var colorOfSearchBarPlaceholder: UIColor = UIColor.lightGray
    internal var colorOfSearchBarBox: UIColor = UIColor(colorLiteralRed: 225.0/255,
                                                            green: 228.0/255,
                                                            blue: 229.0/255,
                                                            alpha: 1.0)
    
    /* DataSource Attributes */
    internal var numberOfTabs: Int = 0
    
    /* FNSegementControl Components */
    internal var tabViews = [UIView]()
    internal var tabViewIndicator: UIView!
    internal var tabViewsTitles = [String]()
    internal var tabViewsImages = [UIImageView]()
    internal var tabViewsTitlesLabels = [UILabel]()
    internal var tabViewsControllers = [UIViewController]()
    
    /* Auxiliar Components */
    internal var addSearchController: Bool = false
    internal var searchController: UISearchController!
    internal var currentControllerInFocus: UIViewController!
    internal var scrollView: UIScrollView!
    internal var mainView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    internal var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)) {
        didSet {

        }
    }
    
    /* Constraints */
    internal var constraintsToActivate = [NSLayoutConstraint]()
    internal var distanceTabIndicatorToMarginLeftConstraint: NSLayoutConstraint!
    
    func setupFNSegmentControl() {
        
    }
}
