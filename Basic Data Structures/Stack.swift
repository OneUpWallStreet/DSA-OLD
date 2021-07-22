// Implementation of Stack in Swift -> Operations are
// 1) Push
// 2) IsEmpty -> Returns Bool
// 3) Pop
// 4) Values -> Returns Array of Stack Items

class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        if lhs.next == rhs.next{
            return true
        }
        else{
            return false
        }
    }
    var value: Int
    var next: Node?
    
    init(val: Int){
        value = val
    }
}


class Stack{

    var Head: Node?
    var Tail: Node?
    
//  Checks if stack is empty
    func isEmpty() -> Bool {
        if Tail == nil {
            return true
        }
        else{
            return false
        }
    }
    
//  Add Value to the Head
    func Push(value: Int){
        
        let Node = Node(val: value)
        
//      Pointing the old head to the new head just made
        Head?.next = Node
        
//      Push the element to the head so we can remove it from there aswell -> LIFO
        Head = Node
        
//      If this is the first element than Head and tail are the same
        if Tail == nil {
            Tail = Node
        }
    }
    
//  Remove Value from Head
    func Pop(){
        
        if Tail == Head {
            Tail = nil
            Head = nil
        }
        else{
            Head = nil
        }
    }
    
//  Print all the values in Stack
    func Values() -> Array<Int>{
        var array: Array<Int> = []
        if Tail == nil {
            return array
        }
        else{
            var Node = Tail
//          Go on till you encounter a head with a nil
            while true{
                array.append((Node?.value)!)
                Node = Node?.next
                
                if Node?.next == nil {
                    if let val = Node?.value{
                        array.append(val)
                    }
                    else{
                        print("SomeThing went wrong")
                    }
                    break
                }
                
            }
          return array
        }
    }
    
    
    
}


var stack = Stack()
print("At the start: \(stack.isEmpty())")
stack.Push(value: 32)
stack.Push(value: 11)
stack.Push(value: 99)
stack.Push(value: 121)
stack.Pop()
print("Array returned from the stack: \(stack.Values())")


