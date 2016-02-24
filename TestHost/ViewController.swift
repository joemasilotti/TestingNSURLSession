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
            self.parse(data)
        }
    }

    private func parse(data: NSData?) {
        guard let
            data = data,
            json = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
            count = json["posts"] as? Int
            else { self.displayErrorAlert(); return }
        self.postCountLabel.text = "\(count)"
    }

    private func displayErrorAlert() {
        let alertController = UIAlertController(title: nil, message: "Something went wrong.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
