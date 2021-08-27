//
//  CustomToggleStyle.swift
//  The_Experience
//
//  Created by Rodrigo Carvalho on 26/08/21.
//

import SwiftUI

//Nano CustomToggle
struct NanoCustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.label
            Button {
                configuration.isOn.toggle()
            } label: {
                NanoToggle(isDay: configuration.isOn)
            }
        }
    }
    
    struct NanoToggle: View {
        var isDay = true
        var body: some View {
            Image(isDay ? "fundo-noite" : "fundo-dia")
                .overlay(
                    Image(isDay ? "lua" : "sol")
                        .antialiased(true)
                        .frame(width: 65, height: 65), alignment: isDay ? .trailing : .leading
                )
                .overlay(
                    Image("nuvem")
                        .position(x: 55, y: 35)
                        .opacity(isDay ? 0 : 1)
                )
                .animation(.easeOut(duration: 0.6))
        }
    }
}
