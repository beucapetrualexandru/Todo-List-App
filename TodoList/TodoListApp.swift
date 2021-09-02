//
//  TodoListApp.swift
//  TodoList
//
//  Created by Beuca Alexandru on 19.08.2021.
//

import SwiftUI

/*
 MVVM Architecture
 Model - data point
 View - UI
 ViewModel - manage model for the view
 
 */

@main
struct TodoListApp: App {
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
