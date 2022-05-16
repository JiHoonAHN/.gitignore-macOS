//
//  ListCardGrid.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/15.
//

import SwiftUI
import WaterfallGrid

struct ListCardGrid: View {
    
    var models : [ListModel]
    
    var body: some View {
        ScrollView(){
            WaterfallGrid((0..<models.count), id: \.self) { index  in
                ListCardView(card: self.models[index])
            }
        }
    }
}

