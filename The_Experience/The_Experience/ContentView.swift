//
//  ContentView.swift
//  The_Experience
//
//  Created by Rodrigo Ryo Aoki on 23/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var onOff: Bool = false
    
    var body: some View {
        Toggle.init("Nano6",isOn: $onOff)
            .toggleStyle(NanoCustomToggle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
