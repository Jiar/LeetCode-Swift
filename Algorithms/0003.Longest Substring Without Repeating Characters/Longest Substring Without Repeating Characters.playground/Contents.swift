///
/// https://leetcode.com/problems/longest-substring-without-repeating-characters/
///

func lengthOfLongestSubstring(_ s: String) -> Int {
    /*
     * https://leetcode.com/submissions/detail/248252120/
     * 耗时：60 ms
     * 击败：52.15%
     * 内存：21 MB
     *
    let string = Array(s)
    var retain = Array<String.Element>()
    var max = 0
    for i in 0..<string.count {
        let item = string[i]
        if let index = retain.firstIndex(of: item) {
            retain.removeSubrange(0...index)
        }
        retain.append(item)
        if retain.count > max {
            max = retain.count
        }
    }
     */
    
    /*
     * https://leetcode.com/submissions/detail/248278845/
     * 耗时：44 ms
     * 击败：76.24%
     * 内存：20.9 MB
     *
    let string = Array(s)
    var start = 0
    var value = 0
    var max = 0
    for i in 0..<string.count {
        let item = string[i]
        if let index = string[start..<i].firstIndex(of: item) {
            start = index+1
            value = i-index
        } else {
            value = i-start+1
        }
        if value > max {
            max = value
        }
    }
    return max
     */
    
    /*
     * https://leetcode.com/submissions/detail/248280947/
     * 耗时：56 ms
     * 击败：57.20%
     * 内存：22.6 MB
     *
    let string = Array(s)
    var valueKeys: [String.Element: Int] = [:]
    var start = 0
    var lastIndex = 0
    var value = 0
    var max = 0
    for i in 0..<string.count {
        let item = string[i]
        if valueKeys.keys.contains(item) {
            let index = valueKeys[item]!
            valueKeys[item] = nil
            if index > lastIndex {
                lastIndex = index
            }
            start = lastIndex+1
            value = i-lastIndex
        } else {
            value = i-start+1
        }
        valueKeys[item] = i
        if value > max {
            max = value
        }
    }
    return max
     */
    
    /*
     * https://leetcode.com/submissions/detail/248279332/
     * 耗时：44 ms
     * 击败：76.24%
     * 内存：21 MB
     */
    let string = Array(s)
    var valueKeys: [String.Element: Int] = [:]
    var start = 0
    var lastIndex = 0
    var value = 0
    var max = 0
    for i in 0..<string.count {
        let item = string[i]
        if let index = valueKeys.removeValue(forKey: item) {
            if index > lastIndex {
                lastIndex = index
            }
            start = lastIndex+1
            value = i-lastIndex
        } else {
            value = i-start+1
        }
        valueKeys[item] = i
        if value > max {
            max = value
        }
    }
    return max
}

print(lengthOfLongestSubstring(""))
print(lengthOfLongestSubstring(" "))
print(lengthOfLongestSubstring("au"))
print(lengthOfLongestSubstring("abba"))
print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))

