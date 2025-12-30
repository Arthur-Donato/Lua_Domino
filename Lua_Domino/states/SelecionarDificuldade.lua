local GameState = require 'lib.GameState'

local selecionarDificuldade = {}

function selecionarDificuldade:enter()
    self.fonteBotoes = love.graphics.newFont(32)

    -- Lista sequencial de botões
    self.botoes = {
        {
            id = "facil",
            x = 535, y = 310,
            width = 370, height = 90,
            text = "Fácil",
            isHovering = false
        },
        {
            id = "medio",
            x = 535, y = 425,
            width = 370, height = 90,
            text = "Médio",
            isHovering = false
        },
        {
            id = "dificil",
            x = 535, y = 539,
            width = 370, height = 90,
            text = "Difícil",
            isHovering = false
        },
        {
            id = "voltar",
            x = 1010, y = 878,
            width = 370, height = 90,
            text = "Voltar",
            isHovering = false
        }
    }
end

function selecionarDificuldade:draw()
    love.graphics.clear(0.953, 0.953, 0.953, 1)
    love.graphics.setLineWidth(5)
    love.graphics.setColor(0,0,0,1)
    love.graphics.line(720,0,720,1024)

    love.graphics.setLineWidth(3)
    love.graphics.circle("fill", 1081, 512, 50)
    love.graphics.circle("fill", 358, 512, 50)

    -- Loop para desenhar todos os botões
    for _, botao in ipairs(self.botoes) do
        if botao.isHovering then
            love.graphics.setColor(0.8, 0.8, 0.8, 1)
        else
            love.graphics.setColor(1,1,1,1)
        end

        love.graphics.rectangle("fill", botao.x, botao.y, botao.width, botao.height)

        love.graphics.setColor(0,0,0,1)
        love.graphics.rectangle("line", botao.x, botao.y, botao.width, botao.height)

        love.graphics.setFont(self.fonteBotoes)
        local posicaoTexto = botao.y + (botao.height / 2) - (self.fonteBotoes:getHeight() / 2)
        love.graphics.printf(botao.text, botao.x, posicaoTexto, botao.width, "center")
    end
end

function selecionarDificuldade:update()
    local mx, my = love.mouse.getX(), love.mouse.getY()

    for _, botao in ipairs(self.botoes) do
        if mx > botao.x and mx < botao.x + botao.width and
           my > botao.y and my < botao.y + botao.height then
            botao.isHovering = true
        else
            botao.isHovering = false
        end
    end
end

function selecionarDificuldade:mousepressed(x, y, button, istouch)
    if button == 1 then
        for _, botao in ipairs(self.botoes) do
            if botao.isHovering then
                if botao.id == "voltar" then
                    GameState.switch('menuInicial')
                elseif botao.id == "facil" then
                    GameState.switch('Game')
                elseif botao.id == "medio" then
                    -- lógica para dificuldade média
                elseif botao.id == "dificil" then
                    -- lógica para dificuldade difícil
                end
            end
        end
    end
end

return selecionarDificuldade
