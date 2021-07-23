//This is very basic implementation of Hash Map which does not support collision prevention, therefore it's not very good lol

class Node{
    
    var value: Int
    var next: Node?
    
    init(val: Int) {
        value = val
    }
}

class HashMap {
    
    var Bucket: Array<Node?>
    init(size: Int) {
        Bucket = [Node?](repeating: nil, count: size)
    }
    
    func hashAndGetIndex(key: Int) -> Int{
        var hasher = Hasher()
        hasher.combine(key)
        let hashedValue = hasher.finalize()
        let index = abs(hashedValue) % 3
        print("Index : \(index) & hashedValue: \(hashedValue) & key: \(key)")
        return index
        
    }
         
    func storeValue(key: Int,value: Int){
        let index = hashAndGetIndex(key: key)
        let Node = Node(val: value)
        Bucket[index] = Node
    }
    
    
    func getValue(key: Int) -> Int{
        let index = hashAndGetIndex(key: key)
        return (Bucket[index]!.value)
    }
    
}
