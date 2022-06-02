local composer = require("composer")
local scene = composer.newScene()

local avancar, retornar

local physics = require( "physics" )
physics.start()

local testParticleSystem

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page03", "fade", 800)
        return true
    end
end

local function proximaTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page05", "fade", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view


     ------------------- Adicionando todas as imagens -------------------
     
     
    --Imagem de fundo céu | Localização e Tamanho
    local ceu = display.newImageRect(sceneGroup, "assets/ceu.png", display.contentWidth, display.contentHeight-470)
    ceu.anchorX = 0
    ceu.anchorY = 0
    ceu.x = display.contentCenterX - 385
    ceu.y = display.contentCenterY - 800

    --Imagem de SOL BRILHANTE | Localização e Tamanho
    local sol_brilhante = display.newImageRect(sceneGroup, "assets/sol_brilhante.png", display.contentWidth-500, display.contentHeight-820)
    sol_brilhante.anchorX = 0
    sol_brilhante.anchorY = 0
    sol_brilhante.x = display.contentCenterX - 385
    sol_brilhante.y = display.contentCenterY - 743
    
    --Imagem de Infiltração | Localização e Tamanho
    local infiltracao = display.newImageRect(sceneGroup, "assets/infiltração_nova.png", display.contentWidth, display.contentHeight-350)
    infiltracao.x = display.contentCenterX
    infiltracao.y = display.contentCenterY + 90

    --Imagem de nuvem | Localização e Tamanho
    local nuvem = display.newImageRect(sceneGroup, "assets/nuvem2.png", 100, 50)
    nuvem.x = display.contentCenterX + 200
    nuvem.y = display.contentCenterY + 90

    --Imagem de nuvem | Localização e Tamanho
    local nuvem1 = display.newImageRect(sceneGroup, "assets/nuvem2.png", 200, 100)
    nuvem1.x = display.contentCenterX + 270
    nuvem1.y = display.contentCenterY -130

    --Imagem de nuvem | Localização e Tamanho
    local nuvem2 = display.newImageRect(sceneGroup, "assets/nuvem2.png", 250, 150)
    nuvem2.x = display.contentCenterX
    nuvem2.y = display.contentCenterY - 50

     --Imagem de nuvem | Localização e Tamanho
    local nuvem3 = display.newImageRect(sceneGroup, "assets/nuvem2.png", 170, 85)
    nuvem3.x = display.contentCenterX + 280
    nuvem3.y = display.contentCenterY +10

    --Imagem de nuvem | Localização e Tamanho
    local nuvem4 = display.newImageRect(sceneGroup, "assets/nuvem2.png", 350, 60)
    nuvem4.x = display.contentCenterX - 140
    nuvem4.y = display.contentCenterY - 250
    
    --Imagem dos TRÊS PASSARINHOS | Localização e Tamanho
    local passarinhos = display.newImageRect(sceneGroup, "assets/passarinhos.png", 280, 250)
    passarinhos.x = display.contentCenterX + 200
    passarinhos.y = display.contentCenterY - 400

    --Imagem do Passaro Vermelho | Localização e Tamanho
    local passaro_vermelho = display.newImageRect(sceneGroup, "assets/passaro_vermelho.png", 220, 200)
    passaro_vermelho.x = display.contentCenterX - 200
    passaro_vermelho.y = display.contentCenterY - 150

    --Imagem do Peixe Amarelo | Localização e Tamanho
    local peixe_amarelo = display.newImageRect(sceneGroup, "assets/peixe_amarelo.png", 300, 200)
    peixe_amarelo.x = display.contentCenterX + 200
    peixe_amarelo.y = display.contentCenterY + 300

    --Imagem da moldura para adicionar texto dentro | Localização e Tamanho
    local moldura = display.newImageRect(sceneGroup, "assets/moldura_marrom_claro.png", display.contentWidth, 420)
    moldura.x = display.contentCenterX
    moldura.y = display.contentCenterY + 635

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


    -- Adicionando Áudio sobre a INFILTRAÇÃO
    local audio_sobre_evaporacao = audio.loadStream("assets/audio_sobre_a_infiltração.mp3")
    audio.reserveChannels(1)
    audio.setVolume( 0.9, { channel=1 } )
    audio.play( audio_sobre_evaporacao, { channel=1, loops=0.5 } )  
    
    -- Texto explicativo
    local texto = {
        text = "A água desce até a superfície da terra através da Infiltração!",
        x = display.contentCenterX + 35,
        y = display.contentCenterY + 630,
        width = 680,
        font = native.systemFont,
        fontSize = 47
    }
    
    local explicacao = display.newText(texto)
    explicacao:setFillColor(0, 0, 0, 1)

    --Adicionando as variáveis ao grupo
    sceneGroup:insert(ceu)
    sceneGroup:insert(sol_brilhante)
    sceneGroup:insert(infiltracao)
    sceneGroup:insert(nuvem)
    sceneGroup:insert(nuvem1)
    sceneGroup:insert(nuvem2)
    sceneGroup:insert(nuvem3)
    sceneGroup:insert(nuvem4)
    sceneGroup:insert(peixe_amarelo)
    sceneGroup:insert(passarinhos)
    sceneGroup:insert(passaro_vermelho)
    sceneGroup:insert(moldura)
    sceneGroup:insert(explicacao)
    sceneGroup:insert(avancar)
    sceneGroup:insert(retornar)
    --sceneGroup:insert(circulo)

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