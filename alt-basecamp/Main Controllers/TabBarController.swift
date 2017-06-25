//
//  TabBarController.swift
//  alt-basecamp
//
//  Created by Michele Longhi on 25/06/17.
//  Copyright © 2017 Michele Longhi. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var lastSelectedIndex = 0
    
    var tabs = [
        [
            "title": "Home",
            "command": "projects",
            "icon": "home"
        ],
        [
            "title": "Campfires",
            "command": "chats",
            "icon": "campfires"
        ],
        [
            "title": "Pings",
            "command": "circles",
            "icon": "pings"
        ],
        [
            "title": "Hey!",
            "command": "my/readings",
            "icon": "hey"
        ],
        [
            "title": "Bookmarks",
            "command": "my/bookmarks",
            "icon": "bookmarks"
        ],
        [
            "title": "Drafts",
            "command": "my/drafts",
            "icon": "drafts"
        ],
        [
            "title": "Reports",
            "command": "reports",
            "icon": "reports"
        ],
        [
            "title": "Search",
            "command": "search",
            "icon": "search"
        ]
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composeTabs()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if let index = tabBar.items?.index(of: item) {
            
            if let viewController = viewControllers?[index] as? WebViewController {
                
                if lastSelectedIndex == index {
                    viewController.reloadData()
                }
            }
            
            lastSelectedIndex = index
        }
    }
    
    func composeTabs() {
        
        var controllers = [UIViewController]()
        
        for tab in tabs {
            
            let webController = storyboard?.instantiateViewController(withIdentifier: "webController") as! WebViewController
            webController.command = tab["command"]
            webController.tabBarItem.title = tab["title"]
            if let icon = tab["icon"] {
                webController.tabBarItem.image = UIImage(named: icon)
            }
            
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
