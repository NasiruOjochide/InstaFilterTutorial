//
//  ImageSaver.swift
//  InstaFilterTutorial
//
//  Created by Danjuma Nasiru on 13/02/2023.
//

import Foundation
import UIKit

class ImageSaver : NSObject{
    func writeToPhotoAlbum(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        print("Save finished")
    }
}
