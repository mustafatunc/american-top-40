//
//  YoutubeViewController.swift
//  AmericanTop40
//
//  Created by Mustafa Tunc on 10/30/17.
//  Copyright © 2017 Mustafa Tunc. All rights reserved.
//

import UIKit

class YoutubeViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var artistName = "The Lumineers"
    var songName = "Sleep On the Floor"
    
    
    let APIKey = "YOUR_YOUTUBE_API_HERE"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Songs"
        self.title = songName
        var song = songName.replacingOccurrences(of: " ", with: "+")
        var artist = artistName.replacingOccurrences(of: " ", with: "+")
        song = song.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        artist = artist.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        
        let keywords = "\(artist)+\(song)"
        let max = 50
        
        
        let apiRequestURL = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(keywords)&order=relevance&maxResults=\(max)&type=video&videoCategory=Music&key=\(APIKey)"
        
        let url = URL(string: apiRequestURL)
        let request = URLRequest(url: url!)
        let responseData = try? NSURLConnection.sendSynchronousRequest(request, returning: nil)
        
        //let result = NSString(data: responseData!, encoding:String.Encoding.utf8.rawValue)
        
        //var titles : [String] = [String]()
        //var videoIDs : [String] = [String]()
        
        let json = try! JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String:AnyObject]
        
        
        
        if let items = json["items"] as? NSArray
        {
            var videoID: String = ""
            var title = ""
            
            for item in items
            {
                let item1 = item as! [String:AnyObject]
                // construct your model objects here
                //Get the title
                //Get the videoID
                let videoIDDict = item1["id"] as! NSDictionary
                videoID = videoIDDict["videoId"] as! String
                
                //Get the title of the video
                let snippetDict = item1["snippet"] as! NSDictionary
                title = snippetDict["title"] as! String
                print("Title =",title)
                
                var listOfArtistWords = artistName.components(separatedBy: " ")
                listOfArtistWords.popLast()
                let listOfSongWords   = songName.components(separatedBy: " ")
                print("ArtistWords =",listOfArtistWords)
                print("SongWords =" ,listOfSongWords)
                var songMatchCount = 0
                var artistMatchCount = 0
                
                for word in listOfArtistWords{
                    if title.containsIgnoringCase(word){
                        artistMatchCount+=1
                    }
                }
                if artistMatchCount >= listOfArtistWords.count{
                    
                    
                    for word in listOfSongWords{
                        if title.containsIgnoringCase(word){
                            songMatchCount+=1
                        }
                    }
                    
                    if songMatchCount >= listOfArtistWords.count-1{
                        print ("Title To Be Showed =",title)
                        break
                    }
                }
                
                
                
                /*
                 let listOfKeyWords = "\(songName) \(artistName)".components(separatedBy: " ")
                 var songMatchCount = 0
                 
                 for word in listOfKeyWords{
                 if title.containsIgnoringCase(word){
                 songMatchCount+=1
                 }
                 }
                 if songMatchCount >= listOfKeyWords.count-2{
                 print ("TITLE",title)
                 break;
                 }
                 */
                
                
                //Set the data
                //titles.append(title1!)
                //videoIDs.append(videoID!)
            }
            
            if videoID != ""{
                let playURL = "https://www.youtube.com/watch?v=\(videoID)"
                let videoURL = URL(string: playURL)
                let videoRequest = URLRequest(url: videoURL!)
                webView.loadRequest(videoRequest)
                
                
            }
            
            
        }
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension String {
    
    func containsIgnoringCase(_ find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
