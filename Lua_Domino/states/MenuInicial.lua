local WIDTH, HEIGHT = love.window.getDesktopDimensions()
local GameState = require 'lib.GameState'

local baseWidth = 1920
local baseHeight = 1080

ScaleX = WIDTH / baseWidth --Pegando a proporção da largura da tela
local scaleY = HEIGHT / baseHeight -- Pegando a proporção da altura da tela

local btnResponsiveX = 370 * scaleX -- Determinando tamanho dos botoes de forma responsiva
local btnResponsiveY = 90 * scaleY

local btnDisposicaoTelaX = (WIDTH / 2) - btnResponsiveX / 2

local btnSpaceY = 20 * scaleY -- Espaçamento entre os botões

local menuInicial = {}

function menuInicial:enter()
    self.title = "Domino"

    self.botoes = {
        {
            id = "botaoIniciarJogo",
            width = btnResponsiveX,
            height = btnResponsiveY,
            text = "Iniciar Jogo",
            x = 0,
            y = 0,
            isHovering = false
        },

        {
            id = "botaoHistorico",
            width = btnResponsiveX,
            height = btnResponsiveY,
            text = "Histórico",
            x = 0,
            y = 0,
            isHovering = false
        },

        {   
            id = "botaoSairJogo",
            width = btnResponsiveX,
            height = btnResponsiveY,
            text = "Sair do Jogo",
            x = 0,
            y = 0,
            isHovering = false
        }
    }
    
    self.fonteBotoes = love.graphics.newFont(32 * scaleX)

end

function menuInicial:draw()
    --CRIANDO A LINHA PARA DIVIDIR A TELA AO MEIO
    love.graphics.clear(0.953, 0.953, 0.953, 1)
    love.graphics.setLineWidth(5)

    love.graphics.setColor(0,0,0,1)

    love.graphics.line(WIDTH/2,0,WIDTH/2,HEIGHT)

    
    --CRIANDO AS CIRCUNFERENCIAS PRESENTES NA TELA
    love.graphics.circle("fill", WIDTH*0.1, HEIGHT*0.2, 50 * scaleX)
    love.graphics.circle("fill", WIDTH*0.38, HEIGHT*0.2, 50 * scaleX)

    love.graphics.circle("fill", WIDTH*0.1, HEIGHT*0.68, 50 * scaleX)
    love.graphics.circle("fill", WIDTH*0.38, HEIGHT*0.68, 50 * scaleX)
    love.graphics.circle("fill", WIDTH*0.61, HEIGHT*0.2, 50 * scaleX)
    love.graphics.circle("fill", WIDTH*0.88, HEIGHT*0.2, 50 *scaleX)

    love.graphics.circle("fill", WIDTH*0.61, HEIGHT*0.68, 50 * scaleX)
    love.graphics.circle("fill", WIDTH*0.88, HEIGHT*0.68, 50 * scaleX)

    --CRIANDO O BOTAO DE INICIO DE JOGO
    local posicaoAtualY = (HEIGHT/2) + btnResponsiveY -- deixando o primeiro botao abaixo do centro da tela
    for _,piece in ipairs(self.botoes) do
        
        if piece.isHovering then
            love.graphics.setColor(0.8, 0.8, 0.8, 1)
        else
            love.graphics.setColor(1, 1, 1, 1)
        end

        love.graphics.rectangle("fill", btnDisposicaoTelaX, posicaoAtualY, piece.width, piece.height)

        love.graphics.setColor(0,0,0,1)
        love.graphics.setLineWidth(3)

        love.graphics.rectangle("line", btnDisposicaoTelaX, posicaoAtualY, piece.width, piece.height)

        love.graphics.setLineWidth(1)

        love.graphics.setFont(self.fonteBotoes)

        local posicaoTexto = posicaoAtualY + (piece.height / 2) - (self.fonteBotoes:getHeight() / 2)

        love.graphics.printf(piece.text, btnDisposicaoTelaX, posicaoTexto, piece.width, "center")

        piece.x = btnDisposicaoTelaX
        piece.y = posicaoAtualY


        posicaoAtualY = posicaoAtualY + piece.height + btnSpaceY

    end



    
end

function menuInicial:update()
    --FAZENDO A LOGICA PARA ALTERAR O HOVERING DOS BOTOES 
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

    for _,piece in ipairs(self.botoes) do
    --LOGICA PARA ALTERAR O HOVERING DO BOTAO INICIAR JOGO
        if mx > piece.x and
           mx < piece.x + piece.width and
           my > piece.y and
           my < piece.y + piece.height
        then
            piece.isHovering = true
        else
            piece.isHovering = false
        end
    end

end

function menuInicial:mousepressed(x, y, button, istouch)
    if button == 1 then

        if self.botoes[1].isHovering then
            GameState.switch('selecionarDificuldade')
        end

        if self.botoes[2].isHovering then
            GameState.switch('historico')
        end

        if self.botoes[3].isHovering then
            GameState.switch('sairJogo')
        end
        
    end
end

return menuInicial