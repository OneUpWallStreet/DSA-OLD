 //Implementation of Circular Buffer in Swift -> Operations are
// 1) EnQuene
// 2) DeQuene
 
 
 extension Array{
    
    func onlyContainsNil(_ array: Array<Int?>) -> Bool{
        
        for index in 0..<array.count-1 {
            if array[index] != nil {
                return false
            }
        }
        
        return true
        
    }
    
    func containsNil(_ array: Array<Int?>) -> Bool {
        for index in 0..<array.count-1{
            if array[index] == nil{
                return true
            }
        }
        return false
    }
    
 }

 
 
 class CircularBuffer {
    
    var array: Array<Int?>
    var enQuene_pointer: Int = 0
    var deQuene_pointer: Int = 0
    
     init(_ k: Int) {
        array = [Int?](repeating: nil, count: k)
     }
    
    func getEnQuenePointer() -> Int{
        return (enQuene_pointer) % array.count
    }
    
    func getDeQuenePointer() -> Int{
        return (deQuene_pointer) % array.count
    }
     
     func enQueue(_ value: Int) -> Bool {
        let index = getEnQuenePointer()
        if array[index] == nil {
            array[index] = value
            enQuene_pointer += 1
            return true
        }
        else{
            return false
        }
     }
     
     func deQueue() -> Bool {
        
        let index = getDeQuenePointer()
        if array[index] != nil{
            deQuene_pointer += 1
            array[index] = nil
            return true
        }
        else{
            return false
        }
     }

     
     func isEmpty() -> Bool {
        
        if array.onlyContainsNil(array) == true{
            return true
        }
        else{
            return false
        }
}
     
     func isFull() -> Bool {
        
        if array.containsNil(array) == false{
            return true
        }
        else{
            return false
        }
}
 }
