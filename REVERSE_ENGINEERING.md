# Galaxy on Fire 2 HD - Engenharia Reversa Completa

**Versão:** 2.0.16 (Android)
**Pacote:** `net.fishlabs.gof2hdallandroid2012`
**Desenvolvedor:** Fishlabs Entertainment
**APK analisado:** `original_unlocked_money.apk`

---

## 1. Estrutura do APK

### 1.1 Metadados

| Campo | Valor |
|-------|-------|
| Tamanho total | ~13.7 MB (155 arquivos) |
| classes.dex | 3.623.964 bytes |
| Lib nativa principal | libgof2hdaa.so (2.187.328 bytes) |
| Data de compilação | 2018-11-20 |

### 1.2 Estrutura de Diretórios

```
/
├── AndroidManifest.xml           (10.492 bytes)
├── classes.dex                   (3.623.964 bytes)
├── resources.arsc                (184.028 bytes)
├── META-INF/                     (assinatura)
├── assets/
│   ├── config.bin                (119.943 bytes) - configuração do jogo
│   ├── bin/items.bin             (27.628 bytes)  - banco de dados de itens
│   ├── data/bin/
│   │   ├── items.bin             (27.628 bytes)  - cópia do banco de itens
│   │   └── ships.bin             (2.304 bytes)   - banco de dados de naves
│   ├── d_data_gstore.dat         (8.585 bytes)   - dados Google Play
│   ├── feedInfo.dat              (1.002 bytes)   - informações de feeds
│   ├── support_classes.jar       (435.524 bytes) - classes de suporte
│   ├── crashlytics-build.properties
│   └── *.lang                    (11 idiomas)
│       ├── gb.lang (302.573)     - Inglês
│       ├── de.lang (317.403)     - Alemão
│       ├── fr.lang (347.237)     - Francês
│       ├── es.lang (321.683)     - Espanhol
│       ├── it.lang (321.532)     - Italiano
│       ├── ptl.lang (318.347)    - Português
│       ├── ru.lang (512.954)     - Russo
│       ├── pl.lang (331.301)     - Polonês
│       ├── ko.lang (359.666)     - Coreano
│       ├── ja.lang (400.020)     - Japonês
│       └── ar.lang (352.532)     - Árabe
├── lib/armeabi-v7a/
│   ├── libgof2hdaa.so            (2.187.328 bytes) - motor do jogo
│   ├── libfmodex.so              (920.204 bytes)   - FMOD Audio Engine
│   ├── libfmodevent.so           (370.660 bytes)   - FMOD Event System
│   └── libcrashlytics.so         (202.580 bytes)   - Crashlytics NDK
├── res/                          (layouts, drawables, etc.)
└── unknown/                      (propriedades Firebase/Play Services)
```

### 1.3 Arquivos de Assets - Detalhes

- **config.bin**: Configuração principal do jogo (119KB). Contém parâmetros globais, preços, probabilidades.
- **items.bin**: Banco de dados binário de todos os itens do jogo (27KB). Cada registro tem ~84 bytes com campos para ID, tipo, preço, atributos, etc.
- **ships.bin**: Banco de dados binário de naves (2.3KB). Contém ~26 naves com stats como HP, slots, cargo, velocidade.
- **support_classes.jar**: Classes Java de suporte usadas pelo motor nativo.
- **d_data_gstore.dat**: Dados de DLC/produtos da Google Play Store.
- ***.lang**: Arquivos de localização contendo textos do jogo em cada idioma.

---

## 2. AndroidManifest.xml

### 2.1 Permissões

| Permissão | Uso |
|-----------|-----|
| `WRITE_EXTERNAL_STORAGE` | Salvar dados do jogo |
| `MODIFY_AUDIO_SETTINGS` | Controle de volume FMOD |
| `INTERNET` | IAP, Google Play Games, analytics |
| `ACCESS_NETWORK_STATE` | Verificar conectividade |
| `ACCESS_WIFI_STATE` | Verificar WiFi |
| `WAKE_LOCK` | Manter tela ligada durante jogo |
| `com.android.vending.BILLING` | Compras in-app (Google Play Billing) |
| `com.android.vending.CHECK_LICENSE` | Verificação de licença LVL |
| `com.google.android.c2dm.permission.RECEIVE` | Firebase Cloud Messaging |

### 2.2 Activities

| Activity | Função |
|----------|--------|
| `DownloaderActivity` | **LAUNCHER** - Tela inicial, download de OBB, verificação de recursos |
| `GOF2HD2012` | Activity principal do jogo (OpenGL ES 2.0) |
| `ProxyBillingActivity` | Activity de proxy para billing (Google) |
| `GoogleApiActivity` | Google Play Services |

### 2.3 Services & Receivers

| Componente | Função |
|------------|--------|
| `FishlabsDownloaderService` | Serviço de download de expansion files (OBB) |
| `AlarmReceiver` | Receiver para alarmes (notificações) |
| `CrashlyticsInitProvider` | Inicialização do Crashlytics |
| `FirebaseInitProvider` | Inicialização do Firebase |
| `ComponentDiscoveryService` | Descoberta de componentes Firebase |
| `AppMeasurementService` | Google Analytics |

### 2.4 Fluxo de Inicialização

```
1. DownloaderActivity (LAUNCHER)
   ├── Verifica OBB files
   ├── FMODCopyTask - extrai bibliotecas FMOD
   ├── Inicia FishlabsDownloaderService se necessário
   └── Lança Intent para GOF2HD2012 com paths:
       - INTENT_EXTERNAL_FILES_DIR
       - INTENT_EXTERNAL_OBB_DIR
       - INTENT_EXTERNAL_MAIN_OBB_FILE_NAME

2. GOF2HD2012.onCreate()
   ├── Inicializa Fabric/Crashlytics
   ├── Carrega LocalizationService
   ├── Configura KeyguardManager
   ├── Configura GLView (OpenGL ES 2.0)
   ├── Configura TouchHandler
   ├── Carrega bibliotecas nativas: fmodex → fmodevent → gof2hdaa
   ├── Chama ToJNI.SetDirectories()
   ├── Chama ToJNI.setAPKPath()
   ├── Chama ToJNI.setCountryCodeOfDevice()
   ├── Cria GooglePlayIAP (se _USE_GOOGLEPLAY=true)
   └── Verifica login Google Play Games
```

---

## 3. Análise Smali - Classes do Pacote net.fishlabs

### 3.1 Classes Principais (net.fishlabs.gof2hdallandroid2012)

| Classe | Função |
|--------|--------|
| `GOF2HD2012` | Activity principal do jogo |
| `DownloaderActivity` | Launcher, download OBB |
| `NativeFunctionCalls` | Bridge JNI → Java para callbacks do jogo |
| `ToJNI` | Bridge Java → JNI para chamar funções nativas |
| `GLView` | SurfaceView OpenGL |
| `GLViewRenderer` | Renderer OpenGL ES 2.0 |
| `TouchHandler` | Processamento de eventos touch |
| `AccelerometerManager` | Gerenciamento do acelerômetro |
| `LocalizationService` | Serviço de localização/i18n |
| `ConfigChooser` | Seleção de configuração EGL |
| `ContextFactory` | Factory de contexto EGL |
| `MultisampleConfigChooser` | Configuração multisample EGL |
| `Messenger` / `MessengerSwitcher` | Sistema de mensagens in-game |
| `FMODExtractionHandler` | Extração de bibliotecas FMOD |
| `FishlabsDownloaderService` | Download de expansion files |
| `AlarmReceiver` | Recebimento de alarmes |
| `Gof2AchievementIDs` | IDs de conquistas Google Play |
| `BuildConfig` | Configuração de build |
| `R$*` | Recursos Android |

### 3.2 Classes Google Play (net.fishlabs.googleplay)

| Classe | Função |
|--------|--------|
| `GooglePlayIAP` | Sistema completo de IAP (In-App Purchase) |
| `BillingManager` | Gerenciamento do Google Play Billing Client |
| `Security` | Verificação de assinatura RSA de compras |
| `ToJNI` | Bridge JNI para funções IAP nativas |
| `GameHelper` | Helper para Google Play Games Services |
| `BaseGameActivity` | Activity base com Google Play Games |
| `BaseGameUtils` | Utilitários Google Play Games |
| `GameHelperUtils` | Utilitários do GameHelper |

### 3.3 Classe: `net.fishlabs.ow_utils.DeviceInfo`

Utilitário para informações do dispositivo (display, resolução, se é tablet).

---

## 4. Análise Detalhada das Classes Smali

### 4.1 ToJNI.smali (gof2hdallandroid2012) - Métodos Nativos

Esta classe é a **ponte principal** entre Java e o motor nativo C++. Todos os métodos são `static synchronized native`.

#### Constantes de Mensagens (Message Codes)

| Constante | Valor | Descrição |
|-----------|-------|-----------|
| `MESSAGE_CHECK_CONNECTION` | 10 (0x0A) | Verificar conexão |
| `MESSAGE_EXIT_APP` | 20 (0x14) | Sair do app |
| `MESSAGE_FREE_CREDITS_WATCH_VIDEO` | 41 (0x29) | Créditos grátis - assistir vídeo |
| `MESSAGE_FREE_CREDITS_LIKE_GOF2` | 42 (0x2A) | Créditos grátis - curtir GOF2 |
| `MESSAGE_FREE_CREDITS_LIKE_FISHLABS` | 43 (0x2B) | Créditos grátis - curtir Fishlabs |
| `MESSAGE_FREE_CREDITS_SUBSCRIBE_YOUTUBE` | 44 (0x2C) | Créditos grátis - inscrever no YouTube |
| `MESSAGE_FREE_CREDITS_FOLLOW_TWITTER` | 45 (0x2D) | Créditos grátis - seguir no Twitter |
| `MESSAGE_FREE_CREDITS_RATE_GAME` | 46 (0x2E) | Créditos grátis - avaliar jogo |
| `MESSAGE_RATE_GAME` | 48 (0x30) | Avaliar jogo |
| `MESSAGE_SHOW_MORE_GAMES` | 47 (0x2F) | Mostrar mais jogos |
| `MESSAGE_SHOW_TERMS_OF_SERVICE` | 49 (0x31) | Termos de serviço |
| `MESSAGE_SHOW_PRIVACY_POLICY` | 50 (0x32) | Política de privacidade |
| `MESSAGE_SET_BRIGHTNESS` | 30 (0x1E) | Ajustar brilho |

#### Métodos Nativos

| Método | Assinatura | Função |
|--------|------------|--------|
| `BackButtonPressed()` | `()V` | Notifica botão voltar pressionado |
| `SetDirectories(String, String)` | `(Ljava/lang/String;Ljava/lang/String;)V` | Define diretórios de dados |
| `correctBoughtDLC1-5(int)` | `(I)V` | Corrige status DLC 1-5 comprada |
| `getDLC1BOUGHT() - getDLC5BOUGHT()` | `()I` | Retorna se DLC foi comprada |
| `getExitFlag()` | `()I` | Flag de saída do jogo |
| `getLogoShown()` | `()I` | Se logo foi exibido |
| `getScreenshotFlag()` | `()I` | Flag de screenshot |
| `handleAccelerometer(float, float, float)` | `(FFF)V` | Dados do acelerômetro |
| `handleTouchEvent(int, int, int, int)` | `(IIII)V` | Evento touch (tipo, x, y, pointer) |
| `initialize(int, int)` | `(II)V` | Inicialização do motor (largura, altura) |
| `isInMainMenu()` | `()I` | Se está no menu principal |
| `renderstep(long)` | `(J)V` | Passo de renderização |
| `resetScreenshotFlag()` | `()V` | Reset flag screenshot |
| `resize(int, int)` | `(II)V` | Redimensionar viewport |
| `sendPauseSignalToGame()` | `()V` | Sinal de pausa |
| `sendResumeSignalToGame()` | `()V` | Sinal de resume |
| `setAPKPath(String)` | `(Ljava/lang/String;)V` | Caminho do APK |
| `setCountryCodeOfDevice(int)` | `(I)V` | Código do país |
| `setEnvironmentVariables(Context)` | `(Landroid/content/Context;)V` | Variáveis de ambiente |
| `setZIPPath(String)` | `(Ljava/lang/String;)V` | Caminho do OBB/ZIP |
| `testPurchase(int)` | `(I)V` | **TESTE: Simula compra IAP** |

### 4.2 NativeFunctionCalls.smali - Callbacks do Jogo

Esta classe recebe chamadas do motor nativo e as roteia para a Activity Java via Handler/Messages.

#### Funções de Créditos Grátis

| Método | Message Code | Ação |
|--------|--------------|------|
| `free_credits_watchVideo()` | 0x29 | Assistir vídeo para ganhar créditos |
| `free_credits_likeGOF2OnFacebook()` | 0x2A | Curtir GOF2 no Facebook |
| `free_credits_likeFishlabsOnFacebook()` | 0x2B | Curtir Fishlabs no Facebook |
| `free_credits_subscribeToYoutubeChannel()` | 0x2C | Inscrever no YouTube |
| `free_credits_followOnTwitter()` | 0x2D | Seguir no Twitter |
| `free_credits_rateGame()` | 0x2E | Avaliar jogo |
| `free_credits_open_offerwall()` | — | **Stub vazio** (desativado) |

#### Funções IAP (Compras)

| Método | Ação |
|--------|------|
| `iap_buy_credits_100_000()` | Comprar 100.000 créditos |
| `iap_buy_credits_300_000()` | Comprar 300.000 créditos |
| `iap_buy_credits_1_000_000()` | Comprar 1.000.000 créditos |
| `iap_buy_credits_3_000_000()` | Comprar 3.000.000 créditos |
| `iap_buy_credits_10_000_000()` | Comprar 10.000.000 créditos |
| `iap_buy_dlc_valkyrie()` | Comprar DLC Valkyrie |
| `iap_buy_dlc_kaamo_club()` | Comprar DLC Kaamo Club |
| `iap_buy_dlc_supernova()` | Comprar DLC Supernova |
| `iap_buy_dlc_vip()` | Comprar pacote VIP |
| `iap_buy_dlc_full_package()` | Comprar pacote completo |
| `iap_restore_purchases()` | Restaurar compras |

#### Funções de UI

| Método | Ação |
|--------|------|
| `rateGame()` | Avaliar jogo |
| `showMoreGames()` | Mostrar mais jogos |
| `openTermsOfService()` | Abrir termos de serviço |
| `openPrivacyPolicy()` | Abrir política de privacidade |

### 4.3 GooglePlayIAP.smali - Sistema IAP

#### Campos Estáticos - Status DLC

```smali
.field private static DLC_1_BOUGHT:Z = true  // Valkyrie
.field private static DLC_2_BOUGHT:Z = true  // Kaamo Club
.field private static DLC_3_BOUGHT:Z = true  // Supernova
.field private static DLC_4_BOUGHT:Z = true  // VIP
.field private static DLC_5_BOUGHT:Z = true  // Full Package
```

**NOTA IMPORTANTE:** Neste APK, TODAS as DLCs estão inicializadas como `true` (compradas). Os getters `getDLC_1_BOUGHT()` a `getDLC_5_BOUGHT()` ignoram o valor do campo e retornam `const/4 v0, 0x1` (true) diretamente.

#### Pacotes de Créditos (Consumíveis)

| Índice | SKU Index | Quantidade |
|--------|-----------|------------|
| 0 | consumable[0] | 100.000 créditos |
| 1 | consumable[1] | 300.000 créditos |
| 2 | consumable[2] | 1.000.000 créditos |
| 3 | consumable[3] | 3.000.000 créditos |
| 4 | consumable[4] | 10.000.000 créditos |

#### DLCs Premium (Não-Consumíveis)

| Índice | SKU Index | DLC |
|--------|-----------|-----|
| 0 | premium[0] | Valkyrie |
| 1 | premium[1] | Kaamo Club |
| 2 | premium[2] | Supernova |
| 3 | premium[3] | VIP Package |
| 4 | premium[4] | Full Package |

#### Fluxo de Compra

```
1. Jogo (nativo) chama NativeFunctionCalls.iap_buy_*()
2. NativeFunctionCalls chama GooglePlayIAP.iap_buy_*()
3. GooglePlayIAP obtém SKU via ToJNI.gof2hd2012getConsumableSKU/getPremiumSKU()
4. BillingManager.initiatePurchaseFlow(sku, "inapp")
5. Google Play exibe UI de compra
6. BillingManager.onPurchasesUpdated() recebe resultado
7. handlePurchase() verifica assinatura (Security.verifyPurchase)
8. GooglePlayIAP.onPurchasesUpdated() processa:
   - Premium: chama ToJNI.iapBoughtPremium(skuIndex, 1)
   - Consumível: BillingManager.consumeAsync() → ToJNI.iapBoughtConsumable(skuIndex)
```

### 4.4 Security.smali - Verificação de Compras

```smali
.method public static verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    const/4 v0, 0x1
    return v0    // ← SEMPRE RETORNA TRUE!
.end method
```

**A verificação de assinatura está COMPLETAMENTE DESABILITADA.** O método `verifyPurchase` ignora todos os parâmetros (chave pública, dados da compra, assinatura) e retorna `true` imediatamente.

O método `verify(PublicKey, String, String)` da mesma classe contém a implementação real de verificação RSA (SHA1withRSA), mas **nunca é chamado** porque `verifyPurchase` é o ponto de entrada e ele bypassa tudo.

### 4.5 GOF2HD2012.smali - Activity Principal

#### Campos Estáticos Importantes

| Campo | Tipo | Valor Default | Função |
|-------|------|---------------|--------|
| `_USE_GOOGLEPLAY` | boolean | true | Habilita Google Play Services |
| `_surface_created` | boolean | false | Surface OpenGL criada |
| `audio` | AudioManager | null | Gerenciador de áudio |
| `currentVolume` | int | 0 | Volume atual |
| `gpiap` | GooglePlayIAP | null | Instância IAP |
| `mGLView` | GLView | null | View OpenGL |
| `touchHandler` | TouchHandler | null | Handler de touch |

#### Métodos Nativos (Google Play Games)

| Método | Função |
|--------|--------|
| `GetAchievementId(int)` | ID de conquista |
| `GetLeaderboardScore(int)` | Score do leaderboard |
| `GetLinkGameGP()` | Flag de vinculação GP |
| `GetShowAchievements()` | Mostrar conquistas |
| `GetShowLeaderboards()` | Mostrar leaderboards |
| `ReleaseOrigamiSuperClub(String)` | Liberar identificador |
| `ResetAchievements()` | Reset conquistas |
| `ResetLeaderboardScore(int)` | Reset score |
| `ResetLinkGameGP()` | Reset vinculação |
| `ResetShowAchievements()` | Reset flag conquistas |
| `ResetShowLeaderboards()` | Reset flag leaderboards |
| `SetGPIsLinked(int)` | Definir status vinculação |
| `SetOrigamiSuperClub(String)` | Definir identificador único |

#### Ciclo de Vida

```
onCreate():
  1. Carrega libs nativas (fmodex, fmodevent, gof2hdaa)
  2. Inicializa Fabric/Crashlytics
  3. Configura tela fullscreen (sensorLandscape)
  4. Cria GLView com resolução fixada (máx 2048px width)
  5. Configura TouchHandler com escala
  6. Define diretórios (SetDirectories)
  7. Define APK path (setAPKPath)
  8. Define país (setCountryCodeOfDevice)
  9. Cria GooglePlayIAP
  10. Verifica login Google Play Games
  11. Define android_id como "OrigamiSuperClub"

onPause():
  1. Salva volume
  2. Mute áudio
  3. Para acelerômetro
  4. Envia sinal de pausa ao motor

onResume():
  1. Restaura volume
  2. Inicia acelerômetro
  3. Envia sinal de resume ao motor

onDestroy():
  1. Libera "OrigamiSuperClub"
  2. Para acelerômetro
  3. Destrói GooglePlayIAP
  4. Mata processo
```

### 4.6 BillingManager.smali - Fluxo de Billing

#### Campo Crítico

```smali
.field private static BASE_64_ENCODED_PUBLIC_KEY:Ljava/lang/String; = "CONSTRUCT_YOUR_KEY_AND_PLACE_IT_HERE"
```

A chave pública RSA é definida como placeholder, mas o `verifyValidSignature` chama `Security.verifyPurchase()` que sempre retorna true.

#### Métodos Principais

| Método | Função |
|--------|--------|
| `initiatePurchaseFlow(sku, type)` | Inicia fluxo de compra |
| `queryPurchases()` | Consulta compras existentes |
| `consumeAsync(token)` | Consome item consumível |
| `handlePurchase(Purchase)` | Processa compra verificada |
| `verifyValidSignature(json, sig)` | Verifica assinatura (bypassed) |
| `startServiceConnection(Runnable)` | Conecta ao serviço de billing |

---

## 5. Biblioteca Nativa - libgof2hdaa.so

### 5.1 Informações Gerais

| Propriedade | Valor |
|-------------|-------|
| Arquitetura | ARM (armeabi-v7a) |
| Tamanho | 2.187.328 bytes (~2.1 MB) |
| Total de símbolos exportados | ~5.574 |
| Compilador | GCC (C++ com STL) |

### 5.2 Bibliotecas Companheiras

| Biblioteca | Tamanho | Função |
|------------|---------|--------|
| `libfmodex.so` | 920 KB | FMOD Ex - motor de áudio |
| `libfmodevent.so` | 370 KB | FMOD Event System |
| `libcrashlytics.so` | 202 KB | Crashlytics NDK |

### 5.3 Símbolos JNI Exportados

#### Mapeamento JNI (Java → Nativo)

Classe `net.fishlabs.gof2hdallandroid2012.ToJNI`:

| Símbolo JNI | Método Java |
|-------------|-------------|
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_BackButtonPressed` | BackButtonPressed() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_SetDirectories` | SetDirectories(String, String) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_correctBoughtDLC1-5` | correctBoughtDLC1-5(int) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_getDLC1-5BOUGHT` | getDLC1-5BOUGHT() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_getExitFlag` | getExitFlag() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_getLogoShown` | getLogoShown() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_getScreenshotFlag` | getScreenshotFlag() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_handleAccelerometer` | handleAccelerometer(FFF) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_handleTouchEvent` | handleTouchEvent(IIII) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_initialize` | initialize(II) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_isInMainMenu` | isInMainMenu() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_renderstep` | renderstep(J) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_resetScreenshotFlag` | resetScreenshotFlag() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_resize` | resize(II) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_sendPauseSignalToGame` | sendPauseSignalToGame() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_sendResumeSignalToGame` | sendResumeSignalToGame() |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_setAPKPath` | setAPKPath(String) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_setCountryCodeOfDevice` | setCountryCodeOfDevice(int) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_setEnvironmentVariables` | setEnvironmentVariables(Context) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_setZIPPath` | setZIPPath(String) |
| `Java_net_fishlabs_gof2hdallandroid2012_ToJNI_testPurchase` | testPurchase(int) |

Classe `net.fishlabs.gof2hdallandroid2012.GOF2HD2012`:

| Símbolo JNI | Método Java |
|-------------|-------------|
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_GetAchievementId` | GetAchievementId(int) |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_GetLeaderboardScore` | GetLeaderboardScore(int) |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_GetLinkGameGP` | GetLinkGameGP() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_GetShowAchievements` | GetShowAchievements() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_GetShowLeaderboards` | GetShowLeaderboards() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_ReleaseOrigamiSuperClub` | ReleaseOrigamiSuperClub(String) |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_ResetAchievements` | ResetAchievements() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_ResetLeaderboardScore` | ResetLeaderboardScore(int) |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_ResetLinkGameGP` | ResetLinkGameGP() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_ResetShowAchievements` | ResetShowAchievements() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_ResetShowLeaderboards` | ResetShowLeaderboards() |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_SetGPIsLinked` | SetGPIsLinked(int) |
| `Java_net_fishlabs_gof2hdallandroid2012_GOF2HD2012_SetOrigamiSuperClub` | SetOrigamiSuperClub(String) |

Classe `net.fishlabs.googleplay.ToJNI`:

| Símbolo JNI | Método Java |
|-------------|-------------|
| `Java_net_fishlabs_googleplay_ToJNI_gof2hd2012apk` | gof2hd2012apk() → String |
| `Java_net_fishlabs_googleplay_ToJNI_gof2hd2012getConsumableSKU` | gof2hd2012getConsumableSKU(int) → String |
| `Java_net_fishlabs_googleplay_ToJNI_gof2hd2012getPremiumSKU` | gof2hd2012getPremiumSKU(int) → String |
| `Java_net_fishlabs_googleplay_ToJNI_gof2hd2012setPremiumContent` | gof2hd2012setPremiumContent(int) |
| `Java_net_fishlabs_googleplay_ToJNI_iapBoughtConsumable` | iapBoughtConsumable(int) |
| `Java_net_fishlabs_googleplay_ToJNI_iapBoughtPremium` | iapBoughtPremium(int, int) |
| `Java_net_fishlabs_googleplay_ToJNI_iapResetNativeItemInformationList` | iapResetNativeItemInformationList() |
| `Java_net_fishlabs_googleplay_ToJNI_iapSetNativeItemInformationList` | iapSetNativeItemInformationList(String[], String[], String[], String[], String[]) |

### 5.4 Classes C++ do Motor do Jogo

#### Motor e Engine

| Classe | Função |
|--------|--------|
| `AbyssEngine` | Motor principal do jogo |
| `NFC` (NativeFunctionCalls) | Callbacks nativos → Java |
| `Globals` | Variáveis globais do jogo |
| `Level` | Sistema de níveis/espaço |
| `LevelScript` | Scripts de missões |

#### Entidades do Jogo

| Classe | Função |
|--------|--------|
| `Ship` | Nave (stats, equipamento, cargo) |
| `Item` | Item (armas, equipamentos, commodities) |
| `Station` | Estação espacial |
| `Gun` | Arma base |
| `BeamGun` | Arma de feixe (laser) |
| `BombGun` | Lança-bombas |
| `RocketGun` | Lança-mísseis |
| `MineGun` | Lança-minas |
| `ObjectGun` | Arma de objetos |
| `SentryGun` | Arma sentinela |
| `SpriteGun` | Arma sprite |
| `PlayerFighter` | Jogador em combate |
| `PlayerStation` | Jogador em estação |
| `PlayerStatic` / `PlayerStaticFar` | Objetos estáticos |
| `PlayerCreature` | Criaturas (aliens) |
| `PlayerAsteroid` | Asteroides |
| `PlayerGasCloud` | Nuvens de gás |
| `PlayerTurret` | Torres de defesa |
| `PlayerFixed` | Objetos fixos |
| `PlayerJunk` | Destroços |
| `ListItem` | Item de lista (UI) |
| `ModStation` | Estação de modificação |
| `Hud` | Interface do jogador |
| `Radar` | Minimapa |
| `NewsItem` | Item de notícia |
| `Status` | Status do jogador |
| `Wanted` | Sistema de procurado |

#### Funções Importantes da Classe Ship

| Método | Função |
|--------|--------|
| `Ship(int, int, int, int, int, int, int, int, float)` | Construtor com stats |
| `getRace()` | Raça da nave |
| `getBaseHP()` | HP base |
| `getMaxHP()` | HP máximo |
| `getCargo()` | Carga atual |
| `getSlots(int)` | Slots por tipo |
| `getUsedSlots(int)` | Slots usados |
| `getValue()` | Valor da nave |
| `getFire()` / `getDamage()` | Stats de dano |
| `getHandling()` | Manobrabilidade |
| `getCurrentShip()` / `setCurrentShip()` | Nave atual |
| `addMod(int)` | Adicionar modificação |
| `getMods()` / `setMods(...)` | Gerenciar modificações |
| `hasMod(...)` | Verificar modificação |
| `hasCloak()` | Tem camuflagem |
| `hasBoost()` | Tem boost |
| `addEquip(...)` / `setEquip(...)` | Equipar itens |
| `removeEquip(...)` | Remover equipamento |
| `refreshStats()` | Recalcular stats (924 bytes de lógica!) |
| `priceDiscount()` | Desconto no preço |
| `freeSlot(...)` | Liberar slot |
| `addCargo(...)` / `setCargo(...)` | Gerenciar carga |
| `replaceEquip(...)` | Substituir equipamento |
| `changeEquip(...)` | Trocar equipamento |

#### Funções Importantes da Classe Item

| Método | Função |
|--------|--------|
| `init()` | Inicializar item |
| `getPrice()` / `setPrice(int)` | Preço |
| `getMinPrice()` / `setMaxPrice(int)` / `setMinPrice(int)` | Limites de preço |
| `getAttribute()` | Atributo |
| `getQuality()` | Qualidade |
| `getBlueprint()` / `setBlueprint()` | Blueprint |
| `getMission()` / `setMission()` | Item de missão |
| `getAmount()` / `setAmount(int)` | Quantidade |
| `getTotalPrice()` | Preço total |
| `combine(...)` / `combineItems(...)` | Combinar itens |
| `extract(...)` | Extrair |
| `mixItems(...)` | Misturar itens |
| `fabricate(...)` | Fabricar |
| `transaction(...)` / `transact(...)` | Transação |
| `checkCargo(...)` | Verificar carga |
| `canBeInstalled()` | Pode ser instalado |
| `isInList(...)` | Está na lista |
| `isUnsafe()` | É inseguro |
| `adjustPrice(...)` | Ajustar preço |
| `clone()` / `equals(Item)` | Clone/igualdade |

#### Funções da Classe Station

| Método | Função |
|--------|--------|
| `Station(enum)` / `Station()` | Construtores |
| `getName()` | Nome da estação |
| `visit()` | Visitar estação |
| `addItem(Item)` / `addShip(Ship)` | Adicionar item/nave |
| `removeItem(...)` / `removeShip(...)` | Remover |
| `setItem(...)` / `setShip(...)` | Definir |
| `hasItem(int)` | Verificar item |
| `isDocked()` | Está acoplado |
| `setDocked(...)` | Definir acoplamento |
| `clone()` / `equals(Station)` | Clone/igualdade |

#### Funções da Classe Level

| Método | Função |
|--------|--------|
| `Level(int)` | Construtor |
| `create*()` (muitas variantes) | Criar entidades no nível |
| `update*()` | Atualizar entidades |
| `render*()` | Renderizar |
| `collide*()` / `collision*()` | Detecção de colisão |
| `assign*()` | Atribuir missões |
| `connect*()` | Conectar sistemas |
| `switch*()` | Trocar contexto |
| `reset()` | Resetar nível |
| `enableFog(bool)` | Habilitar névoa |
| `enemyDied()` | Inimigo morreu |
| `junkDied()` | Destroço destruído |
| `pirate*()` | Sistema pirata |
| `asteroid*()` | Sistema de asteroides |
| `uncov*()` | Descobrir |
| `flash*()` | Efeito de flash |
| `check*()` | Verificações |

#### Funções da Classe Hud

| Método | Função |
|--------|--------|
| `init()` / `closeHud()` | Inicializar/fechar HUD |
| `initHud(...)` | Inicializar com parâmetros |
| `drawEx(...)` | Desenhar HUD expandido |
| `drawMenu(int)` | Desenhar menu |
| `drawCredits(...)` | Desenhar créditos |
| `drawEvent(...)` / `drawEvents()` | Desenhar eventos |
| `drawPause(...)` | Desenhar pausa |
| `drawCharge(...)` | Desenhar carga |
| `drawBig(...)` | Desenhar tela grande |
| `drawTitle(...)` | Desenhar título |
| `drawOrbit(...)` | Desenhar órbita |
| `firePressed()` | Botão de tiro pressionado |
| `cargoFull()` | Carga cheia |
| `isHacking()` | Está hackeando |
| `updateQueue(...)` | Atualizar fila |
| `addToEvent(...)` | Adicionar evento |
| `setTime(...)` | Definir tempo |
| `sameHud(...)` | Verificar HUD |
| `touchBegin(...)` / `touchEnd(...)` / `touchMove(...)` | Eventos touch |
| `getAnalogX()` / `getAnalogY()` | Analógico virtual |
| `hudAction(...)` | Ação do HUD |
| `jumpMap(...)` | Mapa de salto |
| `setJump(...)` | Definir salto |
| `enableF...()` | Habilitar funcionalidade |
| `setAuto(...)` | Definir automático |
| `setCurr(...)` | Definir atual |
| `updateS...()` | Atualizar status |

### 5.5 Variáveis Globais Importantes (namespace Globals)

| Variável | Tipo | Função |
|----------|------|--------|
| `app*` | int/float | Aplicação |
| `rig*` | float | Rig/renderização |
| `sec*` | float | Secundário |
| `aut*` | float | Automático |
| `bot*` | float | Bottom |
| `key*` | int/float | Teclado |
| `mou*` | float | Mouse |
| `sub*` | float/int | Submenu |
| `top*` | float | Top edge |
| `act*` | float | Active |
| `res*` | float | Resolução |
| `tou*` | float | Touch |
| `tur*` | float | Turret |
| `fas*` | float | Fast |
| `is_*` | int | Flags booleanos |
| `show*` | int | Flags de exibição |
| `small*` | float | Pequeno |
| `isScreen*` | int | Tela |
| `is_*` (vários) | int | Diversos flags |
| `sub*` | float/int | Submenu |
| `rot*` | float | Rotação |
| `mouse*` | float | Mouse |
| `men*` | float | Menu |
| `trans*` | float | Transformação |
| `keys` | array | Array de teclas (1020 bytes) |
| `bank*` | float | Banco |
| `fire_x/y` | float | Posição do tiro |
| `boost_x/y` | float | Posição do boost |
| `pause_x/y` | float | Posição da pausa |
| `top_edge` | float | Borda superior |
| `left*` | float | Esquerda |

### 5.6 Criptografia Blowfish

A biblioteca contém implementação completa de Blowfish:

| Símbolo | Função |
|---------|--------|
| `InitializeBlowfish` | Inicializar com chave |
| `Blowfish_encipher` | Encriptar bloco de 64-bit |
| `Blowfish_decipher` | Decriptar bloco de 64-bit |
| `F` | Função Feistel |
| `opensubkeyfile` | Abrir arquivo de subchaves |
| `decrypt` | Função de descriptografia genérica |
| `SubkeyFile` | Ponteiro para arquivo de subchaves |
| `P` | Array P (72 bytes) |
| `S` | Array S-boxes (4096 bytes) |

### 5.7 Entrada/Sistema

| Símbolo | Função |
|---------|--------|
| `MouseInput(int, int)` | Input do mouse |
| `MouseWheel(float, float)` | Roda do mouse |
| `SetKeyCode(const char*, int, int)` | Definir código de tecla |
| `keyPressed(KeyEvent*)` | Tecla pressionada |
| `keyReleased(KeyEvent*)` | Tecla liberada |
| `keyIsPressed()` | Tecla está pressionada |
| `ArrowKeyPressed()` | Seta pressionada |
| `ActualizeMouse(...)` | Atualizar mouse |
| `simulateTouch(...)` | Simular toque |
| `SlowMotion()` | Câmera lenta |
| `SpeedUp()` | Acelerar |
| `setValuesFor...()` | Definir valores |

---

## 6. Formato dos Arquivos de Dados

### 6.1 items.bin - Formato

Arquivo binário com registros de 84 bytes cada (aproximadamente 330 itens).

Estrutura de cada registro (little-endian int32):

```
Offset  Campo
0x00    ID do item
0x04    Tipo/Categoria
0x08    Sub-tipo
0x0C    Preço base
0x10    Atributo 1 (dano/carga/etc)
0x14    Atributo 2
0x18    Atributo 3 (raridade)
0x1C    Atributo 4
0x20    Atributo 5
0x24    Atributo 6
0x28    Nível mínimo
0x2C    Slots necessários
0x30    Flag DLC
0x34    Valor desconhecido
0x38    Preço alto (32-bit high)
0x3C    Preço baixo (32-bit low)
0x40    Quantidade disponível
0x44    Tipo de slot
0x48    Flag de instalação
0x4C    Valor de bônus
0x50    (padding/extra)
```

### 6.2 ships.bin - Formato

Arquivo binário com registros de ~88 bytes cada (~26 naves).

Estrutura aproximada (little-endian int32):

```
Offset  Campo
0x00    ID da nave
0x04    Raça
0x08    Classe/tamanho
0x0C    Preço base
0x10    HP base
0x14    Slots de arma primária
0x18    Slots de arma secundária
0x1C    Slots de equipamento
0x20    Carga máxima (cargo)
0x24    Velocidade
0x28    Manobrabilidade
0x2C    Valor de escudo
0x30    Slots de modificação
0x34    Número de slots extras
0x38    HP máximo
0x3C    Preço alto
0x40    Preço baixo
0x44    ID da textura/modelo
0x48    DLC flag
```

---

## 7. Sistemas do Jogo

### 7.1 Sistema de Créditos (Dinheiro)

Os créditos são a moeda principal do jogo. O sistema funciona assim:

1. **Ganhar créditos:** Missões, comércio, combate, recompensas
2. **Gastar créditos:** Comprar naves, equipamentos, commodities, modificações
3. **Comprar créditos (IAP):** 100K, 300K, 1M, 3M, 10M
4. **Créditos grátis:** Vídeos, curtidas, avaliações (social)

O armazenamento de créditos é feito no motor nativo (C++). O valor é persistido no save game.

### 7.2 Sistema IAP (Compras In-App)

#### Fluxo Completo

```
1. Jogador abre loja IAP no menu do jogo
2. Motor nativo chama NFC.iap_buy_credits_*() ou NFC.iap_buy_dlc_*()
3. NativeFunctionCalls (Java) roteia para GooglePlayIAP
4. GooglePlayIAP obtém SKU via ToJNI.gof2hd2012get*SKU(index)
5. BillingManager.initiatePurchaseFlow() abre Google Play
6. Usuário confirma compra
7. BillingManager.onPurchasesUpdated() recebe resultado
8. Security.verifyPurchase() — retorna true (bypassed!)
9. Para consumíveis: consumeAsync() → iapBoughtConsumable()
10. Para premium: iapBoughtPremium() + setDLC_*_BOUGHT(true)
11. Motor nativo atualiza estado do jogo
```

#### SKUs

Os SKUs reais são definidos no motor nativo via `gof2hd2012getConsumableSKU()` e `gof2hd2012getPremiumSKU()`. O campo `BASE_64_ENCODED_PUBLIC_KEY` em BillingManager contém placeholder.

### 7.3 Sistema DLC

Existem 5 DLCs no jogo:

| DLC | Índice | Conteúdo |
|-----|--------|----------|
| Valkyrie | 0 | Expansão Valkyrie (nova história) |
| Kaamo Club | 1 | Kaamo Club (estação secreta) |
| Supernova | 2 | Expansão Supernova |
| VIP Package | 3 | Pacote VIP |
| Full Package | 4 | Pacote completo (todas as DLCs) |

Cada DLC é controlada por:
- **Java:** `DLC_*_BOUGHT` (static boolean em GooglePlayIAP)
- **Nativo:** `getDLC*BOUGHT()` via JNI
- **Nativo:** `correctBoughtDLC*(int)` para correção

### 7.4 Sistema de Modificações de Naves

O sistema de modificações é gerenciado pela classe `ModStation` no motor nativo:

- `ModStation` contém toda a lógica de modificações
- Suporta múltiplos tipos de slots
- Modificações afetam HP, velocidade, carga, etc.
- `Ship.addMod(int)` adiciona modificação
- `Ship.refreshStats()` recalcula todos os stats (924 bytes de lógica!)

### 7.5 Sistema de Dano de Armas

A classe `Gun` e suas subclasses gerenciam o sistema de combate:

- `Gun` é a classe base com propriedades como magnificação, offset, nível
- `calcCharge()` (1984 bytes) calcula o sistema de carga
- `calcLevel()` calcula bônus por nível
- Subclasses implementam comportamentos específicos:
  - `BeamGun`: Dano contínuo por feixe
  - `BombGun`: Dano em área
  - `RocketGun`: Mísseis teleguiados
  - `MineGun`: Minas explosivas
  - `ObjectGun`: Objetos especiais
  - `SentryGun`: Armas automáticas

### 7.6 Sistema de Save

O save game é gerenciado pelo motor nativo. O caminho é definido via:
- `ToJNI.SetDirectories(dataDir, obbDir)`
- `ToJNI.setAPKPath(apkPath)`
- `ToJNI.setZIPPath(zipPath)` (para OBB files)

O save inclui:
- Créditos atuais
- Naves possuídas
- Equipamentos
- Progresso de missões
- Status de DLCs
- Conquistas
- Configurações

---

## 8. Anti-Tamper / Proteção

### 8.1 Verificação de Assinatura

**Status: DESABILITADA**

```smali
Security.verifyPurchase() → sempre retorna true
```

A verificação RSA (SHA1withRSA) existe no código mas não é chamada.

### 8.2 Verificação de Licença

A permissão `com.android.vending.CHECK_LICENSE` está declarada mas não há código visível de verificação LVL.

### 8.3 Proteção do Motor Nativo

O motor nativo (libgof2hdaa.so) contém:
- Criptografia Blowfish para dados sensíveis
- `opensubkeyfile` e `SubkeyFile` para chaves de criptografia
- `decrypt` para descriptografia genérica

### 8.4 Crashlytics

O app usa Crashlytics NDK para monitoramento de crashes, o que pode ser usado para detecção de modificações.

### 8.5 Google Play Games

A integração com Google Play Games (conquistas, leaderboards) requer assinatura válida para funcionar.

---

## 9. Guia de Modificações

### 9.1 Modificações via Smali (Java)

| Modificação | Arquivo | Dificuldade |
|-------------|---------|-------------|
| Desabilitar verificação IAP | `Security.smali` | **Já feito** (verifyPurchase retorna true) |
| Forçar DLCs compradas | `GooglePlayIAP.smali` | **Já feito** (getters retornam true) |
| Modificar preços de créditos IAP | `GooglePlayIAP.smali` | Fácil (mudar strings de preço) |
| Desabilitar IAP completo | `NativeFunctionCalls.smali` | Fácil (stub methods) |
| Modificar mensagem de UI | `GOF2HD2012.smali` | Médio |
| Alterar comportamento do launcher | `DownloaderActivity.smali` | Médio |
| Modificar resolução | `GOF2HD2012.smali` (onCreate) | Fácil |
| Desabilitar analytics | `GOF2HD2012.smali` (Fabric init) | Fácil |

### 9.2 Modificações via Biblioteca Nativa (.so)

| Modificação | Alvo | Dificuldade |
|-------------|------|-------------|
| Modificar stats de naves | `ships.bin` | Fácil (editar binário) |
| Modificar itens | `items.bin` | Fácil (editar binário) |
| Modificar preço de itens | `config.bin` | Médio |
| Modificar dano de armas | `libgof2hdaa.so` | Difícil (hex patching) |
| Modificar HP/speed | `libgof2hdaa.so` | Difícil |
| Modificar save game | Diretório de dados | Médio |

### 9.3 Modificações via Arquivos de Dados

| Modificação | Arquivo | Formato |
|-------------|---------|---------|
| Adicionar créditos | Save game | Binário |
| Desbloquear naves | Save game | Binário |
| Modificar preços | `config.bin` | Binário |
| Modificar stats naves | `ships.bin` | Binário (88 bytes/registro) |
| Modificar stats itens | `items.bin` | Binário (84 bytes/registro) |

### 9.4 Abordagens Recomendadas

**Para desbloquear tudo (já feito neste APK):**
1. `Security.smali`: `verifyPurchase` retorna `const/4 v0, 0x1`
2. `GooglePlayIAP.smali`: Getters de DLC retornam `true`
3. `GooglePlayIAP.smali`: Campos `DLC_*_BOUGHT` inicializados como `true`

**Para modificar dinheiro/itens:**
1. Editar `items.bin` para alterar preços
2. Editar save game para alterar créditos
3. Modificar `config.bin` para alterar parâmetros econômicos

**Para modificar gameplay:**
1. Editar `ships.bin` para alterar stats de naves
2. Editar `items.bin` para alterar stats de itens
3. Hex-patch `libgof2hdaa.so` para alterar constantes de gameplay

---

## 10. Notas Técnicas

### 10.1 Resolução e Display

- Orientação: `sensorLandscape` (paisagem com rotação)
- Resolução máxima: 2048px largura (escala automática)
- Phones: escala 640px → resolução nativa
- Tablets (isPad): sem escala extra
- OpenGL ES 2.0 obrigatório (`glEsVersion="0x00020000"`)
- Suporte a texturas ETC1 comprimidas

### 10.2 Áudio

- Motor: FMOD Ex
- Bibliotecas: `libfmodex.so`, `libfmodevent.so`
- Extração: `FMODCopyTask` em `DownloaderActivity`
- Controle de volume via `AudioManager`

### 10.3 Identificador Único

O jogo usa `android_id` como identificador único do dispositivo, passado ao motor via:
```java
Settings.Secure.getString(getContentResolver(), "android_id")
// → SetOrigamiSuperClub(android_id)
```

### 10.4 Países Suportados

| Código | País | Valor JNI |
|--------|------|-----------|
| GB | Reino Unido | 0 |
| DE | Alemanha | 1 |
| FR | França | 2 |
| IT | Itália | 3 |
| ES | Espanha | 4 |
| RU | Rússia | 5 |
| PL | Polônia | 6 |
| PT | Portugal | 7 |
| KR | Coreia | 14 |
| JP | Japão | 15 |

### 10.5 Constantes do Teclado

O array `keys` no namespace `Globals` tem 1024 bytes (256 entradas de 4 bytes) para mapeamento de teclas.
