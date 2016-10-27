//
//  FeedVC.swift
//  NivikiSocial
//
//  Created by Khoa on 10/26/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import Firebase
class FeedVC: UIViewController , UITableViewDataSource, UITableViewDelegate {

    
    var posts = [Post]()
    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        DataService.ds.REF_POSTS.observe(.value, with: {
            snapshot in
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
               for snap in snapshots{
                if let postData = snap.value as? Dictionary<String,Any>{
                    let post = Post(postKey: snap.key, dictionary: postData)
                    self.self.posts.append(post)
                }
                print("SNAP: \(snap)")
            }
            
            self.tableView.reloadData()
        
            }}
        )
 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell{
            print(post.postDescription)
            return cell
        }else{
            return PostCell()
        }
      
    }

    // MARK: - Navigation

 
}
