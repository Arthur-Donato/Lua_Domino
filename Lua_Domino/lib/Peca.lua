local Peca = {}

Peca.__index = Peca

function Peca.new(leftValue, rightValue)

    local instance = {
        rightValue = rightValue,
        leftValue = leftValue,
    }

    setmetatable(instance, Peca)
    return instance
    
end

function Peca:EhCarrerao()
    return self.rightValue == self.leftValue
    
end

function Peca:EhCompativelLadoEsquerdo(value)
    
    return self.leftValue == value
end

function Peca:EhCompativelLadoDireito(value)
    
    return self.rightValue == value

end

function Peca:returnsRightValue()
    return self.rightValue
end

return Peca