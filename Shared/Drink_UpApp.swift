//
//  Drink_UpApp.swift
//  Shared
//
//  Created by Nick Andrisin and Mark Kapuscinski on 4/12/21.
//

import SwiftUI

@main
struct Drink_UpApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
