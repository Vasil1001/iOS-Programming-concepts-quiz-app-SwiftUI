//
//  SignUpView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 29/11/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var passwordVisible = false
    @State var confirmPasswordVisible = false
    
    @State var alert = false
    @State var error = ""
    @State var title = ""
    
    var body: some View {
        ZStack { //zstack will allow the popup to display infront of other content on the z axis
            Color(.sRGB, red: 0.4, green: 0.7, blue: 0.9, opacity: 0.3)
                .ignoresSafeArea()
            VStack {
                //https://2.flexiple.com/illustrations/exam link for images
                
                Text("TeraCode")
                    .font(.system(size:42, weight: .bold))
                Text("Register new account")
                    .font(.system(size:21, weight: .light))
                    .padding(.bottom, 30)
                
                Spacer()
                
                Image("3d-flame-285")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image(systemName: "envelope").foregroundColor(Color.gray.opacity(0.5))
                        
                        TextField("Email", text: $email)
                        
                    }
                    .padding()
                    .frame(height: 45)
                    .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 0.2))
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    
                    HStack {
                        
                        if self.passwordVisible{
                            
                            Image(systemName: "lock").foregroundColor(Color.gray.opacity(0.5))
                            
                            TextField("Password", text: $password)
                        }
                        else{
                            
                            Image(systemName: "lock").foregroundColor(Color.gray.opacity(0.5))
                            
                            SecureField("Password", text: $password)
                            
                        }
                        
                        Button(action: {
                            passwordVisible.toggle()
                        }, label: {
                            Image(systemName: passwordVisible ? "eye.slash.fill" : "eye.fill").foregroundColor(Color.gray.opacity(0.5))
                        })
                        
                    }
                    .padding()
                    .frame(height: 45)
                    .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 0.2))
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    
                    HStack {
                        if self.confirmPasswordVisible{
                            
                            Image(systemName: "lock").foregroundColor(Color.gray.opacity(0.5))
                            
                            TextField("Confirm Password", text: $confirmPassword)
                        }
                        else{
                            
                            Image(systemName: "lock").foregroundColor(Color.gray.opacity(0.5))
                            
                            SecureField("Confirm Password", text: $confirmPassword)
                            
                        }
                        
                        Button(action: {
                            confirmPasswordVisible.toggle()
                        }, label: {
                            Image(systemName: confirmPasswordVisible ? "eye.slash.fill" : "eye.fill").foregroundColor(Color.gray.opacity(0.5))
                        })
                        
                    }
                    .padding()
                    .frame(height: 45)
                    .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 0.2))
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        if email.isEmpty || password.isEmpty{
                            error = "Please fill in all the fields"
                            alert.toggle()
                            title = "Error"
                        }
                        else if password.count < 5
                        {
                            error = "Password should have more than 6 characters"
                            alert.toggle()
                            title = "Error"
                            
                        }
                        else if password != confirmPassword
                        {
                            error = "Password confirmation does not match"
                            alert.toggle()
                            title = "Error"
                        }
                        else {
                            if email != "" && password != "" {
                                signUp(email: email, password: password)
                            }
                        }
                    }, label:
                            {
                        Text("Sign Up")
                            .frame(maxWidth:270, maxHeight: 15)
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                    })
                }
            }
            .padding(.bottom, 20)
            
            if alert { //if true, display the message view with $error text
                AlertPopUpView(alert: $alert, message: $error, title:title)
            }
        }
    }
    
    func signUp(email: String, password: String){
        let auth = Auth.auth() //reference to authentication library
        auth.createUser(withEmail: email, password: password) { result, err in
            
            //make sure result is not empty and no errors otherwise
            guard result != nil, err == nil else {
                //Set local error to be equal to alert text
                self.error = err!.localizedDescription
                alert.toggle() //alert popup with info
                
                print(err?.localizedDescription ?? "")
                print("Account details wrong")
                return
            }
            if err == nil {
                print("Registered succesfully")//Succesful sign in
                
                title = "Successful Signup" //set popup title/info
                error = "You have successfully created an account!"
                
                alert.toggle() //activate the popup
            }
        }
    }
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
}


