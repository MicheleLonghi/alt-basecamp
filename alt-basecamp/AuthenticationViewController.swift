//
//  AuthenticationViewController.swift
//  alt-basecamp
//
//  Created by Michele Longhi on 25/06/17.
//  Copyright © 2017 Michele Longhi. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var delegate: AuthenticationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequest()
    }

    func makeRequest() {
        
        let url = "https://launchpad.37signals.com/authorization/new?type=web_server" +
                  "&client_id=\(BCModel.clientId)" +
                  "&redirect_uri=alt-bc://"
        let request = URLRequest(url: URL(string: url)!)
        
        webView.loadRequest(request)
    }
    
}

protocol AuthenticationViewControllerDelegate {
    
    func authenticationViewControllerDidAuthenticate(controller: AuthenticationViewController)
    func authenticationViewControllerDidFailAuthentication(controller: AuthenticationViewController)
}
