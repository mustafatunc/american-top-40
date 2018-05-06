//
//  YearsTableViewController.swift
//  AmericanTop40
//
//  Created by Mustafa Tunc on 10/25/17.
//  Copyright © 2017 Mustafa Tunc. All rights reserved.
//

import UIKit

class YearsTableViewController: UITableViewController {
    
    let years = [1970,1971,1972,1973,1974,1975,1976,1977,1978,1979]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Years"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return years.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath) as? YearTableViewCell else{
            fatalError("The dequeued cell is not an instance of YearTableViewCell.")
        }
        
        //let year = years[indexPath.row]
        cell.yearLabel.text = String(years[indexPath.row])
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let songView = segue.destination as! SongsTableViewController
        let cell = sender as! YearTableViewCell
        songView.setYear(cell.yearLabel.text!)
        
        
    }
    
    
}
