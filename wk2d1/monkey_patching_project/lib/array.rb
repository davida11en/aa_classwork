# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0

        return self.max - self.min
    end

    def average
        return nil if self.length == 0

        return (self.sum / self.length.to_f)
    end

    def median
        return nil if self.length == 0

        sorted = self.sort
        mid = sorted.length / 2

        if sorted.length % 2 == 1 
            return sorted[mid]
        else    
            midsum = sorted[mid] + sorted[mid-1]
            return (midsum / 2.to_f)
        end
    end

    def counts
        count = Hash.new(0)
        self.each do |el|
            count[el] += 1
        end
        count
    end

    def my_count(val)
        count = 0
        self.each do |el|
            if val == el
                count += 1
            end
        end
        count
    end

    def my_index(val)
        return nil if !self.include?(val)
        self.each_with_index do |el, i|
            if el == val
                return i
            end
        end
    end

    def my_uniq
        count = Hash.new(0)
        self.each do |el|
            count[el] += 1
        end
        count.keys
    end

    def my_transpose
        res = []
        self.length.times do 
            res << []
        end

        self.each_with_index do |row, rowi|
            row.each_with_index do |el, i|
                res[i] << el
            end
        end
        res
    end
end
