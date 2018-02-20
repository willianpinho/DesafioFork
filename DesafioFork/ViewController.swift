//
//  ViewController.swift
//  DesafioFork
//
//  Created by Calebe Nunes Pastor on 19/02/18.
//  Copyright © 2018 Calebe Nunes Pastor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.messageButton.setTitle("Toque para ver a mensagem", for: UIControlState.normal)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customLayout()
    }
    
    func customLayout() {
        self.messageButton.addTarget(self, action: #selector(showMessage), for: UIControlEvents.touchUpInside)
    }
    
    
    @objc func showMessage() {
        let alert = UIAlertController(title: self.updateGreeting(), message: "", preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        // Add the actions
        alert.addAction(okAction)
        
        // Present the controller
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateGreeting() -> String {
        
        var greeting = String()
        
        //date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        
        // Get current time and format it to compare
        var currentTime = Date()
        let currentTimeStr = dateFormatter.string(from: currentTime)
        currentTime = dateFormatter.date(from: currentTimeStr)!
        
        //Times array
        let startTimes = ["5:00 AM", //Morning
            "11:00 AM", //Aftenoon
            "5:00 PM", //Evening
            "9:00 PM" //Nigth
        ]
        
        let morning = 0
        let afternoon = 1
        let evening = 2
        let night = 3
        
        var dateTimes = [Date]()
        
        //create an array with the desired times
        for i in 0..<startTimes.count{
            let dateTime = dateFormatter.date(from: startTimes[i])
            print(dateTime!)
            dateTimes.append(dateTime!)
        }
        
        if currentTime >= dateTimes[morning] && currentTime < dateTimes[afternoon]   {
            greeting = "Good Morning!"
        }
        if currentTime >= dateTimes[afternoon] && currentTime < dateTimes[evening]   {
            greeting = "Good Afternoon!"
        }
        if currentTime >= dateTimes[evening] && currentTime <= dateTimes[night]   {
            greeting = "Good Evening"
        }
        if currentTime >= dateTimes[night] && currentTime < dateTimes[morning]   {
            greeting = "Good Night"
        }
        
        return greeting
    }
}
