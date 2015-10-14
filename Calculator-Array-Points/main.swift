import Foundation

func add(a : Int, b : Int) -> Int {
    return a + b
}

func subtract(a : Int, b : Int) -> Int {
    return a - b
}

func multiply(a : Int, b : Int) -> Int {
    return a * b
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
        return Double(array.reduce(1,combine: *))
    } else if operation == "count" {
        return Double(array.count)
    } else {  //operation == "average" {
        return Double(array.reduce(0,combine: +)) / Double(array.count)
    }
}

func tupleSub(point1 : (x : Int?, y : Int?), point2 : (x : Int?, y : Int?)) -> (Int, Int) {
    if (point1.x != nil && point1.y != nil && point2.x != nil && point2.y != nil) {
        return ((point1.x)! - (point2.x)!, (point1.y)! - (point2.y)!)
    } else {
        return(0, 0)
    }
}

func tupleAdd(point1 : (x : Int?, y : Int?), point2 : (x : Int?, y : Int?)) -> (Int, Int) {
    if (point1.x != nil && point1.y != nil && point2.x != nil && point2.y != nil) {
        return ((point1.x)! + (point2.x)!, (point1.y)! + (point2.y)!)
    } else {
        return(0, 0)
    }
}

/*
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
*/

func dictionaryXSub(points : [String: (x : Double!, y: Double!)]) -> Double {
    if (points["P1"]!.x != nil && points["P2"]!.x != nil) {
        return (points["P1"]!.x - points["P2"]!.x)
    } else {
        return 0
    }
}

func dictionaryXAdd(points : [String: (x : Double!, y: Double!)]) -> Double {
    if (points["P1"]!.x != nil && points["P2"]!.x != nil) {
        return (points["P1"]!.x + points["P2"]!.x)
    } else {
        return 0
    }
}

func dictionaryYSub(points : [String: (x : Double!, y: Double!)]) -> Double {
    if (points["P1"]!.x != nil && points["P2"]!.x != nil) {
        return (points["P1"]!.y - points["P2"]!.y)
    } else {
        return 0
    }
}

func dictionaryYAdd(points : [String: (x : Double!, y: Double!)]) -> Double {
    if (points["P1"]!.x != nil && points["P2"]!.x != nil) {
        return (points["P1"]!.y + points["P2"]!.y)
    } else {
        return 0
    }
}

print("")
print("Random Unit Test For 1")
print("")
print("Addition : 1 + 2 = \(add(1, b : 2))")
print("Subtraction : 1 - 2 = \(subtract(1, b : 2))")
print("Mulitplcation : 1 * 2 = \(multiply(1, b : 2))")
print("Divison : 1 / 2 = \(divide(1, b : 2))")
print("Generic Addition : 13 + 2 = \(math(13, num2 : 2){ Double($0) + Double($1) })")
print("Generic Subtraction : 13 - 2 = \(math(13, num2 : 2){ Double($0) - Double($1) })")
print("Generic Muliplcation : 13 * 2 = \(math(13, num2 : 2){ Double($0) * Double($1) })")
print("Generic Division : 13 / 2 = \(math(13, num2 : 2){ Double($0) / Double($1) })")
print("")
print("Random Unit Test For 2")
print("")
print("Addition [2,4,7,10] = \(addArray([2,4,7,10]))")
print("Muliply [2,4,7,10] = \(mulArray([2,4,7,10]))")
print("Count [2,4,7,10] = \(countArray([2,4,7,10]))")
print("Average [2,4,7,10] = \(avgArray([2,4,7,10]))")
let array = [9, 1, 3, 2, 4, 2, 3]
let arrayAdd = mathArray("add", array : array)
let arrayMul = mathArray("multiply", array : array)
let arrayCount = mathArray("count", array : array)
let arrayAvg = mathArray("average", array : array)
print("Generic Addition [1, 9, 3, 2, 4, 2, 3] = \(arrayAdd)")
print("Generic Multiplication [1, 9, 3, 2, 4, 2, 3] = \(arrayMul)")
print("Generic Count [1, 9, 3, 2, 4, 2, 3] = \(arrayCount)")
print("Generic Average [1, 9, 3, 2, 4, 2, 3] = \(arrayAvg)")
print("")
print("Random Unit Test For 3")
print("")
let X1 = 4
let X2 = 3
let Y1 = 2
let Y2 = 4
let tupAdd = tupleAdd((X1, Y1), point2 : (X2, Y2))
print("Tuple Point Addition : (\(X1), \(Y1)) + (\(X2), \(Y2)) = \(tupAdd)")
let tupDiv = tupleSub((X1, Y1), point2 : (X2, Y2))
print("Tuple Point Subtraction : (\(X1), \(Y1)) - (\(X2), \(Y2)) = \(tupDiv)")
let X1Double = 4.0
let X2Double = 3.0
let Y1Double = 2.0
let Y2Double = 4.0
let tupDoubleAdd = tupleAdd((Int(X1Double), Int(Y1Double)), point2 : (Int(X2Double), Int(Y2Double)))
print("Double Point Addition : (\(X1Double), \(Y1Double)) + (\(X2Double), \(Y2Double)) = \(tupDoubleAdd)")
let tupDoubleSub = tupleSub((Int(X1Double), Int(Y1Double)), point2 : (Int(X2Double), Int(Y2Double)))
print("Double Point Subtraction : (\(X1Double), \(Y1Double)) - (\(X2Double), \(Y2Double)) = \(tupDoubleSub)")
var X1nil : Int?
var X2nil : Int? = 4
var Y1nil : Int?
var Y2nil : Int? = 4
let tupNilAdd = tupleAdd((X1nil, X2nil), point2 : (Y1nil, Y2nil))
print("Nil Point Addition : (\(X1nil), \(Y1nil)) + (\(X2nil), \(Y2nil)) = \(tupNilAdd) so please make sure that the two points have x and y coordinates")
let tupNilSub = tupleAdd((X1nil, X2nil), point2 : (Y1nil, Y2nil))
print("Nil Point Subtraction : (\(X1nil), \(Y1nil)) + (\(X2nil), \(Y2nil)) = \(tupNilSub) so please make sure that the two points have x and y coordinates")
let dictionary : [String: (x : Double!, y : Double!)] = ["P1" : (x : 2.0, y : 3.0), "P2" : (x : 1.0, y : 2.0)]
let sumXDictionary = dictionaryXSub(dictionary)
let sumYDictionary = dictionaryYSub(dictionary)
print("Dictionary with Doubles(2.0, 3.0) - (1.0, 2.0) = (\(sumXDictionary) , \(sumYDictionary))")
let addYDictionary = dictionaryYAdd(dictionary)
let addXDictionary = dictionaryXAdd(dictionary)
print("Dictionary with Doubles(2.0, 3.0) - (1.0, 2.0) = (\(sumXDictionary) , \(sumYDictionary))")
let nilDictionary : [String: (x : Double!, y : Double!)] = ["P1" : (x : 2.0, y : nil), "P2" : (x : nil, y : 2.0)]
let nilAnswer = dictionaryYAdd(nilDictionary)
print("Dictionary with Nil(2.0, nil), (nil, 2.0) gets \(nilAnswer) but doesn't crash")
