///
/// https://leetcode.com/problems/two-sum/
///

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    /*
     * https://leetcode.com/submissions/detail/247709736/
     * 耗时：408 ms
     * 内存：21.1 MB
     *
     * 最常见的方法
     *
    var index: Int = 0
    for value in nums {
        for i in index+1..<nums.count {
            if value + nums[i] == target {
                return [index, i]
            }
        }
        index += 1
    }
    return []
     */
 
    /*
     * https://leetcode.com/submissions/detail/247713648/
     * 耗时：1932 ms
     * 内存：22.7 MB
     *
     * 不再进行两次遍历，一次遍历时，将值保存下来，减少了第二次遍历，以空间换时间。
     *
    var keyValueDic: [Int: Int] = [:]
    for index in 0..<nums.count {
        let value = nums[index]
        let preValue = target-value
        // 这里使用了字典的contains方法，而不是字典所有key的contains方法，使得耗时大幅上升
        if keyValueDic.contains(where: { $0.key == preValue}) {
            return [keyValueDic[preValue]!, index]
        } else {
            keyValueDic[value] = index
        }
    }
    return []
     */
    
    /*
     * https://leetcode.com/submissions/detail/248145505/
     * 耗时：32 ms
     * 内存：22.6 MB
     */
    var keyValueDic: [Int: Int] = [:]
    for index in 0..<nums.count {
        let value = nums[index]
        let preValue = target-value
        // 使用字典所有key的contains方法来判断
        if keyValueDic.keys.contains(preValue) {
            return [keyValueDic[preValue]!, index]
        } else {
            keyValueDic[value] = index
        }
    }
    return []
}

print(twoSum([2, 7, 11, 15], 9))
