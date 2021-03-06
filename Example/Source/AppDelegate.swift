//
//  AppDelegate.swift
//  Example
//
//  Created by Django Lee on 05/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import UIKit
import JoUIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let textView = UITextView()
    var collection: [String: [String]] = Dictionary()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = ViewController()
        let navigationController = NavigationController(rootViewController: rootViewController)
        self.window = Window(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        self.window?.didMoveToWindow()
        
        self.window?.addSubview(textView)
        textView.backgroundColor = .black
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 10)
        textView.isEditable = false
        textView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 300, width: UIScreen.main.bounds.width, height: 300)
        
        return true
    }
    
    func addText(obj: AnyObject, text: String) {

        let hashInt = unsafeBitCast(obj, to: Int.self).hashValue
        let hashValue = "\(NSStringFromClass(obj.classForCoder)) \(hashInt)"
        var value = collection[hashValue] ?? []
        value.append(text)
        collection[hashValue] = value
        
        var content = ""
        for (key, list) in collection {
            content.append("\(key) \n")
            for string in list {
                content.append("\(string)\n")
            }
            content.append("\n")
        }
        textView.text = content
        self.window?.addSubview(textView)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

}

