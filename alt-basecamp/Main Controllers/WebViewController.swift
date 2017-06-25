//
//  WebViewController.swift
//  alt-basecamp
//
//  Created by Michele Longhi on 25/06/17.
//  Copyright © 2017 Michele Longhi. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var baseURLPath: String! {
        return "https://3.basecamp.com/\(BCModel.accountId)/\(command!)"
    }
    @IBInspectable var command: String!
    @IBOutlet weak var backItem: UIBarButtonItem!
    @IBOutlet weak var forwardItem: UIBarButtonItem!
    @IBOutlet weak var refreshItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backItem.isEnabled = false
        forwardItem.isEnabled = false
        
        webView.delegate = self
        
        reloadData()
    }
    
    func reloadData() {
        
        if let baseURLPath = self.baseURLPath {
            
            if let url = URL(string: baseURLPath) {
                let request = URLRequest(url: url)
                webView.loadRequest(request)
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }

    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
    }
    
    @IBAction func forward(_ sender: Any) {
        
        webView.goForward()
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left {
            webView.goForward()
        } else if sender.direction == .right {
            webView.goBack()
        }
    }
    
}

extension WebViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        forwardItem.isEnabled = true
        backItem.isEnabled = true
    }
}
