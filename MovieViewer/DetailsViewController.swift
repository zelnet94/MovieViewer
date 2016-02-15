//
//  DetailsViewController.swift
//  MovieViewer
//
//  Created by Denzel Ketter on 2/14/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
  
    @IBOutlet weak var titleLabel: UILabel!
    
   
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var infoView: UIView!
    
    
    var movie: NSDictionary!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["title"] as? String
        overviewLabel.text = overview
        
        overviewLabel.sizeToFit()
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        if let posterPath = movie["poster_path"] as? String {
            let imageUrl = NSURL(string: baseUrl + posterPath)
            let imageRequest = NSURLRequest(URL: imageUrl!)
            
            
            posterImageView.setImageWithURLRequest(
                imageRequest,
                placeholderImage: nil,
                success: { ( imageRequest, imageResponse, image) -> Void in
                
                //imageResponse will be nil if image is cached
                if imageResponse != nil {
                
                    print("Image was NOT cached, fade in image")
                    self.posterImageView.alpha = 0.0
                    self.posterImageView.image = image
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.posterImageView.alpha = 1.0
                
                    })
                
    
                } else {
                    print("Image was cached so just update the image")
                    self.posterImageView.image = image
                
                }
        
            },
                failure: { (imageRequest, imageResponse, error) -> Void in
                    // do something for the failure condition
            })
    
        }
        
        print(movie)
        // Do any additional setup after loading view
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // No recreated resources
        
    }

}
