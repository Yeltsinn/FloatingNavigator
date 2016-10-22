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
    internal var tabViewsImagesActiveState = [UIImage]()
    internal var tabViewsImagesInactiveState = [UIImage]()
    internal var tabViewsTitlesLabels = [UILabel]()
    internal var tabViewsControllers = [UIViewController]()
    
    /* Auxiliar Components */
    internal var addSearchController: Bool = false
    internal var searchController: UISearchController!
    internal var currentControllerInFocus: UIViewController!
    internal var scrollView: UIScrollView!
    internal var mainView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    internal var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    internal var tabViewsSeparatorStyle: TabViewSeparatorStyle = .none {
        didSet {
            self.checkFNViewControllerDataSourceRequired()
            self.setupTabViewsSeparator()
        }
    }
    
    /* Constraints */
    internal var constraintsToActivate = [NSLayoutConstraint]()
    internal var distanceTabIndicatorToMarginLeftConstraint: NSLayoutConstraint!
    
    /* Delegates and DataSource */
    var fNViewControllerDataSource: FNViewControllerDataSource!
    var fNViewControllerDelegate: FNViewControllerDelegate!
    var fNViewControllerSearchBarCustomize: FNViewControllerSearchBarCustomize!
    
    func setupFNSegmentControl() {
        
        checkFNViewControllerDataSourceRequired()
        checkFNViewControllerDataSourceOptional()
        checkFNViewControllerDelegateOptional()
        setupImageViews()
        
        if addSearchController {
            checkFNViewControllerSearchBarCustomizeOptional()
            setupSearchController()
        }
        
        setupFNScrollView(numberOfPagesInScroll: numberOfTabs)
        createTabViews()
        setupConstraints()
    }
    
    /* Check DataSouce Required Values */
    private func checkFNViewControllerDataSourceRequired() {
        guard numberOfTabs == 0 else { return }
        numberOfTabs = fNViewControllerDataSource.numberOfTabsInSegmentControl()
        
        for index in 0...numberOfTabs - 1 {
            tabViewsControllers.append(fNViewControllerDataSource.controllerOfTabViewAtIndex(index: index))
        }
    }
    
    /* Check DataSouce Optional Values */
    private func checkFNViewControllerDataSourceOptional() {
        
        for index in 0...numberOfTabs - 1 {
            
            if let title = fNViewControllerDataSource?.titleForTabViewAtIndex?(index: index) {
                tabViewsTitles.append(title)
            }
            
            if let image = fNViewControllerDataSource?.imageForTabViewAtIndexInInactiveState?(index: index) {
                tabViewsImagesInactiveState.append(image)
            }
            
            if let image = fNViewControllerDataSource?.imageForTabViewAtIndexInActiveState?(index: index) {
                tabViewsImagesActiveState.append(image)
            }
        }
    }
    
    private func setupImageViews() {
        
        for image in tabViewsImagesInactiveState {
            tabViewsImages.append(UIImageView(image: image))
        }
        
        if tabViewsImagesInactiveState.isEmpty {
            for image in tabViewsImagesActiveState {
                tabViewsImages.append(UIImageView(image: image))
            }
        } else {
            guard !tabViewsImagesActiveState.isEmpty else { return }
            tabViewsImages.first?.image = tabViewsImagesActiveState.first
        }
    }
    
    /* Check Delegate Optional Values */
    private func checkFNViewControllerDelegateOptional() {
        
        if let bool = fNViewControllerDelegate?.addSearchBar?() {
            addSearchController = bool
        }
        
        if let value = fNViewControllerDelegate?.setTabViewIndicatorHeigth?() {
            tabViewIndicatorHeigth = value
        }
        
        if let value = fNViewControllerDelegate?.setTabViewsHeigth?() {
            tabViewsHeigth = value
        }
        
        if let value = fNViewControllerDelegate?.setScaleFactorOfImageInTabView?() {
            scaleFactorOfImageInTabView = value
        }
        
        if let value = fNViewControllerDelegate?.setDistanceTabViewComponentsToSideBounds?() {
            distanceTabViewComponentsToSideBounds = value
        }
        
        if let value = fNViewControllerDelegate?.setDistanceBetweenTabViewComponents?() {
            distanceBetweenTabViewComponents = value
        }
        
        if let color = fNViewControllerDelegate?.setColorOfTabViewTitlesInActiveState?() {
            colorOfTabViewTitlesInActiveState = color
        }
        
        if let color = fNViewControllerDelegate?.setColorOfTabViewTitlesInInactiveState?() {
            colorOfTabViewTitlesInInactiveState = color
        }
        
        if let color = fNViewControllerDelegate?.setColorOfTabViewIndicator?() {
            colorOfTabViewIndicator = color
        }
    }
    
    /* Check SearchBarCustomize Delegate Optional Values */
    private func checkFNViewControllerSearchBarCustomizeOptional() {
        
        if let color = fNViewControllerSearchBarCustomize?.setColorOfSearchBarBox?() {
            colorOfSearchBarBox = color
        }
        
        if let color = fNViewControllerSearchBarCustomize?.setColorOfSearchBarIcon?() {
            colorOfSearchBarIcon = color
        }
        
        if let color = fNViewControllerSearchBarCustomize?.setColorOfSearchBarText?() {
            colorOfSearchBarText = color
        }
        
        if let color = fNViewControllerSearchBarCustomize?.setColorOfSearchBarTextField?() {
            colorOfSearchBarTextField = color
        }
        
        if let color = fNViewControllerSearchBarCustomize?.setColorOfSearchBarPlaceholder?() {
            colorOfSearchBarPlaceholder = color
        }
    }
    
    /* Setup Constraints */
    private func setupConstraints() {
        
        if addSearchController {
            self.setupSearchBarConstraints()
        }
        
        self.setupMainViewConstraints()
        self.setupScrollViewConstraints()
        self.setupHeaderViewConstraints()
        self.setupTabIndicatorConstraints()
        self.setHeightConstraintsOfTabViews()
        self.setWidthConstraintsOfTabViews()
        self.setCenterYConstraintOfTabViews()
        self.setConstraintsToFirstAndLastTabViews()
        self.setupViewControllersConstraints()
        self.setConstraintDistanceBetweenTabViews()
        self.setupLabelsTitlesAndImagesConstraints()
        NSLayoutConstraint.activate(constraintsToActivate)
    }
}

