//
//  ContentView.swift
//  Reverse Words SwiftUI
//
//  Created by Dmytro Horodyskyi on 03.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            MainView()
        }
    }
    
    struct HeaderView: View {
        var body: some View {
            ZStack {
                Color(#colorLiteral(red: 0.9650964141, green: 0.9650965333, blue: 0.9650964141, alpha: 1))
                VStack {
                    Spacer()
                    Text("Reverse Words")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                    Divider()
                        .frame(height: 1.2)
                        .overlay(Color(.lightGray))
                }
            }
            .edgesIgnoringSafeArea(.top)
            .frame(height: 40)
        }
    }
}

struct MainView: View {
    
    enum Modes: String, CaseIterable {
        case defaultMode = "Default"
        case customMode = "Custom"
    }
    
    @State private var textToReverse = ""
    @State private var selectedMode: Modes = .defaultMode
    @State private var textToIgnore = ""
    private var reverseManager = ReverseManager.shared
    
    var body: some View {
        VStack {
            TextField("Text to reverse", text: $textToReverse)
                .font(.system(size: 20))
                .frame(height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 5)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(#colorLiteral(red: 0.9195780158, green: 0.9195780158, blue: 0.9195780158, alpha: 1))))
                .padding(.horizontal)
                .padding(.top, 27)
            Picker("What is your favorite color?", selection: $selectedMode) {
                ForEach(Modes.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .scaleEffect(CGSize(width: 1, height: 1.1))
            .onAppear {
                UISegmentedControl.appearance().backgroundColor = UIColor(#colorLiteral(red: 0.8733726144, green: 0.8738296032, blue: 0.8817600608, alpha: 0.5))
            }
            .padding(.horizontal)
            .padding(.top, 25)
            .padding(.bottom, 5)
            switch selectedMode {
            case .defaultMode:
                Text("All characters except alphabetic symbols")
                    .padding(.vertical, 26)
            case .customMode:
                TextField("Text to ignore", text: $textToIgnore)
                    .font(.system(size: 20))
                    .frame(height: 40)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.horizontal, 5)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(#colorLiteral(red: 0.9195780158, green: 0.9195780158, blue: 0.9195780158, alpha: 1))))
                    .padding()
            }
            Text("Result:")
                .font(.system(size:17))
            ScrollView(.horizontal) {
                switch selectedMode {
                case .defaultMode:
                Text(reverseManager.reverseWordsExceptAlphabeticSymbols(of: textToReverse))
                        .font(.system(size:20))
                        .padding()
                        .onTapGesture {
                            UIPasteboard.general.string = self.reverseManager.reverseWordsExceptAlphabeticSymbols(of: textToReverse)
                        }
                        .accessibilityIdentifier("Result")
                case .customMode:
                    Text(reverseManager.reverseWords(of: textToReverse, ignore: textToIgnore))
                        .font(.system(size:20))
                        .padding()
                        .accessibilityIdentifier("Result")
                }
                
            }
            Spacer()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
