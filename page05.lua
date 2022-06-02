local composer = require("composer")
local scene = composer.newScene()

local retornar

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page04", "fade", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view


    --Imagem de fundo branco | Localização e Tamanho
    local ceu_page00 = display.newImageRect(sceneGroup, "assets/ceu_page00.png", display.contentWidth, 215)
    ceu_page00.x = display.contentCenterX
    ceu_page00.y = display.contentCenterY -700

    --Imagem de fundo natureza | Localização e Tamanho
    local fundo_inicio_fim = display.newImageRect(sceneGroup, "assets/fundo_inicio_fim.png", display.contentWidth, 1000)
    fundo_inicio_fim.x = display.contentCenterX
    fundo_inicio_fim.y = display.contentCenterY - 90

    local quadro = display.newImageRect(sceneGroup, "assets/quadro.png", display.contentWidth, 500)
    quadro.x = display.contentCenterX
    quadro.y = display.contentCenterY

    --Imagem da moldura para adicionar texto dentro | Localização e Tamanho
    local moldura = display.newImageRect(sceneGroup, "assets/moldura_marrom.png", display.contentWidth, 420)
    moldura.x = display.contentCenterX
    moldura.y = display.contentCenterY + 620

    --Logo da upe | Tamanho e localização
    local upe = display.newImageRect(sceneGroup, "assets/upe.png", 220, 150)
    upe.x = display.contentWidth * 0.85
    upe.y = display.contentCenterY -710
    
    retornar = display.newImageRect(sceneGroup, "assets/seta_verde_limao.png", 120, 90)
    retornar.x = display.contentWidth * 0.1
    retornar.y = display.contentHeight + 250
    
    --Fazendo a imagem de seta girar 180 graus, ficando para a esquerda
    transition.to( retornar, { rotation=180 } )

    local options1 = {
        text = "Autor: Carlos André Alves Ferreira",
        x = display.contentCenterX + 60,
        y = display.contentCenterY + 600,
        width = 680,
        font = native.systemFont,
        fontSize = 47
    }

    local options2 = {
        text = "Professor: Ewerton Mendonça",
        x = display.contentCenterX + 60,
        y = display.contentCenterY + 680,
        width = 680,
        font = native.systemFont,
        fontSize = 40
    }

    local agradecimento = {
        text = "Muito obrigado pela atenção, espero que esse trabalho tenha ajudado!",
        x = display.contentCenterX + 200,
        y = display.contentCenterY + 35,
        width = 400,
        font = native.systemFont,
        fontSize = 47
    }

    local agradecimentos = display.newText(agradecimento)
    agradecimentos:setFillColor(0, 0, 255)
    local meu_nome = display.newText(options1)
    meu_nome:setFillColor(0, 0, 255)
    local nome_professor = display.newText(options2)
    nome_professor:setFillColor(0, 0, 255)

    sceneGroup:insert(ceu_page00)
    sceneGroup:insert(fundo_inicio_fim)
    sceneGroup:insert(quadro)
    sceneGroup:insert(moldura)
    sceneGroup:insert(meu_nome)
    sceneGroup:insert(nome_professor)
    sceneGroup:insert(agradecimentos)
    sceneGroup:insert(retornar)
    sceneGroup:insert(upe)

end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
    elseif phase == "did" then
        retornar.touch = retornarTela
        retornar:addEventListener("touch", retornar)
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
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