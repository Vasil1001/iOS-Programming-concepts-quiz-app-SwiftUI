//
//  FuncParameter.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 29/04/2022.
//

import SwiftUI

struct FuncParameter: View {
    @State var counter: Int = 0
    @State var startCount = false
    
    @State var showAnswer = false
    @State var showCodeEditor = false
    
    @State var countTo: Int = 0
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            VStack{
                
                VStack {
                    Text("Functions with parameters")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 0)
                        .padding(.top, 15)
                    
                    Divider()
                    Text("Instructions")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 0)
                        .padding(.top, 15)
                    
                    Text("Functions can take parameters to allow reusability in code\n\nCreate a function that takes 2 numbers as parameters, and call it to calculate values")
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)

                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
                    
                    HStack {
                        NavigationLink(destination: FuncParameterEditor()) {
                                HStack{
                                    Text("Code Editor")
                                        .font(.title2.weight(.heavy))
                                        .foregroundColor(.white)
                                    
                                    Image(systemName: "play.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 24, weight: .heavy))
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 1)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(12)
                        }
                        
                    Button(action: {
                        showAnswer.toggle()
                    }, label: {
                        HStack{
                            Text("Answer")
                                .font(.body.weight(.bold))
                                .foregroundColor(.white)
                        }
                        .frame(height: 30)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                        .background(Color(red: 0.12, green: 0.2417, blue: 0.34))
                        .cornerRadius(12)
                        }
                    )
                    }
                    .padding(.bottom, 15)

                }
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                .background(Color.white)
                .cornerRadius(23)
                .frame(width: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .shadow(radius: 30, y: 15)
                
                Spacer()
                
                Button(action: {
                    startCount = true
                    countTo = 300 //change this to change challenge time
                }, label: {
                    Text("Start 5 min timer when ready!")
                        .foregroundColor(.white)
                })
                
                ZStack{
                    ProgressTrack()
                    TimerProgressBar(counter: counter, countTo: countTo)
                    Clock(counter: counter, countTo: countTo)
                }
            }.onReceive(timer) { time in
                if (self.counter < self.countTo) {
                    self.counter += 1
                }
            }
        }
        .navigationBarTitle("Challenge")
        .navigationBarTitleDisplayMode(.inline)
        
        .popup(isPresented: $showAnswer,type: .toast, position: .bottom, animation: .easeIn, closeOnTap: true) {
            ZStack {
                Color(red: 0.12, green: 0.2417, blue: 0.34)
                    .ignoresSafeArea()
                VStack {
                    Text("Function parameter solution")
                        .padding(.top, 30)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Tap on sheet to dismiss")
                        .padding(.top, 30)
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Image("FuncParameter")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Spacer()
                }
            }
            .shadow(color: .black, radius: 10)
            .navigationBarTitle("Challenge")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FuncParameter_Previews: PreviewProvider {
    static var previews: some View {
        FuncParameter()
    }
}
