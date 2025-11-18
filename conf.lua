function love.conf(t)
    
    -- O Lua entende que 't.window' deve ser criado
    -- automaticamente para que 'title' possa ser colocado dentro dele.
    
    t.window.title = "Domino"
    t.window.resizable = false
    t.window.fullscreen = false
    t.window.width = 1440
    t.window.height = 1024
    t.console = true -- Lembre-se deste teste!

end