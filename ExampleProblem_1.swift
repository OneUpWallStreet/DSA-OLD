
//Given a Array and a integer, find if there are any 2 numbers in the array such that their sum is that interger

//Problem is from https://youtu.be/XKu_SEDAykw  -> How to: Work at Google — Example Coding/Engineering Interview

var array: Array<Int> = [1,3,3,4]

struct answer {
    
    var isFound: Bool
    var matchids: (value1: Int,value2: Int)?
    
}

print(array.count)

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

print(answer)


