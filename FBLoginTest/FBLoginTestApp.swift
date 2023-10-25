//
//  FBLoginTestApp.swift
//  FBLoginTest
//
//  Created by Sami Ahmed on 24/10/2023.
//
import SwiftUI
import FacebookLogin
import FBSDKCoreKit


@main
struct FBLoginTest: App {
    init() {
        ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//import SwiftUI
//import FBSDKCoreKit
//
//@main
//struct FBLoginTestApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .onOpenURL(perform: { url in
//                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
//                })
//        }
//    }
//}
//ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
//ApplicationDelegate.shared.application(
//            app,
//            open: url,
//            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
//        )
