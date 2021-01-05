//
//  SuperViewController.swift
//  SampleSwift
//
//  Created by Ross Harding on 1/5/21.
//

import UIKit

public enum ViewControllerIdentifier : String {
    // Put ViewControllerIdentifiers here, i.e.
     case Settings = "SettingsTableViewController"
    // ...
}

class SuperViewController: UIViewController {
    
    var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoadingView()
    }
    
    
    // MARK: Alerts
    
    func presentTimedAlert(_ title: String, _ message: String?, completion: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                alert.dismiss(animated: true, completion: nil)
                completion()
            }
        }
    }
    
    func presentAlertWithOk(_ title: String, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    
    // MARK: Loading Animations
    
    func configureLoadingView() {
        activityIndicator.layer.cornerRadius = 8
        activityIndicator.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    }
    
    func startLoading() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: view.bounds.midX - 30, y: view.bounds.maxY * 0.3, width: 60, height: 60))
        if !view.subviews.contains(activityIndicator) {
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
        view.isUserInteractionEnabled = false
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        view.isUserInteractionEnabled = true
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    // MARK: Navigation
    
    func push(viewControllerIdentifier: ViewControllerIdentifier) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: viewControllerIdentifier.rawValue)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentModally(viewControllerIdentifier: ViewControllerIdentifier) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: viewControllerIdentifier.rawValue)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
