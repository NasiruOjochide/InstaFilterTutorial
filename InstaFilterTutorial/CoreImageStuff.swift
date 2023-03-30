//
//  CoreImageStuff.swift
//  InstaFilterTutorial
//
//  Created by Danjuma Nasiru on 12/02/2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageStuff: View {
    
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        
        
    }
    
    func loadImage() {
        //image = Image("Example")
        
        guard let inputImage = UIImage(named: "Example") else{
            return
        }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        //let currentFilter = CIFilter.sepiaTone()
        let currentFilter = CIFilter.pixellate()
        //let currentFilter = CIFilter.crystallize()
        //let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        
        
        //currentFilter.intensity = 1
        //currentFilter.scale = 100
        //currentFilter.radius = 50
        //currentFilter.radius = 1000
        //currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        
        if inputKeys.contains(kCIInputIntensityKey){
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 100 , forKey: kCIInputScaleKey) }
        
        
        guard let outputImage = currentFilter.outputImage else{
            return
        }
        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent){
            let uiImg = UIImage(cgImage: cgImg)
            image = Image(uiImage: uiImg)
        }
    }
}

struct CoreImageStuff_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageStuff()
    }
}
