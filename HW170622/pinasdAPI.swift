//
//  pinasdAPI.swift
//  MyApp03
//
//  Created by user on 2017/6/20.
//  Copyright © 2017年 user. All rights reserved.
//

import Foundation

class BradAPI{
    static func createAnswer(_ num:Int)->String{
        var rs = Set<Int>()
        var rand:Int
        while rs.count < num{
            rand = Int(arc4random_uniform(10))
            rs.insert(rand)
        }
        var ret = ""
        for v in rs{
            ret.append(String(v))
        }
        
        return ret
    }
    static func checkAB(answer:String, guess:String)->String{
        var A = 0,B = 0
        var ca=String() , cg=String()
        for i in 0..<answer.characters.count{
            ca = substring(str: answer, start: i, len: 1)
            cg = substring(str: guess, start: i, len: 1)
            if cg == ca {
                A += 1
            }else if answer.contains(cg){
                B += 1
            }
        }
         return "\(A)A\(B)B"
    }
}
func substring(str:String?,start:Int,len:Int)->String{
    if len > 0 {
        if let str = str{
            let sLen = Int(strlen(str))
            let newstart = start > sLen ?sLen : start
            let lenth = len > (sLen - newstart) ? (sLen - newstart) : len
            let Findex = str.index(str.startIndex,offsetBy:newstart)
            let Eindex = str.index(str.startIndex,offsetBy:newstart + lenth)
            return str[Findex..<Eindex]
        }else{
            return ""
        }
    }else{
        if let str = str{
            let sLen = Int(strlen(str))
            let newstart = start > sLen ?sLen : start
            let Snum = (newstart+len) > 0 ? (newstart+len) : 0
            let Eindex = str.index(str.startIndex,offsetBy:newstart)
            let Findex = str.index(str.startIndex,offsetBy:Snum)
            return str[Findex..<Eindex]
        }else{
            return ""
        }
    }
    
}

