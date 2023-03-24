//
//  Shell.swift
//  AppToCLISample
//
//  Created by Trevin Wisaksana on 24/03/23.
//

import Foundation

final class Shell {

    /// Enter the argument or parameter in the CLI as an element in the array e.g. ["--version"]
    @discardableResult
    func run(_ command: [String]) throws -> String {
        let task = Process()
        let pipe = Pipe()
        let homeDirectory = FileManager.default.homeDirectoryForCurrentUser.relativePath
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = command
        task.executableURL = URL(fileURLWithPath: "\(homeDirectory)/.local/bin//cardano-node")
        task.standardInput = nil
        
        try task.run()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
    
}
