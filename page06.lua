local composer = require("composer")
local scene = composer.newScene()

local retornar

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page05", "slideRight", 800)
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

    local planeta_na_agua = display.newImageRect(sceneGroup, "assets/planeta_na_agua.png", display.contentWidth, display.contentHeight - 40)
    --planeta_na_agua.anchorX = 0
    --planeta_na_agua.anchorY = 0
    planeta_na_agua.x = display.contentCenterX
    planeta_na_agua.y = display.contentCenterY + 90

    --Logo da upe | Tamanho e localização
    local upe = display.newImageRect(sceneGroup, "assets/upe.png", 220, 150)
    upe.x = display.contentWidth * 0.85
    upe.y = display.contentCenterY -710
    
    retornar = display.newImageRect(sceneGroup, "assets/seta_azul.png", 120, 90)
    retornar.x = display.contentWidth * 0.1
    retornar.y = display.contentHeight + 250
    
    --Fazendo a imagem de seta girar 180 graus, ficando para a esquerda
    transition.to( retornar, { rotation=180 } )

    local options1 = {
        text = "Carlos André Alves Ferreira \n\n Maio de 2022",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = 600,
        font = native.systemFont,
        fontSize = 60,
        align = "center"
    }

    local options2 = {
        text = "Professor: Ewerton Mendonça",
        x = display.contentCenterX,
        y = display.contentCenterY + 650,
        width = 600,
        font = native.systemFont,
        fontSize = 40,
        align = "center"
    }

    local meu_nome = display.newText(options1)
    meu_nome:setFillColor(0, 0, 0)
    local nome_professor = display.newText(options2)
    nome_professor:setFillColor(0, 0, 0)

    sceneGroup:insert(fundo_branco)
    sceneGroup:insert(planeta_na_agua)
    sceneGroup:insert(meu_nome)
    sceneGroup:insert(nome_professor)
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