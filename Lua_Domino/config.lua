local config = {}

-- Pega dimensões atuais da janela
config.WIDTH, config.HEIGHT = love.graphics.getDimensions()

-- Base para responsividade
config.baseWidth = 1920
config.baseHeight = 1080

config.scaleX = config.WIDTH / config.baseWidth --Determinando a proporção da largura da tela(porcetagem)
config.scaleY = config.HEIGHT / config.baseHeight

config.btnResponsiveX = 370 * config.scaleX -- Determinando tamanho dos botoes de forma responsiva
config.btnResponsiveY = 90 * config.scaleY

return config
