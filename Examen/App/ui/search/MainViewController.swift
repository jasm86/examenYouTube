//
//  ViewController.swift
//  Examen
//
//  Created by jasanchezm on 5/27/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: BaseController, UITableViewDelegate, UITableViewDataSource{
    
    var results : [ItemSearch]?
    @IBOutlet weak var tableSearchResults: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: NSLocalizedString("TITLE_SEARCH", comment: "busqueda"), isLargeTitle: true)
        addSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: WS Call.
    override func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            print(searchText)
            SearchRequester.searchVideo(for: searchText, callback: { error, result in
                if error == nil{
                    self.results = result
                    self.tableSearchResults.reloadData()
                }else{
                    self.showMessage(title:  NSLocalizedString("ALERT_SEARCH_TITLE", comment: "Busqueda"), message:  NSLocalizedString("ALERT_SEARCH_ERROR_MESSAGE", comment: "aceptar"))
                }
            })
        }
    }

// MARK: Table delegate.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
        cell.accessibilityIdentifier = "\(indexPath.row)"
        if let currentElement = self.results?[indexPath.row] {
            cell.titleVideo.text = currentElement.snippet?.title
            cell.descriptionVideo.text = currentElement.snippet?.channelTitle
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            if (currentElement.snippet?.publishedAt != nil){
                let date = formatter.date(from: currentElement.snippet?.publishedAt ?? "")
                formatter.dateFormat = "yyyy-MM-dd"
                cell.publishedDate.text = formatter.string(from: date!)
            }
            
            if currentElement.snippet?.thumbnails?.medium?.url != nil{
                let url = URL(string: currentElement.snippet?.thumbnails?.medium?.url ?? "")
                cell.videoImage.kf.indicatorType = .activity
                cell.videoImage.kf.setImage(with: url)
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSegue", let destination = segue.destination as? PlayerViewController {
            if let cell = sender as? UITableViewCell, let indexPath = self.tableSearchResults.indexPath(for: cell) {
                let searchResult = self.results?[indexPath.row]
                destination.videoId = searchResult?.id?.videoId
            }
        }
    }
    
    
}

