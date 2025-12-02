local GameState = require 'lib.GameState'
local ListaDuplamenteEncadeada = require 'lib.ListaDuplamenteEncadeada'
local Peca  = require 'lib.Peca'
local WIDTH, HEIGHT = love.window.getDesktopDimensions()

local Game = {
    botaoComprar = {
            x = 1100,
            y = 480,
            width = 200,
            height = 80,
            text = "Comprar",
            isHovering = false
    },
    maoJogador = {},
    maoIA = {},
    monte = {}
}

function Game:enter()
    
    self.fonteBotoes = love.graphics.newFont(32)
    self.mesa = ListaDuplamenteEncadeada.new()

    for i=0,6 do
        for j=i,6 do
            local imagemPeca = love.graphics.newImage("images/"..i.."-"..j..".png")--carrega a imagem da peça
            print("images/"..i.."-"..j..".png")
            local novaPeca = {
                valor1 = i,
                valor2 = j,
                img = imagemPeca,
                x = 0,
                y = 0,
                width = 100,
                height = 160
            }
            table.insert(self.monte,novaPeca)

        end
    end
    DistribuirPecas(self.monte)

    
    
end


function Embaralhar(monte)
    local j
    for i = #monte, 2, -1 do
        j = math.random(i)
        monte[i], monte[j] = monte[j], monte[i]--OBS
    end
    return monte
end

function DistribuirPecas(monte)
    Game.monte = Embaralhar(monte)
    for i=0,7 do
        local peca = table.remove(Game.monte)
        table.insert(Game.maoJogador,peca)

        peca = table.remove(Game.monte)
        table.insert(Game.maoIA,peca)
    end


end
--OBS: Obs:
--deck[i], deck[j] = deck[j], deck[i]

--É equivalente a:

--Peca temp = deck[i];
--deck[i] = deck[j];
--deck[j] = temp
--no java

function Game:draw()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()
    local posicaoAtual = 30

    love.graphics.clear(0.953, 0.953, 0.953, 1)

    --ADICIONANDO O BTOAO DE COMPRAR UMA NOVA PECA
    if self.botaoComprar.isHovering then
        love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else
        love.graphics.setColor(1,1,1,1)
    end
    if mx > self.botaoComprar.x and
       mx < self.botaoComprar.x + self.botaoComprar.width and
       my > self.botaoComprar.y and
       my < self.botaoComprar.y + self.botaoComprar.height
    then
        self.botaoComprar.isHovering = true
    else
        self.botaoComprar.isHovering = false
    end

    love.graphics.rectangle("fill", self.botaoComprar.x, self.botaoComprar.y, self.botaoComprar.width, self.botaoComprar.height)

    love.graphics.setColor(0,0,0,1)

    love.graphics.rectangle("line", self.botaoComprar.x, self.botaoComprar.y, self.botaoComprar.width, self.botaoComprar.height)

    local posicaoTexto = self.botaoComprar.y + (self.botaoComprar.height / 2) - (self.fonteBotoes:getHeight() / 2)

    love.graphics.printf(self.botaoComprar.text, self.botaoComprar.x, posicaoTexto, self.botaoComprar.width, "center")

    love.graphics.setColor(1,1,1,1)
    --ADICIONANDO AS PECAS DO JOGO
    

    for _,piece in ipairs(self.maoJogador) do--NOTE:
        love.graphics.draw(piece.img,posicaoAtual,580)
        posicaoAtual = posicaoAtual + piece.width + 20
    end

--NOTE: Explicação do for acima:
-- em Lua não se sabe oque a tabela é, se é apenas uma tabela normal [1,2,3,4,5] ou uma tabela-hashtable {"primeiro"=5,"segundo"=2}
-- assim devemos deixar claro como deve se percorrer a tabela assim:
-- ipairs diz a Lua que deve percorrer a lista em ordem (1,2,3,4)
-- o "_" representa o index i que usamos normalmente. Porém, é algo comun usar o _ para representar um index que não pretedemos usar
-- isso é necessário pois, a linguagem lua retorna dois valores ao colocar apenas "for piece in lista"
-- irá retornar o valor do indice e o valor da lista, assim sendo necessário """"""tratar""""" ambos
    
    
end

function Game:update()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()

  
    
end

function Game:mousepressed(x, y, button, istouch)

   
end


return Game