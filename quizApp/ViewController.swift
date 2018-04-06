	//
//  ViewController.swift
//  quizApp
//
//  Created by JACKLIEN on 4/2/18.
//  Copyright © 2018 JACKLIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let questions = ["the longest river in the world ís the","the largest ocean of the world is the","The Leaning Tower of Pisa is located at? "]
    let answers = [["Nile","Amazone","Mekong"],["Pacific Ocean","Atlantic Ocean","Arctic Ocean"],["Italy","Cambodia","India"]]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    
    //Label
    @IBOutlet weak var lbl: UILabel!
    
    
    //Button
    @IBAction func action(_ sender: AnyObject)
    {
        if(sender.tag == Int(rightAnswerPlacement))
        {
            print("RIGHT!")
            points += 1
        }
        else
        {
            print("WRONG!")
        }
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
        else
        {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    //
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    //Functions new question
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        //Create button
        var button:UIButton = UIButton()
        var x = 1
        for i in 1...3
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }    

    func showScore()
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

