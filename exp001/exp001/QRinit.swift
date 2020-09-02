//
//  QRinit.swift
//  exp001
//
//  Created by sddivid on 2019/12/2.
//  Copyright © 2019 sddivid. All rights reserved.
//

import SwiftUI
//
//struct QRinit: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}



import CoreImage

struct QRinit: View {
    let qrCodeString = "BEGIN:VCARD \n" +
    "VERSION:2.1 \n" +
    "FN:John Peter \n" +
    "N:Peter;John \n" +
    "TITLE:Admin \n" +
    "TEL;CELL:+91 431 524 2345 \n" +
    "TEL;WORK;VOICE:+91 436 542 8374 \n" +
    "EMAIL;WORK;INTERNET:John@ommail.in \n" +
    "URL:www.facebook.com \n" +
    "URL: www.instagram.com \n" +
    "ADR;WORK:;;423 ofce sales Center;Newark;DE;3243;USA \n" +
    "ORG:xxx Private limited \n" +
    "END:VCARD"

    var body: some View {
        Image(uiImage: generateQRCode(from: qrCodeString)!)
    }
   
    func generateQRCode(from string: String) -> UIImage? {
   
        let data = string.data(using: String.Encoding.ascii)
        var uiImage: UIImage?
        if let filter = CIFilter(name: "CIQRCodeGenerator",
                                 parameters: ["inputMessage": data,
                                              "inputCorrectionLevel": "L"])
        {
   
            if let outputImage = filter.outputImage,
                let cgImage = CIContext().createCGImage(outputImage,
                                                        from: outputImage.extent) {
                let size = CGSize(width: outputImage.extent.width * 3.0,
                                  height: outputImage.extent.height * 3.0)
                UIGraphicsBeginImageContext(size)
                if let context = UIGraphicsGetCurrentContext() {
                    context.interpolationQuality = .none
                    context.draw(cgImage,
                                 in: CGRect(origin: .zero,
                                            size: size))
                    uiImage = UIGraphicsGetImageFromCurrentImageContext()
                }
                UIGraphicsEndImageContext()
            }
        }
        return uiImage
    }
}


struct QRinit_Previews: PreviewProvider {
    static var previews: some View {
        QRinit()
    }
}
