local composer = require("composer")
local scene = composer.newScene()

local avancar, retornar

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page00", "slideRight", 800)
        return true
    end
end

local function proximaTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page02", "slideLeft", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view

    --Imagem de fundo branco | Localização e Tamanho
    local fundo_branco = display.newImageRect(sceneGroup, "assets/fundo_branco.png", display.contentWidth, display.contentHeight+600)
    fundo_branco.anchorX = 0
    fundo_branco.anchorY = 0
    fundo_branco.x = 0
    fundo_branco.y = display.contentCenterY -800

    --Imagem de céu | Localização e Tamanho
    --local ceu_tela1 = display.newImageRect(sceneGroup, "assets/ceu_tela1.png", display.contentWidth, display.contentHeight-560)
    --fundo_branco.anchorX = 0
    --fundo_branco.anchorY = 0
    --ceu_tela1.x = display.contentCenterX
    --ceu_tela1.y = display.contentCenterY -640

    --Imagem de planeta dentro da Água | Localização e Tamanho
    local planeta_na_agua_reduzido = display.newImageRect(sceneGroup, "assets/planeta_na_agua_reduzido.png", display.contentWidth, display.contentHeight-420)
    planeta_na_agua_reduzido.x = display.contentCenterX
    planeta_na_agua_reduzido.y = display.contentCenterY -272

    --Imagem de Rio Na Floresta | Localização e Tamanho
    local rio_na_floresta = display.newImageRect(sceneGroup, "assets/rio_na_floresta.png", display.contentWidth, display.contentHeight - 350)
    rio_na_floresta.x = display.contentCenterX
    rio_na_floresta.y = display.contentCenterY + 368

    --Imagem das crianças bebendo Água | Localização e Tamanho
    local criancas_bebendo_agua = display.newImageRect(sceneGroup, "assets/criancas_bebendo_agua.png", display.contentWidth - 250, display.contentHeight - 600)
    criancas_bebendo_agua.x = display.contentCenterX +30
    criancas_bebendo_agua.y = display.contentCenterY + 565

    --Seta para avançar
    avancar = display.newImageRect(sceneGroup, "assets/seta_azul.png", 120, 90)
    avancar.x = display.contentWidth * 0.9
    avancar.y = display.contentHeight + 250
    
    --Seta para retornar
    retornar = display.newImageRect(sceneGroup, "assets/seta_azul.png", 120, 90)
    retornar.x = display.contentWidth * 0.1
    retornar.y = display.contentHeight + 250
    
    --Fazendo a imagem de seta girar 180 graus, ficando para a esquerda
    transition.to( retornar, { rotation=180 } )

    -- Colocar áudio
    local audio_importancia_da_agua = audio.loadStream("assets/audio_importancia_da_agua.mp3")
    audio.reserveChannels(1)
    audio.setVolume( 0.9, { channel=1 } )
    audio.play( audio_importancia_da_agua, { channel=1, loops=0.5 } )

    local options1 = {
        text = "A importância da água para todos os seres vivos!",
        x = display.contentCenterX,
        y = display.contentCenterY - 700,
        width = 760,
        font = native.systemFont,
        fontSize = 47
    }
    local explicacao = display.newText(options1)
    explicacao:setFillColor(0, 0, 255, 1)

    --Adicionando as variáveis ao grupo
    sceneGroup:insert(fundo_branco)
    --sceneGroup:insert(ceu_tela1)
    sceneGroup:insert(planeta_na_agua_reduzido)
    sceneGroup:insert(rio_na_floresta)
    sceneGroup:insert(criancas_bebendo_agua)
    sceneGroup:insert(explicacao)
    sceneGroup:insert(avancar)
    sceneGroup:insert(retornar)

end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
    elseif phase == "did" then
        avancar.touch = proximaTela
        retornar.touch = retornarTela
        avancar:addEventListener("touch", avancar)
        retornar:addEventListener("touch", retornar)
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        avancar:removeEventListener("touch", avancar)
        retornar:removeEventListener("touch", retornar)

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