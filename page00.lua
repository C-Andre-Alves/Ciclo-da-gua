local composer = require("composer")
local scene = composer.newScene()

local avancar

local function abrirTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page01", "slideLeft", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view

    --------Imagens da tela--------

    --Imagem de fundo branco | Localização e Tamanho
    local fundo_branco = display.newImageRect(sceneGroup, "assets/fundo_branco.png", display.contentWidth, display.contentHeight+600)
    fundo_branco.anchorX = 0
    fundo_branco.anchorY = 0
    fundo_branco.x = 0
    fundo_branco.y = display.contentCenterY -800

    --Imagem de fundo da água | Localização
    local fundo_agua = display.newImageRect(sceneGroup, "assets/agua.png", display.contentWidth, display.contentHeight+300)
    fundo_agua.anchorX = 0
    fundo_agua.anchorY = 0
    fundo_agua.x = 0
    fundo_agua.y = -150

     --Logo da upe | Tamanho e localização
     local upe = display.newImageRect(sceneGroup, "assets/upe.png", 220, 150)
     upe.x = display.contentWidth * 0.85
     upe.y = display.contentCenterY -710

     --Nome: Ciclo da água | Tamanho e localização
     local ciclo = display.newImageRect(sceneGroup, "assets/ciclo_da_agua.png", 700, 190)
     ciclo.x = display.contentCenterX
     ciclo.y = display.contentCenterY + 200
     
      --Imagem da seta a direita | Tamanho e localização
    avancar = display.newImageRect(sceneGroup, "assets/seta_azul.png", 120, 90)
    avancar.x = display.contentWidth * 0.9
    avancar.y = display.contentHeight + 250
   
    -- Colocar áudio
    local audio_ciclo_da_agua = audio.loadStream("assets/audio_ciclo_da_agua.mp3")
    audio.reserveChannels(1)
    audio.setVolume( 0.9, { channel=1 } )
    audio.play( audio_ciclo_da_agua, { channel=1, loops=0.5 } )

    local opcao1  = {
        text = "Ciências",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = 600,
        font = native.systemFont,
        fontSize = 100,
        align = "center"
    }

    local opcao2 = {
        text = "Carlos André Alves Ferreira",
        x = display.contentWidth * 0.5,
        y = display.contentCenterY + 600,
        width = 600,
        font = native.systemFont,
        fontSize = 45,
        align = "center"
    }

    local ciencias = display.newText(opcao1)
    local nome = display.newText(opcao2)
    ciencias:setFillColor( 0, 0, 0)
    nome:setFillColor( 0, 0, 255)

    --Adicionando as variáveis no grupo
    sceneGroup:insert(fundo_branco)
    sceneGroup:insert(fundo_agua)
    sceneGroup:insert(ciclo)
    sceneGroup:insert(ciencias)
    sceneGroup:insert(nome)
    sceneGroup:insert(avancar)
    sceneGroup:insert(upe)

end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
    elseif phase == "did" then
        avancar.touch = abrirTela
        avancar:addEventListener("touch", avancar)
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        avancar:removeEventListener("touch", avancar)

    elseif phase == "did" then

    end
end

function scene:destroy(event)
    local sceneGroup = self.view

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
