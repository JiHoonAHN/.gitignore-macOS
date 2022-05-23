//
//  TitleLogo.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/24.
//

import SwiftUI

struct TitleLogo: View {
    var body: some View {
        VStack{
            Image("HomeLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 100)
            Text("프로젝트에 꼭 맞는 .gitignore 파일을 더 빠르게 생성하세요!")
                .font(.system(size: 13, weight: .medium, design: .default))
                .padding(.top, 20)
        }
    }
    
}

struct TitleLogo_Previews: PreviewProvider {
    static var previews: some View {
        TitleLogo()
    }
}
