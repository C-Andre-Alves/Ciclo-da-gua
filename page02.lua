local composer = require("composer")
local scene = composer.newScene()

local avancar, retornar

local physics = require( "physics" )
physics.start()

local testParticleSystem
local tempo

local function retornarTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page01", "fade", 800)
        return true
    end
end

local function proximaTela(self, event)
    if event.phase == "ended" or event.phase == "cancelled" then
        composer.gotoScene("page03", "fade", 800)
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

    --Imagem de fundo Floresta | Localização e Tamanho
    local floresta = display.newImageRect(sceneGroup, "assets/floresta_com_rio.png", display.contentWidth, display.contentHeight-350)
    floresta.x = display.contentCenterX
    floresta.y = display.contentCenterY + 90

    --Imagem da Família reunida | Localização e Tamanho
    local familia = display.newImageRect(sceneGroup, "assets/familia.png", 240, 280)
    familia.x = display.contentCenterX + 100
    familia.y = display.contentCenterY + 50

    --Imagem ddo Cachorro Filhote | Localização e Tamanho
    local cachorro_filhote = display.newImageRect(sceneGroup, "assets/cachorro_filhote.png", 150, 130)
    cachorro_filhote.x = display.contentCenterX - 30
    cachorro_filhote.y = display.contentCenterY + 100

    --Imagem dos TRÊS PASSARINHOS | Localização e Tamanho
    local passarinhos = display.newImageRect(sceneGroup, "assets/passarinhos.png", 280, 250)
    passarinhos.x = display.contentCenterX + 200
    passarinhos.y = display.contentCenterY - 400

    --Imagem do Passaro Vermelho | Localização e Tamanho
    local passaro_vermelho = display.newImageRect(sceneGroup, "assets/passaro_vermelho.png", 220, 200)
    passaro_vermelho.x = display.contentCenterX - 200
    passaro_vermelho.y = display.contentCenterY - 150

    --Imagem do Peixe Amarelo | Localização e Tamanho
    local peixe_amarelo = display.newImageRect(sceneGroup, "assets/peixe_amarelo.png", 380, 300)
    peixe_amarelo.x = display.contentCenterX
    peixe_amarelo.y = display.contentCenterY + 300

    --Imagem da moldura para adicionar texto dentro | Localização e Tamanho
    local moldura = display.newImageRect(sceneGroup, "assets/moldura.png", display.contentWidth, 420)
    moldura.x = display.contentCenterX
    moldura.y = display.contentCenterY + 620

    --Imagem de SOL SEM O BRILHO | Localização e Tamanho
    local sol_sem_brilho = display.newImageRect(sceneGroup, "assets/sol_sem_brilho.png", display.contentWidth-500, display.contentHeight-820)
    sol_sem_brilho.anchorX = 0
    sol_sem_brilho.anchorY = 0
    sol_sem_brilho.x = display.contentCenterX - 385
    sol_sem_brilho.y = display.contentCenterY - 743

    --Imagem de SOL BRILHANTE | Localização e Tamanho
    local sol_brilhante = display.newImageRect(sceneGroup, "assets/sol_brilhante.png", display.contentWidth-500, display.contentHeight-820)
    sol_brilhante.anchorX = 0
    sol_brilhante.anchorY = 0
    sol_brilhante.x = display.contentCenterX - 385
    sol_brilhante.y = display.contentCenterY - 743

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


    -- Adicionando Áudio sobre a EVAPORAÇÃO
    local audio_sobre_evaporacao = audio.loadStream("assets/audio_sobre_evaporação.mp3")
    audio.reserveChannels(1)
    audio.setVolume( 0.9, { channel=1 } )
    audio.play( audio_sobre_evaporacao, { channel=1, loops=0.5 } )
    
    -- Texto explicativo
    local texto = {
        text = "Toque no sol para que ele forneça mais luz e calor e assim ocorra a evaporação",
        x = display.contentCenterX + 60,
        y = display.contentCenterY + 610,
        width = 660,
        font = native.systemFont,
        fontSize = 47
    }
    
    local explicacao = display.newText(texto)
    explicacao:setFillColor(0, 0, 0, 1)

    ------------------- Adicionando função de evaporação das particulas -------------------

        testParticleSystem = physics.newParticleSystem(
        {
            filename = "assets/gota_de_agua.png",
            radius = 10,
            imageRadius = 7
        })

    local function evaporar(event)
        testParticleSystem:createParticle(
        {            
            x = math.random(0, 750),
            y = (870),
            velocityX = 0,
            velocityY = -900,
            color = { 0, 255, 255, 0.7 },
            lifetime = 1.5,
            flags = { "water", "destructionListener" }
        })
      end      

      local number_of_particles_destroyed = testParticleSystem:destroyParticles(
    {
        x = display.contentWidth,
        y = display.ContentHeight,
        angle = 45,
        halfWidth = 16,
        halfHeight = 16
    })


    ------------------- Adicionando função do TAP -------------------


    --Função para o TAP
    function executarTap()
        sceneGroup:remove(sol_sem_brilho)

        -- Adicionar áudio de brilho ao clicar no sol
        local audio_do_brilho = audio.loadStream("assets/som_do_brilho.mp3")
        audio.reserveChannels(1)
        audio.setVolume( 0.9, { channel=1 } )
        audio.play( audio_do_brilho, { channel=1, loops=0.5 } )

        --Adicionando Sol Brilhante na tela
        sceneGroup:insert(sol_brilhante)        

        --Dando o start na função chover
        tempo = timer.performWithDelay( 5, evaporar, 0 )
    end

    --Adicionando função do TAP na imagem
    sol_sem_brilho:addEventListener("tap", executarTap) 
    
    --Adicionando as variáveis ao grupo
    sceneGroup:insert(ceu)
    sceneGroup:insert(floresta)
    sceneGroup:insert(passarinhos)
    sceneGroup:insert(passaro_vermelho)
    sceneGroup:insert(familia)
    sceneGroup:insert(cachorro_filhote)
    sceneGroup:insert(peixe_amarelo)
    sceneGroup:insert(moldura)
    sceneGroup:insert(sol_sem_brilho)
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
