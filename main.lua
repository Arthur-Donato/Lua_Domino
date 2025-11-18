gameState = "menuInicial"
local GameState = require 'lib.GameState'

function love.load()
    --ADICIONANDO A TELA PARA SER RECONHECIDA COMO UM ESTADO
    GameState.register("menuInicial", require 'states.MenuInicial')
    GameState.register("selecionarDificuldade", require 'states.SelecionarDificuldade')
    GameState.register("sairJogo", require 'states.SairJogo')
    GameState.register("historico", require 'states.Historico')
    GameState.register("Game", require 'states.Game')

    --INICIANDO O JOGO NA TELA DE MENU INICIAL
    GameState.switch("menuInicial")
    
end

function love.update(dt)
    GameState.update(dt)
    
end

function love.draw()
    GameState.draw()
    
end

function love.mousepressed(x, y, button, istouch)
    GameState.mousepressed(x, y, button, istouch)
end