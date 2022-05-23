//
//  DetailView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/13.
//

import SwiftUI

public struct ToolBarButtonStyle: ButtonStyle {
    public  func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .buttonStyle(PlainButtonStyle())
    }
    
    //MARK: - Initalizer
    public init(){}
}


