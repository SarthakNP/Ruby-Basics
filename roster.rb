class Person
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        return self
    end

    def getAge
        return @age
    end

    def setAge(x)
        @age = x
    end


end

class Student < Person
    attr_accessor :grade
    def initialize(name,age, grade)
        @name = name
        @age = age
        @grade = grade
        return self
    end

    def getGrade
        return @grade
    end

    def changeGrade(x)
        @grade = x
        return self
    end
end

class Staff < Person 
    attr_accessor :position
    def initialize(name,age, position)
        @name = name
        @age = age
        @position = position
        return self
    end

    def getPosition
        return @position
    end

    def changePosition(newPosition)
        @position = newPosition
        return self
    end
end

class Roster
    attr_accessor :persons, :size
    def initialize
        @persons = []
        @size = 0
    end

    def add(person)
        @persons.append(person)
        @size += 1
    end

    def size
        return @size
    end

    def getPerson(name)
        for person in @persons
            if person.name == name
                return person
            end
        end
        return nil
    end

    def remove(person)
        if @persons.index(person)
            @persons.delete(person)
        end
        @size -= 1
    end

    def map(&blk)
        if block_given?
            for i in @persons
                yield i
            end
        end
    end
end


