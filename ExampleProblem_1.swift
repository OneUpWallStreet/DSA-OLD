
//Given a Array and a integer, find if there are any 2 numbers in the array such that their sum is that interger

// In the first case the array is sorted and in the second case the array is unsorted so we have to solve it using a Hash Set.

//Problem is from https://youtu.be/XKu_SEDAykw  -> How to: Work at Google — Example Coding/Engineering Interview

var array: Array<Int> = [1,3,3,4]
var complements = Set<Int>()
var unsorted_array: Array<Int> = [1,7,4,3,7,0,7]

struct answer {
    
    var isFound: Bool
    var matchids: (value1: Int,value2: Int)?
    
}

func solve_unsorted(arr: Array<Int>,sumToFind: Int) -> answer{
    
    
    for index in 0..<unsorted_array.count{
        
        let current_value = unsorted_array[index]
        let complement = sumToFind - current_value
        
        
        if complements.contains(complement){
            return answer(isFound: true, matchids: (value1: current_value, value2: complement))
        }
        else{
            complements.insert(complement)
        }
    }
    return answer(isFound: false)
}


func solve(arr: Array<Int>,sumToFind: Int) -> answer{
    
    var small_index  = 0
    var upper_index = array.count - 1
    
    
    while small_index < upper_index {
        
        let total_sum = arr[small_index] + arr[upper_index]
        
        if total_sum < sumToFind{
            small_index+=1
        }
        else if total_sum > sumToFind {
            upper_index-=1
        }
        else if total_sum == sumToFind {
            return answer(isFound: true, matchids: (arr[small_index],arr[upper_index]))
        }

    }
    
    
    
    return answer(isFound: false)
}


let answer = solve(arr: array, sumToFind: 4)
let answer_2 = solve_unsorted(arr: unsorted_array, sumToFind: 8)



