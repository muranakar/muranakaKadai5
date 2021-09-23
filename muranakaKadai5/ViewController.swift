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

class ViewController: UIViewController {
    @IBOutlet private weak var calculationLabel: UILabel!
    @IBOutlet private weak var num1TextField: UITextField!
    @IBOutlet private weak var num2TextField: UITextField!

    @IBAction private func calculationButton(_ sender: Any) {
        errorMessageCheck()
        // ↑↑↑（上記）のメソッドのアラートの処理が一つでも、行われた場合に、
        // ↓↓↓（下記）のメソッドを行わないようにする処理方法がわかりませんでした。
        // わからなかったので、calculationLabelに「""」を入れています。
        guard let calculate = calculate() else {
            calculationLabel.text = ""
            return
        }
        calculationLabel.text = String(calculate)
    }

    private func errorMessageCheck() {
        let num1 = Int(num1TextField.text ?? "")
        let num2 = Int(num2TextField.text ?? "")
        if num1 == nil {
            message(errormessage: ErrorMessage.nonNum1)
        } else if num2 == nil {
            message(errormessage: ErrorMessage.nonNum2)
        } else if num2 == 0 {
            message(errormessage: ErrorMessage.zeroNum2)}
    }

    private func message(errormessage: String) {
        let alert = UIAlertController(title: "課題５", message: "\(errormessage)", preferredStyle: .alert)
        let textAlert = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)}
        alert.addAction(textAlert)
        present(alert, animated: true, completion: nil)
    }

    private func calculate() -> Int? {
        let num1 = Int(num1TextField.text ?? "")
        let num2 = Int(num2TextField.text ?? "")
        guard let num1 = num1, let num2 = num2 else {
            return nil
        }
        guard num2 != 0 else {
            return nil
        }
        return num1 / num2
    }
}
