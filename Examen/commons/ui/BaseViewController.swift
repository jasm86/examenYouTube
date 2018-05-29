//
//  BaseViewController.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import UIKit

class BaseController: UIViewController, UISearchResultsUpdating {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTitle(title: String, isLargeTitle: Bool){
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = isLargeTitle
            navigationItem.title = title
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            navigationController?.navigationBar.barTintColor =  UIColor.blue
        }else{
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            navigationItem.title = title
            navigationController?.navigationBar.barTintColor = UIColor.blue
        }
    }
    
    func addSearchBar(){
        if #available(iOS 11.0, *) {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.dimsBackgroundDuringPresentation = false
            searchController.searchBar.sizeToFit()
            
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func showMessage(title: String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: NSLocalizedString("BUTTON_ACCEPT", comment: "aceptar"), style: .default)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
    }
}
