//
//  ContentView.swift
//  AppToCLISample
//
//  Created by Trevin Wisaksana on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    
    private let shell = Shell()
    
    @State var output: String = ""
    
    var body: some View {
        VStack {
            Text(output)
            
            Button {
                do {
                    output = try shell.run(["--version"])
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            } label: {
                Text("Run")
            }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
