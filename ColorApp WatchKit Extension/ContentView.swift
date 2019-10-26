//
//  ContentView.swift
//  ColorApp WatchKit Extension
//
//  Created by Joe DeGrand on 10/26/19.
//  Copyright © 2019 Joe DeGrand. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var clickedColor = 1
    @State var currentColor = Color.white
    @State var didTap = false
    var body: some View {
        VStack {
            ForEach(0 ..< 10) { item in
                HStack {
                ForEach(0 ..< 10) { square in
                    Rectangle().padding(.horizontal, 0.0).foregroundColor(self.didTap ? Color.white : Color.blue).frame(width: 10, height: 10)
        
                }
                }
            }
            HStack {
            Rectangle().foregroundColor(Color(red: 1, green: 0, blue: 0, opacity: 1.0)).frame(width: 20, height: 20)
                Rectangle().foregroundColor(Color(red: 1, green: 129/255, blue: 0, opacity: 1.0)).frame(width: 20, height: 20).border(Color.black, width: 2).gesture(TapGesture()
                        .onEnded {
                            self.didTap.toggle()
                        }
                    )
                Rectangle().foregroundColor(Color(red: 1, green: 1, blue: 0, opacity: 1.0)).frame(width: 20, height: 20)
                Rectangle().foregroundColor(Color(red: 0, green: 1, blue: 0, opacity: 1.0)).frame(width: 20, height: 20)
                Rectangle().foregroundColor(Color(red: 0, green: 0, blue: 1, opacity: 1.0)).frame(width: 20, height: 20)
                Rectangle().foregroundColor(Color(red: 1, green: 0, blue: 1, opacity: 1.0)).frame(width: 20, height: 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
