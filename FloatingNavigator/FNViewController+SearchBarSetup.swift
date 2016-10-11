//
//  FNViewController+SearchBarSetup.swift
//  FloatingNavigator
//
//  Created by Yeltsin Suares Lobato Gama on 10/7/16.
//  Copyright © 2016 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

extension FNViewController {
    
    func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.headerView = searchController.searchBar
    }
    
    
    /* MARK: SearchBar UISearchResultsUpdating and UISearchBarDelegate  */
    
    func updateSearchBarDelegate() {
        if addSearchController {
            if let controller = currentControllerInFocus as? UISearchResultsUpdating {
                searchController.searchResultsUpdater = controller
            }
            if let controller = currentControllerInFocus as? UISearchBarDelegate {
                searchController.searchBar.delegate = controller
            }
        }
    }
    
    /* MARK: Setup SearchBar */
    
    func customizeSearchBar(colorOfSearchBarText: UIColor, colorOfSearchBarTextField: UIColor, colorOfSearchBarBox: UIColor, colorOfSearchBarPlaceholder: UIColor, colorOfSearchBarIcon: UIColor) {
        
        self.searchController.searchBar.tintColor = colorOfSearchBarText
        self.searchController.searchBar.barTintColor = colorOfSearchBarBox
        self.searchController.searchBar.layer.borderColor = colorOfSearchBarBox.cgColor
        self.searchController.searchBar.layer.borderWidth = 1
        
        // Change Background Color of Search TextField
        for subView in self.searchController.searchBar.subviews  {
            for subsubView in subView.subviews  {
                if let textField = subsubView as? UITextField {
                    textField.backgroundColor = colorOfSearchBarTextField
                }
            }
        }
        
        let searchTextField: UITextField? = searchController.searchBar.value(forKey: "searchField") as? UITextField
        if searchTextField!.responds(to: #selector(getter: UITextField.attributedPlaceholder)) {
            
            let attributeDict = [NSForegroundColorAttributeName: colorOfSearchBarPlaceholder]
            searchTextField!.attributedPlaceholder = NSAttributedString(string: "Search", attributes: attributeDict)
        }
        
        if let textFieldInsideSearchBar = self.searchController.searchBar.value(forKey: "searchField") as? UITextField,
            let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
            
            glassIconView.image = glassIconView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            glassIconView.tintColor = colorOfSearchBarIcon
        }
    }
}
