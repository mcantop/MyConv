//
//  ContentView.swift
//  MyConv
//
//  Created by Maciej on 24/07/2022.
//

import SwiftUI

struct ContentView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            TemperatureView()
                .tabItem {
                    Label("Temperature", systemImage: "thermometer")
                }
            
            LengthView()
                .tabItem {
                    Label("Length", systemImage: "ruler.fill")
                }
            
            TimeView()
                .tabItem {
                    Label("Time", systemImage: "clock")
                }
            
            VolumeView()
                .tabItem {
                    Label("Volume", systemImage: "cube.transparent")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
