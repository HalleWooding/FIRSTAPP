//
//  ContentView.swift
//  FIRSTAPP
//
//  Created by Halle Wooding on 6/22/23.
//view is what is seen on screen by users (buttons, photos, etc)
//parent view is whole of all views and individual views are child views
//modifiers are features that allow us to customize + design views
//stack is collection of SwiftUI views that are grouped in a way to create a certain layout in app
// VStack = vertical, 

import SwiftUI
extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

let gray0 = Color(hex: "3f")
let gray1 = Color(hex: "#69")
let gray2 = Color(hex: "#6911")
let gray3 = Color(hex: "fff")
let red = Color(hex: "#FF000044s")
let green = Color(hex: "#00FF00")
let blue0 = Color(hex: "0000FF")
let blue1 = Color(hex: "0000F")
let purple = Color(hex: "CDB4DB")
let pink1 = Color(hex: "FFAFCC")
struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text ("My Travels")
                    .fontWeight (.bold)
                    .multilineTextAlignment(.center)
                    .font(.system(.largeTitle, design: .serif))
                
                NavigationLink(destination: View4()) {
                    Text("New York")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color(hex: "FFAFCC"))
                        .fontWeight(.bold)
                        .font(.system(.title3, design: .rounded))
                        .cornerRadius (10)
                    
                    NavigationLink(destination: View3()) {
                        Text("Lake Tahoe")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color(hex: "CDB4DB"))
                            .fontWeight(.bold)
                            .font(.system(.title3, design: .rounded))
                            .cornerRadius (10)
                    }
                }
            }
            .padding(.horizontal, 20.0)
        }
        
    }
    
    struct View2: View {
        var body: some View {
            VStack(alignment: .center) {
                Text("")
                    .fontWeight (.bold)
                    .foregroundColor(Color(hex: "FFAFCC"))
                    .multilineTextAlignment(.center)
                    .font(.system(.largeTitle, design: .serif))
              
                
            }
        }
        
    }
    
    struct View3: View {
        var body: some View {
            VStack(alignment: .center) {
                Text("Lake Tahoe")
                    .fontWeight (.bold)
                    .foregroundColor(Color(hex: "CDB4DB"))
                    .multilineTextAlignment(.center)
                    .font(.system(.largeTitle, design: .serif))
                Image("Lake Tahoe 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius (15)
                    .padding(.horizontal, 24.0)
                    .multilineTextAlignment(.center)
                Text("Lake Tahoe (2019)")
                    .font(.system(.title2, design: .serif))
                
            }
        }
        
    }
    
    struct View4: View {
        var body: some View {
            VStack(alignment: .center) {
                Text("New York")
                    .fontWeight (.bold)
                    .foregroundColor(Color(hex: "FFAFCC"))
                    .multilineTextAlignment(.center)
                    .font(.system(.largeTitle, design: .serif))
                    
                Image("New York 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius (15)
                    .padding(.horizontal, 25.0)
                    .multilineTextAlignment(.center)
                
                Text("New York (2023)")
                    .font(.system(.title2, design: .serif))
                
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
