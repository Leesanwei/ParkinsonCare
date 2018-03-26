//
//  AppDelegate.swift
//  ParkinsonCare
//
//  Created by San-Wei LEE on 28/02/2018.
//  Copyright © 2018 San-Wei LEE. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Request the authorization to notify user.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
            if granted {
                print("User granted notification authorization.")
            }
            else{
                print("User did nont granted notification authorization.")
            }
        }
        
        // Get notification category
        let notificationCategories = self.getNotificationCategorie()
        // Register the category.
        center.setNotificationCategories(notificationCategories)
        center.delegate = self

        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Si l'application n'a jamais été installé alors on remplis la BD
        //UserDefaults.standard.set(false, forKey: "wasLaunched")
        if(!UserDefaults.standard.bool(forKey: "wasLaunched")){
            if(preloadData()){
                UserDefaults.standard.set(true, forKey: "wasLaunched")
            return true
            }
            return false
        }
        return true
    }
    
    func preloadData() -> Bool{
        
        let persistanceFacade : PersistenceFacade = PersistenceFacade.getInstance()
        
        return persistanceFacade.addSpecialities() && persistanceFacade.addEvent() && persistanceFacade.addMedicines()
        
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ParkinsonCare")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getNotificationCategorie() -> Set<UNNotificationCategory>{
        
        //Medicine category
        let postponeAction = UNNotificationAction(identifier : "POSTPONE",title : "Repousser", options : [])
        
        let validateTakeAction = UNNotificationAction(identifier : "VALIDATE",title : "Valider", options : [])
    
        let medicineCategory = UNNotificationCategory(
            identifier: "medicineCategory",
            actions: [postponeAction,validateTakeAction],
            intentIdentifiers: [],
            options: [])
    
        
        // Evaluation category
        let onAction = UNNotificationAction(identifier: "ON", title: "On", options: [])
        let offAction = UNNotificationAction(identifier: "OFF", title: "Off", options: [])
        let dysAction = UNNotificationAction(identifier: "DYSKINESIE", title: "Diskinésie", options: [])

        let evalCategory = UNNotificationCategory(identifier: "evaluationCategory", actions: [onAction,offAction,dysAction], intentIdentifiers: [], options: [])
        
        var set : Set<UNNotificationCategory> = Set<UNNotificationCategory>()
        set.insert(medicineCategory)
        set.insert(evalCategory)
        
        return set
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        NotificationManager.getInstance().handleResponse(response : response)
    }

}

