//
//  TabBarController.swift
//  alt-basecamp
//
//  Created by Michele Longhi on 25/06/17.
//  Copyright © 2017 Michele Longhi. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composeTabs()
    }
    
    func composeTabs() {
        
        let tabs = [
            [
                "title": "Home",
                "command": "projects"
            ],
            [
                "title": "Campfires",
                "command": "chats"
            ],
            [
                "title": "Pings",
                "command": "circles"
            ],
            [
                "title": "Hey!",
                "command": "my/readings"
            ],
            [
                "title": "Reports",
                "command": "reports"
            ],
            [
                "title": "Search",
                "command": "search"
            ]
            
        ]
        
        var controllers = [UIViewController]()
        
        for tab in tabs {
            
            let webController = storyboard?.instantiateViewController(withIdentifier: "webController") as! WebViewController
            webController.command = tab["command"]
            webController.tabBarItem.title = tab["title"]
            
            controllers.append(webController)
        }
        
        viewControllers = controllers
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
