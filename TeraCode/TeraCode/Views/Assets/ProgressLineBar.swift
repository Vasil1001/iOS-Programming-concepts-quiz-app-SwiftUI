//
//  ProgressLineBar.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 18/04/2022.
//

import SwiftUI

struct ProgressLineBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
               
                Rectangle().frame(width: geometry.size.width , height: 12)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))
               
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: 12)
                        .foregroundColor(Color(UIColor.systemMint))
                        .animation(.linear,value: value)
                
            }
            .cornerRadius(45.0)
        }
    }
}

//struct ProgressLineBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressLineBar()
//    }
//}
