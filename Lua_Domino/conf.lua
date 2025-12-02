

function love.conf(t)
    
    -- O Lua entende que 't.window' deve ser criado
    -- automaticamente para que 'title' possa ser colocado dentro dele.
    
    
    
    t.window.title = "Domino"
    t.window.resizable = true
    t.window.fullscreen = false
    t.window.width = 0
    t.window.height =0
    t.console = true -- Lembre-se deste teste!

end