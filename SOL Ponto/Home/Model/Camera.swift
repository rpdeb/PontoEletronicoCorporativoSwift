//
//  swift
//  SOL Ponto
//
//  Created by Sósthenes Oliveira Lima on 02/10/23.
//

import Foundation
import UIKit

protocol CameraDelegate: AnyObject {
    func didSelecFoto(_ image: UIImage)
}

class Camera: NSObject {
    
    weak var delegate: CameraDelegate?
    
    func abrirCamera(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing =  true
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = UIImagePickerController.isCameraDeviceAvailable(.front) ? .front : .rear
        
        controller.present(imagePicker, animated: true, completion: nil)
    }
    
    func abrirBibliotecaFotos(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        controller.present(imagePicker, animated: true, completion: nil)
    }
}
    extension Camera: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            picker.dismiss(animated: true)
            guard let foto = info[.editedImage] as? UIImage else {return}
        
            delegate?.didSelecFoto(foto)
        }
    
}
