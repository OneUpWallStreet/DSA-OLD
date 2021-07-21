var arr: Array<Int> = [1,2,4,6,3,6,3,65]

func SimpleLinearSearch(arr: Array<Int>) -> Int? {
    
    for index in 0..<arr.count{
        
        let number: Int = arr[index]
        
        
        if index == 0{
            if number > arr[index+1]{
                return number
            }
        }
        else if index == arr.count{
            if number > arr[index-1]{
                return number
            }
        }
        else if number>arr[index-1] && number>arr[index+1]{
            return number
        }
    }
    return nil
}
let answer = SimpleLinearSearch(arr: arr)

if answer == nil{
    print("No Peak")
}
else{
    print("Peak is \(answer!)")
}

