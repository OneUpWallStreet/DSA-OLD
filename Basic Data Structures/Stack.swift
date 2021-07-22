// Implementation of Stack in Swift -> Operations are
// 1) Push
// 2) IsEmpty -> Returns Bool
// 3) Pop
// 4) Values -> Returns Array of Stack Items

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

var stack = Stack()
stack.Push(value: "1")
stack.Push(value: "2")
stack.Push(value: "3")
stack.Push(value: "4")
stack.Push(value: "5")

print(stack.Values())

print(stack.Pop())
print(stack.Pop())
print(stack.Pop())
print(stack.Pop())
print(stack.Pop())


print("Head value: \(stack.Head?.value) Head next: \(stack.Head?.next)")
print("Tail value:  \(stack.Tail?.value) Tail next: \(stack.Tail?.next)")
print(stack.Values())

