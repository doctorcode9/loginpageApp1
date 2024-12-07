//
//  ContentView.swift
//  loginpageApp
//
//  Created by Mouheb on 01.12.24.
//

import SwiftUI
import SwiftData
import UIKit
struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var rememberMe: Bool = false
    var body: some View {
        
        ZStack{
            // let's add the decoration
            Color.black
                           .edgesIgnoringSafeArea(.all)
            Circle()
                           .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                           .frame(width: 300, height: 300)
                           .position(x: 100, y: 150)
                           .opacity(0.4)
                           .blur(radius: 50)
            

                       Circle()
                           .fill(LinearGradient(gradient: Gradient(colors: [.pink, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                           .frame(width: 250, height: 250)
                           .position(x: 250, y: 500)
                           .opacity(0.3)
                           .blur(radius: 50)
            VStack{
                // Engaging Welcome Message
                           VStack(alignment: .leading, spacing: 10) {
                               Text("Welcome Back!")
                                   .font(.largeTitle)
                                   .fontWeight(.bold)
                                   .foregroundColor(.blue)
                               
                               Text("Login to continue to your account")
                                   .font(.subheadline)
                                   .foregroundStyle(.white)
                           }
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .padding(.horizontal)
                Spacer()
                VStack{
                    // Email Field
                    StyledTextField(hint: "Email", text: $email).padding(.horizontal)
                    
                    
                    // Password Field
                    StyledTextField(hint: "Password", text: $password,isSecure: true).padding(.horizontal).padding(.bottom, 20)
                    HStack {
                        Toggle(isOn: $rememberMe) {
                                       Text("Remember Me")
                                           .foregroundColor(.gray)
                                           .font(.footnote)
                                   }
                                   .toggleStyle(CheckboxToggleStyle())
                               }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    // Sign Up Button
                               Button(action: {}) {
                                   Text("Sign Up")
                                       .bold()
                                       .frame(maxWidth: .infinity)
                                       .padding()
                                       .background(Color.blue)
                                       .foregroundColor(.white)
                                       .cornerRadius(10)
                               }
                               .padding(.horizontal)
                    // Forgot Password
                               Button(action: {
                                   // Forgot password action
                               }) {
                                   Text("Forgot your password?")
                                       .font(.footnote)
                                       .foregroundColor(.blue)
                               }
                }
          
                Spacer()
                // Signup Option
                           HStack {
                               Text("Don’t have an account?")
                                   .font(.footnote)
                                   .foregroundColor(.gray)
                               Button(action: {
                                   // Navigate to Signup
                               }) {
                                   Text("Sign Up")
                                       .font(.footnote)
                                       .foregroundColor(.blue)
                               }
                           }
            }
        }
               
                   
    }
    
               
    
}


// styling the textfield
struct StyledTextField: View {
    var hint: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 60)
                
               
            
            // Text Field
            if isSecure {
                SecureField(hint, text: $text,prompt: Text(hint).foregroundColor(Color.white.opacity(0.6)))
                    .padding(.horizontal, 15)
                    .foregroundColor(Color.white)
                    
                    
            } else {
                TextField(hint, text: $text, prompt: Text(hint).foregroundColor(Color.white.opacity(0.6)))
                    .padding(.horizontal, 15)
                    .foregroundColor(Color.white)
                    
                
            }
        }
    }
}

// Checkbox Toggle Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
}

#Preview {
    ContentView()
}
