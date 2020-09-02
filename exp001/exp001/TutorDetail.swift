//
//  TutorDetail.swift
//  exp001
//
//  Created by sddivid on 2019/11/28.
//  Copyright © 2019 sddivid. All rights reserved.
//

import SwiftUI

struct TutorDetail: View {
    var name: String
    var headline: String
    var bio: String
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Divider()

            Image(name)
             .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.orange, lineWidth: 4)
            )
            .shadow(radius: 10)
//            Divider()

            Text(name)
                           .font(.title)
                       Text(headline).font(.subheadline)
            Divider()

                       Text(bio).font(.headline)
                       .multilineTextAlignment(.center)
                        .lineLimit(50)
                
        }
    }
}
#if DEBUG

struct TutorDetail_Previews: PreviewProvider {
    static var previews: some View {
//        TutorDetail()
        TutorDetail(name: "Simon Ng", headline: "Founder of AppCoda", bio: "Founder of AppCoda. Author of multiple iOS programming books including Beginning iOS 12 Programming with Swift and Intermediate iOS 12 Programming with Swift. iOS Developer and Blogger.")

    }
}
#endif
