//
//  constant.swift
//  Fineminton
//
//  Created by Theresia Saputri on 06/09/22.
//

import Foundation
import SwiftUI

// custom color for hi-fi
let greyBackground = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
let darkGreyBackgound = Color(red: 0.11, green: 0.11, blue: 0.118)
let lightGreyBackgound = Color(red: 0.173, green: 0.173, blue: 0.181)
let orangeButton = Color("EF6817")
let greenRing = Color("49CC3B")
let blueRing = Color("35BBFF")
let whiteFont = Color("FFFFFF")


//extension to add custom color
extension Color {
  init?(_ hex: String) {
    var str = hex
    if str.hasPrefix("#") {
      str.removeFirst()
    }
    if str.count == 3 {
      str = String(repeating: str[str.startIndex], count: 2)
        + String(repeating: str[str.index(str.startIndex, offsetBy: 1)], count: 2)
        + String(repeating: str[str.index(str.startIndex, offsetBy: 2)], count: 2)
    } else if !str.count.isMultiple(of: 2) || str.count > 8 {
      return nil
    }
    let scanner = Scanner(string: str)
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    if str.count == 2 {
      let gray = Double(Int(color) & 0xFF) / 255
      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
    } else if str.count == 4 {
      let gray = Double(Int(color >> 8) & 0x00FF) / 255
      let alpha = Double(Int(color) & 0x00FF) / 255
      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
    } else if str.count == 6 {
      let red = Double(Int(color >> 16) & 0x0000FF) / 255
      let green = Double(Int(color >> 8) & 0x0000FF) / 255
      let blue = Double(Int(color) & 0x0000FF) / 255
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    } else if str.count == 8 {
      let red = Double(Int(color >> 24) & 0x000000FF) / 255
      let green = Double(Int(color >> 16) & 0x000000FF) / 255
      let blue = Double(Int(color >> 8) & 0x000000FF) / 255
      let alpha = Double(Int(color) & 0x000000FF) / 255
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    } else {
      return nil
    }
  }
}

//change ui color
func uicolorFromHex(rgbValue:UInt32)->UIColor{
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0

    return UIColor(red:red, green:green, blue:blue, alpha:1.0)
}



// Below codes were taken from KavSoft on Half Modal Tutorial
extension View{
    
    // Binding Show Variable...
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,@ViewBuilder sheetView: @escaping ()->SheetView,onEnd: @escaping ()->())->some View{
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(),showSheet: showSheet, onEnd: onEnd)
            )
            .onChange(of: showSheet.wrappedValue) { newValue in
                if !newValue{
                    onEnd()
                }
            }
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: ()->()
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
    
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
     
        if showSheet{
            
            if uiViewController.presentedViewController == nil{
                let sheetController = CustomHostingController(rootView: sheetView)
                sheetController.presentationController?.delegate = context.coordinator
                uiViewController.present(sheetController, animated: true)
            }
        }
        else{
            // closing view when showSheet toggled again...
            if uiViewController.presentedViewController != nil{
                uiViewController.dismiss(animated: true)
            }
        }
    }
    
    // On Dismiss...
    class Coordinator: NSObject,UISheetPresentationControllerDelegate{
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
        }
    }
}

// Custom UIHostingController for halfSheet....
class CustomHostingController<Content: View>: UIHostingController<Content>{
    
    override func viewDidLoad() {
                
        // setting presentation controller properties...
        if let presentationController = presentationController as? UISheetPresentationController{
            
            presentationController.detents = [
               .medium(),
               .large()
            ]
            // to show grab protion...
            presentationController.prefersGrabberVisible = true
        }
    }
}
