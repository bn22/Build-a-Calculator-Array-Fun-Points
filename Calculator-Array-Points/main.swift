import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    print (result)
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

func convertDouble(incoming:String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}

let separators = NSCharacterSet(charactersInString: "( ),")
let separators1 = NSCharacterSet(charactersInString: "( )")
let separators2 = NSCharacterSet(charactersInString: "[,]")

func add(a : Int, b : Int) -> Double {
    return Double(a + b)
}

func subtract(a : Int, b : Int) -> Double {
    return Double(a - b)
}

func multiply(a : Int, b : Int) -> Double {
    return Double(a * b)
}

func divide(a : Int, b : Int) -> Double {
    return Double(a) / Double(b)
}

func math(num1: Int, num2: Int, op : (Int, Int) -> Double) -> Double {
    return op(num1, num2)
}

func addArray(a : [Int]) -> Double {
    var total = 0
    for (var index = 0; index < a.count; index++) {
        total = total + a[index]
    }
    return Double(total)
}

func mulArray (a : [Int]) -> Double {
    var total = 1
    for (var index = 0; index < a.count; index++) {
        total = total * a[index]
    }
    return Double(total)
}

func countArray(a : [Int]) -> Double {
    return Double(a.count)
}

func avgArray (a : [Int]) -> Double {
    var total = 0
    for (var index = 0; index < a.count; index++) {
        total = total + a[index]
    }
    let avg = Double(total) / Double(a.count)
    return avg
}

func mathArray(operation : String, array : [Int]) -> Double {
    if operation == "add" {
        return Double(array.reduce(0,combine: +))
    } else if operation == "multiply" {
        return Double(array.reduce(0,combine: *))
    } else if operation == "count" {
        return Double(array.count)
    } else {  //operation == "average" {
        return Double(array.reduce(0,combine: +)) / Double(array.count)
    }
}

func tupleSub(point1 : (x : Double, y : Double), point2 : (x : Double, y : Double)) -> (Double, Double) {
    return ((point1.x) - (point2.x), (point1.y) - (point2.y))
}

func tupleAdd(point1 : (x : Double, y : Double), point2 : (x : Double, y : Double)) -> (Double, Double) {
    return ((point1.x) + (point2.x), (point1.y) + (point2.y))
}

func dictionaryYAdd(points : [String: Double]) -> Double {
    return (points["Y1"]! + points["Y2"]!)
}

func dictionaryXAdd(points : [String: Double]) -> Double {
    return (points["X1"]! + points["X2"]!)
}

func dictionaryYSub(points : [String: Double]) -> Double {
    return (points["Y1"]! - points["Y2"]!)
}

func dictionaryXSub(points : [String: Double]) -> Double {
    return (points["X2"]! - points["X2"]!)
}


print ("Choose Portion of HW (Calculator, Array or Points)")
var userInput = input()
if userInput == "Calculator" {
    print("Please Enter add, subtract, multiply, divide or math")
    var calculatorInput = input()
    var calculatorArray : [String] = calculatorInput.componentsSeparatedByCharactersInSet(separators)
    if (calculatorArray[0] != "math") {
        let num1 = Int(calculatorArray[1])
        let num2 = Int(calculatorArray[2])
        if (calculatorArray[0] == "add") {
            let result = Int(add(convert(calculatorArray[1]), b : convert(calculatorArray[2])))
            print("\(num1!) + \(num2!) = \(result)")
        } else if (calculatorArray[0] == "subtract") {
            let result = Int(subtract(convert(calculatorArray[1]), b : convert(calculatorArray[2])))
            print("\(num1!) - \(num2!) = \(result)")
        } else if (calculatorArray[0] == "multiply") {
            let result = Int(multiply(convert(calculatorArray[1]), b : convert(calculatorArray[2])))
            print("\(num1!) * \(num2!) = \(result)")
        } else if (calculatorArray[0] == "divide") {
            let result = divide(convert(calculatorArray[1]), b : convert(calculatorArray[2]))
            print("\(num1!) / \(num2!) = \(result)")
        }
    } else {
        let num1 = Int(calculatorArray[2])
        let num2 = Int(calculatorArray[3])
        if (calculatorArray[1] == "add") {
            let result = Int(math(convert(calculatorArray[2]), num2: convert(calculatorArray[3])) { Double($0) + Double($1) })
            print("\(num1!) + \(num2!) = \(result)")
        } else if (calculatorArray[1] == "subtract") {
            let result = Int(math(convert(calculatorArray[2]), num2: convert(calculatorArray[3])) { Double($0) - Double($1) })
            print("\(num1!) - \(num2!) = \(result)")
        } else if (calculatorArray[1] == "multiply") {
            let result = Int(math(convert(calculatorArray[2]), num2: convert(calculatorArray[3])) { Double($0) * Double($1) })
            print("\(num1!) * \(num2!) = \(result)")
        } else if (calculatorArray[1] == "divide") {
            let result = math(convert(calculatorArray[2]), num2: convert(calculatorArray[3])) { Double($0) / Double($1) }
            print("\(num1!) / \(num2!) = \(result)")
        }
    }
} else if userInput == "Array" {
    print("Please Enter add, multiply, count, average or math")
    var arrayInput = input()
    var arrayArray = arrayInput.componentsSeparatedByCharactersInSet(separators1)
    if (arrayArray[0] != "math") {
        var array = arrayArray[1]
        var finalArray = array.componentsSeparatedByCharactersInSet(separators2)
        var final = [Int]()
        for (var index = 1; index < finalArray.count - 1;index++) {
            let num = convert(finalArray[index])
            final.append(num)
        }
        if (arrayArray[0] == "add") {
            let result = Int(addArray(final))
            print("\(arrayInput) = \(result)")
        } else if (arrayArray[0] == "multiply") {
            let result = Int(mulArray(final))
            print("\(arrayInput) = \(result)")
        } else if (arrayArray[0] == "count") {
            let result = Int(countArray(final))
            print("\(arrayInput) = \(result)")
        } else if (arrayArray[0] == "average") {
            let result = avgArray(final)
            print("\(arrayInput) = \(result)")
        }
    } else {
        var array = arrayArray[2]
        var finalArray = array.componentsSeparatedByCharactersInSet(separators2)
        var final = [Int]()
        for (var index = 1; index < finalArray.count - 1;index++) {
            let num = convert(finalArray[index])
            final.append(num)
        }
        let result = mathArray(arrayArray[1], array : final)
        print("\(arrayInput) = \(result)")
    }
} else {
    print("Choose between add and subtract")
    let pointOperation = input()
    print("Tuple Or Dictionary")
    let parameterOption = input()
    let point1X = convertDouble(input())
    let point1Y = convertDouble(input())
    let point2X = convertDouble(input())
    let point2Y = convertDouble(input())
    if parameterOption == "Dictionary" {
        if pointOperation == "add" {
            var dictionary = ["X1" : point1X, "X2" : point2X, "Y1" : point1Y, "Y2" : point2Y]
            let xResult = dictionaryXAdd(dictionary)
            let yResult = dictionaryYAdd(dictionary)
            print("(\(point1X), \(point1Y)) + (\(point2X), \(point2Y)) = (\(xResult), \(yResult))")
        } else if pointOperation == "subtract" {
            var dictionary = ["X1" : point1X, "X2" : point2X, "Y1" : point1Y, "Y2" : point2Y]
            let xResult = dictionaryXSub(dictionary)
            let yResult = dictionaryYSub(dictionary)
            print("(\(point1X), \(point1Y)) - (\(point2X), \(point2Y)) = (\(xResult), \(yResult))")
        }
    } else if parameterOption == "Tuple" {
        if pointOperation == "add" {
            let result = tupleAdd((point1X, point1Y), point2 : (point2X, point2Y))
            print("(\(point1X), \(point1Y)) + (\(point2X), \(point2Y)) = \(result)")
        } else if pointOperation == "subtract"{
            let result = tupleSub((point1X, point1Y), point2 : (point2X, point2Y))
            print("(\(point1X), \(point1Y)) - (\(point2X), \(point2Y)) = \(result)")
        }
    }
}




