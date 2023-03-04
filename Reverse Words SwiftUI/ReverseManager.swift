//
//  File.swift
//  ReverseWords
//
//  Created by Dmytro Horodyskyi on 19.01.2023.
//

import Foundation

struct ReverseManager {
    
    static let shared = ReverseManager()
    
    func reverseWordsExceptAlphabeticSymbols(of string: String) -> String {
        string
            .split(separator: " ")
            .map {
                var result = Array($0)
                var i: Int = 0, j: Int = result.count - 1
                while i < j {
                    while i < j {
                        if result[i].isLetter {
                            break
                        }
                        i += 1
                    }
                    while i < j {
                        if result[j].isLetter {
                            break
                        }
                        j -= 1
                    }
                    let temp = result[i]
                    result[i] = result[j]
                    result[j] = temp
                    i += 1
                    j -= 1
                }
                return String(result)
            }
            .joined(separator: " ")
    }
    func reverseWords(of string: String, ignore characters: String) -> String {
        string
            .split(separator: " ")
            .map {
                var result = Array($0)
                var i: Int = 0, j: Int = result.count - 1
                while i < j {
                    while i < j {
                        if !characters.contains(result[i]) {
                            break
                        }
                        i += 1
                    }
                    while i < j {
                        if !characters.contains(result[j]) {
                            break
                        }
                        j -= 1
                    }
                    let temp = result[i]
                    result[i] = result[j]
                    result[j] = temp
                    i += 1
                    j -= 1
                }
                return String(result)
            }
            .joined(separator: " ")
    }
}
