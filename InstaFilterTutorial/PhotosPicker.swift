//
//  PhotosPicker.swift
//  InstaFilterTutorial
//
//  Created by Danjuma Nasiru on 12/02/2023.
//

import SwiftUI

struct PhotosPicker: View {
    
    @State private var image: Image?
    @State private var inputImage : UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
            
            Button("Save image"){
                guard let inputImage = inputImage else {
                    return
                }
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage, perform: {_ in loadImage()})
        
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        
        image = Image(uiImage: inputImage)

    }
}

struct PhotosPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPicker()
    }
}
