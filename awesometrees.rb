def max (row, pos, tri)
    x = data_at(row, pos, tri)
    puts row.to_s + " " + pos.to_s
    if !x
        return 0
    else
        rr,rp = right_child(row, pos)
        lr,lp = left_child(row, pos)
        return [max(rr, rp), max(lr,lp)].max + x
    end
end

def left_child (row,pos)
    return row+1, pos
end

def right_child (row, pos)
    return row+1, pos+1
end

def data_at (row, pos, tri)
    return tri[row][pos]
end

x = IO.binread("triangle.txt").split("\n").map{|x| x.split(" ").map{|x| x.to_i}}

for row in (x.length-2).downto(0)
    x[row].each_index do |pos|
        x[row][pos] += [data_at(row+1, pos, x), data_at(row+1, pos+1, x)].max
    end
end

puts x[0][0]    