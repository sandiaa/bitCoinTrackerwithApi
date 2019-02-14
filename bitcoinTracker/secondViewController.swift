//
//  secondViewController.swift
//  bitcoinTracker
//
//  Created by Admin on 07/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class secondViewController: UIViewController {
    var countryChosen : String = ""
    var currency : String = ""
    var curSymbol : String = ""
    var rate : Float = 0.0
    let heads : [String : String] = ["X-Testing": "testing"]
    let baseURL : String = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD/changes"
    //"https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    var finalURL : String = ""
    let publicKey : String = "Yjk3NjZjNmRhMmM1NDA2MWIyYTFlZjY3OGIyNmI5M2Y"
    let privateKey : String = "M2YyNjVjMGZlNTcyNDg5MDg1YmY2NWU5M2RiOGMyNDk3NDU3MDExMzRiMzA0MTUwODkyOGNkNGJlNzkwNTg4MA"
    @IBOutlet weak var bitcoinRate: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        country.text = "You have chosen \(countryChosen)"
        curSymbol = currencySymbol(country : countryChosen)
        finalURL = baseURL
        print(finalURL)
        getCurrencyRate(url: finalURL)
    }
    
    func currencySymbol(country : String) -> String{
        let symbol : String = "USD"
        return symbol
    }
  
    func getCurrencyRate(url : String)
    {
       // Alamofire.request(url, method: .get).responseJSON {
        Alamofire.request(url, method: .get,headers: heads).responseJSON {
        response in
            if response.result.isSuccess {
                
                print("Success! Got the currency rate")
                let rateJSON : JSON = JSON(response.result.value!)
                print(rateJSON)
                updateUI(value: rateJSON)
                
                }
            else {
                print("Error \(String(describing: response.result.error))")
                
            }
        }
        
        func updateUI(value : JSON){
            let vol : String = value["averages"]["day"].stringValue
            print(vol)
            bitcoinRate.text = vol
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
