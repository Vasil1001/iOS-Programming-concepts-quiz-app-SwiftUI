//
//  TeraCodeApp.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 19/11/2021.
//

import SwiftUI
import Firebase

@main
struct TeraCodeApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                WelcomePageView(title: "Welcome to TeraCode!", message: "Join to start practicing with questions and quizzes for an introduction to Swift!", imageName: "business-3d-bamboo-board-with-statistic-notes")
                    
            }
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate{
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}

