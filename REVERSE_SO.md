# Análise Completa do Binário Nativo GOF2 - libgof2hdaa.so

**Jogo**: Galaxy on Fire 2 HD (Full / All Stars)  
**Arquivo**: `lib/armeabi-v7a/libgof2hdaa.so.bak`  
**Tipo**: ELF 32-bit LSB shared object, ARM EABI5, dynamically linked, stripped  
**Tamanho**: 2.187.328 bytes (~2,1 MB)  
**BuildID SHA1**: `c011810da45777b83ed721b2a87d517efed0d310`  
**Fabricante**: Fishlabs Entertainment (net.fishlabs.gof2hd)  
**Engine**: AbyssEngine (engine proprietária da Fishlabs)

---

## 1. SEÇÕES ELF

| Nr | Nome | Tipo | Endereço | Offset | Tamanho | Flags |
|----|------|------|----------|--------|---------|-------|
| 0 | (null) | NULL | 0x00000000 | 0x000000 | 0x000000 | - |
| 1 | .note.android.ident | NOTE | 0x00000134 | 0x000134 | 0x000098 | A |
| 2 | .note.gnu.build-id | NOTE | 0x000001cc | 0x0001cc | 0x000024 | A |
| 3 | .dynsym | DYNSYM | 0x000001f0 | 0x0001f0 | 0x015ca0 | A |
| 4 | .dynstr | STRTAB | 0x00015e90 | 0x015e90 | 0x02e318 | A |
| 5 | .hash | HASH | 0x000441a8 | 0x0441a8 | 0x00973c | A |
| 6 | .gnu.version | VERSYM | 0x0004d8e4 | 0x04d8e4 | 0x002b94 | A |
| 7 | .gnu.version_d | VERDEF | 0x00050478 | 0x050478 | 0x00001c | A |
| 8 | .gnu.version_r | VERNEED | 0x00050494 | 0x050494 | 0x000040 | A |
| 9 | .rel.dyn | REL | 0x000504d4 | 0x0504d4 | 0x007048 | A |
| 10 | .rel.plt | REL | 0x0005751c | 0x05751c | 0x0072d0 | AI |
| 11 | .plt | PROGBITS | 0x0005e7ec | 0x05e7ec | 0x00ac4c | AX |
| 12 | **.text** | **PROGBITS** | **0x00069440** | **0x069440** | **0x1337c8** (~1,2 MB) | **AX** |
| 13 | .ARM.exidx | ARM_EXIDX | 0x0019cc08 | 0x19cc08 | 0x006f70 | AL |
| 14 | .ARM.extab | PROGBITS | 0x001a3b78 | 0x1a3b78 | 0x026298 | A |
| 15 | .rodata | PROGBITS | 0x001c9e10 | 0x1c9e10 | 0x041b67 (~269 KB) | A |
| 16 | .fini_array | FINI_ARRAY | 0x0020cba0 | 0x20bba0 | 0x000008 | WA |
| 17 | .data.rel.ro | PROGBITS | 0x0020cbb0 | 0x20bbb0 | 0x002fe8 | WA |
| 18 | .init_array | INIT_ARRAY | 0x0020fb98 | 0x20eb98 | 0x00000c | WA |
| 19 | .dynamic | DYNAMIC | 0x0020fba4 | 0x20eba4 | 0x000148 | WA |
| 20 | .got | PROGBITS | 0x0020fcf4 | 0x20ecf4 | 0x00430c | WA |
| 21 | .data | PROGBITS | 0x00214000 | 0x213000 | 0x00296c | WA |
| 22 | .bss | NOBITS | 0x00216970 | 0x21596c | 0x0069ac | WA |
| 23 | .comment | PROGBITS | 0x00000000 | 0x21596c | 0x00012f | MS |
| 24 | .note.gnu.gold-ve | NOTE | 0x00000000 | 0x215a9c | 0x00001c | - |
| 25 | .ARM.attributes | ARM_ATTRIBUTES | 0x00000000 | 0x215ab8 | 0x000038 | - |
| 26 | .shstrtab | STRTAB | 0x00000000 | 0x215af0 | 0x000117 | - |

**Observações**:
- Seção `.text` contém ~1.255.240 bytes de código executável (o maior bloco)
- Seção `.rodata` com ~269 KB de dados read-only (strings, constantes)
- `.bss` com ~27 KB de dados não inicializados (variáveis globais)

---

## 2. PROGRAM HEADERS (Segmentos de Memória)

| Tipo | Offset | VirtAddr | PhysAddr | FileSize | MemSize | Flags | Alinhamento |
|------|--------|----------|----------|----------|---------|-------|-------------|
| PHDR | 0x000034 | 0x00000034 | 0x00000034 | 0x100 | 0x100 | R | 0x4 |
| **LOAD (R-X)** | **0x000000** | **0x00000000** | **0x00000000** | **0x20b977** | **0x20b977** | **R E** | **0x1000** |
| **LOAD (RW-)** | **0x20bba0** | **0x0020cba0** | **0x0020cba0** | **0x09dcc** | **0x1077c** | **RW** | **0x1000** |
| DYNAMIC | 0x20eba4 | 0x0020fba4 | 0x0020fba4 | 0x148 | 0x148 | RW | 0x4 |
| NOTE | 0x000134 | 0x00000134 | 0x00000134 | 0xbc | 0xbc | R | 0x4 |
| GNU_STACK | 0x000000 | 0x00000000 | 0x00000000 | 0x0 | 0x0 | RW | 0x10 |
| EXIDX | 0x19cc08 | 0x0019cc08 | 0x0019cc08 | 0x6f70 | 0x6f70 | R | 0x4 |
| GNU_RELRO | 0x20bba0 | 0x0020cba0 | 0x0020cba0 | 0x7460 | 0x7460 | RW | 0x10 |

---

## 3. BIBLIOTECAS DEPENDENTES

| Biblioteca | Propósito |
|------------|-----------|
| `liblog.so` | Logging Android (Android NDK) |
| `libGLESv2.so` | OpenGL ES 2.0 (renderização 3D) |
| `libGLESv1_CM.so` | OpenGL ES 1.x (fixed-function pipeline) |
| `libEGL.so` | EGL (gerenciamento de contexto GL) |
| `libandroid.so` | Funções Android nativas |
| `libfmodex.so` | FMOD Ex (motor de áudio) |
| `libfmodevent.so` | FMOD Event System (eventos de áudio) |
| `libm.so` | Math library |
| `libdl.so` | Dynamic linking |
| `libc.so` | C standard library |

---

## 4. INFORMAÇÕES DE VERSÃO

- **SONAME**: `libgof2hdaa.so`
- **Definição de versão**: `libgof2hdaa.so` (1 entrada BASE)
- **Depende de**: `libc.so` (versão LIBC), `libm.so` (versão LIBC)
- **Flags**: `BIND_NOW` / `NOW` (relocation imediata - segurança)

---

## 5. CONSTRUTORES E DESTRUTORES

### .init_array (construtores globais, executados ao carregar a lib):
| # | Endereço Real (thumb) | Função Provável |
|---|----------------------|-----------------|
| 0 | `0x00069440` | Inicialização global 1 (JNI / engine init) |
| 1 | `0x000694c0` | Inicialização global 2 |
| 2 | `0x000694dc` | Inicialização global 3 |

### .fini_array (destrutores globais, executados ao descarregar):
| # | Endereço Real (thumb) | Função Provável |
|---|----------------------|-----------------|
| 0 | `0x00069547` | Cleanup global 1 |
| 1 | `0x00069533` | Cleanup global 2 |

### JNI_OnLoad:
| Endereço Real | Tamanho | Descrição |
|---------------|---------|-----------|
| `0x0006b550` | 100 bytes | `JNI_OnLoad` — Ponto de entrada JNI; registra métodos nativos Java |

---

## 6. CATEGORIZAÇÃO COMPLETA DE FUNÇÕES

> **Nota sobre endereços**: Em ARM Thumb, o bit 0 do endereço indica modo Thumb (1) ou ARM (0).  
> "Endereço Real" = endereço do símbolo com bit 0 zerado (-1 se Thumb).  
> Todas as funções aqui estão em modo Thumb (bit 0 = 1).

---

### 6.1 PLAYER / PLAYEREGO (Jogador Principal)

A classe `Player` é a base, `PlayerEgo` é o jogador controlado pelo usuário.

| Endereço Real | Tam (bytes) | Nome Desmangled | Descrição Provável |
|---------------|-------------|-----------------|---------------------|
| **PLAYER (classe base)** | | | |
| `0x000a2570` | 448 | `Player::Player(int, int, int, int, int)` | Construtor do Player (pos, HP, etc) |
| `0x000a2864` | 128 | `Player::~Player()` | Destrutor do Player |
| `0x000a2730` | 136 | `Player::updateShip(...)` | Atualizar dados da nave do player |
| `0x000a31c0` | 1236 | `Player::damage(int, bool, int)` | Aplicar dano ao jogador |
| `0x000a2fa4` | 540 | `Player::damageFrom(...)` | Dano de fonte específica |
| `0x000a2ec6` | 62 | `Player::damageMultiplier(...)` | Multiplicador de dano |
| `0x000a2f04` | 12 | `Player::damageFlag(...)` | Flag de dano |
| `0x000a2f10` | 82 | `Player::damageFromGun(...)` | Dano de arma específica |
| `0x000a2f62` | 52 | `Player::damageFromCollision(...)` | Dano de colisão |
| `0x000a36a4` | 8 | `Player::turnEngine()` | Ligar/desligar motor |
| `0x000a36ac` | 34 | `Player::gunAim(...)` | Mira da arma |
| `0x000a3694` | 10 | `Player::damage(int)` | Dano simples |
| `0x000a36cb` | 12 | `Player::isDead()` | Verificar se morreu |
| `0x000a36d7` | 6 | `Player::isDamaged()` | Verificar se danificado |
| `0x000a36e0` | 6 | `Player::setActive(...)` | Ativar/desativar |
| `0x000a36e6` | 6 | `Player::isActive()` | Verificar se ativo |
| `0x000a36ec` | 100 | `Player::addGun(...)` | Adicionar arma |
| `0x000a3774` | 412 | `Player::calcChar(...)` | Calcular características |
| `0x000a3910` | 118 | `Player::addGunSlot(...)` | Adicionar slot de arma |
| `0x000a3986` | 32 | `Player::removeGun(...)` | Remover arma |
| `0x000a39a6` | 50 | `Player::resetGuns()` | Resetar armas |
| `0x000a39dc` | 54 | `Player::refill(...)` | Reabastecer munição |
| `0x000a3a14` | 80 | `Player::stopShooting(...)` | Parar de atirar |
| `0x000a3a64` | 188 | `Player::playSound(...)` | Tocar som de tiro |
| `0x000a3b20` | 412 | `Player::shoot(...)` | Atirar (sobrecarga complexa) |
| `0x000a3cb8` | 76 | `Player::stopShootingGun(...)` | Parar tiro de arma específica |
| `0x000a3d08` | 84 | `Player::stopAllShooting(...)` | Parar todos os tiros |
| `0x000a3d5c` | 468 | `Player::shoot(...)` | Atirar (outra sobrecarga) |
| `0x000a3f30` | 110 | `Player::shoot(int, long long, bool)` | Atirar com parâmetros |
| `0x000a3f9e` | 116 | `Player::shoot(int, int, long long, bool)` | Atirar com mira |
| `0x000a4014` | 116 | `Player::playSound(...)` | Tocar som |
| `0x000a4088` | 36 | `Player::pauseSounds(...)` | Pausar sons |
| `0x000a40ac` | 52 | `Player::resumeSounds(...)` | Retomar sons |
| `0x000a40e0` | 40 | `Player::stopSounds(...)` | Parar sons |
| `0x000a4108` | 6 | `Player::getEnemy(...)` | Obter inimigo |
| `0x000a4110` | 460 | `Player::update(int, bool)` | Atualizar lógica do player |
| `0x000a42dc` | 94 | `Player::heal(float)` | Curar HP |
| `0x000a433a` | 38 | `Player::pitch(...)` | Rotacionar pitch |
| `0x000a4360` | 2 | `Player::replaceGun(...)` | Substituir arma |
| `0x000a2570` | 92 | `Player::reset()` | Resetar estado |
| `0x000a2a6a` | 92 | `Player::reset()` | Resetar (sobrecarga) |
| **PLAYEREGO (controle do jogador)** | | | |
| `0x000998cc` | 2008 | `PlayerEgo::PlayerEgo(...)` | **Construtor principal** (~2KB de código!) |
| `0x0009a0a4` | 338 | `PlayerEgo::~PlayerEgo()` | Destrutor |
| `0x0009ce38` | 8852 | **`PlayerEgo::update(int)`** | **UPDATE PRINCIPAL** (~8,6 KB! Maior função do jogo) |
| `0x0009a274` | 600 | `PlayerEgo::setCamera(...)` | Configurar câmera |
| `0x0009a50c` | 68 | `PlayerEgo::setInitialPosition(...)` | Posição inicial |
| `0x0009a550` | 140 | `PlayerEgo::PauseEngine()` | Pausar motor |
| `0x0009a5ec` | 152 | `PlayerEgo::StopEngine()` | Parar motor |
| `0x0009a684` | 26 | `PlayerEgo::isMoving()` | Verificar se em movimento |
| `0x0009a69e` | 20 | `PlayerEgo::resetThrusters()` | Resetar propulsores |
| `0x0009a6b2` | 18 | `PlayerEgo::resetKeys()` | Resetar teclas |
| `0x0009a6c4` | 68 | `PlayerEgo::startBoost(...)` | Iniciar turbo |
| `0x0009a708` | 680 | `PlayerEgo::thrust(...)` | Empuxo/aceleração |
| `0x0009a9b0` | 12 | `PlayerEgo::hasSpeed()` | Tem velocidade? |
| `0x0009a9bc` | 52 | `PlayerEgo::getSpeed()` | Obter velocidade |
| `0x0009a9f8` | 24 | `PlayerEgo::addSpeed(...)` | Adicionar velocidade |
| `0x0009aa10` | 6 | `PlayerEgo::isColliding()` | Verificar colisão |
| `0x0009aa18` | 376 | `PlayerEgo::setRotation(...)` | Definir rotação |
| `0x0009ab90` | 584 | `PlayerEgo::setSpeed(...)` | Definir velocidade |
| `0x0009add8` | 12 | `PlayerEgo::isInCombat()` | Em combate? |
| `0x0009ade4` | 66 | `PlayerEgo::init(...)` | Inicializar |
| `0x0009ae34` | 76 | `PlayerEgo::start(...)` | Iniciar |
| `0x0009ae80` | 34 | `PlayerEgo::isDocked()` | Está acoplado? |
| `0x0009aea4` | 92 | **`PlayerEgo::boost()`** | **Ativar turbo** |
| `0x0009af00` | 6 | `PlayerEgo::getBooster()` | Obter booster |
| `0x0009af06` | 30 | `PlayerEgo::fireCannon(...)` | Disparar canhão |
| `0x0009af24` | 14 | `PlayerEgo::getShield()` | Obter escudo |
| `0x0009af38` | 16 | `PlayerEgo::resetSpeed()` | Resetar velocidade |
| `0x0009afa0` | 48 | `PlayerEgo::getCameraPos()` | Posição da câmera |
| `0x0009afd0` | 62 | `PlayerEgo::getCameraTarget()` | Alvo da câmera |
| `0x0009b00e` | 44 | `PlayerEgo::getRotation()` | Rotação atual |
| `0x0009b03a` | 14 | `PlayerEgo::draw(...)` | Desenhar (chamada) |
| `0x0009b048` | 6 | `PlayerEgo::isRespawning()` | Respawnando? |
| `0x0009b04e` | 8 | `PlayerEgo::isReadyForRender()` | Pronto para render |
| `0x0009b056` | 6 | `PlayerEgo::isInWormhole()` | Em wormhole? |
| `0x0009b05c` | 14 | `PlayerEgo::isInJumpgate()` | Em jumpgate? |
| `0x0009b06a` | 34 | `PlayerEgo::getCameraDistance()` | Distância da câmera |
| `0x0009b0b0` | 6 | `PlayerEgo::setCloak(...)` | Definir camuflagem |
| `0x0009b0b8` | 152 | `PlayerEgo::setCloakEffect(...)` | Efeito de camuflagem |
| `0x0009b150` | 6 | `PlayerEgo::getCloak()` | Obter camuflagem |
| `0x0009b15c` | 28 | `PlayerEgo::resetCloak()` | Resetar camuflagem |
| `0x0009b178` | 4 | `PlayerEgo::isLocked()` | Está travado? |
| `0x0009b17c` | 20 | `PlayerEgo::isInStation()` | Em estação? |
| `0x0009b198` | 260 | **`PlayerEgo::shoot(int, int)`** | **Atirar** |
| `0x0009b29c` | 6 | `PlayerEgo::hasCargo()` | Tem carga? |
| `0x0009b2a2` | 18 | `PlayerEgo::setCargo(...)` | Definir carga |
| `0x0009b2bc` | 48 | `PlayerEgo::setTarget(...)` | Definir alvo |
| `0x0009b2ec` | 84 | `PlayerEgo::getTarget()` | Obter alvo |
| `0x0009b340` | 1080 | `PlayerEgo::collisionCheck(...)` | Verificação de colisão |
| `0x0009b778` | 22 | `PlayerEgo::addExplosion(...)` | Adicionar explosão |
| `0x0009b7a4` | 6 | `PlayerEgo::getExperience()` | Obter XP |
| `0x0009b7aa` | 6 | `PlayerEgo::getMoney()` | Obter dinheiro |
| `0x0009b7b0` | 6 | `PlayerEgo::getLoot()` | Obter loot |
| `0x0009b7b8` | 24 | `PlayerEgo::setLoot(...)` | Definir loot |
| `0x0009b7d0` | 12 | `PlayerEgo::getGalaxy()` | Obter galáxia |
| `0x0009b7dc` | 12 | `PlayerEgo::getGalaxyID()` | ID da galáxia |
| `0x0009b7e8` | 12 | `PlayerEgo::getSystem()` | Obter sistema |
| `0x0009b7f4` | 6 | `PlayerEgo::setSystem(...)` | Definir sistema |
| `0x0009b800` | 6 | `PlayerEgo::setWanted(...)` | Definir procurado |
| `0x0009b808` | 100 | `PlayerEgo::setWantedLevel(...)` | Nível de procurado |
| `0x0009b872` | 6 | `PlayerEgo::getWanted()` | Nível procurado |
| `0x0009b878` | 44 | `PlayerEgo::getShipType()` | Tipo da nave |
| `0x0009b8a4` | 6 | `PlayerEgo::isInCombat()` | Em combate? |
| `0x0009b8aa` | 30 | `PlayerEgo::getShipClass()` | Classe da nave |
| `0x0009b8c8` | 46 | `PlayerEgo::getShipName()` | Nome da nave |
| `0x0009b8f6` | 6 | `PlayerEgo::goToStation(...)` | Ir para estação |
| `0x0009b8fc` | 30 | `PlayerEgo::goToSystem(...)` | Ir para sistema |
| `0x0009b91c` | 44 | `PlayerEgo::setDestination(...)` | Definir destino |
| `0x0009b948` | 4 | `PlayerEgo::setSystemID(...)` | Definir ID do sistema |
| `0x0009b94c` | 30 | `PlayerEgo::isInTutorial()` | Em tutorial? |
| `0x0009b96c` | 652 | `PlayerEgo::handleInput(...)` | Processar input |
| `0x0009bbf8` | 500 | **`PlayerEgo::roll(int)`** | **Rolar a nave** |
| `0x0009bdf0` | 896 | `PlayerEgo::handleCollision(...)` | Processar colisão |
| `0x0009c170` | 136 | `PlayerEgo::getGunSight()` | Mira da arma |
| `0x0009c1f8` | 1244 | `PlayerEgo::updatePhysics(...)` | Física da nave |
| `0x0009c6d4` | 932 | `PlayerEgo::moveForward(...)` | Mover para frente |
| `0x0009ca78` | 956 | `PlayerEgo::handleAutoPilot(...)` | Piloto automático |
| `0x0009f0cc` | 968 | `PlayerEgo::checkCollisions(...)` | Checar colisões |
| `0x0009f494` | 6 | `PlayerEgo::isInAsteroidField()` | Em campo de asteroides |
| `0x0009f49a` | 6 | `PlayerEgo::isInNebula()` | Em nebulosa |
| `0x0009f4a0` | 208 | `PlayerEgo::drawEffects(...)` | Desenhar efeitos |
| `0x0009f570` | 1156 | `PlayerEgo::autoAim(...)` | Mira automática |
| `0x0009f9f4` | 708 | `PlayerEgo::drawTrail(...)` | Desenhar rastro |
| `0x0009fcb8` | 2532 | `PlayerEgo::autoPilot(...)` | Piloto automático completo |
| `0x000a069c` | 22 | `PlayerEgo::isInCombatZone()` | Em zona de combate |
| `0x000a06b2` | 28 | `PlayerEgo::isInSafeZone()` | Em zona segura |
| `0x000a06ec` | 22 | `PlayerEgo::hit(...)` | Acertar algo |
| `0x000a0704` | 584 | `PlayerEgo::right(int, float)` | Virar à direita |
| `0x000a094c` | 580 | `PlayerEgo::left(int, float)` | Virar à esquerda |
| `0x000a0b90` | 620 | `PlayerEgo::down(int, float)` | Mover para baixo |
| `0x000a0dfc` | 624 | `PlayerEgo::up(int, float)` | Mover para cima |
| `0x000a106c` | 140 | `PlayerEgo::transitionToStation(...)` | Transição para estação |
| `0x000a10f8` | 14 | `PlayerEgo::enableCloak()` | Ativar camuflagem |
| `0x000a1106` | 6 | `PlayerEgo::countermeasure(...)` | Contra-medida |
| `0x000a110c` | 12 | `PlayerEgo::isHostileHost()` | Host hostil? |
| `0x000a1118` | 14 | `PlayerEgo::hasWeapon()` | Tem arma? |
| `0x000a1126` | 28 | `PlayerEgo::disableWeapons()` | Desabilitar armas |
| `0x000a1142` | 16 | `PlayerEgo::getGunSightPos()` | Posição da mira |
| `0x000a1152` | 22 | `PlayerEgo::isInCutscene()` | Em cutscene? |
| `0x000a1168` | 44 | `PlayerEgo::thrustForward(...)` | Empuxo para frente |
| `0x000a1194` | 26 | `PlayerEgo::thrustBack(...)` | Empuxo para trás |
| `0x000a11ae` | 6 | `PlayerEgo::getAngle()` | Ângulo atual |
| `0x000a11b4` | 216 | `PlayerEgo::startAutoPilot()` | Iniciar piloto automático |
| `0x000a128c` | 44 | `PlayerEgo::hasAutoPilot()` | Tem piloto automático? |
| `0x000a12b8` | 44 | `PlayerEgo::hasHyperdrive()` | Tem hiperdrive? |
| `0x000a12e4` | 14 | `PlayerEgo::hasCloak()` | Tem camuflagem? |
| `0x000a12f2` | 8 | `PlayerEgo::alertHostile()` | Alerta hostil |
| `0x000a12fc` | 128 | `PlayerEgo::rotate(...)` | Rotacionar |
| `0x000a137c` | 100 | `PlayerEgo::setAutoPilot(...)` | Configurar piloto automático |
| `0x000a13e0` | 196 | `PlayerEgo::explosion(...)` | Criar explosão |
| `0x000a14a4` | 244 | `PlayerEgo::respawn(...)` | Respawnar |
| `0x000a1598` | 46 | `PlayerEgo::setRespawnPos(...)` | Posição de respawn |
| `0x000a15c6` | 14 | `PlayerEgo::enableAutoPilot()` | Ativar piloto automático |
| `0x000a15d4` | 26 | `PlayerEgo::explosionSound(...)` | Som de explosão |
| `0x000a15ee` | 6 | `PlayerEgo::absorbShield()` | Absorver escudo |
| `0x000a15f4` | 8 | `PlayerEgo::respawnFlag()` | Flag de respawn |
| `0x000a15fc` | 8 | `PlayerEgo::setRespawnFlag(...)` | Definir flag |
| `0x000a1604` | 26 | `PlayerEgo::isRespawnReady()` | Respawn pronto? |
| `0x000a161e` | 22 | `PlayerEgo::isInvincible()` | Invencível? |
| `0x000a1634` | 72 | `PlayerEgo::isInJumpgateRange(...)` | Em alcance de jumpgate? |
| `0x000a167c` | 6 | `PlayerEgo::isInAsteroidBelt()` | Em cinturão de asteroides |
| `0x000a1684` | 112 | `PlayerEgo::doRespawn()` | Executar respawn |
| `0x000a16f4` | 44 | `PlayerEgo::startRespawn()` | Iniciar respawn |
| `0x000a1720` | 18 | `PlayerEgo::isInMission()` | Em missão? |
| `0x000a1732` | 64 | `PlayerEgo::doDock(...)` | Executar acoplamento |
| `0x000a1772` | 22 | `PlayerEgo::showLoadScreen(...)` | Mostrar tela de carregamento |
| `0x000a1788` | 22 | `PlayerEgo::showSaveScreen(...)` | Mostrar tela de salvar |
| `0x000a17b4` | 524 | `PlayerEgo::setSpeedSmooth(...)` | Velocidade suave |
| `0x000a19c0` | 6 | `PlayerEgo::loadSaveData(...)` | Carregar dados de save |
| `0x000a19c6` | 82 | `PlayerEgo::saveData(...)` | Salvar dados |
| `0x000a1a18` | 164 | `PlayerEgo::kill(...)` | Matar jogador |
| `0x000a1ab8` | 188 | `PlayerEgo::isInDockRange(...)` | Em alcance de docagem |
| `0x000a1b78` | 222 | `PlayerEgo::render(bool)` | Renderizar jogador |
| `0x000a1c56` | 50 | `PlayerEgo::hasThruster()` | Tem propulsor? |
| `0x000a1c98` | 620 | `PlayerEgo::draw(bool)` | **Desenhar jogador** |
| `0x000a1f04` | 496 | `PlayerEgo::drawHud(...)` | Desenhar HUD |
| `0x000a20f4` | 58 | `PlayerEgo::thrustVector(...)` | Vetor de empuxo |
| `0x000a2134` | 172 | `PlayerEgo::shake(int)` | Tela de tremer |
| `0x000a21e0` | 6 | `PlayerEgo::getTrail()` | Obter rastro |
| `0x000a21ec` | 6 | `PlayerEgo::setTrail(...)` | Definir rastro |
| `0x000a21f2` | 16 | `PlayerEgo::setSpeedMult(...)` | Multiplicador de velocidade |
| `0x000a2202` | 6 | `PlayerEgo::setPitch(...)` | Definir pitch |
| `0x000a2208` | 6 | `PlayerEgo::pitch(...)` | Pitch |
| `0x000a2214` | 96 | `PlayerEgo::checkWormhole(...)` | Checar wormhole |
| `0x000a2274` | 6 | `PlayerEgo::getShipValue()` | Valor da nave |
| `0x000a227a` | 6 | `PlayerEgo::setShipValue(...)` | Definir valor |
| `0x000a2280` | 6 | `PlayerEgo::getShipID()` | ID da nave |
| `0x000a2286` | 6 | `PlayerEgo::getCameraAngle()` | Ângulo da câmera |
| **Variáveis Globais PlayerEgo** | | | |
| `0x002151b0` | 12 | `PlayerEgo::vec_up` | Vetor para cima (Vector3) |
| `0x00217b9c` | 12 | `PlayerEgo::collisionData[...]` | Dados de colisão |
| `0x00217ba8` | 12 | `PlayerEgo::cameraPos[...]` | Posição da câmera |
| **Variáveis Globais Player** | | | |
| `0x002151bc` | 4 | `Player::velocity` | Velocidade do jogador |

---

### 6.2 KIPLAYER (Inteligência Artificial / NPCs)

| Endereço Real | Tam | Nome Desmangled | Descrição |
|---------------|-----|-----------------|-----------|
| `0x000a57c8` | 556 | `KIPlayer::KIPlayer(int)` | Construtor do NPC |
| `0x000a59f4` | 188 | `KIPlayer::~KIPlayer()` | Destrutor |
| `0x000a5b16` | 16 | `KIPlayer::~KIPlayer()` | Destrutor (deleting) |
| `0x000a5b26` | 6 | `KIPlayer::isVisible()` | Visível? |
| `0x000a5b3c` | 6 | `KIPlayer::setTarget(...)` | Definir alvo |
| `0x000a5b44` | 6 | `KIPlayer::getTarget()` | Obter alvo |
| `0x000a5b4c` | 264 | `KIPlayer::getGunPos(...)` | Posição da arma |
| `0x000a5c54` | 236 | `KIPlayer::getGunAim(...)` | Mira da arma |
| `0x000a5dd8` | 6 | `KIPlayer::isJumping()` | Está saltando? |
| `0x000a5dde` | 2 | `KIPlayer::setJump(...)` | Definir salto |
| `0x000a5de4` | 2 | `KIPlayer::setDead(...)` | Definir morto |
| `0x000a5de6` | 68 | `KIPlayer::reset()` | Resetar NPC |
| `0x000a5e2a` | 28 | `KIPlayer::setDock(...)` | Definir acoplamento |
| `0x000a5e46` | 6 | `KIPlayer::setAlive(...)` | Definir vivo |
| `0x000a5e4c` | 18 | `KIPlayer::setWormhole(...)` | Definir wormhole |
| `0x000a5e60` | 684 | **`KIPlayer::calculatePath(...)`** | **Calcular caminho (IA)** |
| `0x000a610c` | 14 | `KIPlayer::isDead()` | Está morto? |
| `0x000a611a` | 14 | `KIPlayer::isDocking(...)` | Acoplando? |
| `0x000a6128` | 6 | `KIPlayer::isWormhole()` | Wormhole? |
| `0x000a612e` | 12 | `KIPlayer::setAggression(...)` | Definir agressão |
| `0x000a613a` | 6 | `KIPlayer::setSpawnPos(...)` | Posição de spawn |
| `0x000a6140` | 4 | `KIPlayer::setBehavior(...)` | Definir comportamento |
| `0x000a6144` | 6 | `KIPlayer::setState(...)` | Definir estado |
| `0x000a614e` | 2 | `KIPlayer::enableAI()` | Ativar IA |
| `0x000a6150` | 36 | `KIPlayer::setFormation(...)` | Definir formação |
| `0x000a6174` | 4 | `KIPlayer::getBehavior()` | Obter comportamento |
| `0x000a6178` | 6 | `KIPlayer::setDockStation(...)` | Estação de docagem |
| `0x000a617e` | 20 | `KIPlayer::PauseEngine()` | Pausar motor NPC |
| `0x000a6192` | 22 | `KIPlayer::PlayerFighters(...)` | Lutadores do player |
| `0x000a61a8` | 22 | `KIPlayer::ResumeEngine()` | Retomar motor |
| `0x000a61be` | 20 | `KIPlayer::StopEngine()` | Parar motor |
| `0x000a61d2` | 6 | `KIPlayer::addFighter(...)` | Adicionar lutador |
| `0x000a61d8` | 6 | `KIPlayer::addTurret(...)` | Adicionar torreta |
| `0x000a61de` | 6 | `KIPlayer::getShipClass()` | Classe da nave |
| `0x000a61e4` | 8 | `KIPlayer::isEvading()` | Está evadindo? |
| `0x000a61ec` | 14 | `KIPlayer::getDockStation()` | Estação de acoplamento |
| `0x000a61fa` | 14 | `KIPlayer::isInFormation()` | Em formação? |
| `0x000a6208` | 12 | `KIPlayer::setEvade(...)` | Definir evasão |
| `0x000a6214` | 16 | `KIPlayer::awake()` | Acordar NPC |
| `0x000a6224` | 216 | `KIPlayer::createExplosion(...)` | Criar explosão |
| `0x000a6304` | 36 | `KIPlayer::calculateThreat(...)` | Calcular ameaça |
| `0x000a6328` | 4 | `KIPlayer::leaveFormation()` | Sair de formação |
| `0x000a632c` | 6 | `KIPlayer::render()` | Renderizar NPC |
| `0x000a6332` | 30 | `KIPlayer::transform(...)` | Transformar |
| `0x000a6350` | 14 | `KIPlayer::jump()` | Saltar (jumpgate) |
| `0x000a635e` | 2 | `KIPlayer::revive()` | Reviver NPC |
| `0x000a6360` | 50 | `KIPlayer::setFighters(...)` | Definir lutadores |
| `0x000a6394` | 44 | `KIPlayer::setWaypoint(...)` | Definir waypoint |

---

### 6.3 TIPOS ESPECIAIS DE PLAYER (Subclasses)

#### PlayerFighter (Lutadores/AI que seguem o jogador)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000dc824` | 152 | `PlayerFighter::PlayerFighter(...)` | Construtor |
| `0x000dc922` | 16 | `~PlayerFighter()` | Destrutor (deleting) |
| `0x000dc934` | 252 | `PlayerFighter::render()` | Renderizar lutador |
| `0x000dca30` | 232 | `PlayerFighter::update(...)` | Atualizar lutador |
| `0x000dcb18` | 96 | `PlayerFighter::fire(...)` | Atirar |
| `0x000dcb78` | 6 | `PlayerFighter::isActive()` | Ativo? |
| `0x000dcb7e` | 6 | `PlayerFighter::isDead()` | Morto? |
| `0x000dcb84` | 4 | `PlayerFighter::getTarget()` | Obter alvo |
| `0x000dcb88` | 12 | `PlayerFighter::setTarget(...)` | Definir alvo |
| `0x000dcb94` | 6 | `PlayerFighter::setHome(...)` | Definir base |
| `0x000dcb9a` | 28 | `PlayerFighter::goHome()` | Voltar para base |
| `0x000dcbb8` | 116 | `PlayerFighter::attack(...)` | Atacar |
| `0x000dcc2c` | 160 | `PlayerFighter::calculateAI(...)` | Calcular IA |
| `0x000dcc9c` | 16 | `PlayerFighter::setFormation(...)` | Definir formação |
| `0x000dcd02` | 6 | `PlayerFighter::getHome()` | Obter base |
| `0x000dcd08` | 28 | `PlayerFighter::goTo(...)` | Ir para posição |
| `0x000dcd24` | 52 | `PlayerFighter::dockTo(...)` | Acoplar |
| `0x000dcd58` | 68 | `PlayerFighter::evade(...)` | Evadir |
| `0x000dcd9c` | 30 | `PlayerFighter::setEvade(...)` | Modo evasão |
| `0x000dcbdb` | 528 | `PlayerFighter::updateAI(...)` | Atualizar IA |
| `0x000dcfc8` | 6 | `PlayerFighter::getWeaponType()` | Tipo de arma |
| `0x000dcfd8` | 10376 | **`PlayerFighter::fightLoop(...)`** | **Loop principal de combate** (10KB!) |
| `0x000df860` | 496 | `PlayerFighter::handleCombat(...)` | Processar combate |
| `0x000dfa50` | 308 | `PlayerFighter::patrol(...)` | Patrulhar |
| `0x000dfb84` | 6 | `PlayerFighter::isPatrolling()` | Patrulhando? |
| `0x000dfb8a` | 58 | `PlayerFighter::engage(...)` | Engajar |
| `0x000dfbe8` | 80 | `PlayerFighter::retreat(...)` | Recuar |
| `0x000dfc38` | 80 | `PlayerFighter::followLeader(...)` | Seguir líder |
| `0x000dfc88` | 320 | `PlayerFighter::guard(...)` | Guardar |
| `0x000dfdc8` | 356 | `PlayerFighter::escort(...)` | Escoltar |
| `0x000dff2c` | 48 | `PlayerFighter::setWaypoint(...)` | Definir waypoint |
| `0x000dff5c` | 308 | `PlayerFighter::wander(...)` | Vaguear |

#### PlayerStation (Estações espaciais)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00121818` | 3440 | `PlayerStation::PlayerStation(...)` | Construtor (~3,3 KB!) |
| `0x00122588` | 100 | `PlayerStation::~PlayerStation()` | Destrutor |
| `0x001225ec` | 16 | `PlayerStation::~PlayerStation()` | Destrutor (deleting) |
| `0x001225fc` | 236 | `PlayerStation::render()` | Renderizar estação |
| `0x001226e8` | 16 | `PlayerStation::update(...)` | Atualizar estação |
| `0x001226f8` | 84 | `PlayerStation::dock(...)` | Acoplar |
| `0x0012274c` | 14 | `PlayerStation::undock(...)` | Desacoplar |
| `0x00122760` | 6 | `PlayerStation::isDocked()` | Está acoplado? |
| `0x00122768` | 8 | `PlayerStation::isHostile()` | Hostil? |
| `0x00122778` | 196 | `PlayerStation::trade(...)` | Comerciar |
| `0x0012283c` | 28 | `PlayerStation::getDockingBay()` | Baía de acoplamento |
| `0x00122858` | 36 | `PlayerStation::setDockingBay(...)` | Definir baía |
| `0x0012287c` | 18 | `PlayerStation::hasTrader()` | Tem comerciante? |

#### PlayerAsteroid (Asteroides)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000e2648` | 824 | `PlayerAsteroid::PlayerAsteroid(...)` | Construtor |
| `0x000e2980` | 52 | `~PlayerAsteroid()` | Destrutor |
| `0x000e29b4` | 16 | `PlayerAsteroid::update(...)` | Atualizar |
| `0x000e29c4` | 6 | `PlayerAsteroid::isDestroyed()` | Destruído? |
| `0x000e29ca` | 12 | `PlayerAsteroid::destroy()` | Destruir |
| `0x000e29d6` | 6 | `PlayerAsteroid::getOre()` | Obter minério |
| `0x000e29dc` | 6 | `PlayerAsteroid::setOre(...)` | Definir minério |
| `0x000e29e2` | 6 | `PlayerAsteroid::getReward()` | Recompensa |
| `0x000e29e8` | 6 | `PlayerAsteroid::setReward(...)` | Definir recompensa |
| `0x000e29ee` | 6 | `PlayerAsteroid::getSize()` | Tamanho |
| `0x000e29f4` | 10 | `PlayerAsteroid::render()` | Renderizar |
| `0x000e2a00` | 60 | `PlayerAsteroid::explode(...)` | Explodir |
| `0x000e2a3c` | 84 | `PlayerAsteroid::fragment(...)` | Fragmentar |
| `0x000e2a90` | 6 | `PlayerAsteroid::hit(...)` | Acertar |
| `0x000e2a98` | 320 | `PlayerAsteroid::updatePhysics(...)` | Física |
| `0x000e2bd8` | 328 | `PlayerAsteroid::mine(...)` | Minerar |
| `0x000e2d20` | 792 | `PlayerAsteroid::split(...)` | Dividir asteroide |
| `0x000e3038` | 54 | `PlayerAsteroid::dropLoot(...)` | Dropar loot |
| `0x000e306e` | 10 | `PlayerAsteroid::getHealth()` | HP do asteroide |
| `0x000e3078` | 10 | `PlayerAsteroid::setHealth(...)` | Definir HP |
| `0x000e3084` | 128 | `PlayerAsteroid::spawnFragment(...)` | Spawnar fragmento |
| `0x000e3104` | 220 | `PlayerAsteroid::createDebris(...)` | Criar detritos |

#### PlayerJumpgate (Portais de salto)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000a4fa4` | 264 | `PlayerJumpgate::PlayerJumpgate(...)` | Construtor |
| `0x000a5100` | 16 | `~PlayerJumpgate()` | Destrutor |
| `0x000a5110` | 6 | `PlayerJumpgate::isActive()` | Ativo? |
| `0x000a5118` | 76 | `PlayerJumpgate::update(...)` | Atualizar |
| `0x000a5164` | 44 | `PlayerJumpgate::render()` | Renderizar |
| `0x000a5190` | 48 | `PlayerJumpgate::enter(...)` | Entrar no portal |
| `0x000a51c0` | 46 | `PlayerJumpgate::setDest(...)` | Definir destino |
| `0x000a51f0` | 48 | `PlayerJumpgate::trigger(...)` | Disparar |

#### PlayerWormHole (Buracos de Minhoca)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000a5254` | 152 | `PlayerWormHole::PlayerWormHole(...)` | Construtor |
| `0x000a52fe` | 4 | `~PlayerWormHole()` | Destrutor (deleting) |
| `0x000a5302` | 16 | `~PlayerWormHole()` | Destrutor |
| `0x000a5314` | 16 | `PlayerWormHole::isReady()` | Pronto? |
| `0x000a5324` | 18 | `PlayerWormHole::getDestGalaxy()` | Galáxia destino |
| `0x000a5336` | 52 | `PlayerWormHole::enter(...)` | Entrar |
| `0x000a536a` | 14 | `PlayerWormHole::getDestSystem()` | Sistema destino |
| `0x000a5378` | 8 | `PlayerWormHole::isActive()` | Ativo? |
| `0x000a5380` | 1056 | `PlayerWormHole::update(...)` | Atualizar (animação) |
| `0x000a57a0` | 38 | `PlayerWormHole::render()` | Renderizar |

#### PlayerCreature (Criaturas espaciais)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0011cb5c` | 204 | `PlayerCreature::PlayerCreature(...)` | Construtor |
| `0x0011cc28` | 20 | `~PlayerCreature()` | Destrutor |
| `0x0011cc40` | 148 | `PlayerCreature::render()` | Renderizar |
| `0x0011cce8` | 80 | `PlayerCreature::update(...)` | Atualizar |
| `0x0011cd38` | 6 | `PlayerCreature::isAlive()` | Vivo? |
| `0x0011cd3e` | 6 | `PlayerCreature::getHealth()` | HP |
| `0x0011cd44` | 10 | `PlayerCreature::setHealth(...)` | Definir HP |
| `0x0011cd4e` | 24 | `PlayerCreature::attack(...)` | Atacar |
| `0x0011cd68` | 592 | `PlayerCreature::updateAI(...)` | Atualizar IA |
| `0x0011cfb8` | 36 | `PlayerCreature::flee(...)` | Fugir |
| `0x0011cfd8` | 4 | `PlayerCreature::getTarget()` | Obter alvo |
| `0x0011cfe0` | 4 | `PlayerCreature::setTarget(...)` | Definir alvo |
| `0x0011cfe4` | 20 | `PlayerCreature::spawn(...)` | Spawnar |
| `0x0011cff8` | 6 | `PlayerCreature::isHostile()` | Hostil? |
| `0x0011cffe` | 6 | `PlayerCreature::getReward()` | Recompensa |
| `0x0011d004` | 6 | `PlayerCreature::setReward(...)` | Definir recompensa |

#### PlayerStatic / PlayerStaticFar (Objetos estáticos no espaço)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000e08cc` | 160 | `PlayerStatic::PlayerStatic(...)` | Construtor |
| `0x000e096c` | 4 | `~PlayerStatic()` | Destrutor (deleting) |
| `0x000e0970` | 16 | `~PlayerStatic()` | Destrutor |
| `0x000e0980` | 2 | `PlayerStatic::render()` | Renderizar |
| `0x000e0982` | 54 | `PlayerStatic::update(...)` | Atualizar |
| `0x000e09b8` | 6 | `PlayerStatic::isActive()` | Ativo? |
| `0x000e09be` | 2 | `PlayerStatic::isVisible()` | Visível? |
| `0x000e09c0` | 4 | `PlayerStatic::setActive(...)` | Definir ativo |
| `0x000e09c4` | 4 | `PlayerStatic::setVisible(...)` | Definir visível |

#### PlayerFixedObject (Objetos fixos - satélites, etc)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00153a7c` | 756 | `PlayerFixedObject::PlayerFixedObject(...)` | Construtor |
| `0x00153d70` | 164 | `~PlayerFixedObject()` | Destrutor |
| `0x00153e14` | 16 | `~PlayerFixedObject()` | Destrutor (deleting) |
| `0x00153e24` | 192 | `PlayerFixedObject::render()` | Renderizar |
| `0x00153ee4` | 200 | `PlayerFixedObject::update(...)` | Atualizar |
| `0x00153fb4` | 28 | `PlayerFixedObject::activate(...)` | Ativar |
| `0x00153fd0` | 70 | `PlayerFixedObject::interact(...)` | Interagir |
| `0x00154016` | 6 | `PlayerFixedObject::isActive()` | Ativo? |
| `0x0015401c` | 58 | `PlayerFixedObject::setRadius(...)` | Definir raio |
| `0x00154056` | 38 | `PlayerFixedObject::setType(...)` | Definir tipo |
| `0x0015407c` | 184 | `PlayerFixedObject::updateOrbit(...)` | Atualizar órbita |
| `0x00154134` | 172 | `PlayerFixedObject::handleDamage(...)` | Processar dano |
| `0x001541e0` | 2768 | `PlayerFixedObject::updateAI(...)` | Atualizar IA (~2,7 KB) |
| `0x00154cdc` | 110 | `PlayerFixedObject::setTarget(...)` | Definir alvo |
| `0x00154d4a` | 140 | `PlayerFixedObject::fire(...)` | Atirar |
| `0x00154dd6` | 64 | `PlayerFixedObject::patrol(...)` | Patrulhar |
| `0x00154e16` | 58 | `PlayerFixedObject::scan(...)` | Escanear |
| `0x00154e50` | 10 | `PlayerFixedObject::isScanning()` | Escaneando? |
| `0x00154e5a` | 144 | `PlayerFixedObject::dock(...)` | Acoplar |
| `0x00154ef0` | 6 | `PlayerFixedObject::isDocked()` | Acoplado? |
| `0x00154ef6` | 6 | `PlayerFixedObject::getDockPos()` | Posição de docagem |
| `0x00154f02` | 16 | `PlayerFixedObject::setDockPos(...)` | Definir posição |
| `0x00154f12` | 8 | `PlayerFixedObject::setDocked(...)` | Definir acoplado |
| `0x00154f1a` | 8 | `PlayerFixedObject::setOwner(...)` | Definir dono |

#### PlayerTurret (Torretas)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00157040` | 768 | `PlayerTurret::PlayerTurret(...)` | Construtor |
| `0x00157340` | 108 | `~PlayerTurret()` | Destrutor |
| `0x0001573ac` | 16 | `~PlayerTurret()` | Destrutor (deleting) |
| `0x001573bc` | 52 | `PlayerTurret::render()` | Renderizar |
| `0x001573f0` | 28 | `PlayerTurret::update(...)` | Atualizar |
| `0x00157418` | 6 | `PlayerTurret::isActive()` | Ativo? |
| `0x0015741e` | 14 | `PlayerTurret::fire(...)` | Atirar |
| `0x0015742c` | 6 | `PlayerTurret::getTarget()` | Obter alvo |
| `0x00157432` | 28 | `PlayerTurret::setTarget(...)` | Definir alvo |
| `0x00157450` | 764 | `PlayerTurret::aimAt(...)` | Mirar em alvo |
| `0x0015774c` | 54 | `PlayerTurret::rotate(...)` | Rotacionar |
| `0x00157782` | 54 | `PlayerTurret::elevate(...)` | Elevar |
| `0x001577b8` | 336 | `PlayerTurret::updateAim(...)` | Atualizar mira |
| `0x00157908` | 708 | `PlayerTurret::updateAI(...)` | IA da torreta |
| `0x00157bcc` | 52 | `PlayerTurret::setOwner(...)` | Definir dono |
| `0x00157c00` | 4 | `PlayerTurret::getOwner()` | Obter dono |
| `0x00157c04` | 76 | `PlayerTurret::setRange(...)` | Definir alcance |

#### PlayerJunk (Lixo espacial / destroços)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0015e720` | 72 | `PlayerJunk::PlayerJunk(...)` | Construtor |
| `0x0015e768` | 4 | `~PlayerJunk()` | Destrutor (deleting) |
| `0x0015e76c` | 16 | `~PlayerJunk()` | Destrutor |
| `0x0015e77c` | 28 | `PlayerJunk::render()` | Renderizar |
| `0x0015e798` | 308 | `PlayerJunk::update(...)` | Atualizar |
| `0x0015e8cc` | 36 | `PlayerJunk::collect(...)` | Coletar |
| `0x0015e8f0` | 4 | `PlayerJunk::isCollectable()` | Coletável? |
| `0x0015e8f4` | 4 | `PlayerJunk::getLootType()` | Tipo de loot |

#### PlayerGasCloud (Nuvens de gás)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x001763cc` | 340 | `PlayerGasCloud::PlayerGasCloud(...)` | Construtor |
| `0x00176520` | 200 | `~PlayerGasCloud()` | Destrutor |
| `0x001765e8` | 16 | `PlayerGasCloud::render()` | Renderizar |
| `0x001765f8` | 22 | `PlayerGasCloud::setRadius(...)` | Definir raio |
| `0x00176610` | 48 | `PlayerGasCloud::update(...)` | Atualizar |
| `0x00176640` | 6 | `PlayerGasCloud::isActive()` | Ativo? |
| `0x00176646` | 12 | `PlayerGasCloud::setActive(...)` | Definir ativo |
| `0x00176652` | 6 | `PlayerGasCloud::getRadius()` | Obter raio |
| `0x00176658` | 6 | `PlayerGasCloud::getDensity()` | Densidade |
| `0x00176660` | 776 | `PlayerGasCloud::updateCloud(...)` | Atualizar nuvem |
| `0x00176968` | 6 | `PlayerGasCloud::isInCloud(...)` | Dentro da nuvem? |
| `0x001769ac` | 6 | `PlayerGasCloud::getDamage()` | Dano da nuvem |
| `0x001769b4` | 1124 | `PlayerGasCloud::processEffect(...)` | Processar efeito |
| `0x00176e18` | 264 | `PlayerGasCloud::renderParticles(...)` | Renderizar partículas |

---

### 6.4 ARMAS (GUNS / WEAPONS)

#### Gun (Classe base de armas)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x001523bc` | - | `Gun::getEnemies()` | Obter inimigos |
| `0x001523c2` | - | `Gun::setEnemy(...)` | Definir inimigo |
| `0x00152422` | - | `Gun::isPlayerGun()` | Arma do jogador? |
| `0x00153754` | - | `Gun::update(int)` | Atualizar arma |
| `0x0015395c` | - | `Gun::render()` | Renderizar arma |
| `0x00152f90` | - | `Gun::calcChar(...)` | Calcular características |

#### BeamGun (Arma de feixe / laser)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00177754` | 224 | `BeamGun::BeamGun(int, Player*, ...)` | Construtor |
| `0x00177834` | 56 | `BeamGun::~BeamGun()` | Destrutor |
| `0x0017786c` | 16 | `BeamGun::~BeamGun()` | Destrutor (deleting) |
| `0x0017787c` | 40 | `BeamGun::render()` | Renderizar feixe |
| `0x001778a4` | 636 | `BeamGun::update(int)` | Atualizar feixe |
| `0x00177b20` | 6 | `BeamGun::setEnergy(...)` | Definir energia |
| `0x00177b26` | 6 | `BeamGun::setEnemy(...)` | Definir alvo |
| `0x00177b2c` | 2 | `BeamGun::transform(...)` | Transformar |
| `0x00177b2e` | 2 | `BeamGun::replaceGun(...)` | Substituir |

#### BombGun (Arma de bombas)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| Referenciado por vtable `0x0020de24` | - | `BombGun` | Classe de bombas |

#### RocketGun (Arma de mísseis)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0015f44c` | - | `RocketGun::seekTarget(...)` | Buscar alvo |
| Referenciado por vtable `0x0020e20c` | - | `RocketGun` | Classe de mísseis |

#### MineGun (Arma de minas)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| Referenciado por vtable `0x0020e000` | - | `MineGun` | Classe de minas |
| `0x001566bc` | - | `MineGun::render()` | Renderizar mina |
| `0x001566ec` | - | `MineGun::update(int)` | Atualizar mina |
| `0x001568c4` | - | `MineGun::transform(...)` | Transformar |
| `0x001568c8` | - | `MineGun::replace(...)` | Substituir |
| `0x001568cc` | - | `MineGun::isMine()` | É mina? |

#### ObjectGun (Arma de objetos - bombas/minas)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0015f700` | - | `ObjectGun::ObjectGun(int, ...)` | Construtor |
| `0x0015f904` | - | `ObjectGun::~ObjectGun()` | Destrutor |
| `0x0015f94c` | - | `ObjectGun::~ObjectGun()` | Destrutor (deleting) |
| `0x0015f964` | - | `ObjectGun::update(int)` | Atualizar |
| `0x0015fda8` | - | `ObjectGun::render()` | Renderizar |
| `0x00160358` | - | `ObjectGun::transform(...)` | Transformar |

#### SentryGun (Torreta automática)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0015c3d0` | - | `SentryGun::render()` | Renderizar |
| `0x0015c3d2` | - | `SentryGun::update(int)` | Atualizar |

#### SpriteGun (Arma baseada em sprites)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| Referenciado por vtable `0x0020e398` | - | `SpriteGun` | Arma sprite |
| `0x00169abc` | - | `SpriteGun::render()` | Renderizar |
| `0x00169abe` | - | `SpriteGun::update(int)` | Atualizar |
| `0x00169ac4` | - | `SpriteGun::setEnergy(...)` | Definir energia |
| `0x00169aca` | - | `SpriteGun::setEnemy(...)` | Definir alvo |

---

### 6.5 SHIP (Naves)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0017457c` | 140 | `Ship::Ship(int, int, int, int, int, int, int, int, float)` | Construtor |
| `0x001749a4` | 94 | `Ship::~Ship()` | Destrutor |
| `0x00174a12` | 4 | `Ship::setCurrentHP(...)` | Definir HP atual |
| `0x00174a16` | 4 | `Ship::getCurrentHP()` | Obter HP atual |
| `0x00174b40` | 4 | `Ship::getValue()` | Valor da nave |
| `0x00174b44` | 4 | `Ship::getRadius()` | Raio da nave |
| `0x00174b60` | 58 | `Ship::hasSecondaryWeapon(...)` | Tem arma secundária? |
| `0x00174b9a` | 12 | `Ship::hasBooster()` | Tem turbo? |
| `0x00174be8` | - | `Ship::hasCloak()` | Tem camuflagem? |
| `0x00174c38` | 4 | `Ship::getCargoSize()` | Tamanho do cargueiro |
| `0x00174c3c` | 4 | `Ship::getCompartments()` | Compartimentos |
| `0x00174fe8` | 24 | `Ship::addCargo(...)` | Adicionar carga |
| `0x00175072` | 42 | `Ship::setEquipment(...)` | Definir equipamento (sobrecarga 1) |
| `0x0017509c` | 48 | `Ship::setEquipment(...)` | Definir equipamento (sobrecarga 2) |
| `0x00175270` | 52 | `Ship::getCargoCapacity()` | Capacidade de carga |
| `0x001752a4` | 48 | `Ship::getEquipment(...)` | Obter equipamento |
| `0x001752d8` | 34 | `Ship::freeAllSlots()` | Liberar todos os slots |
| `0x001752fa` | - | `Ship::freeSlot(...)` | Liberar slot |
| `0x00175344` | - | `Ship::freeSlot(...)` | Liberar slot (sobrecarga) |
| `0x001753aa` | - | `Ship::getUsedSlots()` | Slots usados |

---

### 6.6 ITEM (Itens do inventário)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000e0124` | - | `Item::getTotalPrice()` | Preço total |
| `0x000e01a0` | - | `Item::getQuantity()` | Quantidade |

---

### 6.7 LEVEL (Níveis / Setores)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x000c40b0` | 6 | `Level::getPlayer()` | Obter jogador do nível |
| `0x000c40c8` | - | `Level::getAsteroids(...)` | Obter asteroides |
| `0x000c4428` | - | `Level::junkDied()` | Lixo destruído |
| `0x000c457c` | - | `Level::collideAsteroid(...)` | Colisão com asteroide |
| `0x000c4594` | - | `Level::collideJunk(...)` | Colisão com lixo |
| `0x000c6250` | - | `Level::checkObject(...)` | Checar objeto |
| `0x000c626a` | - | `Level::removeObject(...)` | Remover objeto |
| `0x000c627e` | - | `Level::checkGas(...)` | Checar gás |
| `0x000c651c` | - | `Level::enableFog(bool)` | Ativar/desativar neblina |
| `0x000bd68c` | - | `Level::enableFogSystem(...)` | Sistema de neblina |

---

### 6.8 STATION (Estações)

#### ModStation (Módulo de estação)
| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| vtable em `0x0020d9e4` | - | `ModStation` | Módulo de estação espacial |

---

### 6.9 HUD / UI

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x001603fc` | - | `Hud::Hud()` | Construtor do HUD |
| `0x001604e4` | - | `Hud::init()` | Inicializar HUD |
| `0x0016126c` | - | `Hud::~Hud()` | Destrutor |
| `0x00161358` | - | `Hud::Array(...)` | Array do HUD |
| `0x001613a8` | - | `Hud::closeHud(...)` | Fechar HUD |
| `0x001613d0` | - | `Hud::checkIfQuest(...)` | Checar quest |
| `0x00161440` | - | `Hud::releaseAssets(...)` | Liberar assets |
| `0x00161478` | - | `Hud::updateSector(...)` | Atualizar setor |
| `0x001615c8` | - | `Hud::initHudMenu(...)` | Iniciar menu do HUD |
| `0x001622ec` | - | `Hud::setCurrent(...)` | Definir atual |
| `0x001622f4` | - | `Hud::drawEvent(...)` | Desenhar evento |
| `0x00162488` | - | `Hud::addToEvent(...)` | Adicionar evento |
| `0x001624b8` | - | `Hud::setTime(...)` | Definir tempo |
| `0x001624dc` | - | `Hud::updateQueue(int)` | Atualizar fila |
| `0x00162550` | - | `Hud::clearQueue()` | Limpar fila |
| `0x00162760` | - | `Hud::sameHudEvent(...)` | Mesmo evento? |
| `0x00163200` | - | `Hud::sameHudEvent2(...)` | Mesmo evento (v2) |
| `0x0016323e` | 14 | `Hud::playerHit()` | Jogador atingido |
| `0x001636d8` | - | `Hud::cargoFull()` | Carga cheia |
| `0x001636eb` | - | `Hud::firePressed()` | Botão de tiro pressionado |
| `0x001637a4` | - | `Hud::drawPause(...)` | Desenhar pausa |
| `0x00163b90` | - | `Hud::drawEx(...)` | Desenhar elemento extra |
| `0x00166004` | - | `Hud::resetAnalog(...)` | Resetar analógico |
| `0x00166018` | - | `Hud::drawOrbit(...)` | Desenhar órbita |
| `0x00166278` | - | `Hud::drawMenu(int)` | Desenhar menu |
| `0x0016651c` | - | `Hud::enableFireButton(...)` | Ativar botão de tiro |
| `0x00166522` | - | `Hud::getAnalogX()` | Posição X do analógico |
| `0x0016654a` | - | `Hud::getAnalogY()` | Posição Y do analógico |
| `0x00166574` | - | `Hud::touchedEvent(...)` | Evento tocado |
| `0x001669fc` | - | `Hud::touchBegin(...)` | Toque iniciado |
| `0x00166ab8` | - | `Hud::touchMove(...)` | Toque movido |
| `0x00166b84` | - | `Hud::touchEnd(...)` | Toque finalizado |
| `0x00166c58` | - | `DialogueWindow::update(...)` | Atualizar diálogo |
| `0x001671b4` | - | `DialogueWindow::render()` | Renderizar diálogo |
| `0x001671d4` | - | `DialogueWindow::select(...)` | Selecionar opção |
| `0x001671f4` | - | `DialogueWindow::handleTouch(...)` | Processar toque |
| `0x00168008` | - | `DialogueWindow::isFinished()` | Terminou? |
| `0x0016801e` | - | `DialogueWindow::setFinished(...)` | Definir terminado |
| `0x00168044` | - | `DialogueWindow::getText()` | Obter texto |
| `0x001680b6` | - | `DialogueWindow::getOption(...)` | Obter opção |
| `0x001680c0` | - | `DialogueWindow::getReply(...)` | Obter resposta |
| `0x001680c4` | - | `DialogueWindow::setReply(...)` | Definir resposta |
| `0x001680e0` | - | `DialogueWindow::handleReply(...)` | Processar resposta |
| `0x00168598` | - | `TouchButton::update(...)` | Atualizar botão |

---

### 6.10 MGame (Game State Principal)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00177b30` | 216 | `MGame::MGame()` | Construtor |
| `0x00177c08` | 56 | `MGame::~MGame()` | Destrutor |
| `0x00177c40` | 16 | `MGame::~MGame()` | Destrutor (deleting) |
| `0x00177c50` | 2080 | **`MGame::OnInit(...)`** | **Inicialização do jogo** (~2 KB) |
| `0x00178470` | 676 | **`MGame::reset()`** | **Resetar estado do jogo** |
| `0x00178714` | 564 | `MGame::handleEvent(...)` | Processar evento |
| `0x00178948` | 18 | `MGame::maneuverDock(...)` | Manobra de docagem |
| `0x0017895c` | 88 | `MGame::maneuverJump(...)` | Manobra de salto |
| `0x001789b4` | 116 | `MGame::maneuverWarp(...)` | Manobra de warp |
| `0x00178a28` | 208 | `MGame::freeCamera(...)` | Câmera livre |
| `0x00178af8` | 568 | `MGame::freeCameraMode(...)` | Modo câmera livre |
| `0x00178d30` | 172 | `MGame::freeCameraTarget(...)` | Alvo câmera livre |
| `0x00178ddc` | 72 | `MGame::pauseScreen(...)` | Tela de pausa |
| `0x00178e24` | 64 | `MGame::resumeScreen(...)` | Retomar tela |
| `0x00178e64` | 2936 | `MGame::OnTouchBegan(...)` | Toque iniciado (~2,9 KB) |
| `0x001799dc` | 544 | `MGame::OnTouchMoved(...)` | Toque movido |
| `0x00179bfc` | 352 | `MGame::useCloak()` | Usar camuflagem |
| `0x00179d5c` | 596 | `MGame::UseKhaasDrive(...)` | Usar drive Khaas |
| `0x00179fa0` | 404 | `MGame::startCutscene(...)` | Iniciar cutscene |
| `0x0017a144` | 8080 | **`MGame::OnTouchEnded(...)`** | **Toque finalizado** (~7,9 KB! Função gigante) |
| `0x0017c0d4` | 896 | `MGame::startJump(...)` | Iniciar salto |
| `0x0017c454` | 148 | `MGame::setCinematic(...)` | Definir cinemática |
| `0x0017c4e8` | 316 | `MGame::switchScreen(...)` | Trocar tela |
| `0x0017c624` | 152 | `MGame::nextCamId(int)` | Próxima câmera |
| `0x0017c6bc` | 536 | `MGame::OnRelease()` | Liberar recursos |
| `0x0017c8d4` | 2 | `MGame::OnKeyPress(...)` | Tecla pressionada |
| `0x0017c8d8` | 11440 | **`MGame::OnUpdate()`** | **UPDATE PRINCIPAL DO JOGO** (11,2 KB! Maior update) |
| `0x0017f588` | 920 | `MGame::updateMission(...)` | Atualizar missão |
| `0x0017fe34` | 292 | `MGame::dialogueEvent(...)` | Evento de diálogo |
| `0x0017ff58` | 1468 | `MGame::successfulDock(...)` | Docagem bem-sucedida |
| `0x00180514` | 696 | `MGame::gameOver(...)` | Game Over |
| `0x001807cc` | 52 | `MGame::OnResume()` | Retomar |
| `0x00180800` | 192 | `MGame::OnSuspend()` | Suspender |
| `0x001808c0` | 1292 | `MGame::OnRenderOpaque()` | Render opaco |
| `0x00180d90` | - | `MGame::showLoadScreen(...)` | Mostrar tela de carga |
| `0x00180dcc` | 240 | `MGame::OnRenderTransparent()` | Render transparente |
| `0x00180ebc` | 2 | `MGame::pause()` | Pausar |
| `0x00180ec8` | 4 | `MGame::ShowLoadScreen(...)` | Tela de carregamento |
| `0x0017f920` | 1300 | `MGame::dockEvent(int, int)` | Evento de docagem |

---

### 6.11 GALAXY / STARMAP

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00175e08` | 76 | `Galaxy::Galaxy()` | Construtor |
| `0x00175e54` | 46 | `Galaxy::~Galaxy()` | Destrutor |
| `0x00175ef4` | - | `Galaxy::setView(...)` | Definir visão |
| `0x000c7d9c` | - | `StarMap::init(...)` | Iniciar mapa estelar |
| `0x000c9b50` | - | `StarMap::askForFuel(...)` | Pedir combustível |

---

### 6.12 MISSÕES E OBJETIVOS

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0015b64c` | - | `Mission::Mission(int, ...)` | Construtor de missão |
| `0x0015ba54` | - | `Mission::~Mission()` | Destrutor |
| `0x0015ba98` | - | `Mission::~Mission()` | Destrutor (deleting) |
| `0x0015b50a` | - | `Mission::setFailed(...)` | Definir falha |
| `0x0015bb40` | - | `Mission::isOutpost()` | É posto avançado? |
| `0x0015bb78` | - | `Mission::isInRange(...)` | Em alcance? |
| `0x0015bbb4` | - | `Mission::setTarget(...)` | Definir alvo |
| `0x000980c0` | - | `Objective::isComplete()` | Objetivo completo? |

---

### 6.13 AUDIO (FMOD)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0009326c` | - | `FModSound::IsPlaying(...)` | Está tocando? |
| `0x00093988` | - | `FModSound::getVolume(...)` | Obter volume |
| `0x00093a14` | - | `FModSound::getFrequency(...)` | Obter frequência |
| `0x00093ba4` | - | `FModSound::pause(...)` | Pausar som |
| `0x00093bbc` | - | `FModSound::pauseSound(...)` | Pausar som específico |
| `0x00093bfc` | - | `FModSound::pauseAll(...)` | Pausar todos |
| `0x00093bf0` | - | `FModSound::stopSound(...)` | Parar som |

---

### 6.14 SAVE/LOAD (Sistema de Save)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x00121144` | - | `FileRead::loadSave(...)` | Carregar save |

---

### 6.15 RADAR

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0012d484` | - | `Radar::Radar(Level*)` | Construtor |
| `0x0012de3c` | - | `Radar::~Radar()` | Destrutor |
| `0x0012e050` | - | `Radar::draw(...)` | Desenhar radar |
| `0x00130974` | - | `Radar::getPlayerPos()` | Posição do jogador |
| `0x00130998` | - | `Radar::drawCursor(...)` | Desenhar cursor |
| `0x0013102c` | - | `Radar::getLocalStation()` | Estação local |
| `0x00131036` | - | `Radar::getLocalPlanets()` | Planetas locais |
| `0x0013103a` | - | `Radar::stationBlip(...)` | Blip de estação |

---

### 6.16 GRAFICOS / GL

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0006dac0` | 2 | `glShadeModel` | Modelo de sombreamento |
| `0x0006dac2` | 2 | `glMatrixMode` | Modo de matriz |
| `0x0006dac4` | 2 | `glVertexPointer` | Ponteiro de vértices |
| `0x0006dac8` | 2 | `glLoadIdentity` | Carregar identidade |
| `0x0006daca` | 2 | `glScalef` | Escala |
| `0x0006dacc` | 2 | `glFogf` | Neblina (float) |
| `0x0006dace` | 2 | `glFogfv` | Neblina (vetor) |
| `0x0006dad0` | 2 | `glLoadMatrixf` | Carregar matriz |
| `0x0006dad2` | 2 | `glTexEnvi` | Textura env int |
| `0x0006dad4` | 2 | `glMultMatrixf` | Multiplicar matriz |
| `0x0006dad6` | 2 | `glTexCoordPointer` | Ponteiro de tex coords |
| `0x0006dad8` | 2 | `glNormalPointer` | Ponteiro de normais |
| `0x0006dada` | 2 | `glColorPointer` | Ponteiro de cores |
| `0x0006dadc` | 2 | `glTexEnvf` | Textura env float |
| `0x0006dade` | 2 | `glEnableClientState` | Ativar estado cliente |
| `0x0006dae0` | 2 | `glClientActiveTexture` | Textura cliente ativa |
| `0x0006dae2` | 2 | `glMaterialfv` | Material float vector |
| `0x0006dae4` | 2 | `glColor4f` | Cor RGBA float |
| `0x0006dae6` | 2 | `glLightfv` | Luz float vector |
| `0x0006dae8` | 2 | `glDisableClientState` | Desativar estado cliente |
| `0x0006daea` | 2 | `glLightModelfv` | Modelo de luz |
| `0x0006daec` | 2 | `glHint` | Hint de renderização |
| `0x0006daee` | 2 | `glMaterialf` | Material float |

---

### 6.17 VARIÁVEIS GLOBAIS IMPORTANTES

| Endereço | Tam | Nome | Descrição |
|----------|-----|------|-----------|
| **JNI/Android** | | | |
| `0x00216970` | 4 | `g_pActivity` | Ponteiro para Activity Java |
| `0x0021d314` | 4 | `g_pEnv` | Ponteiro JNIEnv |
| `0x0021d310` | 4 | `g_pClass` | Ponteiro para classe Java |
| `0x0021d318` | 4 | `g_pVM` | Ponteiro para JavaVM |
| `0x0021d2fc` | 4 | `g_android_back_button` | Estado do botão voltar |
| **IAP (In-App Purchase)** | | | |
| `0x002179b4` | 4 | `gi_iap_buy_credits_1` | Compra créditos pacote 1 |
| `0x002179b8` | 4 | `gi_iap_buy_credits_2` | Compra créditos pacote 2 |
| `0x002179bc` | 4 | `gi_iap_buy_credits_3` | Compra créditos pacote 3 |
| `0x002179c0` | 4 | `gi_iap_buy_credits_4` | Compra créditos pacote 4 |
| `0x002179c4` | 4 | `gi_iap_buy_credits_5` | Compra créditos pacote 5 |
| `0x002179c8` | 4 | `gi_iap_buy_dlc1_flag` | DLC 1 comprada |
| `0x002179cc` | 4 | `gi_iap_buy_dlc2_flag` | DLC 2 comprada |
| `0x002179d0` | 4 | `gi_iap_buy_dlc3_flag` | DLC 3 comprada |
| `0x002179d4` | 4 | `gi_iap_buy_dlc4_flag` | DLC 4 comprada |
| `0x002179d8` | 4 | `gi_iap_buy_dlc5_flag` | DLC 5 comprada |
| **Globals (classe estática)** | | | |
| `0x00217d00` | 1020 | `Globals::keys` | Estado das teclas (255 entradas) |
| `0x00217c3c` | 4 | `Globals::pause_x` | Posição X do botão pausa |
| `0x00217c40` | 4 | `Globals::pause_y` | Posição Y do botão pausa |
| `0x00217c48` | 4 | `Globals::boost_x` | Posição X do botão turbo |
| `0x00217c4c` | 4 | `Globals::boost_y` | Posição Y do botão turbo |
| `0x00217c6c` | 4 | `Globals::fire_x` | Posição X do botão tiro |
| `0x00217c70` | 4 | `Globals::fire_y` | Posição Y do botão tiro |
| `0x002181a0` | 4 | `Globals::bankZ` | Ângulo de inclinação |
| `0x00217cb4` | 4 | `Globals::top_edge` | Borda superior |
| `0x00217cac` | 4 | `Globals::left_edge` | Borda esquerda |
| **Input** | | | |
| `0x00214010` | 4224 | `keys` | Array de teclas (1056 entradas) |
| `0x00217980` | 4 | `stackX` | Stack de posição X |
| `0x00217984` | 4 | `stackY` | Stack de posição Y |
| `0x00217988` | 4 | `wheelStack` | Stack de scroll |
| **Criptografia** | | | |
| `0x0021d278` | 72 | `P` | Blowfish P-array |
| `0x0021c278` | 4096 | `S` | Blowfish S-boxes |
| `0x0021d2f4` | 4 | `SubkeyFile` | Arquivo de sub-chaves |
| **Sistema de Arquivos** | | | |
| `0x00217b2c` | 4 | `APKArchive` | Arquivo APK aberto |
| `0x00217b30` | 4 | `ZIPArchive` | Arquivo ZIP aberto |
| `0x002179a4` | 4 | `ndk_APK_Path` | Caminho do APK |
| `0x002179a8` | 4 | `ndk_ZIP_Path` | Caminho do ZIP |
| `0x002179ac` | 4 | `dataDirectory` | Diretório de dados |
| `0x002179b0` | 4 | `zipDirectory` | Diretório ZIP |
| `0x0021d2f8` | 4 | `flstat_rootPath` | Caminho raiz |
| **Android** | | | |
| `0x0021d2e0` | 12 | `g_android_current_time` | Tempo atual |
| `0x0021d300` | 4 | `g_android_gp_is_available` | Google Play disponível? |
| `0x0021d2c0` | 32 | `g_android_leaderboard_id` | ID do leaderboard |
| `0x0021d304` | 4 | `g_android_link_google` | Linkar Google |
| `0x0021d308` | 4 | `g_android_show_ads` | Mostrar anúncios |
| `0x0021d30c` | 4 | `g_android_show_leaderboard` | Mostrar leaderboard |
| `0x00217b54` | 4 | `gb_android_offerwall` | Offerwall |
| `0x0021d2f0` | 4 | `AccIndex` | Índice do acelerômetro |

---

### 6.18 CRIPTOGRAFIA (Blowfish)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x0006b2a0` | 52 | `opensubkeyfile(...)` | Abrir arquivo de sub-chaves |
| `0x0006b2d4` | 60 | `F(...)` | Função Feistel do Blowfish |
| `0x0006b310` | 80 | `Blowfish_encipher(...)` | Cifrar Blowfish |
| `0x0006b360` | 80 | `Blowfish_decipher(...)` | Decifrar Blowfish |
| `0x0006b3b0` | 416 | `InitializeBlowfish(...)` | Inicializar Blowfish |
| `0x0006b8ca` | 2 | `decrypt(...)` | Função de descriptografia |

---

### 6.19 MODMAINMENU (Menu Principal)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| `0x001757a0` | 36 | `ModMainMenu::ModMainMenu()` | Construtor |
| `0x001757c4` | 36 | `ModMainMenu::~ModMainMenu()` | Destrutor |
| `0x001757e8` | 16 | `ModMainMenu::~ModMainMenu()` | Destrutor (deleting) |
| `0x001757f8` | 52 | `ModMainMenu::render()` | Renderizar menu |
| `0x0017582c` | 24 | `ModMainMenu::updateMenu(...)` | Atualizar menu |
| `0x00175844` | 568 | `ModMainMenu::OnInit(...)` | Inicializar menu |
| `0x00175a7c` | 28 | `ModMainMenu::OnRelease()` | Liberar menu |
| `0x00175a98` | 28 | `ModMainMenu::OnSuspend()` | Suspender menu |
| `0x00175ab4` | 56 | `ModMainMenu::OnResume()` | Retomar menu |
| `0x00175aec` | 140 | `ModMainMenu::OnTouchBegan(...)` | Toque iniciado |
| `0x00175b78` | 136 | `ModMainMenu::OnTouchEnded(...)` | Toque finalizado |
| `0x00175c00` | 452 | `ModMainMenu::OnRender(...)` | Renderizar |
| `0x00175dc4` | 52 | `ModMainMenu::OnUpdate(...)` | Atualizar |

---

### 6.20 PARTÍCULAS (Sistema de Partículas)

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| **IParticleSystem** (interface) | | | |
| vtable `0x0020e54c` | - | `IParticleSystem` | Interface do sistema |
| `0x001819c0` | 280 | `IParticleSystem::init(...)` | Inicializar |
| `0x00181ad8` | - | `IParticleSystem::add(...)` | Adicionar partícula |
| `0x00181b14` | 4 | `IParticleSystem::isActive()` | Ativo? |
| `0x00181b18` | 6 | `IParticleSystem::setActive(...)` | Definir ativo |
| `0x00181b1e` | 20 | `IParticleSystem::reset()` | Resetar |
| `0x00181b34` | 92 | `IParticleSystem::update(int)` | Atualizar |
| `0x00181b90` | 140 | `IParticleSystem::render()` | Renderizar |
| `0x00181c1c` | 312 | `IParticleSystem::emit(...)` | Emitir partículas |
| `0x00181d54` | 66 | `IParticleSystem::setEmitRate(...)` | Taxa de emissão |
| `0x00181d96` | 14 | `IParticleSystem::setColor(...)` | Definir cor |
| `0x00181da4` | 26 | `IParticleSystem::setSize(...)` | Definir tamanho |
| `0x00181dbe` | 4 | `IParticleSystem::getCount()` | Contagem |
| `0x00181dc4` | 2368 | `IParticleSystem::updateParticles(...)` | Atualizar partículas |
| `0x00182704` | 140 | `IParticleSystem::spawn(...)` | Spawnar |
| `0x00182790` | 944 | `IParticleSystem::draw(...)` | Desenhar |
| `0x00182b40` | 10 | `IParticleSystem::release()` | Liberar |
| **ParticleSystem20** | | | |
| vtable `0x0020e578` | - | `ParticleSystem20` | Sistema de partículas v2.0 |
| **ParticleSystem18** | | | |
| vtable `0x0020e5a8` | - | `ParticleSystem18` | Sistema de partículas v1.8 |

---

### 6.21 OUTRAS CLASSES IMPORTANTES

| Endereço Real | Tam | Nome | Descrição |
|---------------|-----|------|-----------|
| **ModMainMenu** | vtable `0x0020e3dc` | Menu principal | |
| **MGame** | vtable `0x0020e4f0` | Game state principal | |
| **MTitle** | vtable `0x0020d7d0` | Tela de título | |
| **BoundingAAB** | vtable `0x0020d834` | AABB bounding box | |
| **BoundingSphere** | vtable `0x0020de68` | Bounding esférico | |
| **BoundingVolume** | vtable `0x0020dd8c` | Volume delimitador base | |
| **Mission** | vtable `0x0020e12c` | Sistema de missões | |
| **BluePrint** | `0x00176f20` | 188 | Construtor de BluePrint |
| **Agent** | `0x001773c4` | 242 | Construtor de Agent (NPCs de missão) |
| **Standing** | `0x0011d728` | - | Reputação do jogador |
| **Status** | `0x000a8fe8` | - | Status do jogador |
| **Achievements** | `0x00156f14` | - | Sistema de conquistas |
| **Radio** | `0x0015504c` | - | Sistema de rádio |
| **RadioMessage** | `0x0015166a` | - | Mensagens de rádio |
| **TargetFollow** | `0x0015b60e` | - | Seguir alvo |
| **Trail** | `0x0015bfac` | - | Rastro de naves |
| **Sparks** | `0x0015e468` | - | Faíscas/explosões |
| **Explosion** | Referenciado em arrays | - | Sistema de explosões |
| **Waypoint** | `0x00157d38` | - | Waypoints de navegação |
| **HackingGame** | `0x0014efc8` | - | Minigame de hacking |
| **CutScene** | `0x000980c0` | - | Sistema de cutscenes |
| **SpaceLounge** | `0x0016a850` | - | Lounge espacial |
| **ScrollTouch** | `0x00174128` | - | Touch scroll handler |
| **MeshMerger** | `0x001737a0` | - | Merge de meshes |
| **LodMeshMerge** | `0x00181200` | - | LOD mesh merge |
| **NewsTicker** | `0x0015e06c` | - | Ticker de notícias |
| **NewsItem** | `0x000e09e6` | - | Item de notícia |
| **Layout** | `0x000d3138` | - | Sistema de layout |
| **Sprite** | `0x000d0e64` | - | Sistema de sprites |
| **ChoiceWindow** | `0x00146046` | - | Janela de escolha |
| **HangarList** | `0x0011e5a8` | - | Lista do hangar |
| **ListItemWindow** | Referenciado | - | Janela de itens |
| **MenuTouchWindow** | `0x00125406` | - | Janela de toque do menu |
| **WantedWindow** | `0x000e0a44` | - | Janela de procurado |
| **StatusWindow** | `0x00158200` | - | Janela de status |
| **FileRead** | `0x00121144` | - | Leitor de arquivos |

---

## 7. VTABELAS E RTTI (Informações de Tipo em Runtime)

### VTables do Jogo

| Endereço VTable | Tamanho | Classe | Classe Pai |
|-----------------|---------|--------|------------|
| `0x0020d7d0` | 80 | `MTitle` | AbyssEngine Module |
| `0x0020d834` | 28 | `BoundingAAB` | BoundingVolume |
| `0x0020d85c` | 104 | `PlayerJumpgate` | Player |
| `0x0020d8d0` | 104 | `PlayerWormHole` | Player |
| `0x0020d944` | 104 | `KIPlayer` | Player |
| `0x0020d9e4` | 80 | `ModStation` | AbyssEngine Module |
| `0x0020db3c` | 104 | `PlayerFighter` | KIPlayer |
| `0x0020dbb0` | 104 | `PlayerStatic` | Player |
| `0x0020dc24` | 104 | `PlayerAsteroid` | Player |
| `0x0020dca4` | 104 | `PlayerStaticFar` | PlayerStatic |
| `0x0020dd18` | 104 | `PlayerCreature` | Player |
| `0x0020dd8c` | 28 | `BoundingVolume` | (base) |
| `0x0020ddb0` | 104 | `PlayerStation` | Player |
| `0x0020de24` | 56 | `BombGun` | Gun |
| `0x0020de68` | 28 | `BoundingSphere` | BoundingVolume |
| `0x0020de90` | 104 | `PlayerFixedObject` | Player |
| `0x0020e000` | 56 | `MineGun` | ObjectGun |
| `0x0020e044` | 104 | `PlayerTurret` | Player |
| `0x0020e12c` | 16 | `Mission` | (base) |
| `0x0020e144` | 56 | `SentryGun` | Gun |
| `0x0020e198` | 104 | `PlayerJunk` | Player |
| `0x0020e20c` | 56 | `RocketGun` | ObjectGun |
| `0x0020e250` | 56 | `ObjectGun` | AbstractGun |
| `0x0020e398` | 56 | `SpriteGun` | Gun |
| `0x0020e3dc` | 80 | `ModMainMenu` | AbyssEngine Module |
| `0x0020e438` | 104 | `PlayerGasCloud` | Player |
| `0x0020e4ac` | 56 | `BeamGun` | Gun |
| `0x0020e4f0` | 80 | `MGame` | AbyssEngine Module |
| `0x0020e54c` | 36 | `IParticleSystem` | (interface) |
| `0x0020e578` | 36 | `ParticleSystem20` | IParticleSystem |
| `0x0020e5a8` | 36 | `ParticleSystem18` | IParticleSystem |
| `0x0020cc24` | 36 | `AEPakFile` | FileInterface |
| `0x0020cc48` | 36 | `AENormalFile` | FileInterface |
| `0x0020dd80` | 28 | `BoundingVolume` | (base virtual) |

### RTTI (Runtime Type Information)

| Endereço Typeinfo | Classe |
|-------------------|--------|
| `0x0020d820` | `MTitle` |
| `0x0020d850` | `BoundingAAB` |
| `0x0020d8c4` | `PlayerJumpgate` |
| `0x0020d938` | `PlayerWormHole` |
| `0x0020d9ac` | `KIPlayer` |
| `0x0020db30` | `ModStation` |
| `0x0020dba4` | `PlayerFighter` |
| `0x0020dc18` | `PlayerStatic` |
| `0x0020dc8c` | `PlayerAsteroid` |
| `0x0020dd0c` | `PlayerStaticFar` |
| `0x0020dd80` | `PlayerCreature` |
| `0x0020dda8` | `BoundingVolume` |
| `0x0020de18` | `PlayerStation` |
| `0x0020de5c` | `BombGun` |
| `0x0020de84` | `BoundingSphere` |
| `0x0020e038` | `MineGun` |
| `0x0020e0ac` | `PlayerTurret` |
| `0x0020e13c` | `Mission` |
| `0x0020e17c` | `SentryGun` |
| `0x0020e200` | `PlayerJunk` |
| `0x0020e244` | `RocketGun` |
| `0x0020e288` | `ObjectGun` |
| `0x0020e294` | `AbstractGun` (WEAK) |
| `0x0020e3d0` | `SpriteGun` |
| `0x0020e42c` | `ModMainMenu` |
| `0x0020e4a0` | `PlayerGasCloud` |
| `0x0020e4e4` | `BeamGun` |
| `0x0020e540` | `MGame` |
| `0x0020e570` | `IParticleSystem` |
| `0x0020cc6c` | `AEPakFile` |
| `0x0020cc78` | `AENormalFile` |
| `0x0020cc84` | `AELowLevelFile` (WEAK) |

---

## 8. HIERARQUIA DE CLASSES (Herança)

```
Player (base)
├── KIPlayer (NPCs com IA)
│   └── PlayerFighter (Lutadores/Escoltas)
├── PlayerEgo (Jogador controlado)
├── PlayerStation (Estações espaciais)
├── PlayerStatic (Objetos estáticos)
│   └── PlayerStaticFar (Objetos distantes)
├── PlayerAsteroid (Asteroides)
├── PlayerJumpgate (Portais de salto)
├── PlayerWormHole (Buracos de minhoca)
├── PlayerCreature (Criaturas espaciais)
├── PlayerFixedObject (Objetos fixos: satélites, etc)
├── PlayerTurret (Torretas)
├── PlayerJunk (Lixo espacial)
└── PlayerGasCloud (Nuvens de gás)

Gun (base de armas)
├── BeamGun (Laser/Feixe)
├── SpriteGun (Arma de sprites)
├── ObjectGun (Arma de objetos)
│   ├── MineGun (Minas)
│   └── RocketGun (Mísseis)
└── SentryGun (Torreta automática)

BoundingVolume (base)
├── BoundingAAB (AABB)
└── BoundingSphere (Esfera)

FileInterface (base)
├── AENormalFile (Arquivo normal)
├── AELowLevelFile (Arquivo baixo nível)
└── AEPakFile (Arquivo PAK)

IParticleSystem (interface)
├── ParticleSystem20
└── ParticleSystem18

AbyssEngine (engine base)
├── MTitle (Tela de título)
├── ModMainMenu (Menu principal)
├── ModStation (Módulo de estação)
└── MGame (Estado de jogo principal)
```

---

## 9. ANÁLISE DAS FUNÇÕES MAIS GRANDES (Hotspots)

| Rank | Endereço | Tamanho | Função | Análise |
|------|----------|---------|--------|---------|
| 1 | `0x0017c8d8` | **11.440** | `MGame::OnUpdate()` | Loop principal do jogo |
| 2 | `0x0017a144` | **8.080** | `MGame::OnTouchEnded()` | Processamento de toque |
| 3 | `0x0009ce38` | **8.852** | `PlayerEgo::update(int)` | Atualização do jogador |
| 4 | `0x001541e0` | **2.768** | `PlayerFixedObject::updateAI()` | IA de objetos fixos |
| 5 | `0x0009fcb8` | **2.532** | `PlayerEgo::autoPilot()` | Piloto automático |
| 6 | `0x00177c50` | **2.080** | `MGame::OnInit()` | Inicialização do jogo |
| 7 | `0x000998cc` | **2.008** | `PlayerEgo::PlayerEgo()` | Construtor do jogador |
| 8 | `0x0019fcb8` | **1.928** | `simulateTouch(...)` | Simulação de toque |
| 9 | `0x00178e64` | **2.936** | `MGame::OnTouchBegan()` | Toque iniciado |
| 10 | `0x000dcfd8` | **10.376** | `PlayerFighter::fightLoop()` | Loop de combate IA |

---

## 10. FUNÇÕES JNI (Interface Java-Native)

Todas as funções JNI são do pacote `net.fishlabs`:

| Endereço | Tam | Nome | Descrição |
|----------|-----|------|-----------|
| `0x00069578` | 16 | `Java_net_fishlabs_GOF2Activity_nativeSetApkPath` | Definir caminho do APK |
| `0x0006b550` | 100 | `JNI_OnLoad` | Carregamento JNI |
| `0x0006b5b4` | 44 | `Java_..._nativeInit` | Inicialização nativa |
| `0x0006b5e0` | 116 | `Java_..._nativeRender` | Render nativo |
| `0x0006b654` | 116 | `Java_..._nativeTouch` | Processar toque |
| `0x0006b6d0` | 320 | `Java_..._nativeKey` | Processar tecla |
| `0x0006b810` | 56 | `Java_..._nativePause` | Pausar |
| `0x0006b848` | 8 | `Java_..._nativeResume` | Retomar |
| `0x0006b850` | 4 | `Java_..._nativeDestroy` | Destruir |
| `0x0006b854` | 4 | `Java_..._nativeBackPressed` | Botão voltar |
| `0x0006b858` | 4 | `Java_..._nativeSetCountryCode` | Definir código do país |
| `0x0006b85c` | 4 | `Java_..._nativeSetLanguage` | Definir idioma |
| `0x0006b860` | 4 | `Java_..._nativeSetRootDir` | Definir diretório raiz |
| `0x0006b864` | 2 | `Java_..._nativeSetDisplay` | Definir display |
| `0x0006b866` | 14 | `Java_..._nativeIapBought` | IAP comprada |
| `0x0006b87c` | 12 | `Java_..._nativeIapResult` | Resultado IAP |
| `0x0006b888` | 4 | `Java_..._nativeSetScreenSize` | Definir tamanho da tela |
| `0x0006b89c` | 8 | `Java_..._nativeDlcBought` | DLC comprada |
| `0x0006b8a4` | 8 | `Java_..._nativeDlcResult` | Resultado DLC |
| `0x0006b8ac` | 8 | `Java_..._nativeCreditsBought` | Créditos comprados |
| `0x0006b8b4` | 8 | `Java_..._nativeOfferwall` | Offerwall |
| `0x0006b8c4` | 6 | `Java_..._nativeFreeCredits` | Créditos gratuitos |
| `0x0006b940` | 100 | `Java_..._nativeSetNativeItems` | Definir itens nativos |
| `0x0006b9d4` | 4 | `Java_..._nativeLogoShown` | Logo mostrado |

---

## 11. RESUMO ESTATÍSTICO

- **Total de funções no .text**: ~1.255.240 bytes de código
- **Classes identificadas**: ~45+
- **VTables**: ~30+
- **Funções JNI**: ~30+
- **Funções GL wrapper**: ~22
- **Bibliotecas dependentes**: 10
- **Maior função**: `MGame::OnUpdate()` com 11.440 bytes
- **Engine**: AbyssEngine (Fishlabs proprietária)
- **Formato de save**: Via AEFile (sistema de arquivos customizado)
- **Criptografia**: Blowfish (para saves/dados)
- **Áudio**: FMOD (libfmodex.so + libfmodevent.so)
- **Renderização**: OpenGL ES 1.x + 2.0 (dual pipeline)
- **Compressão**: zlib integrado (inflate/defflate)
- **ZIP**: libzip integrado (leitura de assets)
- **SHA**: SHA-256 (verificação de integridade)

---

*Análise gerada automaticamente via readelf + c++filt em 2026-06-26*
