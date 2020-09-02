//
//  ContentView.swift
//  exp001
//
//  Created by sddivid on 2019/11/28.
//  Copyright © 2019 sddivid. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
struct ContentView: View {

    var tutors: [Tutor] = []

    var body: some View {
        VStack {
            NavigationView {

            List(tutors) { tutors in
                TutorCellBtnMap(tutors: tutors)
            }.navigationBarTitle(Text("揪團打怪成員"))
                }
//            ScrollView()
//            Text("Simon Ng")
//            Text("Placeholder")
//            Text("Hello, World!")
            HStack {
                Text("按下按鈕")
                Text("開啟QRcode")
                Text("掃描器")
            }
            .padding(.vertical)
            
//            VStack {
//                Text("Simon Ng")
//                Text("Placeholder")
//                Text("Hello, World!")
//
//            }
//            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
//                Image(systemName: "photo")
//                    .padding(.all, 20.0)
//                VStack(alignment: .leading) {
//                    Text("Simon Ng")
//                    Text("Founder of AppCoda")
//                        .font(.subheadline)
//                        .foregroundColor(Color.gray)
//                        .padding(.top, 5.0)
//                }
//            }
            
//  ScrollView(.horizontal, showsIndicators: false) {
//      HStack {
//           Text("Simon Ng")
//           Text("Simon Ng")
//           Text("Simon Ng")
//           Text("Simon Ng")
//
//      }
//
//  }
Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("加入新成員")
            }
.padding(.vertical, 5.0)
        
.padding(.horizontal)
     .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
//.border(Color.black, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .cornerRadius(30)
.foregroundColor(Color.white)
            
    .font(.headline)

            
            HStack {
            Image(systemName: "link")
            
            Text("Powered by ")
                      Text("DaYuan.Dev")

            }
            

            
           

        }
        
    }
}
    

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //2
        ContentView(tutors: testData)
    }
}
#endif

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//

struct TutorCellBtnMap: View {
    let tutors: Tutor

//    var body: some View {
//        NavigationLink(destination: Text(tutors.name)) {
//            Image(tutors.imageName)
//                .frame(width: nil)
//                .cornerRadius(40)
//                .padding(.all, 10)
//            VStack(alignment: .leading) {
//                Text(tutors.name)
//                Text(tutors.headline)
//                    .font(.subheadline)
//                    .foregroundColor(Color.gray)
//                    .padding(.top, 5.0)
//            }
//        }
//    }
    
    var body: some View {
        return NavigationLink(destination: TutorDetail(name: tutors.name, headline: tutors.headline, bio: tutors.bio)) {
            Image(tutors.imageName)
                      .frame(width: nil)
                      .cornerRadius(40)
                      .padding(.all, 10)
                  VStack(alignment: .leading) {
                      Text(tutors.name)
                      Text(tutors.headline)
                          .font(.subheadline)
                          .foregroundColor(Color.gray)
                          .padding(.top, 5.0)
                  }
        }
    }
}
