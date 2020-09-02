//
//  QRCodeScan.swift
//  exp001
//
//  Created by sddivid on 2019/12/2.
//  Copyright © 2019 sddivid. All rights reserved.
//

import SwiftUI

//struct QRCodeScan: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct QRCodeScan_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScan()
    }
}


struct QRCodeScan: UIViewControllerRepresentable {

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> ScannerViewController {
        let vc = ScannerViewController()
        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ vc: ScannerViewController, context: Context) {
    }

    class Coordinator: NSObject, QRCodeScannerDelegate {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        func codeDidFind(_ foundCode: String) {
            print(foundCode)
            /*this is where the code comes to, need to return it from here */
            presentationMode.wrappedValue.dismiss()
        }

        var parent: QRCodeScan

        init(_ parent: QRCodeScan) {
            self.parent = parent
        }

    }
}
