local GameState = require 'lib.GameState'

local sairJogo = { }

function sairJogo:enter()
    self.fonteBotoes = love.graphics.newFont(32)

    self.botoes = {
        botaoConfirmar = {
            x = 173,
            y = 422,
            width = 370,
            height = 90,
            text = "CONFIRMAR",
            isHovering = false
        },

        botaoVoltar = {
            x = 896,
            y = 422,
            width = 370,
            height = 90,
            text = "VOLTAR",
            isHovering = false
        }
    }
    
end

function sairJogo:draw()
    --CRIANDO A LINHA PARA DIVIDIR A TELA
    love.graphics.clear(0.953, 0.953, 0.953, 1)
    love.graphics.setLineWidth(5)

    love.graphics.setColor(0,0,0,1)

    love.graphics.line(720,0,720,1024)

    love.graphics.setLineWidth(3)

    --CRIANDO OS CIRCULOS
    love.graphics.circle("fill", 150, 232, 50)
    love.graphics.circle("fill", 358, 232, 50)
    love.graphics.circle("fill", 567, 232, 50)

    love.graphics.circle("fill", 150, 701, 50)
    love.graphics.circle("fill", 358, 701, 50)
    love.graphics.circle("fill", 567, 701, 50)

    love.graphics.circle("fill", 873, 232, 50)
    love.graphics.circle("fill", 1081, 232, 50)
    love.graphics.circle("fill", 1290, 232, 50)

    love.graphics.circle("fill", 873, 701, 50)
    love.graphics.circle("fill", 1081, 701, 50)
    love.graphics.circle("fill", 1290, 701, 50)


    --CRIANDO O BOTAO DE CONFIRMAR SAIDA

    if self.botoes.botaoConfirmar.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botoes.botaoConfirmar.x, self.botoes.botaoConfirmar.y, self.botoes.botaoConfirmar.width, self.botoes.botaoConfirmar.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoConfirmar.x, self.botoes.botaoConfirmar.y, self.botoes.botaoConfirmar.width, self.botoes.botaoConfirmar.height)

    local posicaoTexto = self.botoes.botaoConfirmar.y + (self.botoes.botaoConfirmar.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.setFont(self.fonteBotoes)

    love.graphics.printf(self.botoes.botaoConfirmar.text, self.botoes.botaoConfirmar.x, posicaoTexto, self.botoes.botaoConfirmar.width, "center")

    --CRIANDO O BOTAO PARA VOLTAR PARA O MENU PRINCIPAL

    if self.botoes.botaoVoltar.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
        
    end

    love.graphics.rectangle("fill", self.botoes.botaoVoltar.x, self.botoes.botaoVoltar.y, self.botoes.botaoVoltar.width, self.botoes.botaoVoltar.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoVoltar.x, self.botoes.botaoVoltar.y, self.botoes.botaoVoltar.width, self.botoes.botaoVoltar.height)

    posicaoTexto = self.botoes.botaoVoltar.y + (self.botoes.botaoVoltar.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoVoltar.text, self.botoes.botaoVoltar.x, posicaoTexto, self.botoes.botaoVoltar.width, "center")
    
end

function sairJogo:update()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

    --VERIFICANDOO O HOVERING DO BOTAO CONFIRMAR
    if mx > self.botoes.botaoConfirmar.x and
       mx < self.botoes.botaoConfirmar.x + self.botoes.botaoConfirmar.width and
       my > self.botoes.botaoConfirmar.y and
       my < self.botoes.botaoConfirmar.y + self.botoes.botaoConfirmar.height
    then
        self.botoes.botaoConfirmar.isHovering = true
    else
        self.botoes.botaoConfirmar.isHovering = false
    end

    --VERIFICANDO O HOVERING DO BOTAO VOLRTAR
    if mx > self.botoes.botaoVoltar.x and
       mx < self.botoes.botaoVoltar.x + self.botoes.botaoVoltar.width and
       my > self.botoes.botaoVoltar.y and
       my < self.botoes.botaoVoltar.y + self.botoes.botaoVoltar.height
    then
        self.botoes.botaoVoltar.isHovering = true
    else
        self.botoes.botaoVoltar.isHovering = false
    end
    
end

function sairJogo:mousepressed(x, y, button, istouch)
    
    if button == 1 then
        if self.botoes.botaoConfirmar.isHovering then
            os.exit(0)
        end

        if self.botoes.botaoVoltar.isHovering then
            GameState.switch('menuInicial')
        end
    end
end


return sairJogo