//
//  AttachPhotoViewController.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/8/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AttachPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var note : Note?
    
    lazy var imagePicker : UIImagePickerController = {
        
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.addChildViewController(picker)
        return picker
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(imagePicker.view)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        imagePicker.view.frame = view.bounds
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let note = note {
            note.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
