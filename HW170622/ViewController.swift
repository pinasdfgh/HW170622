//
//  ViewController.swift
//  MyApp03
//
//  Created by user on 2017/6/20.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
   
    private var textGuess:UITextField?
    private var btnOk:UIButton?
    private var rsGuess:UITextField?
    private var hsGuess:UITextView?
    var stringAnswer:String = ""
    
    private func initRound(){
        textGuess = UITextField()
        textGuess?.frame = CGRect(x: 10, y: 22, width: 300, height: 50)
        textGuess?.text = ""
        textGuess?.placeholder = "輸入數字"
        textGuess?.font = UIFont(name: "Arial", size: 20)
        textGuess?.borderStyle = .roundedRect
        textGuess?.keyboardType = .numbersAndPunctuation
        self.view.addSubview(textGuess!)
        
        btnOk = UIButton(type: UIButtonType.system)
        //CHRect類別為處理範圍 == 畫面範圍
        btnOk?.frame = CGRect(x:330,y:22,width:40,height:40)
        btnOk?.setTitle("OK", for: UIControlState.normal)
        btnOk?.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        
        self.view.addSubview(btnOk!)
        
        rsGuess = UITextField()
        rsGuess?.frame = CGRect(x: 10, y: 66, width: 370, height: 50)
        rsGuess?.text = "game result"
        rsGuess?.font = UIFont(name: "Arial", size: 20)
        rsGuess?.borderStyle = .roundedRect
        rsGuess?.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        rsGuess?.allowsEditingTextAttributes = false
        rsGuess?.textAlignment = .center
        self.view.addSubview(rsGuess!)
        
        hsGuess = UITextView()
        hsGuess?.frame = CGRect(x: 10, y: 134, width: 370, height: 500)
        hsGuess?.text = ""
        hsGuess?.font = UIFont(name: "Arial", size: 20)
        hsGuess?.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        hsGuess?.allowsEditingTextAttributes = false
        self.view.addSubview(hsGuess!)
        
        btnOk?.addTarget(self, action: #selector(guessStrat), for: UIControlEvents.touchUpInside)
        stringAnswer = BradAPI.createAnswer(4)
        counter = 0

//        textInput.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
//        click(self)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textGuess?.resignFirstResponder()
        textGuess?.delegate = self
        initRound()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var counter = 0
    
//    private var textGuess:UITextField?
//    private var btnOk:UIButton?
//    private var rsGuess:UITextField?
//    private var hsGuess:UITextView?

    @objc private func guessStrat() {
        counter += 1
        let stringInput = textGuess?.text!
//        print(stringInput)

        let SResult = BradAPI.checkAB(answer: stringAnswer,guess:stringInput!)

        rsGuess?.text = SResult

        hsGuess?.text.append("\(counter). \(stringInput ?? "")=>\(SResult)\n")
        textGuess?.text = ""
        if SResult == "3A0B"{
            showWinnweDialog()
        }else if counter == 10{
            showLoserDialog()
        }
        textGuess?.resignFirstResponder()

    }
    func showWinnweDialog(){
        let alert:UIAlertController = UIAlertController(title:"遊戲結果",message:"恭喜",preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK",style:UIAlertActionStyle.default,handler:{
            (action:UIAlertAction) -> Void in print("OK")
        })
        alert.addAction(okAction)
        //present為UIViewController的方法
        self.present(alert, animated: true, completion: nil)
    }
    func showLoserDialog(){
        let alert:UIAlertController = UIAlertController(title:"遊戲結束",message:"殘念:Ans = \(stringAnswer)",preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.default,
            handler:{
                (action:UIAlertAction) ->Void in
                self.initRound()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }



 

}

    
