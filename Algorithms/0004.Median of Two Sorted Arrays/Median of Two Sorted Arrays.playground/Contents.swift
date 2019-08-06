///
/// https://leetcode.com/problems/median-of-two-sorted-arrays/
///

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    /*
     * https://leetcode.com/submissions/detail/249421030/
     * 耗时：96 ms
     * 击败：45.74%
     * 内存：21.5 MB
     *
    let num = (nums1+nums2).sorted(by: <)
    if num.count % 2 == 1 {
        return Double(num[num.count/2])
    } else {
        return Double(num[num.count/2-1]+num[num.count/2])/2
    }
    return 0
     */
    
    /*
     * https://leetcode.com/submissions/detail/249433950/
     * 耗时：88 ms
     * 击败：72.56%
     * 内存：21 MB
     *
    let total = nums1.count+nums2.count
    let isOddNumber = total%2 == 1
    let half = total/2
    var nums1Index = 0
    var nums2Index = 0
    var array: [Int] = []
    for i in 0..<total {
        if nums1Index < nums1.count, nums2Index < nums2.count {
            if nums1[nums1Index] < nums2[nums2Index] {
                array.append(nums1[nums1Index])
                nums1Index += 1
            } else {
                array.append(nums2[nums2Index])
                nums2Index += 1
            }
        } else if nums1Index < nums1.count {
            array.append(nums1[nums1Index])
            nums1Index += 1
        } else if nums2Index < nums2.count {
            array.append(nums2[nums2Index])
            nums2Index += 1
        }
        if i == half {
            if isOddNumber {
                return Double(array[half])
            } else {
                return Double(array[half]+array[half-1])/2
            }
        }
    }
    return 0
     */
 
    /*
     * https://leetcode.com/submissions/detail/249441234/
     * 耗时：80 ms
     * 击败：96.67%
     * 内存：21.1 MB
     */
    let total = nums1.count+nums2.count
    let isOddNumber = total%2 == 1
    let half = total/2
    var lastIsNumber1 = true
    var isNums1 = true
    var nums1Index = 0
    var nums2Index = 0
    for i in 0..<total {
        if nums1Index < nums1.count, nums2Index < nums2.count {
            if nums1[nums1Index] < nums2[nums2Index] {
                nums1Index += 1
                isNums1 = true
            } else {
                nums2Index += 1
                isNums1 = false
            }
        } else if nums1Index < nums1.count {
            nums1Index += 1
            isNums1 = true
        } else if nums2Index < nums2.count {
            nums2Index += 1
            isNums1 = false
        }
        if i == half {
            if isOddNumber {
                if isNums1 {
                    return Double(nums1[nums1Index-1])
                } else {
                    return Double(nums2[nums2Index-1])
                }
            } else {
                let firstNum: Int
                let secondNum: Int
                if lastIsNumber1 {
                    if isNums1 {
                        firstNum = nums1[nums1Index-2]
                        secondNum = nums1[nums1Index-1]
                    } else {
                        firstNum = nums1[nums1Index-1]
                        secondNum = nums2[nums2Index-1]
                    }
                } else {
                    if isNums1 {
                        firstNum = nums2[nums2Index-1]
                        secondNum = nums1[nums1Index-1]
                    } else {
                        firstNum = nums2[nums2Index-2]
                        secondNum = nums2[nums2Index-1]
                    }
                }
                return Double(firstNum+secondNum)/2
            }
        }
        lastIsNumber1 = isNums1
    }
    return 0
}

print(findMedianSortedArrays([1,3], [2]))
print(findMedianSortedArrays([1,2], [3,4]))
print(findMedianSortedArrays([], [2,3]))
