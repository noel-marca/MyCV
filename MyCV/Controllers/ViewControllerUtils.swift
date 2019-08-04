//
//  ViewControllerUtils.swift
//  MyCV
//
//  Created by MIguel Martinez on 8/3/19.
//  Copyright © 2019 Noel MIguel Martinez. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerUtils {
    // MARK: ActivityIndicator
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicator(uiView: UIView, color: UIColor) -> UIView {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor.clear
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.clear
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = color
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        activityIndicator.startAnimating()
        return container
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    //MARK: Color
    
    func UIColorFromHex(hexString: String, alpha: Double)->UIColor {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let alpha, red, green, blue: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            break
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            break
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            break
        default:
            (alpha, red, green, blue) = (0, 0, 0, 0)
            break
        }
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
    }
    
    //MARK: Datos
    
    enum Files: String {
        case PersonalInformation = "PersonalInformation"
        case AcademicDataInformation = "AcademicDataInformation"
        case CertificationsInformation = "CertificationsInformation"
        case InformationSkills = "InformationSkills"
        case WorkExperienceInformation = "WorkExperienceInformation"
    }
    
    func getdatos(tag: Files) -> NSArray {
        let fileName = tag.rawValue
        let jsonFile = Bundle.main.path(forResource: fileName, ofType: "json")
        let jsonData = NSData.init(contentsOfFile: jsonFile!)! as Data
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? NSDictionary
        let array = dict?.object(forKey: "arrayOfObjects") as! NSArray
        return array;
    }
}
