//
//  ViewController.swift
//  muranakaKadai5
//
//  Created by 村中令 on 2021/09/22.
//
import UIKit

private enum ErrorMessage {
    static let nonNum1 = "割られる数を入力してください"
    static let nonNum2 = "割る数を入力してください"
    static let zeroNum2 = "割る数には、０を入力しないで下さい"
}

private enum ValidationResult {
    case valid(Int, Int)
    case invalid(String)
}

class ViewController: UIViewController {
    @IBOutlet private weak var calculationLabel: UILabel!
    @IBOutlet private weak var num1TextField: UITextField!
    @IBOutlet private weak var num2TextField: UITextField!

    @IBAction private func calculationButton(_ sender: Any) {
        switch validate() {
        case let .invalid(message):
            presentAlert(errormessage: message)
        case let .valid(num1, num2):
            let result = calculate(num1: num1, num2: num2)
            calculationLabel.text = String(result)
        }
    }

    private func validate() -> ValidationResult {
        let num1 = Int(num1TextField.text ?? "")
        let num2 = Int(num2TextField.text ?? "")

        switch (num1, num2) {
        case (nil, _):
            return .invalid(ErrorMessage.nonNum1)
        case (_?, nil):
            return .invalid(ErrorMessage.nonNum2)
        case (_?, 0):
            return .invalid(ErrorMessage.zeroNum2)
        case (let num1?, let num2?):
            return .valid(num1, num2)
        }
    }

    private func presentAlert(errormessage: String) {
        let alert = UIAlertController(title: "課題５", message: "\(errormessage)", preferredStyle: .alert)
        let textAlert = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        alert.addAction(textAlert)
        present(alert, animated: true, completion: nil)
    }

    private func calculate(num1: Int, num2: Int) -> Int {
        num1 / num2
    }
}
