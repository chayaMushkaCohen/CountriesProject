//
//  CountryDetailsViewController.swift
//  MatrixCountriesProjectCohenChayaMushka
//
//  Created by hyperactive on 07/06/2021.
//  Copyright © 2021 hyperactive. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var nativeName: UILabel!
    @IBOutlet weak var neighboringCountries: UILabel!
    
    @IBOutlet weak var returnButton: UIButton!
    
    var countryIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        setViewLabels()
        setNeighboringCountriesLabelText()
        setReurnButton()
        
        
    }
    
    func setViewLabels() {
        setNameLabel()
        setNativeNameLabel()
        setNeighboringCountriesLabel()
    }
    
    func setNameLabel() {
        name.frame = CGRect(x: 10, y: 50, width: view.bounds.width - 20, height: view.bounds.height / 6)
        name.adjustsFontSizeToFitWidth = true
        name.textAlignment = .center
        //print(countries.count)
        name.text = "country name: \(countries[countryIndex].name)"
        
    }
    
    func setNativeNameLabel() {
        nativeName.frame = CGRect(x: 10, y: 50 + name.bounds.height + 10, width: view.bounds.width - 20, height: view.bounds.height / 6)
        nativeName.adjustsFontSizeToFitWidth = true
        nativeName.textAlignment = .center
        nativeName.text = "country native name: \(countries[countryIndex].nativeName)"
    }
    
    func setNeighboringCountriesLabel() {
        neighboringCountries.frame = CGRect(x: 10, y: 50 + name.bounds.height + nativeName.bounds.height + 20, width: view.bounds.width - 20, height: (view.bounds.height / 6) * 2)
        neighboringCountries.adjustsFontSizeToFitWidth = true
        neighboringCountries.textAlignment = .center
        
    }
    
    func setReurnButton() {
        returnButton.backgroundColor = .lightGray
        returnButton.addTarget(self, action: #selector(returnToCountriesTable), for: .touchUpInside)
        returnButton.frame = CGRect(x: view.bounds.width / 2 - 15, y: view.bounds.height - 70, width: 50, height: 50)
        returnButton.titleLabel?.adjustsFontSizeToFitWidth = true
        returnButton.layer.cornerRadius = 0.5 * returnButton.bounds.width
        returnButton.setTitleColor(.black, for: .normal)
        
    }
    
    @objc func returnToCountriesTable() {
         performSegue(withIdentifier: "countries", sender: self)
        
    }
    
    func setNeighboringCountriesLabelText() {
        if countries[countryIndex].borders.count != 0 {
            print(countries[countryIndex].borders.count)
            var fullNameNeighboringCountry: [Country] = []
            
            for border in countries[countryIndex].borders {
                for country in countries {
                    if country.alphaCode == border {
                        fullNameNeighboringCountry.append(country)
                    }
                }
            }
            neighboringCountries.numberOfLines = fullNameNeighboringCountry.count * 3 + 2
            var neighboringCountryString = "Neighboring countries:\r\r"
            for fullNeighboringCountryName in fullNameNeighboringCountry {
                neighboringCountryString += "* name: \(fullNeighboringCountryName.name),  native name: \(fullNeighboringCountryName.nativeName)\r"
            }

            neighboringCountries.text = neighboringCountryString
        }
        else {
            neighboringCountries.text = ""

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
