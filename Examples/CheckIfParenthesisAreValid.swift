
// Given Array of String Parenthasis make sure that all of the closures match, if they do return true otheriwse return false

// Ex. "(([ ( )( ) ])) -> This should return False
// Ex. "(([ ( )( ) ]))"-> This should return True


class Node: Equatable{
    static func == (lhs: Node, rhs: Node) -> Bool {
        if lhs.next == rhs.next && lhs.value == rhs.value{
            return true
        }
        else{
            return false
        }
    }
    var value: String
    var next: Node?
    
    init(val: String) {
        value = val
    }
    
}

class Stack {
    
    var Head: Node?
    var Tail: Node?
    
    
    func Push(value: String){
        let Node = Node(val: value)
        if Head == nil {
            Head = Node
            Tail = Node
        }
        else{
            Node.next = Head
            Head = Node
        }
    }
    
    func isEmpty() -> Bool {
        
        if Tail == nil || Head == nil{
            return true
        }
        else {
            return false
        }
        
    }
    
    func Pop() -> String {
        
        var value: String
        
        if Tail == Head {
            value = (Tail?.value)!
            print("Here")
            Head = nil
            Tail = nil
            return value
        }
        else{
            value = (Head?.value)!
            Head = Head?.next
            return value
        }
        
        
        
    }
    
    func Values() -> Array<String> {
        
        var Node = Head
        var array: Array<String> = []
        
        
        if Head == nil || Tail == nil{
//          Return empty array
            return array
        }
        
//      If only 1 is left
        if Node?.next == nil {
            array.append((Node?.value)!)
            return array
        }
        
        
        while true{
            
            array.append((Node?.value)!)
            Node = Node?.next
            
            if Node?.next == nil{
                
                array.append((Node?.value)!)
                break
                
            }
        }
        
        return array
    }
    
}



func CheckIfStringOfParenthesisAreValid(array: Array<String>) -> Bool {
    
    let stack = Stack()
    
    for index in 0..<array.count-1{
        
        let bracket = array[index]
        
        if opening.contains(bracket){
            stack.Push(value: bracket)
        }
        
        else if closing.contains(bracket){
            let closed = stack.Pop()
            
            if bracket == ")" && closed != "("{
                return false
            }
            else if bracket == "]" && closed != "["{
                return false
            }
            
    }
    
    }
    return true
}

var brackets: Array<String> = ["(","(","[","(",")","(","]",")",")"]


var opening: Set<String> = ["(","["]
var closing: Set<String> = [")","]"]



let answer: Bool = CheckIfStringOfParenthesisAreValid(array: brackets)

if answer == true{
    print("The parenthasis are in the correct order")
}else{
    print("The parenthasis are not correct")
}
