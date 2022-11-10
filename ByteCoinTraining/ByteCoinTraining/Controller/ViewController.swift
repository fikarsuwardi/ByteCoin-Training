//
//  ViewController.swift
//  ByteCoinTraining
//
//  Created by Zulfikar Abdul Rahman Suwardi on 07/11/22.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var bitcoinLabel: UILabel!
  @IBOutlet weak var currencyLabel: UILabel!
  @IBOutlet weak var currencyPicker: UIPickerView!
  
  var coinManager = CoinManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    coinManager.delegate = self
    currencyPicker.dataSource = self
    currencyPicker.delegate = self
  }
  
  //  func numberOfComponents(in pickerView: UIPickerView) -> Int {
  //    return 1
  //  }
  //
  //  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
  //    coinManager.currencyArray.count
  //  }
  //
  //
  //  func didUpdateCoin(price: String, currency: String) {
  //    DispatchQueue.main.async {
  //      // ini yang muncul pertama kali di halaman depan
  //      self.bitcoinLabel.text = price
  //      self.currencyLabel.text = currency
  //    }
  //  }
  //
  //  func didFailWithError(error: Error) {
  //    print(error)
  //  }
}

//MARK: - UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    coinManager.currencyArray.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return coinManager.currencyArray[row]
  }
  
  // fungsi yang bekerja saat kita memilih salah satu picker
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectedCurrency = coinManager.currencyArray[row]
    coinManager.getCoinPrice(for: selectedCurrency)
  }
  
}

//extension ViewController: UIPickerViewDelegate {
//
//}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
  func didUpdateCoin(price: String, currency: String) {
    DispatchQueue.main.async {
      // ini yang muncul pertama kali di halaman depan
      self.bitcoinLabel.text = price
      self.currencyLabel.text = currency
    }
  }
  
  func didFailWithError(error: Error) {
    print(error)
  }
}

