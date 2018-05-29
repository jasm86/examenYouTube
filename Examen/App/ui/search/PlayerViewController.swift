//
//  PlayerViewController.swift
//  Examen
//
//  Created by jasanchezm on 5/28/18.
//  Copyright © 2018 jasanchezm. All rights reserved.
//

import Foundation
import YouTubePlayer

class PlayerViewController: BaseController{
    
    @IBOutlet weak var playerView: YouTubePlayerView!
    
    var videoId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: NSLocalizedString("TITLE_SEARCH", comment: "busqueda"), isLargeTitle: false)
        if videoId != nil{
            playerView.playerVars = [
                "playsinline": "1",
                "controls": "0",
                "showinfo": "0"
                ] as YouTubePlayerView.YouTubePlayerParameters
            playerView.loadVideoID(videoId!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
