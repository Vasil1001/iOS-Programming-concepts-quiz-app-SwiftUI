//
//  LoginView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 28/11/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

struct LoginView: View {

    
    var body: some View {
        LoginUI()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        LoginView().preferredColorScheme(.dark)

    }
}

struct LoginUI: View {
    
    @State var email = ""
    @State var password = ""
    @State var passwordVisible = false
    @State var alert = false
    @State var error = ""
    @State var title = ""
        
    var body: some View {
        
        ZStack{
            Color(.sRGB, red: 0.4, green: 0.7, blue: 0.9, opacity: 0.3)
                .ignoresSafeArea()
            VStack  {
                //https://2.flexiple.com/illustrations/exam link for images
                
                Text("TeraCode")
                    .font(.system(size:42, weight: .bold))
                Text("Sign in to account")
                    .font(.system(size:21, weight: .light))
                
                Spacer()
                
                Image("3d-flame-255-2")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text("Sign in to TeraCode")
                    .padding(.leading, 23)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
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
                            self.passwordVisible.toggle()
                        }, label: {
                            Image(systemName: self.passwordVisible ? "eye.slash.fill" : "eye.fill").foregroundColor(Color.gray.opacity(0.5))
                        })
                    }
                    .padding()
                    .frame(height: 45)
                    .overlay(RoundedRectangle(cornerRadius:14).stroke(.black, lineWidth: 0.2))
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                
                HStack{
                    NavigationLink(destination: SignUpView()) {
                        Text("Register")
                            .padding(.horizontal, 20)
                            .font(.system(size:14, weight:.bold))
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ForgotPassword()) {
                        Text("Forgot Password?")
                            .padding(.horizontal, 20)
                            .font(.system(size:14, weight:.bold))
                    }
                }
                .padding(.bottom, 20)
                
                Spacer()
                
                VStack {
                    
                    Button(action: { //Sign in button
                        
                        if email.isEmpty || password.isEmpty { //if a textfield is empty
                            error = "Please fill in all the fields" //set the message accordingly
                            title = "Error" //title  for the popup
                            
                            alert.toggle() //display the popup view on the screen
                        }
                        
                        else if password.count < 5 // make sure password is more than 5 characters
                        {
                            error = "Password should have more than 5 characters"
                            title = "Error"
                            
                            alert.toggle()
                            
                        }
                        
                        else { //if email is not empty
                            if email != "" && password != "" {
                                signIn(email: email, password: password) //call signin func using email and password entered in text fields
                            }
                        }
                    }, label:
                            {
                        Text("Sign in")
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
            
            //if alert is toggled
            if alert { //if true, display the message view with $error text
                AlertPopUpView(alert: $alert, message: $error, title:title)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    
    func signIn(email: String, password: String){
        let auth = Auth.auth() //reference to authentication library
        auth.signIn(withEmail: email, password: password) { result, err in
            //make sure result is not empty and no errors otherwise
            guard result != nil, err == nil else {
                //Set local error to be equal to alert text
                self.error = err!.localizedDescription
                title = "Error" //set title for popup
                alert.toggle() //activate the popup
                
                print(err?.localizedDescription ?? "")
                print("Account details wrong")
                return
            }
            //if there are no errors
            if err == nil {
                print("Signed in succesfully")//Succesful sign in
                //loggedIn = true
                title = "Successful Login" //set title for popup
                error = "You have successfully logged in!" //set message to logged in
                alert.toggle() //activate the popup
                
            }
        }
    }
}
