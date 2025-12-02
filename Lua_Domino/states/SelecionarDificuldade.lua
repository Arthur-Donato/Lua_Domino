local GameState = require 'lib.GameState'

local selecionarDificuldade = { }

function selecionarDificuldade:enter()
    self.fonteBotoes = love.graphics.newFont(32)

    self.botoes = { 
        botaoFacil = {
        x = 535,
        y = 310,
        width = 370,
        height = 90,
        text = "Fácil",
        isHovering = false
        },

        botaoMedio = {
            x = 535,
            y = 425,
            width = 370,
            height = 90,
            text = "Médio",
            isHovering = false
        },

        botaoDificil = {
            x = 535,
            y = 539,
            width = 370,
            height = 90,
            text = "Difícil",
            isHovering = false
        },

        botaoVoltar = {
            x = 1010,
            y = 878,
            width = 370,
            height = 90,
            text = "Voltar",
            isHovering = false
        }
    }
end

function selecionarDificuldade:draw()
    --CRIANDO A LINHA PARA DIVIDIR A TELA AO MEIO 
    love.graphics.clear(0.953, 0.953, 0.953, 1)
    love.graphics.setLineWidth(5)

    love.graphics.setColor(0,0,0,1)
    love.graphics.line(720,0,720,1024)

    love.graphics.setLineWidth(3)

    --CRIANDO OS CIRCULOS
    love.graphics.circle("fill", 1081, 512, 50)

    love.graphics.circle("fill", 358, 512, 50)

    --CRIANDO O BOTAO DIFICULDADE FACIL

    if self.botoes.botaoFacil.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botoes.botaoFacil.x, self.botoes.botaoFacil.y, self.botoes.botaoFacil.width, self.botoes.botaoFacil.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoFacil.x, self.botoes.botaoFacil.y, self.botoes.botaoFacil.width, self.botoes.botaoFacil.height)

    love.graphics.setFont(self.fonteBotoes)

    local posicaoTexto = self.botoes.botaoFacil.y + (self.botoes.botaoFacil.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoFacil.text, self.botoes.botaoFacil.x, posicaoTexto, self.botoes.botaoFacil.width, "center")

    --CRIANDO O BOTAO DIFICULDADE MEDIA

    if self.botoes.botaoMedio.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
        
    end

    love.graphics.rectangle("fill", self.botoes.botaoMedio.x, self.botoes.botaoMedio.y, self.botoes.botaoMedio.width, self.botoes.botaoMedio.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoMedio.x, self.botoes.botaoMedio.y, self.botoes.botaoMedio.width, self.botoes.botaoMedio.height)

    posicaoTexto = self.botoes.botaoMedio.y + (self.botoes.botaoMedio.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoMedio.text, self.botoes.botaoMedio.x, posicaoTexto, self.botoes.botaoMedio.width, "center")


    --CRIANDO O BOTAO DIFICULDADE DIFICIL

    if self.botoes.botaoDificil.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
        
    end

    love.graphics.rectangle("fill", self.botoes.botaoDificil.x, self.botoes.botaoDificil.y, self.botoes.botaoDificil.width, self.botoes.botaoDificil.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoDificil.x, self.botoes.botaoDificil.y, self.botoes.botaoDificil.width, self.botoes.botaoDificil.height)

    posicaoTexto = self.botoes.botaoDificil.y + (self.botoes.botaoDificil.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoDificil.text, self.botoes.botaoDificil.x, posicaoTexto, self.botoes.botaoDificil.width, "center")

    --CRIANDO O BOTAO PARA VOLTAR AO MENU INICIAL

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

function selecionarDificuldade:update()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

    --VERIFICANDO O HOVERING DO BOTAO FACIL
    if mx > self.botoes.botaoFacil.x and
       mx < self.botoes.botaoFacil.x + self.botoes.botaoFacil.width and
       my > self.botoes.botaoFacil.y and
       my < self.botoes.botaoFacil.y + self.botoes.botaoFacil.height
    then
        self.botoes.botaoFacil.isHovering = true
    else
        self.botoes.botaoFacil.isHovering = false
    end

    --VERIFICANDO O HOVERING DO BOTAO MEDIO 

    if mx > self.botoes.botaoMedio.x and
       mx < self.botoes.botaoMedio.x + self.botoes.botaoMedio.width and
       my > self.botoes.botaoMedio.y and
       my < self.botoes.botaoMedio.y + self.botoes.botaoMedio.height
    then
        self.botoes.botaoMedio.isHovering = true
    else
        self.botoes.botaoMedio.isHovering = false
    end

    --VERIFICANDO O HOVERING DO BOTAO DIFICIl

    if mx > self.botoes.botaoDificil.x and
       mx < self.botoes.botaoDificil.x + self.botoes.botaoDificil.width and
       my > self.botoes.botaoDificil.y and
       my < self.botoes.botaoDificil.y + self.botoes.botaoDificil.height
    then
        self.botoes.botaoDificil.isHovering = true
    else
        self.botoes.botaoDificil.isHovering = false
    end
    

    --VERIFICANDO O HOVERING DO BOTAO PARA VOLTAR AO MENU INICIAL

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

function selecionarDificuldade:mousepressed(x, y, button, istouch)
    
    if button == 1 then
        if self.botoes.botaoVoltar.isHovering then
            GameState.switch('menuInicial')
        end

        if self.botoes.botaoFacil.isHovering then
            GameState.switch('Game')
        end

        if self.botoes.botaoMedio.isHovering then
            
        end

        if self.botoes.botaoDificil.isHovering then
            
        end
    end
end

return selecionarDificuldade