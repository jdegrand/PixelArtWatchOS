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
    @State public var currentColor = Color.white
    @State var didTap = false
    @State var matrix = [[Color]](repeating: [Color](repeating: Color.white, count: 10), count: 10)
    var body: some View {
        VStack {
            ForEach(0 ..< 10) { item in
                HStack {
                ForEach(0 ..< 10) { square in
                    Rectangle().padding(.horizontal, 0.0).foregroundColor(self.matrix[item][square]).frame(width: 10, height: 10)
                        .gesture(TapGesture()
                                    .onEnded {
                            self.matrix[item][square] = self.currentColor
                                                    }
                                            )
        
                }
                }
            }
            HStack {
                ColorPicker(color: .red, currentColor: self.currentColor).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.red
                    }
                )
                ColorPicker(color: .orange, currentColor: self.currentColor).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.orange
                    }
                )
                ColorPicker(color: .yellow, currentColor: self.currentColor).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.yellow
                    }
                )
                ColorPicker(color: .green, currentColor: self.currentColor).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.green
                    }
                )
                ColorPicker(color: .blue, currentColor: self.currentColor).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.blue
                    }
                )
                ColorPicker(color: .purple, currentColor: self.currentColor).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.purple
                    }
                )
            }
        }
    }
    func getWidth(color: Color) -> CGFloat {
        if isChosen(color: color) {
            return 2
        } else {
            return 0
        }
    }
    func isChosen(color: Color) -> Bool {
        return color == self.currentColor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorPicker: View {
    var color: Color
    var currentColor: Color
    var body: some View {
        Rectangle().foregroundColor(color).frame(width: 20, height: 20)
            .border(Color.black, width: getWidth(color: color))
    }
    func getWidth(color: Color) -> CGFloat {
            if isChosen(color: color) {
                return 2
            } else {
                return 0
            }
    }
    func isChosen(color: Color) -> Bool {
        return color == self.currentColor
    }
}
