//
//  AddItemViewController.swift
//  GroceryDataImages
//
//  Created by Giorgio Natili on 11/14/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: UI elements
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var category: UIPickerView!
    
    // MARK: data
    var dataManager:DataManager!
    private var pickerDataSource:[String]!
    
    // MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pickerDataSource = GroceryItem.categories
        
        category.dataSource = self
        category.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerViewDataSource implementation
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataSource.count;
    
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return pickerDataSource[row]
        
    }
    
    // MARK: User interactions
    @IBAction func saveItem(sender: AnyObject) {
        
        guard name.text?.characters.count > 0 else {
            return
        }
        
        dataManager.addItem(name.text!, category: currentCategory())
        
        navigationController!.popViewControllerAnimated(true)
        
    }
    
    // MARK: Data management
    private func currentCategory() -> Int {
        
        return category.selectedRowInComponent(0)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
