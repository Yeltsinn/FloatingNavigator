//
//  FNViewController+TabViewsSetup.swift
//  FloatingNavigator
//
//  Created by Yeltsin Suares Lobato Gama on 10/7/16.
//  Copyright © 2016 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

extension FNViewController {
    
    /* Creating TabView and add in main view */
    private func createTabViews() {
        
        for _ in 0...tabViewsControllers.count - 1 {
            
            let tabView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            tabView.translatesAutoresizingMaskIntoConstraints = false
            self.tabViews.append(tabView)
            self.view.addSubview(tabView)
        }
    }
    
    /* Setup action to swipe gesture in FNSegmentControl */
    func switchTabView(gesture: UIGestureRecognizer) {
        
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width * CGFloat(gesture.view!.tag), y: 0), animated: true)
    }
}
