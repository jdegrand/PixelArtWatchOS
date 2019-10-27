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
    @State var scroll = 0.0
    @State var matrix = [[Color]](repeating: [Color](repeating: Color.white, count: 20), count: 20)
    @State var numrows = 10
    var body: some View {
        VStack {
        VStack(spacing: 1) {
            ForEach(0 ..< 9) { item in
                HStack(spacing: 1){
                    ForEach(0 ..< self.numrows) { square in
                    Rectangle().padding(.horizontal, 0.0).foregroundColor(self.matrix[item][square]).frame(width: 15, height: 15)
                        .gesture(TapGesture()
                                    .onEnded {
                                        self.matrix[item][square] = self.getColor(color_num: self.scroll)
                                                    }
                                            )

                }
                }
            }
            }
            HStack {
                ColorPicker(color: .red, color_num: 1.0, currentColor: self.scroll).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.red
                        self.scroll = 1.0
                    }
                )
                ColorPicker(color: .orange, color_num: 2.0,  currentColor: self.scroll).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.orange
                        self.scroll = 2.0
                    }
                )
                ColorPicker(color: .yellow, color_num: 3.0, currentColor: self.scroll).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.yellow
                        self.scroll = 3.0
                    }
                )
                ColorPicker(color: .green, color_num: 4.0, currentColor: self.scroll).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.green
                        self.scroll = 4.0
                    }
                )
                ColorPicker(color: .blue, color_num: 5.0, currentColor: self.scroll).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.blue
                        self.scroll = 5.0
                    }
                )
                ColorPicker(color: .purple, color_num: 6.0, currentColor: self.scroll).gesture(TapGesture()
                    .onEnded {
                        self.currentColor = Color.purple
                        self.scroll = 6.0
                    }
                )
            }
        }.focusable(true).digitalCrownRotation($scroll, from: 1, through: 6, by: 1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
    }
    func getColor(color_num: Double) -> Color {
        switch color_num {
        case 1.0:
            return Color.red
        case 2.0:
            return Color.orange
        case 3.0:
            return Color.yellow
        case 4.0:
            return Color.green
        case 5.0:
            return Color.blue
        case 6.0:
            return Color.purple
        default:
            return Color.white
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
    @State var color_num: Double
    var currentColor: Double
    var body: some View {
        Rectangle().foregroundColor(color).frame(width: 20, height: 20)
            .border(Color.black, width: getWidth(color_num: color_num))
    }
    func getWidth(color_num: Double) -> CGFloat {
            if isChosen(color_num: color_num) {
                return 2
            } else {
                return 0
            }
    }
    func isChosen(color_num: Double) -> Bool {
        return color_num == self.currentColor
    }
}
