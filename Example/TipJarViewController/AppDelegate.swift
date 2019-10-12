//
//  AppDelegate.swift
//  TipJarViewController
//
//  Created by Dan Loewenherz on 05/06/2018.
//  Copyright (c) 2018 Dan Loewenherz. All rights reserved.
//

import UIKit
import LionheartExtensions
import TipJarViewController
import QuickTableView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegateWithWindow {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigation = UINavigationController(rootViewController: TipJarViewController<ExampleTipJarOptions>())
        rootViewController = navigation
        return true
    }
}

struct ExampleTipJarOptions: TipJarConfiguration {
    static var topHeader = "Hi There"
    
    static var topDescription = """
If you've been enjoying this app and would like to show your support, please consider a tip. They go such a long way, and every little bit helps. Thanks! :)
"""
    
    static func subscriptionProductIdentifier(for row: SubscriptionRow) -> String {
        switch row {
        case .monthly: return "co.itbeaver.TipJarTestApp.Subscription.Monthly"
        case .yearly: return "co.itbeaver.TipJarTestApp.Subscription.Yearly"
        }
    }
    
    static func oneTimeProductIdentifier(for row: OneTimeRow) -> String {
        switch row {
        case .small: return "co.itbeaver.TipJarTestApp.Tip.Small"
        case .medium: return "co.itbeaver.TipJarTestApp.Tip.Medium"
        case .large: return "co.itbeaver.TipJarTestApp.Tip.Large"
        case .huge: return "co.itbeaver.TipJarTestApp.Tip.Huge"
        case .massive: return "co.itbeaver.TipJarTestApp.Tip.Massive"
        }
    }
    
    static var termsOfUseURLString = "https://lionheartsw.com/software/pushpin/terms.html"
    static var privacyPolicyURLString = "https://lionheartsw.com/software/pushpin/privacy.html"
}

extension ExampleTipJarOptions: TipJarOptionalConfiguration {
    static var title = "Tip Jar"
    static var oneTimeTipsTitle = "One-Time Tips"
    static var subscriptionTipsTitle = "Ongoing Tips ❤️"
    static var receiptVerifierURLString = "https://iap-receipt-verifier.herokuapp.com/verify"
}
