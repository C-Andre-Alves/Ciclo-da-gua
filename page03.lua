local composer = require("composer")
local scene = composer.newScene()

local avancar, retornar
local tempo
local explicacao

local physics = require("physics")
--physics.setDrawMode("debug")
--physics.setDrawMode("hybrid")
physics.setGravity( 0, 0 )
physics.start()

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page02", "fade", 800)
        return true
    end
end

local function proximaTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page04", "fade", 800)
        return true
    end
end

function scene:create(event)
    local sceneGroup = self.view


    ------------------- Imagens da Background e o céu -------------------


    --Imagem de fundo céu | Localização e Tamanho
    local ceu_sem_nuvem = display.newImageRect(sceneGroup, "assets/ceu_sem_nuvem.png", display.contentWidth, display.contentHeight - 470)
    ceu_sem_nuvem.anchorX = 0
    ceu_sem_nuvem.anchorY = 0
    ceu_sem_nuvem.x = display.contentCenterX - 385
    ceu_sem_nuvem.y = display.contentCenterY - 800

    --Imagem de fundo Floresta | Localização e Tamanho
    local floresta = display.newImageRect(sceneGroup, "assets/floresta_com_rio.png", display.contentWidth, display.contentHeight-350)
    floresta.x = display.contentCenterX
    floresta.y = display.contentCenterY + 90

    --Imagem dos TRÊS PASSARINHOS | Localização e Tamanho
    local passaro_verde = display.newImageRect(sceneGroup, "assets/passaro_verde.png", 170, 130)
    passaro_verde.x = display.contentCenterX + 240
    passaro_verde.y = display.contentCenterY - 200

    --Imagem do Peixe de Duas Cores | Localização e Tamanho
    local peixe_tres_cores = display.newImageRect(sceneGroup, "assets/peixe_tres_cores.png", 380, 300)
    peixe_tres_cores.x = display.contentCenterX
    peixe_tres_cores.y = display.contentCenterY + 300

    --Imagem da Girafa | Localização e Tamanho
    local girafa = display.newImageRect(sceneGroup, "assets/girafa.png", 200, 230)
    girafa.x = display.contentCenterX - 100
    girafa.y = display.contentCenterY + 50

    --Imagem da Zebra | Localização e Tamanho
    local zebra = display.newImageRect(sceneGroup, "assets/zebra.png", 220, 180)
    zebra.x = display.contentCenterX + 150
    zebra.y = display.contentCenterY + 90

    --Imagem da moldura para adicionar texto dentro | Localização e Tamanho
    local moldura = display.newImageRect(sceneGroup, "assets/moldura.png", display.contentWidth, 420)
    moldura.x = display.contentCenterX
    moldura.y = display.contentCenterY + 620

    --Imagem de SOL SEM O BRILHO | Localização e Tamanho
    local sol_sem_brilho = display.newImageRect(sceneGroup, "assets/sol_sem_brilho.png", display.contentWidth-500, display.contentHeight-820)
    sol_sem_brilho.x = display.contentCenterX - 270
    sol_sem_brilho.y = display.contentCenterY - 170

    -- Imagem de Sol que será usada para a interação
    local sol = display.newImage(sceneGroup,'assets/sol_brilhante.png', display.contentCenterX, display.contentCenterY - 170, 40, 40, {radius = 5})
    sol.width = display.contentWidth / 3
    sol.height = display.contentHeight / 4
    sol.name = 'Sol'

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


    ------------------- Imagens das Nuvens separadas -------------------


    --Imagem da Nuvem 1 | Localização e Tamanho
    local nuvem_1 = display.newImageRect(sceneGroup, "assets/nuvem_1.png", display.contentWidth, display.contentHeight-470)
    nuvem_1.anchorX = 0
    nuvem_1.anchorY = 0
    nuvem_1.x = display.contentCenterX - 385
    nuvem_1.y = display.contentCenterY - 800

    --Imagem da Nuvem 2 | Localização e Tamanho
    local nuvem_2 = display.newImageRect(sceneGroup, "assets/nuvem_2.png", display.contentWidth, display.contentHeight-470)
    nuvem_2.anchorX = 0
    nuvem_2.anchorY = 0
    nuvem_2.x = display.contentCenterX - 385
    nuvem_2.y = display.contentCenterY - 800

    --Imagem da Nuvem 3 | Localização e Tamanho
    local nuvem_3 = display.newImageRect(sceneGroup, "assets/nuvem_3.png", display.contentWidth, display.contentHeight-470)
    nuvem_3.anchorX = 0
    nuvem_3.anchorY = 0
    nuvem_3.x = display.contentCenterX - 385
    nuvem_3.y = display.contentCenterY - 800

    --Imagem da Nuvem 4 | Localização e Tamanho
    local nuvem_4 = display.newImageRect(sceneGroup, "assets/nuvem_4.png", display.contentWidth, display.contentHeight-470)
    nuvem_4.anchorX = 0
    nuvem_4.anchorY = 0
    nuvem_4.x = display.contentCenterX - 385
    nuvem_4.y = display.contentCenterY - 800

    --Imagem da Nuvem 5 | Localização e Tamanho
    local nuvem_5 = display.newImageRect(sceneGroup, "assets/nuvem_5.png", display.contentWidth, display.contentHeight-470)
    nuvem_5.anchorX = 0
    nuvem_5.anchorY = 0
    nuvem_5.x = display.contentCenterX - 385
    nuvem_5.y = display.contentCenterY - 800

    --Imagem da Nuvem 6 | Localização e Tamanho
    local nuvem_6 = display.newImageRect(sceneGroup, "assets/nuvem_6.png", display.contentWidth, display.contentHeight-470)
    nuvem_6.anchorX = 0
    nuvem_6.anchorY = 0
    nuvem_6.x = display.contentCenterX - 385
    nuvem_6.y = display.contentCenterY - 800

    --Imagem da Nuvem 7 | Localização e Tamanho
    local nuvem_7 = display.newImageRect(sceneGroup, "assets/nuvem_7.png", display.contentWidth, display.contentHeight-470)
    nuvem_7.anchorX = 0
    nuvem_7.anchorY = 0
    nuvem_7.x = display.contentCenterX - 385
    nuvem_7.y = display.contentCenterY - 800

    --Imagem da Nuvem 8 | Localização e Tamanho
    local nuvem_8 = display.newImageRect(sceneGroup, "assets/nuvem_8.png", display.contentWidth, display.contentHeight-470)
    nuvem_8.anchorX = 0
    nuvem_8.anchorY = 0
    nuvem_8.x = display.contentCenterX - 385
    nuvem_8.y = display.contentCenterY - 800


    ------------------- Imagens de Gotículas de Água -------------------


    --Imagem de gotículas de água 1 | Localização e Tamanho
    local goticulas_de_agua_1 = display.newImageRect(sceneGroup, "assets/goticulas.png", 260, 80)
    goticulas_de_agua_1.x = display.contentCenterX - 220
    goticulas_de_agua_1.y = display.contentCenterY - 735

    local goticulas_de_agua_2 = display.newImageRect(sceneGroup, "assets/goticulas.png", 260, 80)
    goticulas_de_agua_2.x = display.contentCenterX + 230
    goticulas_de_agua_2.y = display.contentCenterY - 730

    local goticulas_de_agua_3 = display.newImageRect(sceneGroup, "assets/goticulas.png", 170, 60)
    goticulas_de_agua_3.x = display.contentCenterX - 240
    goticulas_de_agua_3.y = display.contentCenterY - 645

    local goticulas_de_agua_4 = display.newImageRect(sceneGroup, "assets/goticulas.png", 260, 80)
    goticulas_de_agua_4.x = display.contentCenterX + 10
    goticulas_de_agua_4.y = display.contentCenterY - 655
    
    local goticulas_de_agua_5 = display.newImageRect(sceneGroup, "assets/goticulas.png", 260, 80)
    goticulas_de_agua_5.x = display.contentCenterX + 240
    goticulas_de_agua_5.y = display.contentCenterY - 600

    local goticulas_de_agua_6 = display.newImageRect(sceneGroup, "assets/goticulas.png", 150, 40)
    goticulas_de_agua_6.x = display.contentCenterX + 10
    goticulas_de_agua_6.y = display.contentCenterY - 540

    local goticulas_de_agua_7 = display.newImageRect(sceneGroup, "assets/goticulas.png", 300, 140)
    goticulas_de_agua_7.x = display.contentCenterX - 215
    goticulas_de_agua_7.y = display.contentCenterY - 500

    local goticulas_de_agua_8 = display.newImageRect(sceneGroup, "assets/goticulas.png", 300, 110)
    goticulas_de_agua_8.x = display.contentCenterX + 215
    goticulas_de_agua_8.y = display.contentCenterY - 480

    
    ------------------- Adicionando os textos para a interação -------------------


    --Texto explicativo para as interações
    local texto = {
        text = "Toque nas gotículas de água para formar as nuvens; \nDepois Toque no sol e Arraste-o até as nuvens e Solte-o para chover",
        x = display.contentCenterX + 40,
        y = display.contentCenterY + 610,
        width = 660,
        font = native.systemFont,
        fontSize = 47
    }

    local explicacao = display.newText(texto)
    explicacao:setFillColor(0, 0, 0, 1)


    ---- Depois ajeito esse texto ----

    --Texto explicativo para as interações
    local texto2 = {
        text = "Arraste o Sol até as nuvens e Solte-o para chover",
        x = display.contentCenterX + 40,
        y = display.contentCenterY + 610,
        width = 660,
        font = native.systemFont,
        fontSize = 47
    }
    

    ------------------- Adicionando função de Chover -------------------


    testParticleSystem = physics.newParticleSystem(
    {
        filename = "assets/gota_de_agua.png",
        radius = 10,
        imageRadius = 10
    })

    local function chover(event)
        testParticleSystem:createParticle(
    {
        x = math.random(0, 750),
        y = -190,
        velocityX = 0,
        velocityY = 700,
        color = { 0, 255, 255, 1 },
        lifetime = 1.5,
        flags = { "water", "barrier" }
    })
  end

  -- Função de arrastar o Sol para chover
  function arrastarSol(e)
  
      local target = e.target
      if (e.phase == 'began') then
  
      elseif (e.phase == 'moved') then
          target.x = e.x 
          target.y = e.y
      elseif (e.phase == 'ended') then
        tempo = timer.performWithDelay( 10, chover, 0 )

        -- Adicionando Som de chuva
        local som_de_chuva = audio.loadStream("assets/som_de_chuva.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 0.9, { channel=1 } )
        audio.play( som_de_chuva, { channel=1, loops=0.5 } )
      end
          
  end

    --Função para o Tap
    function executarTap()
        --Remove a imagem do Sol sem brilho
        sceneGroup:remove(sol_sem_brilho)

        -- Colocar áudio do brilho ao tocar no sol
        local som_do_brilho = audio.loadStream("assets/som_do_brilho.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 0.9, { channel=1 } )
        audio.play(som_do_brilho, {channel=1, loops=0.5})

        --Adicionando imagem do sol brilhante para a interação Touch
        sceneGroup:insert(sol)

        --Utilizar o .Text é uma forma de revomer o texto anterior
        --explicacao.text = {
            --text = "Arraste o Sol até as nuvens e Solte-o para chover",
            --x = display.contentCenterX + 40,
            --y = display.contentCenterY + 610,
            --width = 660,
            --font = native.systemFont,
            --fontSize = 47
        --}
        -- Adicionando o novo texto na tela e implementando a cor
        --explicacao = display.newText(texto2)
        --explicacao:setFillColor(0, 0, 255, 1)

end


    ------------------- Função do TAP para adicionar as Nuvens -------------------


    function TapNuvem1()
        sceneGroup:remove(goticulas_de_agua_1)
        -- Adicionando som de chuva ao Arrastar o Sol
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_1)   
end
    function TapNuvem2()    
        sceneGroup:remove(goticulas_de_agua_2)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_2)   
end
    function TapNuvem3()
        sceneGroup:remove(goticulas_de_agua_3)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_3)   
end
    function TapNuvem4()
        sceneGroup:remove(goticulas_de_agua_4)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_4)    
end
    function TapNuvem5()
        sceneGroup:remove(goticulas_de_agua_5)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_5)   
end
    function TapNuvem6()
        sceneGroup:remove(goticulas_de_agua_6)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_6)   
end
    function TapNuvem7()
        sceneGroup:remove(goticulas_de_agua_7)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_7) 
end
    function TapNuvem8()
        sceneGroup:remove(goticulas_de_agua_8)
        local som_para_nuvem = audio.loadStream("assets/som_para_nuvem.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 5.5, { channel=1 } )
        audio.play(som_para_nuvem, {channel=1, loops=0.5})
        sceneGroup:insert(nuvem_8)    
end

    
    --Adicionando função do TOUCH na imagem
    sol:addEventListener('touch', arrastarSol)

    --Adicionando função do TAP na imagem
    sol_sem_brilho:addEventListener("tap", executarTap) 
    goticulas_de_agua_1:addEventListener("tap", TapNuvem1)
    goticulas_de_agua_2:addEventListener("tap", TapNuvem2)
    goticulas_de_agua_3:addEventListener("tap", TapNuvem3)
    goticulas_de_agua_4:addEventListener("tap", TapNuvem4)
    goticulas_de_agua_5:addEventListener("tap", TapNuvem5)
    goticulas_de_agua_6:addEventListener("tap", TapNuvem6)
    goticulas_de_agua_7:addEventListener("tap", TapNuvem7)
    goticulas_de_agua_8:addEventListener("tap", TapNuvem8)
    
    -- Adicionando Áudio sobre a CONDENSAÇÃO E PRECIPITAÇÃO
    local audio_sobre_a_precipitacao = audio.loadStream("assets/audio_sobre_a_precipitação.mp3")
    audio.reserveChannels(1)
    audio.setVolume( 0.9, { channel=1 } )
    audio.play(audio_sobre_a_precipitacao, {channel=1, loops=0.5})
    
    --Adicionando Todas as imagens ao grupo
    sceneGroup:insert(ceu_sem_nuvem)
    sceneGroup:insert(floresta)
    sceneGroup:insert(passaro_verde)
    sceneGroup:insert(peixe_tres_cores)
    sceneGroup:insert(girafa)
    sceneGroup:insert(zebra)
    sceneGroup:insert(sol_sem_brilho)
    sceneGroup:insert(moldura) 
    sceneGroup:insert(explicacao)
    sceneGroup:insert(avancar)
    sceneGroup:insert(retornar)
    sceneGroup:insert(goticulas_de_agua_1)  
    sceneGroup:insert(goticulas_de_agua_2)  
    sceneGroup:insert(goticulas_de_agua_3)  
    sceneGroup:insert(goticulas_de_agua_4) 
    sceneGroup:insert(goticulas_de_agua_5) 
    sceneGroup:insert(goticulas_de_agua_6) 
    sceneGroup:insert(goticulas_de_agua_7) 
    sceneGroup:insert(goticulas_de_agua_8) 

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
        timer.cancel(tempo);

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