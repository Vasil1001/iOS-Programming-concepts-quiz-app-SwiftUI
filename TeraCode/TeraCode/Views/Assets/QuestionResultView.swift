//
//  QuestionResultView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 26/02/2022.
//

import SwiftUI

struct QuestionResultView: View {
    
    @Binding var resultAlert: Bool //
    @Binding var message: String
    @State var title: String
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Text(title).font(.title)
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal, 25)
                .padding(.top,4)
                
                Text(message)
                    .padding(.top)
                    .padding(.horizontal,25)
                    .foregroundColor(Color.black)

                if (title == "Wrong") {
                    HStack {
                        Button(action: { (
                            resultAlert = false
                        ) })
                        {
                            Text("Close")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: 150)
                        }
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(20)
                        
                        Button(action: { (
                            resultAlert = false
                        ) })
                        {
                            Text("Check theory")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: 150)
                        }
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(20)
                        .padding()
                    }
                }
                
                if (title == "Correct"){
                    
                    Button(action: { (
                        resultAlert = false
                    ) })
                    {
                        Text("Close")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: 150)
                    }
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(20)
                    .padding()
                }
            }
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 7.6))
            .background(Color.white)
            .cornerRadius(14)
            .shadow(radius: 5)
        }
    }
    //struct alert_Previews: PreviewProvider {
    //    static var previews: some View {
    //        //alert()
    //    }
    //}
}
