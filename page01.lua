local composer = require("composer")
local scene = composer.newScene()

local avancar, retornar

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page00", "slideRight", 800)
        return true
    end
end

local function avancarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page02", "fade", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view


    ------------------- Adicionando todas as imagens -------------------


    --Imagem de céu | Localização e Tamanho
    local ceu = display.newImageRect(sceneGroup, "assets/ceu_inicio.png", display.contentWidth, 400)
    ceu.anchorX = 0
    ceu.anchorY = 0
    ceu.x = display.contentCenterX - 385
    ceu.y = display.contentCenterY - 800

    --Imagem de Rio Na Floresta | Localização e Tamanho
    local floresta_com_rio = display.newImageRect(sceneGroup, "assets/floresta_final.png", display.contentWidth, 830)
    floresta_com_rio.x = display.contentCenterX
    floresta_com_rio.y = display.contentCenterY

    --Imagem do Cachorro | Localização e Tamanho
    local cachorro = display.newImageRect(sceneGroup, "assets/cachorro_novo.png", 180, 150)
    cachorro.x = display.contentCenterX + 300
    cachorro.y = display.contentCenterY + 150

    --Imagem do Peixe | Localização e Tamanho
    local peixe = display.newImageRect(sceneGroup, "assets/peixe.png", 260, 230)
    peixe.x = display.contentCenterX - 200
    peixe.y = display.contentCenterY + 340

    --Imagem do Peixe Vermelho | Localização e Tamanho
    local peixe_vermelho = display.newImageRect(sceneGroup, "assets/peixe_vermelho.png", 200, 170)
    peixe_vermelho.x = display.contentCenterX + 100
    peixe_vermelho.y = display.contentCenterY + 300

    --Imagem do Passarinho com Flor | Localização e Tamanho
    local passarinho = display.newImageRect(sceneGroup, "assets/passarinho.png", 200, 150)
    passarinho.x = display.contentCenterX - 100
    passarinho.y = display.contentCenterY - 400

    --Imagem do Passarinho | Localização e Tamanho
    local passarinho_com_flor = display.newImageRect(sceneGroup, "assets/passarinho_com_flor.png", 200, 140)
    passarinho_com_flor.x = display.contentCenterX + 200
    passarinho_com_flor.y = display.contentCenterY - 200   

    --Imagem das crianças bebendo Água | Localização e Tamanho
    local criancas_bebendo_agua = display.newImageRect(sceneGroup, "assets/criancas_bebendo_agua.png", 330, 300)
    criancas_bebendo_agua.x = display.contentCenterX
    criancas_bebendo_agua.y = display.contentCenterY + 70

    --Imagem da moldura para adicionar texto dentro | Localização e Tamanho
    local moldura = display.newImageRect(sceneGroup, "assets/moldura.png", display.contentWidth, 420)
    moldura.x = display.contentCenterX
    moldura.y = display.contentCenterY + 620

    --Seta para avançar
    avancar = display.newImageRect(sceneGroup, "assets/seta_verde_limao.png", 120, 90)
    avancar.x = display.contentWidth * 0.9
    avancar.y = display.contentHeight + 250
    
    --Seta para retornar
    retornar = display.newImageRect(sceneGroup, "assets/seta_verde_limao.png", 120, 90)
    retornar.x = display.contentWidth * 0.1
    retornar.y = display.contentHeight + 250
    
    --Fazendo a imagem de seta girar 180 graus, ficando para a esquerda
    transition.to( retornar, { rotation=180 } )


    ------------------- Adicionando áudio de fundo e o texto explicativo -------------------

    -- Colocar áudio
    local audio_importancia_da_agua = audio.loadStream("assets/audio_importancia_da_agua.mp3")
    audio.reserveChannels(1)
    audio.setVolume( 0.9, { channel=1 } )
    audio.play( audio_importancia_da_agua, { channel=1, loops=0.5 } )

    -- Texto explicativo
    local texto = {
        text = "A importância da água para todos os seres vivos!",
        x = display.contentCenterX + 60,
        y = display.contentCenterY + 600,
        width = 680,
        font = native.systemFont,
        fontSize = 47
    }
    
    local explicacao = display.newText(texto)
    explicacao:setFillColor(0, 0, 0, 1)

    --Adicionando as variáveis ao grupo
    sceneGroup:insert(ceu)
    sceneGroup:insert(floresta_com_rio)
    sceneGroup:insert(passarinho_com_flor)
    sceneGroup:insert(passarinho)
    sceneGroup:insert(cachorro)
    sceneGroup:insert(criancas_bebendo_agua)
    sceneGroup:insert(peixe)
    sceneGroup:insert(peixe_vermelho)
    sceneGroup:insert(moldura)
    sceneGroup:insert(explicacao)
    sceneGroup:insert(avancar)
    sceneGroup:insert(retornar)

end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
    elseif phase == "did" then
        avancar.touch = avancarTela
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