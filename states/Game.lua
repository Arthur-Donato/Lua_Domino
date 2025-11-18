local GameState = require 'lib.GameState'
local ListaDuplamenteEncadeada = require 'lib.ListaDuplamenteEncadeada'
local Peca  = require 'lib.Peca'

local Game = {}

function Game:enter()
    self.fonteBotoes = love.graphics.newFont(32)

    self.lista = ListaDuplamenteEncadeada.new()
    self.lista:addFirst(6,6)

    self.botoes = {
        botaoComprar = {
            x = 1010,
            y = 878,
            width = 370,
            height = 90,
            text = "Comprar",
            isHovering = false
        },

        pecaInicial = {
            x = 651,
            y = 382,
            width = 100,
            height = 60,
            text = "6 - 6"
        },

        primeiraPeca = {
            x = 398,
            y = 888,
            width = 73,
            height = 136,
            isCompatible = false,
            value = Peca.new(6,3),
            text = "6 - 3",
            isHovering = false,
            clicked = false
            --ADICIONAR A IMAGEM DA PECA COMO UM PNG
        },

        segundaPeca = {
            x = 471,
            y = 888,
            width = 73,
            height = 136,
            isCompatible = false,
            value = Peca.new(3,1),
            text = "3 - 1",
            isHoveirng = false,
            isBlock = false
        }

        --PROVAVELMENTE AS PECAS SERAO TRATADAS COMO BOTOES TAMBENM
    }
    
end

function Game:draw()

    love.graphics.clear(0.953, 0.953, 0.953, 1)


    --ADICIONANDO O BTOAO DE COMPRAR UMA NOVA PECA
    if self.botoes.botaoComprar.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botoes.botaoComprar.x, self.botoes.botaoComprar.y, self.botoes.botaoComprar.width, self.botoes.botaoComprar.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoComprar.x, self.botoes.botaoComprar.y, self.botoes.botaoComprar.width, self.botoes.botaoComprar.height)

    local posicaoTexto = self.botoes.botaoComprar.y + (self.botoes.botaoComprar.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoComprar.text, self.botoes.botaoComprar.x, posicaoTexto, self.botoes.botaoComprar.width, "center")

    --ADICIONANDO AS PECAS DO JOGO

    love.graphics.setColor(1,1,1,1)

    love.graphics.rectangle("fill", self.botoes.pecaInicial.x, self.botoes.pecaInicial.y, self.botoes.pecaInicial.width, self.botoes.pecaInicial.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.pecaInicial.x, self.botoes.pecaInicial.y, self.botoes.pecaInicial.width, self.botoes.pecaInicial.height)

    posicaoTexto = self.botoes.pecaInicial.y + (self.botoes.pecaInicial.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.pecaInicial.text, self.botoes.pecaInicial.x, posicaoTexto, self.botoes.pecaInicial.width)

    if self.botoes.primeiraPeca.isCompatible then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botoes.primeiraPeca.x, self.botoes.primeiraPeca.y, self.botoes.primeiraPeca.width, self.botoes.primeiraPeca.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.primeiraPeca.x, self.botoes.primeiraPeca.y, self.botoes.primeiraPeca.width, self.botoes.primeiraPeca.height)

    posicaoTexto = self.botoes.primeiraPeca.y + (self.botoes.primeiraPeca.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.primeiraPeca.text, self.botoes.primeiraPeca.x, posicaoTexto, self.botoes.primeiraPeca.width)

    if self.botoes.primeiraPeca.clicked then
        self.botoes.primeiraPeca.x = 751
        self.botoes.primeiraPeca.y = 382
        self.botoes.primeiraPeca.width = 100
        self.botoes.primeiraPeca.height = 60

    end

    if self.botoes.segundaPeca.isCompatible then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1, 1, 1, 1)
    end

    love.graphics.rectangle("fill", self.botoes.segundaPeca.x, self.botoes.segundaPeca.y, self.botoes.segundaPeca.width, self.botoes.segundaPeca.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.segundaPeca.x, self.botoes.segundaPeca.y, self.botoes.segundaPeca.width, self.botoes.segundaPeca.height)

    posicaoTexto = self.botoes.segundaPeca.y + (self.botoes.segundaPeca.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.segundaPeca.text, self.botoes.segundaPeca.x, posicaoTexto, self.botoes.segundaPeca.width)

    
    
end

function Game:update()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

    --TRATAMENTO DE ESTADO PARA A PRIMEIRA PECA
    if mx > self.botoes.primeiraPeca.x and
       mx < self.botoes.primeiraPeca.x + self.botoes.primeiraPeca.width and
       my > self.botoes.primeiraPeca.y and
       my < self.botoes.primeiraPeca.y + self.botoes.primeiraPeca.height
     then
        self.botoes.primeiraPeca.isHovering = true
    else 
        self.botoes.primeiraPeca.isHovering = false
    end

    if self.botoes.primeiraPeca.value:EhCompativelLadoEsquerdo(self.lista:getHeadValue()) or
       self.botoes.primeiraPeca.value:EhCompativelLadoDireito(self.lista:getHeadValue()) 
     then
        self.botoes.primeiraPeca.isCompatible = true
     else
        self.botoes.primeiraPeca.isCompatible = false
    end

    --TRATAMENTO DE ESTADO PARA A SEGUNDA PECA
    if mx > self.botoes.segundaPeca.x and
       mx < self.botoes.segundaPeca.x + self.botoes.segundaPeca.width and
       my > self.botoes.segundaPeca.y and
       my < self.botoes.segundaPeca.y + self.botoes.segundaPeca.height
     then
        self.botoes.segundaPeca.isHovering = true
     else
        self.botoes.segundaPeca.isHovering = false
    end

    if self.botoes.segundaPeca.value:EhCompativelLadoEsquerdo(self.lista:getHeadValue()) or
       self.botoes.segundaPeca.value:EhCompativelLadoDireito(self.lista:getHeadValue()) or
       self.botoes.segundaPeca.value:EhCompativelLadoEsquerdo(self.lista:getTailValue()) or
       self.botoes.segundaPeca.value:EhCompativelLadoDireito(self.lista:getTailValue())
       then
        self.botoes.segundaPeca.isCompatible = true
        
       else
        self.botoes.segundaPeca.isCompatible = false
        
    end
    
end

function Game:mousepressed(x, y, button, istouch)

    if button == 1 then
        if self.botoes.primeiraPeca.isHovering and self.botoes.primeiraPeca.isCompatible then
            self.botoes.primeiraPeca.clicked = true
            self.lista:addLast(6, 3)
            
        end

        if self.botoes.segundaPeca.isHovering and self.botoes.segundaPeca.isCompatible then
            self.botoes.segundaPeca.haveClicked = true
        end
        
    end
end


return Game