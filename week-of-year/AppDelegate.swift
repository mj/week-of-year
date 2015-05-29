//
//  AppDelegate.swift
//  Calendar Week
//
//  Created by Martin Jansen on 29.05.15.
//  Copyright (c) 2015 divbyzero, inc. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit", action: Selector("terminate:"), keyEquivalent: "q"))
        
        statusItem.menu = menu;
        
        NSTimer.scheduledTimerWithTimeInterval(
            60.0,
            target: self,
            selector: Selector("update"),
            userInfo: nil,
            repeats: true
        )
        
        update();
    }
    
    func update() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitWeekOfYear, fromDate: date)
        
        if let button = statusItem.button {
            button.title = String(components.weekOfYear)
            button.font = NSFont.systemFontOfSize(12);
        }
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
    }
}
