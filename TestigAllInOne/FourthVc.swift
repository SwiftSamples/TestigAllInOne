
import UIKit
import UniformTypeIdentifiers
import MobileCoreServices

class FourthVc: UIViewController, UIDocumentPickerDelegate {
    var attachmentFile: Data?
    var attachmentImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func pickBtn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (_) in            self.openCamera()
        }
        
        let action1 = UIAlertAction(title: "Image from gallary", style: .default) { (_) in
            // self.idType = .image
            //  self.didSelectIdPicker = true
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true)
        }
        
        let action2 = UIAlertAction(title: "PDF from file manager", style: .default) { (_) in
            //  self.idType = .pdf
            
            var documentPicker: UIDocumentPickerViewController!

            if #available(iOS 14, *) {
                     // iOS 14 & later
                     let supportedTypes: [UTType] = [UTType.pdf]
                     documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes)
                 } else {
                     // iOS 13 or older code
                     let supportedTypes: [String] = [kUTTypePDF as String]
                     documentPicker = UIDocumentPickerViewController(documentTypes: supportedTypes, in: .import)
                 }
            
    //        let supportedTypes: [UTType] = [UTType.pdf]
    //
    //        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
           
            
            
//            let supportedTypes: [UTType] = [UTType.pdf]
//
//            let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
            documentPicker.delegate = self
            self.present(documentPicker, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionCamera)

        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(cancel)
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = sender.bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        present(alert, animated: true)
        
    }
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
             let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
          //  self.isCameraMode = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let pdfURL = urls.first else { return }
        let data = try! Data(contentsOf: pdfURL)
       
        attachmentFile = data
        print("sifhisdhgjhdi \(pdfURL) jshgjdfhjgbdfjk \(data)")
    }
    
    
}



extension FourthVc: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {

          //  attachedImage = imageData
            attachmentImage = pickedImage
            print("sdgjkdhjgkhdjkk \(pickedImage)")
            picker.dismiss(animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
