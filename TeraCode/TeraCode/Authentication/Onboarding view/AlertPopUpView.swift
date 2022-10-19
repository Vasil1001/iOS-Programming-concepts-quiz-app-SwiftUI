//
//  alert.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 22/02/2022.
//

import SwiftUI
struct AlertPopUpView: View {
    @Binding var alert: Bool
    @Binding var message: String
    @State var title: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text(title).font(.title)
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal, 25)
                .padding(.top,4)
                
                Text(message)
                    .padding(.top)
                    .padding(.horizontal,25)
                    .foregroundColor(Color.black)
                
                
                    Button(action: { (
                        alert = false
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
                
                
                if (title == "Successful Login"){
                    
                    NavigationLink(destination: HomePageView()) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: 150)
                    }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                    .background(Color.blue.opacity(0.8))
                    .overlay(RoundedRectangle(cornerRadius:14).stroke(.green, lineWidth: 0.8))
                    .cornerRadius(20)
                    .padding()
                }
                
                if (title == "Successful Signup"){
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: 150)
                    }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                    .background(Color.blue.opacity(0.8))
                    .overlay(RoundedRectangle(cornerRadius:14).stroke(.green, lineWidth: 0.8))
                    .cornerRadius(20)
                    .padding()
                }
            
            }
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 9.6))
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
