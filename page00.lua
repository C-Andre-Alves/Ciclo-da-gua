local composer = require("composer")
local scene = composer.newScene()

local avancar

local function abrirTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page01", "fade", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view

    --------Imagens da tela--------

    --Imagem de fundo branco | Localização e Tamanho
    local ceu_page00 = display.newImageRect(sceneGroup, "assets/ceu_page00.png", display.contentWidth, 215)
    ceu_page00.x = display.contentCenterX
    ceu_page00.y = display.contentCenterY -700

    --Imagem de fundo natureza | Localização e Tamanho
    local fundo_inicio_fim = display.newImageRect(sceneGroup, "assets/fundo_inicio_fim.png", display.contentWidth, 1000)
    fundo_inicio_fim.x = display.contentCenterX
    fundo_inicio_fim.y = display.contentCenterY - 90

    --Imagem do Boneco | Localização e Tamanho
    local boneco_agua = display.newImageRect(sceneGroup, "assets/boneco_agua.png", 380, 400)
    boneco_agua.x = display.contentCenterX - 150
    boneco_agua.y = display.contentCenterY + 130

    --Imagem da moldura para adicionar texto dentro | Localização e Tamanho
    local moldura = display.newImageRect(sceneGroup, "assets/moldura_marrom.png", display.contentWidth, 420)
    moldura.x = display.contentCenterX
    moldura.y = display.contentCenterY + 620

     --Logo da upe | Tamanho e localização
     local upe = display.newImageRect(sceneGroup, "assets/upe.png", 220, 150)
     upe.x = display.contentWidth * 0.85
     upe.y = display.contentCenterY -710

     --Nome: Ciclo da água | Tamanho e localização
     local ciclo = display.newImageRect(sceneGroup, "assets/ciclo_da_agua.png", 700, 190)
     ciclo.x = display.contentCenterX
     ciclo.y = display.contentCenterY - 70

      --Imagem da seta a direita | Tamanho e localização
    avancar = display.newImageRect(sceneGroup, "assets/seta_verde_limao.png", 120, 90)
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
        y = display.contentCenterY - 300,
        width = 600,
        font = native.systemFont,
        fontSize = 100,
        align = "center"
    }

    local opcao2 = {
        text = "Carlos André Alves Ferreira",
        x = display.contentCenterX + 150,
        y = display.contentCenterY + 480,
        width = 680,
        font = native.systemFont,
        fontSize = 35
        --align = "center"
    }

    local obs = {
        text = "OBS: Aguarde todos efeitos sonoros acabarem para mudar de tela ou realizar outra interação",
        x = display.contentCenterX + 60,
        y = display.contentCenterY + 655,
        width = 640,
        font = native.systemFont,
        fontSize = 47
        --align = "center"
    }

    local observacao = display.newText(obs)
    observacao:setFillColor( 255, 0, 0)

    local ciencias = display.newText(opcao1)
    local nome = display.newText(opcao2)
    ciencias:setFillColor( 0, 0, 0)
    nome:setFillColor( 0, 0, 255)

    --Adicionando as variáveis no grupo
    sceneGroup:insert(ceu_page00)
    sceneGroup:insert(fundo_inicio_fim)
    sceneGroup:insert(boneco_agua)
    sceneGroup:insert(moldura)
    sceneGroup:insert(ciclo)
    sceneGroup:insert(ciencias)
    sceneGroup:insert(nome)
    sceneGroup:insert(observacao)
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
