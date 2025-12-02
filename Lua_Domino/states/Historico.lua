local GameState = require 'lib.GameState'
local WIDTH, HEIGHT = love.window.getDesktopDimensions()

local historico = {}

function historico:enter()
    self.fonteBotoes = love.graphics.newFont(32)

    self.botaoVoltar = {
        x = 1010,
        y = 878,
        width = 370,
        height = 90,
        text = "VOLTAR",
        isHovering = false
    }
    
end

function historico:draw()

    love.graphics.clear(0.953, 0.953, 0.953, 1)

    if self.botaoVoltar.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botaoVoltar.x, self.botaoVoltar.y, self.botaoVoltar.width, self.botaoVoltar.height)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setLineWidth(3)

    love.graphics.rectangle("line", self.botaoVoltar.x, self.botaoVoltar.y, self.botaoVoltar.width, self.botaoVoltar.height)

    local posicaoTexto = self.botaoVoltar.y + (self.botaoVoltar.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botaoVoltar.text, self.botaoVoltar.x, posicaoTexto, self.botaoVoltar.width, "center")
    
end

function historico:update()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

    if mx > self.botaoVoltar.x and
       mx < self.botaoVoltar.x + self.botaoVoltar.width and
       my > self.botaoVoltar.y and
       my < self.botaoVoltar.y + self.botaoVoltar.height
    then
        self.botaoVoltar.isHovering = true
    else
        self.botaoVoltar.isHovering = false
    end
    
end

function historico:mousepressed(x, y, button, istouch)
    if button == 1 then
        if self.botaoVoltar.isHovering then
            GameState.switch('menuInicial')
        end
    end
end



return historico