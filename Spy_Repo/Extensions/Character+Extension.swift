//
//  Character+Extension.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 31.07.2021.
//  Copyright © 2021 Burak Erarslan. All rights reserved.
//

extension Character {
    func convertMyAlphabet() -> String {
        switch self {
        case "a":
            return MyAlphabet.a.rawValue
        case "b":
            return MyAlphabet.b.rawValue
        case "c":
            return MyAlphabet.c.rawValue
        case "d":
            return MyAlphabet.d.rawValue
        case "e":
            return MyAlphabet.e.rawValue
        case "f":
            return MyAlphabet.f.rawValue
        case "g":
            return MyAlphabet.g.rawValue
        case "h":
            return MyAlphabet.h.rawValue
        case "i":
            return MyAlphabet.i.rawValue
        case "j":
            return MyAlphabet.j.rawValue
        case "k":
            return MyAlphabet.k.rawValue
        case "l":
            return MyAlphabet.l.rawValue
        case "m":
            return MyAlphabet.m.rawValue
        case "n":
            return MyAlphabet.n.rawValue
        case "o":
            return MyAlphabet.o.rawValue
        case "p":
            return MyAlphabet.p.rawValue
        case "q":
            return MyAlphabet.q.rawValue
        case "r":
            return MyAlphabet.r.rawValue
        case "s":
            return MyAlphabet.s.rawValue
        case "t":
            return MyAlphabet.t.rawValue
        case "u":
            return MyAlphabet.u.rawValue
        case "v":
            return MyAlphabet.v.rawValue
        case "w":
            return MyAlphabet.w.rawValue
        case "x":
            return MyAlphabet.x.rawValue
        case "y":
            return MyAlphabet.y.rawValue
        case "z":
            return MyAlphabet.z.rawValue
        case "0":
            return MyAlphabet.zero.rawValue
        case "1":
            return MyAlphabet.one.rawValue
        case "2":
            return MyAlphabet.two.rawValue
        case "3":
            return MyAlphabet.three.rawValue
        case "4":
            return MyAlphabet.four.rawValue
        case "5":
            return MyAlphabet.five.rawValue
        case "6":
            return MyAlphabet.six.rawValue
        case "7":
            return MyAlphabet.seven.rawValue
        case "8":
            return MyAlphabet.eight.rawValue
        case "9":
            return MyAlphabet.nine.rawValue
        default:
            return String(self)
        }
    }
}
