//
//  ForgotPassword.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 02/12/2021.
//

import SwiftUI
import FirebaseAuth


struct ForgotPassword: View {
    @State var email = ""
    
    @State var alert = false
    @State var error = ""
    @State var title = ""
    
    var body: some View {
        
        ZStack {
            Color(.sRGB, red: 0.4, green: 0.7, blue: 0.9, opacity: 0.3)
                .ignoresSafeArea()
            VStack {
                Text("Tera")
                    .font(.system(size:42, weight: .bold))
                Text("Reset Password")
                    .font(.system(size:21, weight: .light))
                
                Spacer()
                
                Image("business-3d-317")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text("Type an email to receive a reset request")
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Image(systemName: "envelope").foregroundColor(Color.gray.opacity(0.5))
                    
                    TextField("Email", text: $email)
                    
                }
                .padding()
                .frame(height: 45)
                .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 0.2))
                .background(Color(.systemGray6))
                .cornerRadius(14)
                .padding(.bottom, 15)
                
                Button(action: {
                    print("Reset password request sent")
                    resetPassword(email: email)
                })
                {
                    Text("Reset password")
                }
                .frame(maxWidth:270, maxHeight: 15)
                .font(.system(size: 20, weight: .bold))
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(15)
                
                Spacer()
                Spacer()
                
            }
            .padding(.horizontal, 20)
            //if alert is toggled
            if alert { //if true, display the message view with $error text
                AlertPopUpView(alert: $alert, message: $error, title:title)
            }
        }
    }
    
    func resetPassword(email: String){
        
        let auth = Auth.auth() //reference to authentication library
        auth.sendPasswordReset(withEmail: email) { err in
            
            //make sure result is not empty and no errors otherwise
            guard err == nil else {
                //Set local error to be equal to alert text
                self.error = err!.localizedDescription //set the error to the popup message
                alert.toggle() //activate the popup message with the error
                
                print(err?.localizedDescription ?? "")
                print("Reset Password Error")
                return
            }
            
            if err == nil { //if there are no errors
                print("Password reset request sent")//Succesful sign in

                title = "Reset Password" //set title for popup
                error = "A request to reset your password has been sent to your email!"
                alert.toggle() //activate the popup
                
            }
        }
    }
}



struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
        ForgotPassword()
            .preferredColorScheme(.dark)
    }
}
