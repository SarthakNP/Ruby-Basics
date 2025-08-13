def fib(n)
	fib_arr = []
	if n == 0
		return fib_arr
	elsif n == 1
		fib_arr[0] = 0
		return fib_arr
	else
		fib_arr[0] = 0
		fib_arr[1] = 1
		index = 2
		while index < n
			fib_arr[index] = fib_arr[index-1] + fib_arr[index-2]
            index += 1
		end
        return fib_arr
	end
end

def isPalindrome(n)
    length = n.to_s.length
    digits = n.to_s
    reverse = digits.reverse
    if digits.eql?(reverse)
        return true
    else
        return false
    end   
end

def nthmax(n, a)
    sorted = a.sort()
    sorted = sorted.reverse
    length = a.length
    if (n < length)
        return sorted[n]
    else
        return nil
    end
end

def freq(s)
    if s.length == 0
        return ""
    end
    max = -1
    max_char = ""
    s.each_char{|c|
        count = s.count(c)
        if max < count
            max = count
            max_char = c
        end
    }
    return max_char
end

def zipHash(arr1, arr2)
    index = 0
    map = Hash.new
    if arr1.length() != arr2.length() 
        return nil
    else
        for elem in arr1
            map[elem] = arr2[index]
            index += 1
        end
    end
    return map
end

def hashToArray(hash)
    keys = hash.keys
    result = []
    index = 0
    for key in keys
        result[index] = [key, hash[key]]
        index += 1
    end
    return result
end

def maxProcChain(init, procs)
    max = -1000
    temp = -1000
    temp2 = -1000
    temp3 = -1000
    for i in 0..procs.length-1
        temp = procs[i].call(init)
        if temp > max
            max = temp
        end
        for j in i+1..procs.length-1
            temp2 = procs[j].call(temp)
            if temp2 > max
                max = temp2
            end
            temp3 = maxProcAux(temp2, j, max, procs)
            if temp3 > max
                max = temp3
            end
        end
    end    
    return max

end

def maxProcAux(value,index,max, procs)
    max = -10000
    temp = value
    for i in index+1..procs.length-1
        temp = procs[i].call(temp)
        if temp > max
            max = temp
        end
    end
    return max
end
