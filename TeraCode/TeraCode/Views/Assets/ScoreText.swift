//
//  ScoreText.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 24/04/2022.
//

import SwiftUI

struct ScoreText: View {
    let text: String
    let message: String
    
    var body: some View {
        Text(text)
            .padding(.top, 3)
            .font(.title2)
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .center)

        Text(message)
            .padding(.top, 1)
            .font(.title2)
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}


