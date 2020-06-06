import UIKit

//Example with Classes
//class Compiler {
//    func analyze() { }
//    func parse() { }
//    func generate() { }
//    func optimize() { }
//    func output() { }
//    func compile(filename: String) {
//        analyze()
//        parse()
//        generate()
//        optimize()
//        output()
//    }
//
//}
//
//class PascalCompiler: Compiler {
//
//    override func analyze() {
//        print("Analysing Pascal")
//    }
//
//    override func parse() {
//        print("Parsing Pascal")
//    }
//
//}
//
//let compiler = PascalCompiler()
//compiler.compile(filename: "myfile.pas")

//Example with Structs
protocol Compiler {
    func analyze()
    func parse()
    func generate()
    func optimize()
    func output()
    func compile(filename: String)
}

extension Compiler {
    func analyze() { }
    func parse() { }
    func generate() { }
    func optimize() { }
    func output() { }
    func compile(filename: String) {
        analyze()
        parse()
        generate()
        optimize()
        output()
    }
    
}

protocol PascalFrontEnd: Compiler { }

extension PascalFrontEnd {
    func analyze() {
        print("Analysing Pascal")
        
    }
    func parse() { print("Parsing Pascal")
    }
    
}

protocol ARM64BackEnd: Compiler { }

extension ARM64BackEnd {
    func output() {
        print("Writing ARM code")
        
    }
}

struct PascalForARM64: PascalFrontEnd, ARM64BackEnd { }

let compiler = PascalForARM64()
compiler.compile(filename: "myfile.pas")
