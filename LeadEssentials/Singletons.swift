//
//  Singletons.swift
//
//
//  Created by Devesh Tyagi on 01/12/21.
//

import UIKit


struct LoggedInUser {}
//struct FeedItem {}

///Singletons ->(with capital S) In software engineering, the singleton pattern is a software design pattern that restricts the instantiation of a class to one "single" instance. This is useful when exactly one object is needed to coordinate actions across the system.

final class ApiClient {
    //Private init
    private init() {}
    
    //Shared Instance
    static let shared : ApiClient = ApiClient()
    
    func execute(_ : URLRequest, completion: (Data) -> Void ){}
    
}
///singleton -> (With small s) Where you can get shared as well as new instance of the same class

//URLSession.shared
//URLSession()


//
class LoginViewController: UIViewController {
    //Property Injection
   // var api = ApiClient.shared
    
    //Closures
    var login : (((LoggedInUser) -> Void) -> Void)?
    
    func didTapLoginButton() {
        login? {user in
            
        }
    }
}

extension ApiClient {
    func login(completion :@escaping (LoggedInUser) -> Void){}
    func loadFeed(completion :@escaping ([FeedItem]) -> Void){}
    
}
