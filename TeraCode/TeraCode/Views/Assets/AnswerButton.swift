//
//  AnswerButton.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 24/04/2022.
//

import SwiftUI

struct AnswerButton: View {
    let text: String
    let onClick: () -> Void
    
    var body: some View {
        
        Button(action: {
            onClick()
        }) {
            Text(text)
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius:7).stroke(.black, lineWidth: 2.6))
        }.shadow(radius: 1)
    }
}
