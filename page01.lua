local composer = require("composer")
local scene = composer.newScene()

local avancar, retornar

local function abrirpage00(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page00", "slideRight", 800)
        return true
    end
end

local function proximaTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("final", "slideLeft", 800)
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

    --Imagem de fundo Floresta | Localização e Tamanho
    local background = display.newImageRect(sceneGroup, "assets/floresta1.png", display.contentWidth, display.contentHeight)
    background.anchorX = 0
    background.anchorY = 0
    background.x = display.contentCenterX - 385
    background.y = display.contentCenterY - 320

    local options1 = {
        text = "O Sol é o responsável por proporcionar energia para que o ciclo aconteça. Sua luz provoca a evaporação da água presente na superfície terrestre. (Toque no sol para aumentar sua luz para acontecer a evaporação)",
        x = display.contentCenterX,
        y = display.contentCenterY - 550,
        width = 760,
        font = native.systemFont,
        fontSize = 47
    }
    local myText1 = display.newText(options1)
    myText1:setFillColor(0, 0, 0)

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

    --Adicionando as variáveis ao grupo
    sceneGroup:insert(fundo_branco)
    sceneGroup:insert(background)
    sceneGroup:insert(myText1)
    sceneGroup:insert(avancar)
    sceneGroup:insert(retornar)

end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
    elseif phase == "did" then
        avancar.touch = proximaTela
        retornar.touch = abrirpage00
        avancar:addEventListener("touch", avancar)
        retornar:addEventListener("touch", retornar)
    end
end

--function scene:show(event)
    --local sceneGroup = self.view
    --local phase = event = event.phase

    --if phase == "will" then
     -- elseif phase == "did" then
        
     -- end
    --end

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