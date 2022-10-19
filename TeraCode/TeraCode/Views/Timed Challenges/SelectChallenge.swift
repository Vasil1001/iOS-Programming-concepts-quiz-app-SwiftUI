//
//  SelectChallenge.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 27/04/2022.
//

import SwiftUI

struct SelectChallenge: View {
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            VStack{
                
                Text("Pick a challenge and start solving")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.top, 1)
                
                Text("Solve on your personal computer in a given timeframe")
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                
                Text("Can you solve it?")
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .font(.body.weight(.regular))
                    .padding(.horizontal, 20)
                    .padding(.top, 3)
                
                Divider()
                
                VStack {
                    ScrollView {
                    NavigationLink(destination: DeclaringTutorial()) {
                        VStack {
                            HStack {
                                Text("Data types")
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 0)
                                    .padding(.top, 10)
                                Spacer()
                                Text("5 min")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                                    .padding(.bottom, 0)
                                    .padding(.top, 5)
                            }
                            
                            Text("Practice Swift data types basics through the editor by following the instructions")
                                .fontWeight(.regular)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .font(.body.weight(.regular))
                                .padding(.vertical, 4)
                                .padding(.bottom, 10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 18)
                    .padding(2)
                    .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                    .background(Color.white)
                    .cornerRadius(23)
                    .frame(width: .infinity, alignment: .center)
                    .padding(.horizontal, 20)
                .shadow(radius: 6)
                
                
                NavigationLink(destination: FuncParameter()) {
                    VStack {
                        HStack {
                            Text("Functions")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0)
                                .padding(.top, 10)
                            
                            Text("5 min")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding(.bottom, 0)
                                .padding(.top, 5)
                        }
                        
                        Text("Practice creating functions that take parameters in Swift")
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .font(.body.weight(.regular))
                            .padding(.vertical, 4)
                            .padding(.bottom, 10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                .background(Color.white)
                .cornerRadius(23)
                .frame(width: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .shadow(radius: 6)
                
                NavigationLink(destination: ArraySum()) {
                    VStack {
                        HStack {
                            Text("Array Sum")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0)
                                .padding(.top, 10)
                            
                            Text("2 min")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding(.bottom, 0)
                                .padding(.top, 5)
                        }
                        
                        Text("Create a function that calculates all the sum of all elements in an array")
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .font(.body.weight(.regular))
                            .padding(.vertical, 4)
                            .padding(.bottom, 10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                .background(Color.white)
                .cornerRadius(23)
                .frame(width: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .shadow(radius: 6)
                
                NavigationLink(destination: Challenge2()) {
                    VStack {
                        HStack {
                            Text("Reverse Array")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0)
                                .padding(.top, 10)
                            
                            Text("2 min")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding(.bottom, 0)
                                .padding(.top, 5)
                        }
                        
                        Text("Practice reversing the elements of an array in Swift")
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .font(.body.weight(.regular))
                            .padding(.vertical, 4)
                            .padding(.bottom, 10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                .background(Color.white)
                .cornerRadius(23)
                .frame(width: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .shadow(radius: 6)
                
                NavigationLink(destination: FizzBuzz()) {
                    VStack {
                        
                        HStack {
                            Text("FizzBuzz")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.bottom, 0)
                                .padding(.top, 15)
                            
                            Text("5 min")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding(.bottom, 0)
                                .padding(.top, 15)
                        }
                        
                        Text("Can you solve the classic must know problem found in multiple job interviews?")
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .font(.body.weight(.regular))
                            .padding(.vertical, 4)
                            .padding(.bottom, 7)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                .background(Color.white)
                .cornerRadius(23)
                .frame(width: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .shadow(radius: 6)
                
                Spacer()
            }
                }}
        }.navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct ChallengeFrame: View {
    let title: String
    let minutes: String
    let Description: String
    var view: AnyView //allows to navigate to a view
    var body: some View {
        
        NavigationLink(destination: view) {
            VStack {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 0)
                        .padding(.top, 15)
                    
                    Text(minutes)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .padding(.bottom, 0)
                        .padding(.top, 15)
                }
                
                Text(Description)
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    .multilineTextAlignment(.leading)
                    .font(.body.weight(.regular))
                    .padding(.vertical, 4)
                    .padding(.bottom, 7)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
            .padding(2)
            .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
            .background(Color.white)
            .cornerRadius(23)
            .frame(width: .infinity, alignment: .center)
            .padding(.horizontal, 20)
            .shadow(radius: 6)
        }
    }
}

struct SelectChallenge_Previews: PreviewProvider {
    static var previews: some View {
        SelectChallenge()
    }
}

