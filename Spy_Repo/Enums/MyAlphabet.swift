//
//  MyAlphabet.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 31.07.2021.
//  Copyright © 2021 Burak Erarslan. All rights reserved.
//

enum MyAlphabet: String {
    case a = "."
    case b = ".."
    case c = "..."
    case d = "...."
    case e = "....."
    case f = "....+"
    case g = "...+."
    case h = "...++"
    case i = "..+.."
    case j = "..+.+"
    case k = "..++."
    case l = "..+++"
    case m = ".+..."
    case n = ".+..+"
    case o = ".+.+."
    case p = ".+.++"
    case q = ".++.."
    case r = ".++.+"
    case s = ".+++."
    case t = ".++++"
    case u = "+...."
    case v = "+...+"
    case w = "+..+."
    case x = "+..++"
    case y = "+.+.."
    case z = "+.+.+"
    case zero = "+.++."
    case one = "+.+++"
    case two = "++..."
    case three = "++..+"
    case four = "++.+."
    case five = "++.++"
    case six = "+++.."
    case seven = "+++.+"
    case eight = "++++."
    case nine = "+++++"
    
    func decode() -> String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        case .c:
            return "c"
        case .d:
            return "d"
        case .e:
            return "e"
        case .f:
            return "f"
        case .g:
            return "g"
        case .h:
            return "h"
        case .i:
            return "i"
        case .j:
            return "j"
        case .k:
            return "k"
        case .l:
            return "l"
        case .m:
            return "m"
        case .n:
            return "n"
        case .o:
            return "o"
        case .p:
            return "p"
        case .q:
            return "q"
        case .r:
            return "r"
        case .s:
            return "s"
        case .t:
            return "t"
        case .u:
            return "u"
        case .v:
            return "v"
        case .w:
            return "w"
        case .x:
            return "x"
        case .y:
            return "y"
        case .z:
            return "z"
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        }
    }
}
