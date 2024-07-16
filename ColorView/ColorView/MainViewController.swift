//
//  MainViewController.swift
//  ColorView
//
//  Created by imac-1681 on 2024/7/12.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    // MARk: - IBOutlet
    @IBOutlet var redslider: UISlider!
    @IBOutlet  var greenslider: UISlider!
    @IBOutlet  var blueslider: UISlider!
    @IBOutlet var VIEW: UIView!
    
    @IBOutlet var redtextfield: UITextField!
    @IBOutlet var greentextfield: UITextField!
    @IBOutlet var bluetextfield: UITextField!
    
    
    // MARK: - Proprtty
    
    var result: Float = 0

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redtextfield.delegate = self
        greentextfield.delegate = self
        bluetextfield.delegate = self
    }
   
    // MARK: - UI Setting
 
    // MARK: - IBAction
    @IBAction func redslider(_ sender: UISlider) {
           redtextfield.text = "\(Int(sender.value))"
        // 邊拉邊改變 Slider 顏色，由左至右
                   sender.minimumTrackTintColor = UIColor(red: CGFloat(redslider.value/255),
                                                          green: 0,
                                                          blue: 0,
                                                          alpha: 1)
        // 邊拉邊改變 Slider 圓圈顏色，由左至右
                   sender.thumbTintColor = UIColor(red: CGFloat(redslider.value/255),
                                                   green: 0,
                                                   blue: 0,
                                                   alpha: 1)
                   VIEW.backgroundColor = UIColor(red: CGFloat(redslider.value/255),
                                                  green: CGFloat(greenslider.value/255),
                                                  blue: CGFloat(blueslider.value/255),
                                                  alpha: 1)
       }
    
    @IBAction func greenslider(_ sender: UISlider) {
           greentextfield.text = "\(Int(sender.value))"
                   sender.minimumTrackTintColor = UIColor(red: 0,
                                                          green: CGFloat(greenslider.value/255),
                                                          blue: 0,
                                                          alpha: 1)
        
                   sender.thumbTintColor = UIColor(red: 0,
                                                   green: CGFloat(greenslider.value/255),
                                                   blue: 0,
                                                   alpha: 1)
        
                   VIEW.backgroundColor = UIColor(red: CGFloat(redslider.value/255),
                                                  green: CGFloat(greenslider.value/255),
                                                  blue: CGFloat(blueslider.value/255),
                                                  alpha: 1)
       }
    
    @IBAction func blueslider(_ sender: UISlider) {
           bluetextfield.text = "\(Int(sender.value))"
        // 邊拉邊改變 Slider 顏色，由左至右
                  sender.minimumTrackTintColor = UIColor(red: 0,
                                                         green: 0,
                                                         blue: CGFloat(blueslider.value/255), alpha: 1)
        // 邊拉邊改變 Slider 圓圈的顏色
                  sender.thumbTintColor = UIColor(red: 0,
                                                  green: 0,
                                                  blue: CGFloat(blueslider.value/255), alpha: 1)
        
                  VIEW.backgroundColor = UIColor(red: CGFloat(redslider.value/255),
                                                 green: CGFloat(greenslider.value/255),
                                                 blue: CGFloat(blueslider.value/255),
                                                 alpha: 1)
       }
    @IBAction func redtextfield(_ sender: UITextField) {
        if let redStringValue = redtextfield.text{
                    if let redIntValue = Int(redStringValue){
                        if redIntValue > 255 {
                            redtextfield.text = "\(255)"
                        }
                        redslider.setValue(Float(redIntValue), animated: true)
                    }
                }
        VIEW.backgroundColor = UIColor(red: CGFloat(redslider.value/255),
                                       green: CGFloat(greenslider.value/255),
                                       blue: CGFloat(blueslider.value/255),
                                       alpha: 1)
        }
  
     @IBAction func greentextfield(_ sender: UITextField) {
         if let greenStringValue = greentextfield.text{
                     if let greenIntValue = Int(greenStringValue){
                         if greenIntValue > 255 {
                             greentextfield.text = "\(255)"
                         }
                         greenslider.setValue(Float(greenIntValue), animated: true)
                     }
                 }
            VIEW.backgroundColor = UIColor(red: CGFloat(redslider.value/255),
                                           green: CGFloat(greenslider.value/255),
                                           blue: CGFloat(blueslider.value/255),
                                           alpha: 1)
        }
  
     @IBAction func bluetextfield(_ sender: UITextField) {
         if let blueStringValue = bluetextfield.text{
                     if let blueIntValue = Int(blueStringValue){
                         if blueIntValue > 255 {
                             bluetextfield.text = "\(255)"
                         }
                         blueslider.setValue(Float(blueIntValue), animated: true)
                     }
                 }
            VIEW.backgroundColor = UIColor(red: CGFloat(redslider.value/255),
                                           green: CGFloat(greenslider.value/255),
                                           blue: CGFloat(blueslider.value/255),
                                           alpha: 1)
        }
    // MARK: - Function
    
    //限制只能輸入數字(0~9)，不能輸入特殊符號
    func textFieldValueToSliderValue(_ textField : UITextField,shouldChangeCharactersIn range : NSRange, replacementString string : String) -> Bool {
        let length = string.lengthOfBytes(using: String.Encoding.utf8)
        for loopIndex in 0..<length{
            let char = (string as NSString).character(at: loopIndex)
            if char < 48{
                textField.text = "0"
                return false
            }
            if char > 57{
                textField.text = "0"
                return false
            }
        }
        return true
    }
    
    // 結束編輯 把鍵盤隱藏起來
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
  

// MARK: - Extensions
