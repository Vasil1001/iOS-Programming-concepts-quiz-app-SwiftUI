//
//  ProgressBar.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 24/04/2022.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
               
                Rectangle().frame(width: geometry.size.width , height: 12)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))
               
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: 12)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(.linear,value: value)
                
            }
            .cornerRadius(45.0)
        }
    }
}
