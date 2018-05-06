//
//  SongsTableViewController.swift
//  AmericanTop40
//
//  Created by Mustafa Tunc on 10/25/17.
//  Copyright © 2017 Mustafa Tunc. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    private var year:String =  "1970"
    private var songList = NSArray()
    private var artistList = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songList = FileReading.getList("songs"+self.year)
        artistList = FileReading.getList("artists"+self.year)
        
        title = "Top Songs of \(year)"
        //self.navigationController?.navigationBar.topItem?.title = "Years ASAS"

    }
    override func viewDidAppear(_ animated: Bool) {
        title = "Top Songs of \(year)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songList.count
    }
    
    
    public func setYear(_ year: String){
        self.year = year
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as? SongTableViewCell else{
            fatalError("The dequeued cell is not an instance of SongTableViewCell.")
        }
        
        //let year = years[indexPath.row]
        
        cell.artistLabel.text = String(describing: artistList[indexPath.row])
        cell.songTitleLabel.text = String(describing: songList[indexPath.row])
        cell.numberLabel.text = String(indexPath.row)
        
        return cell
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let youtubeView = segue.destination as! YoutubeViewController
        let cell = sender as! SongTableViewCell
        youtubeView.artistName = cell.artistLabel.text!
        youtubeView.songName = cell.songTitleLabel.text!
        
    }
    
    
}
