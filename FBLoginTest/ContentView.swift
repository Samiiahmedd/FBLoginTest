
//  ContentView.swift
//  FBLoginTest
//
//  Created by Sami Ahmed on 24/10/2023.


import SwiftUI
import FBSDKLoginKit

struct ContentView: View {
    var body: some View{
        Home()

    }

    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
    struct Home : View {
        //setting App Storage UserDeafult
        @AppStorage ("logged") var logged = false
        @AppStorage ("email") var email = ""
        @State var manager = LoginManager()
        var body: some View {
            VStack(spacing: 25){


                //login button
                Button {
                    //if logged means logout
                    if logged{
                        manager.logOut()
                        email = ""
                        logged = false
                    }
                    else{
                        //logged in user
                        //you can give  any premissions
                        //im reading profile and email
                        manager.logIn(permissions: ["public_profile","email"], from: nil) { result, err in
                            if err != nil{
                                print(err!.localizedDescription)
                                return
                            }
                       //check if user cancalled the flow
                            if !result!.isCancelled{
                                //  logged in

                                logged = true

                                //getting user details using fb graph request

                                let request = GraphRequest(graphPath: "me",parameters: ["fields":"email"])
                                
                                request.start { _, res, _ in
                                    
                                    //will return dictionary

                                    guard let profileData = res as? [String : Any] else{return}
                                    //saving email...
                                    email = profileData["email"] as! String
                                }
                                }
                                
                                
                                
                            }
                        }
                    
                } label: {
                    Text(logged ? "Logout" : "FB Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,35)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                Text (email)
                    .fontWeight(.bold)
                //to return me !!!
                NavigationLink(
                                    destination: loggedInView(), // Navigate to LoggedInView
                                    isActive: $logged, // Activate the link when 'logged' is true
                                    label: {
                                        //?????
                                    }
                                )
                            }
                        }
                    }
