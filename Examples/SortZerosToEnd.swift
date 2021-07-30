import Foundation

//Given a array sort the array elements such that all the zeros are placed at the end of array
// Ex: [1,3,0,8,6,0,33,7] -> [1,3,8,6,33,7,0,0]

func solution(array: Array<Int>) -> (answer: Array<Int>,timeTaken: Double) {
    let startingPoint = Date()
    var zeroCounter: Int = 0
    var newArr: Array<Int> = []
    for index in 0..<array.count-1  {
        let number: Int = array[index]
        if number != 0 {
            newArr.append(number)
        }
        else{
            zeroCounter += 1
        }
    }
    
    for _ in 0..<zeroCounter{
        newArr.append(0)
    }
    return (answer: array,timeTaken: startingPoint.timeIntervalSinceNow * -1)
}

extension Array where Element == Int{
    
    mutating func swapElements(firstIndex: Int,secondIndex: Int, swapValue: Int = 0)-> Array<Int>{
        var newArr: Array<Int> = self
        newArr[firstIndex] = newArr[secondIndex]
        newArr[secondIndex] = swapValue
        return newArr
    }
    
    
}



func solutionTwo(array: Array<Int>) -> (answer: Array<Int>,timeTaken: Double) {
    let startingPoint = Date()
    var newArr = array
    var indexOfLastElement: Int = array.count-1
    for index in 0..<array.count-1{
        var number: Int = array[index]
        while number == 0{
            newArr = newArr.swapElements(firstIndex: index, secondIndex: indexOfLastElement)
            indexOfLastElement -= 1
            number = newArr[index]
        }
    }

    return (answer: array,timeTaken: startingPoint.timeIntervalSinceNow * -1)
    
}

func generateRandomArray(size: Int) -> Array<Int>{
    var array: Array<Int> = []
    for _ in 0..<size{
        array.append(Int(arc4random_uniform(5)))
    }
    return array
}

func compareSolutions() {
    
    
    

    let arrayToConvert: Array<Int> = generateRandomArray(size: 20000)
    
    let quadraticSoln = solution(array: arrayToConvert)
    let linearSoln = solutionTwo(array: arrayToConvert)
    
    print("Time Taken by Quadratic Solution: \(quadraticSoln.timeTaken)")
    print("Time Taken by Linear Solution: \(linearSoln.timeTaken)")
    
}


compareSolutions()
