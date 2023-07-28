//
//  main.swift
//  Kiosk
//
//  Created by 김도현 on 2023/07/24.
//


import Foundation

enum MainMenu: String {
    case burger = "1"
    case fronzenCustard = "2"
    case drink = "3"
    case beer = "4"
    case exit = "0"
}

let kiosk = Kiosk()
kiosk.run()

