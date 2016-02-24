//
//  ViewController.swift
//  TestingNSURLSession
//
//  Created by Joe Masilotti on 2/24/16.
//  Copyright © 2016 Masilotti.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var postCountLabel: UILabel!

    let httpClient = HTTPClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPostCount()
    }

    private func fetchPostCount() {
        let url = NSURL(string: "http://masilotti.com/api/posts.json")!
        httpClient.get(url) { (data, error) -> Void in
            if let data = data {
                guard let
                    json = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
                    count = json["posts"] as? Int
                    else { return }
                self.postCountLabel.text = "\(count)"
            }
        }
    }
}
