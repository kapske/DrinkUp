//
//  ContentView.swift
//  Shared
//
//  Created by Nick Andrisin and Mark Kapuscinski on 4/12/21.
//
	
import SwiftUI

// Read Prompt Text File and Encode it to an Array
import Foundation
let path = Bundle.main.path(forResource: "promptList", ofType: "txt")!
let text = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
let prompts = text.components(separatedBy: CharacterSet.newlines)
var cleanPrompts = prompts.filter(){$0 != ""}
var tempPrompts = cleanPrompts

var allNames: [String] = ["","","","","","","",""]
var cleanNames: [String] = []


struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    // Store Player's Names
    @State private var player1 = ""
    @State private var player2 = ""
    @State private var player3 = ""
    @State private var player4 = ""
    @State private var player5 = ""
    @State private var player6 = ""
    @State private var player7 = ""
    @State private var player8 = ""

    var body: some View {

            VStack{
                
                // Top Logo
                Image("Logo")
                    .padding(.top, 50.0)
                    .padding(.bottom, 20.0)
                    

                // Player Name Entry
                VStack{
                    
                    Text("Players")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 2, x: 0.0, y: 2.0)
                    
                    ScrollView{
                        
                        TextField("Name", text:$player1)
                            .font(.title)
                            .disableAutocorrection(true)
                                            
                        TextField("Name", text: $player2)
                            .font(.title)
                            .disableAutocorrection(true)

                        TextField("Name", text: $player3)
                            .font(.title)
                            .disableAutocorrection(true)
                        
                        TextField("Name", text:$player4)
                            .font(.title)
                            .disableAutocorrection(true)
                                            
                        TextField("Name", text: $player5)
                            .font(.title)
                            .disableAutocorrection(true)
                        
                        TextField("Name", text: $player6)
                            .font(.title)
                            .disableAutocorrection(true)
                        
                        TextField("Name", text: $player7)
                            .font(.title)
                            .disableAutocorrection(true)
                        
                        TextField("Name", text: $player8)
                            .font(.title)
                            .disableAutocorrection(true)
                    }
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height:240)
                    
                }
                

                
                // Play Button
                Button(action: {
                    allNames[0] = player1
                    allNames[1] = player2
                    allNames[2] = player3
                    allNames[3] = player4
                    allNames[4] = player5
                    allNames[5] = player6
                    allNames[6] = player7
                    allNames[7] = player8
                    if (player1 == "" && player2 == "" && player3 == "" && player4 == "" && player5 == "" && player6 == "" && player7 == "" && player8 == ""){
                        // Implement no name notification
                    }
                    else {
                        cleanNames = allNames.filter(){$0 != ""}
                        withAnimation {
                        viewRouter.currentPage = .page2
                        }
                    }
                    tempPrompts = cleanPrompts
                    tempPrompts.shuffle()
                }) {
                    
                    Text("   Play   ")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.white)
                        .font(.largeTitle)
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 3, x: 0.0, y: 3.0)
                        
                }
                .padding(.bottom, 80.0)
                .padding(.top, 80.0)
                
        }
        
        // Background Color
        .padding(.all, 60)
            .background(Color(red: 0.67, green: 0.85, blue: 0.90, opacity: 1.0))
            .ignoresSafeArea()
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
}
