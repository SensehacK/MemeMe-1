//
//  MemeSentViewController.swift
//  MemeMe
//
//  Created by Sensehack on 19/10/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import  UIKit

class MemeSentViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var memeListTitle: UILabel!
    
    @IBOutlet weak var memeListDetail: UILabel!
    
    
    
    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! ViewController
        detailController.memesArr = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    
    
    
    
    
}
