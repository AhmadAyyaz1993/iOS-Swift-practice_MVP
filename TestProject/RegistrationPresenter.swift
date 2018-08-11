//
//  RegistrationPresenter.swift
//  TestProject
//
//  Created by Ahmad on 8/11/18.
//  Copyright © 2018 Ahmad. All rights reserved.
//

import Foundation

protocol  RegistrationDelegate {
    func showProgress();
    func hideProgress();
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class RegistrationPresenter{
    var delegate: RegistrationDelegate
    
    init(delegate: RegistrationDelegate) {
        self.delegate = delegate
    }
    
    func registerUser(email: String, password: String, fullName: String, phoneNumber: String)  {
        if email.isEmpty{
            print("email empty")
            self.delegate.registrationDidFailed(message: "Email cannot be empty")
            return
        }
        if password.isEmpty{
            print("password empty")
            self.delegate.registrationDidFailed(message: "Password cannot be empty")
            return
        }
        if fullName.isEmpty{
            print("full name empty")
            self.delegate.registrationDidFailed(message: "Name cannot be empty")
            return
        }
        if phoneNumber.isEmpty{
            print("phone number is empty")
            self.delegate.registrationDidFailed(message: "Phone number cannot be empty")
            return
        }
        
        self.delegate.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.delegate.hideProgress()
            self.delegate.registrationDidSucceed()
        }
    }
}



