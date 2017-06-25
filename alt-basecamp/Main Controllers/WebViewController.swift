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
        
        let bodySize = UIFont.preferredFont(forTextStyle: .body).pointSize
        let headlineSize = UIFont.preferredFont(forTextStyle: .headline).pointSize
        let subheadlineSize = UIFont.preferredFont(forTextStyle: .subheadline).pointSize
        let title1Size = UIFont.preferredFont(forTextStyle: .title1).pointSize
        let title2Size = UIFont.preferredFont(forTextStyle: .title2).pointSize
        let title3Size = UIFont.preferredFont(forTextStyle: .title3).pointSize
        
        let url = Bundle.main.url(forResource: "styles", withExtension: "css")!
        let cssString = try! NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "{bodySize}", with: "\(bodySize)")
            .replacingOccurrences(of: "{headlineSize}", with: "\(headlineSize)")
            .replacingOccurrences(of: "{subheadlineSize}", with: "\(subheadlineSize)")
            .replacingOccurrences(of: "{title1Size}", with: "\(title1Size)")
            .replacingOccurrences(of: "{title2Size}", with: "\(title2Size)")
            .replacingOccurrences(of: "{title3Size}", with: "\(title3Size)")
        
        let javascriptString = "var style = document.createElement('style'); style.innerHTML = '%@'; document.head.appendChild(style)"
        let injectString = NSString(format: javascriptString as NSString, cssString) as String
        
        webView.stringByEvaluatingJavaScript(from: injectString)
        
        forwardItem.isEnabled = true
        backItem.isEnabled = true
    }
}
