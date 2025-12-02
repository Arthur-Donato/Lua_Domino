local WIDTH, HEIGHT = love.window.getDesktopDimensions()
local GameState = require 'lib.GameState'

local menuInicial = {}

function menuInicial:enter()
    self.title = "Domino"

    self.botoes = {
        botaoIniciarJogo = {
        x = 535,
        y = 310,
        width = 370,
        height = 90,
        text = "Iniciar Jogo",
        isHovering = false
        },

        botaoHistorico = {
            x = 535,
            y = 425,
            width = 370,
            height = 90,
            text = "Histórico",
            isHovering = false
        },

        botaoSairJogo = {
            x = 535,
            y = 539,
            width = 370,
            height = 90,
            text = "Sair do Jogo",
            isHovering = false
        }
    }
    
    self.fonteBotoes = love.graphics.newFont(32)

end

function menuInicial:draw()
    --CRIANDO A LINHA PARA DIVIDIR A TELA AO MEIO
    love.graphics.clear(0.953, 0.953, 0.953, 1)
    love.graphics.setLineWidth(5)

    love.graphics.setColor(0,0,0,1)

    love.graphics.line(720,0,720,1024)

    
    --CRIANDO AS CIRCUNFERENCIAS PRESENTES NA TELA
    love.graphics.circle("fill", 131, 227, 50)
    love.graphics.circle("fill", 495, 227, 50)

    love.graphics.circle("fill", 131, 712, 50)
    love.graphics.circle("fill", 495, 712, 50)

    love.graphics.circle("fill", 945, 227, 50)
    love.graphics.circle("fill", 1309, 227, 50)

    love.graphics.circle("fill", 945, 712, 50)
    love.graphics.circle("fill", 1309, 712, 50)

    --CRIANDO O BOTAO DE INICIO DE JOGO

    if self.botoes.botaoIniciarJogo.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)      
    end

    love.graphics.rectangle("fill", self.botoes.botaoIniciarJogo.x, self.botoes.botaoIniciarJogo.y, self.botoes.botaoIniciarJogo.width, self.botoes.botaoIniciarJogo.height)

    love.graphics.setColor(0,0,0,1)
    love.graphics.setLineWidth(3)

    love.graphics.rectangle("line", self.botoes.botaoIniciarJogo.x, self.botoes.botaoIniciarJogo.y, self.botoes.botaoIniciarJogo.width, self.botoes.botaoIniciarJogo.height)

    love.graphics.setLineWidth(1)

    love.graphics.setFont(self.fonteBotoes)

    local posicaoTexto = self.botoes.botaoIniciarJogo.y + (self.botoes.botaoIniciarJogo.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoIniciarJogo.text, self.botoes.botaoIniciarJogo.x, posicaoTexto, self.botoes.botaoIniciarJogo.width, "center")

    --CRIANDO O BOTAO DE HISTORICO DE PARTIDAS

    if self.botoes.botaoHistorico.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botoes.botaoHistorico.x, self.botoes.botaoHistorico.y, self.botoes.botaoHistorico.width, self.botoes.botaoHistorico.height)

    love.graphics.setColor(0,0,0,1)
    love.graphics.setLineWidth(3)

    love.graphics.rectangle("line", self.botoes.botaoHistorico.x, self.botoes.botaoHistorico.y, self.botoes.botaoHistorico.width, self.botoes.botaoHistorico.height)

    love.graphics.setLineWidth(1)

    posicaoTexto = self.botoes.botaoHistorico.y + (self.botoes.botaoHistorico.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoHistorico.text, self.botoes.botaoHistorico.x, posicaoTexto, self.botoes.botaoHistorico.width, "center")

    --CRIANDO O BOTAO PARA SAIR DO JOGO

    if self.botoes.botaoSairJogo.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end

    love.graphics.rectangle("fill", self.botoes.botaoSairJogo.x, self.botoes.botaoSairJogo.y, self.botoes.botaoSairJogo.width, self.botoes.botaoSairJogo.height)

    love.graphics.setLineWidth(3)
    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botoes.botaoSairJogo.x, self.botoes.botaoSairJogo.y, self.botoes.botaoSairJogo.width, self.botoes.botaoSairJogo.height)

    love.graphics.setLineWidth(1)
    
    posicaoTexto = self.botoes.botaoSairJogo.y + (self.botoes.botaoSairJogo.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botoes.botaoSairJogo.text, self.botoes.botaoSairJogo.x, posicaoTexto, self.botoes.botaoSairJogo.width, "center")


    
end

function menuInicial:update()
    --FAZENDO A LOGICA PARA ALTERAR O HOVERING DOS BOTOES 
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

    --LOGICA PARA ALTERAR O HOVERING DO BOTAO INICIAR JOGO
    if mx > self.botoes.botaoIniciarJogo.x and
       mx < self.botoes.botaoIniciarJogo.x + self.botoes.botaoIniciarJogo.width and
       my > self.botoes.botaoIniciarJogo.y and
       my < self.botoes.botaoIniciarJogo.y + self.botoes.botaoIniciarJogo.height
    then
        self.botoes.botaoIniciarJogo.isHovering = true
    else
        self.botoes.botaoIniciarJogo.isHovering = false
    end

    --LOGICA PARA ALTERAR O HOVERING DO BOTAO HISTORICO

    if mx > self.botoes.botaoHistorico.x and
       mx < self.botoes.botaoHistorico.x + self.botoes.botaoHistorico.width and
       my > self.botoes.botaoHistorico.y and
       my < self.botoes.botaoHistorico.y + self.botoes.botaoHistorico.height 
    then
        self.botoes.botaoHistorico.isHovering = true
    else
        self.botoes.botaoHistorico.isHovering = false
        
    end

    --LOFICA PARA ALTERAR O HOVERING DO BOTAO SAIR DO JOGO

    if mx > self.botoes.botaoSairJogo.x and
       mx < self.botoes.botaoSairJogo.x + self.botoes.botaoSairJogo.width and
       my > self.botoes.botaoSairJogo.y and
       my < self.botoes.botaoSairJogo.y + self.botoes.botaoSairJogo.height
    then
        self.botoes.botaoSairJogo.isHovering = true
    else
        self.botoes.botaoSairJogo.isHovering = false
    end
end

function menuInicial:mousepressed(x, y, button, istouch)
    if button == 1 then

        if self.botoes.botaoIniciarJogo.isHovering then
            GameState.switch('selecionarDificuldade')
        end

        if self.botoes.botaoHistorico.isHovering then
            GameState.switch('historico')
        end

        if self.botoes.botaoSairJogo.isHovering then
            GameState.switch('sairJogo')
        end
        
    end
end

return menuInicial