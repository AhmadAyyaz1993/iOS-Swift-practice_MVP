//
//  ViewController.swift
//  TestProject
//
//  Created by Ahmad on 7/30/18.
//  Copyright © 2018 Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var presenter: RegistrationPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.presenter = RegistrationPresenter(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func registerButton(_ sender: Any) {
        self.presenter?.registerUser(email: emailField.text!, password: passwordField.text!, fullName: fullNameField.text!, phoneNumber: phoneNumberField.text!)
    }
    func alert() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        return alert
    }
    
}

extension ViewController: RegistrationDelegate
{
    func showProgress(){
        present(alert(), animated: true, completion: nil)
    }
    func hideProgress(){
        dismiss(animated: false, completion: nil)
    }
    func registrationDidSucceed(){
        print("succeed")
    }
    func registrationDidFailed(message: String){
        print(message)
    }
    
}
