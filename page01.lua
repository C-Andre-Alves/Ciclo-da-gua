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
        composer.gotoScene("page06", "slideLeft", 800)
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

    --Imagem de fundo céu | Localização e Tamanho
    local ceu = display.newImageRect(sceneGroup, "assets/ceu.png", display.contentWidth, display.contentHeight-570)
    ceu.anchorX = 0
    ceu.anchorY = 0
    ceu.x = display.contentCenterX - 385
    ceu.y = display.contentCenterY - 343

    --Imagem de SOL SEM O BRILHO | Localização e Tamanho
    local sol_sem_brilho = display.newImageRect(sceneGroup, "assets/sol_sem_brilho.png", display.contentWidth-500, display.contentHeight-820)
    sol_sem_brilho.anchorX = 0
    sol_sem_brilho.anchorY = 0
    sol_sem_brilho.x = display.contentCenterX - 385
    sol_sem_brilho.y = display.contentCenterY - 343

    --Imagem de SOL BRILHANTE | Localização e Tamanho
    local sol_brilhante = display.newImageRect(sceneGroup, "assets/sol_brilhante.png", display.contentWidth-500, display.contentHeight-820)
    sol_brilhante.anchorX = 0
    sol_brilhante.anchorY = 0
    sol_brilhante.x = display.contentCenterX - 385
    sol_brilhante.y = display.contentCenterY - 343

    --Imagem de fundo Floresta | Localização e Tamanho
    local floresta = display.newImageRect(sceneGroup, "assets/floresta3.png", display.contentWidth, display.contentHeight-430)
    floresta.anchorX = 0
    floresta.anchorY = 0
    floresta.x = display.contentCenterX - 385
    floresta.y = display.contentCenterY + 110

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
    sceneGroup:insert(ceu)
    sceneGroup:insert(sol_sem_brilho)
    sceneGroup:insert(floresta)
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
