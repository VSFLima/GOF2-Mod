# Análise Reversa Completa — GOF2 HD Android (Smali)

## 1. Lista de Todos os Arquivos Smali em net/fishlabs/

### Pacote: `net/fishlabs/gof2hdallandroid2012/`
| Arquivo | Classe | Superclasse |
|---------|--------|-------------|
| `AccelerometerListener.smali` | interface AccelerometerListener | — |
| `AccelerometerManager.smali` | AccelerometerManager | Object |
| `AccelerometerManager$1.smali` | inner class (SensorEventListener) | Object |
| `AlarmReceiver.smali` | AlarmReceiver | BroadcastReceiver |
| `BuildConfig.smali` | BuildConfig | Object |
| `ConfigChooser.smali` | ConfigChooser | Object |
| `ContextFactory.smali` | ContextFactory | Object |
| `DownloaderActivity.smali` | DownloaderActivity | Activity |
| `DownloaderActivity$1.smali` | inner class | Runnable |
| `DownloaderActivity$2.smali` | inner class | OnClickListener |
| `DownloaderActivity$3.smali` | inner class | OnClickListener |
| `DownloaderActivity$4.smali` | inner class | Runnable |
| `DownloaderActivity$5.smali` | inner class | Runnable |
| `DownloaderActivity$5$1.smali` | inner class | — |
| `DownloaderActivity$5$1$1.smali` | inner class | — |
| `DownloaderActivity$FMODCopyTask.smali` | FMODCopyTask | AsyncTask |
| `DownloaderActivity$FMODCopyTask$1.smali` | inner class | — |
| `DownloaderActivity$FMODCopyTask$2.smali` | inner class | — |
| `DownloaderActivity$FMODCopyTask$3.smali` | inner class | — |
| `DownloaderActivity$XAPKFile.smali` | XAPKFile | Object |
| `FishlabsDownloaderService.smali` | DownloaderService | Custom (expansion lib) |
| `FMODExtractionHandler.smali` | FMODExtractionHandler | Object |
| `Gof2AchievementIDs.smali` | Gof2AchievementIDs | Object |
| `GOF2HD2012.smali` | **GOF2HD2012** | BaseGameActivity |
| `GOF2HD2012$1.smali` | Handler (mHandler) | Handler |
| `GOF2HD2012$2.smali` | inner class | Runnable |
| `GOF2HD2012$3.smali` | inner class | OnClickListener |
| `GOF2HD2012$4.smali` | inner class | OnClickListener |
| `GLView.smali` | GLView | GLSurfaceView |
| `GLViewRenderer.smali` | GLViewRenderer | Object (implements Renderer) |
| `LocalizationService.smali` | LocalizationService | Object |
| `LocalizationService$1.smali` | inner class | — |
| `LocalizationService$Languages.smali` | enum Languages | Enum |
| `LocalizationService$MessageCodes.smali` | enum MessageCodes | Enum |
| `Messenger.smali` | Messenger | Object |
| `MessengerSwitcher.smali` | MessengerSwitcher | Object |
| `MultisampleConfigChooser.smali` | MultisampleConfigChooser | Object |
| **`NativeFunctionCalls.smali`** | **NativeFunctionCalls** | **Object** |
| `R.smali` | R | Object |
| `R$attr.smali`, `R$bool.smali`, etc. | Resource IDs | — |
| `TouchHandler.smali` | TouchHandler | Object |
| `TouchHandler$_pointerInformation.smali` | inner class | Object |
| **`ToJNI.smali`** | **ToJNI (gof2hdallandroid2012)** | **Object** |

### Pacote: `net/fishlabs/googleplay/`
| Arquivo | Classe | Superclasse |
|---------|--------|-------------|
| `BaseGameActivity.smali` | BaseGameActivity | FragmentActivity |
| `BaseGameUtils.smali` | BaseGameUtils | Object |
| **`BillingManager.smali`** | **BillingManager** | **Object** |
| `BillingManager$1.smali` – `$7.smali` | inner classes (Runnable, Listeners) | — |
| `BillingManager$BillingUpdatesListener.smali` | interface | — |
| `BillingManager$ServiceConnectedListener.smali` | interface | — |
| `GameHelper.smali` | GameHelper | Object |
| `GameHelper$1.smali` | inner class | — |
| `GameHelper$GameHelperListener.smali` | interface | — |
| `GameHelper$SignInFailureReason.smali` | inner class | Object |
| `GameHelperUtils.smali` | GameHelperUtils | Object |
| **`GooglePlayIAP.smali`** | **GooglePlayIAP** | **Object** |
| **`Security.smali`** | **Security** | **Object** |
| **`ToJNI.smali`** | **ToJNI (googleplay)** | **Object** |

### Pacote: `net/fishlabs/ow_utils/`
| Arquivo | Classe | Superclasse |
|---------|--------|-------------|
| `DeviceInfo.smali` | DeviceInfo | Object |

---

## 2. Análise Detalhada dos Arquivos-Chave

### 2.1 `net/fishlabs/googleplay/ToJNI.smali` — JNI do Google Play

**Classe:** `final class net.fishlabs.googleplay.ToJNI extends Object`

**Métodos nativos (JNI) — 8 métodos:**

| Método | Assinatura | Descrição |
|--------|-----------|-----------|
| `gof2hd2012apk()` | `() -> String` | **Retorna a chave pública Base64 RSA** (embutida no .so nativo) |
| `gof2hd2012getConsumableSKU(int)` | `(int) -> String` | Retorna SKU consumível pelo índice (0-4) |
| `gof2hd2012getPremiumSKU(int)` | `(int) -> String` | Retorna SKU premium pelo índice (0-4) |
| `gof2hd2012setPremiumContent(int)` | `(int) -> void` | Define conteúdo premium |
| `iapBoughtConsumable(int)` | `(int) -> void` | Notifica compra de item consumível |
| `iapBoughtPremium(int, int)` | `(int, int) -> void` | Notifica compra de item premium |
| `iapResetNativeItemInformationList()` | `() -> void` | Reseta lista de itens nativos |
| `iapSetNativeItemInformationList(String×5)` | `(String[],...,String[]) -> void` | Define IDs, nomes, descrições, moedas, preços |

**Observação crítica:** A chave pública RSA NÃO está hardcoded no Java — ela é retornada por `gof2hd2012apk()`, ou seja, está embutida no binário nativo `libgof2hdaa.so`. Isso é uma camada de obscurcação.

---

### 2.2 `net/fishlabs/gof2hdallandroid2012/ToJNI.smali` — JNI do Motor do Jogo

**Classe:** `final class net.fishlabs.gof2hdallandroid2012.ToJNI extends Object`

**Constantes (message codes):**

| Constante | Valor | Descrição |
|-----------|-------|-----------|
| `MESSAGE_CHECK_CONNECTION` | 0x10 (10) | Verificar conexão |
| `MESSAGE_EXIT_APP` | 0x20 (20) | Sair do app |
| `MESSAGE_FREE_CREDITS_WATCH_VIDEO` | 0x29 (41) | Assistir vídeo para créditos |
| `MESSAGE_FREE_CREDITS_LIKE_GOF2` | 0x2A (42) | Curtir GOF2 no Facebook |
| `MESSAGE_FREE_CREDITS_LIKE_FISHLABS` | 0x2B (43) | Curtir Fishlabs no Facebook |
| `MESSAGE_FREE_CREDITS_SUBSCRIBE_YOUTUBE` | 0x2C (44) | Inscrever-se no YouTube |
| `MESSAGE_FREE_CREDITS_FOLLOW_TWITTER` | 0x2D (45) | Seguir no Twitter |
| `MESSAGE_FREE_CREDITS_RATE_GAME` | 0x2E (46) | Avaliar o jogo |
| `MESSAGE_RATE_GAME` | 0x30 (48) | Avaliar jogo |
| `MESSAGE_SHOW_MORE_GAMES` | 0x31 (49) | Mostrar mais jogos |
| `MESSAGE_SHOW_TERMS_OF_SERVICE` | 0x31 (49) | Termos de serviço |
| `MESSAGE_SHOW_PRIVACY_POLICY` | 0x32 (50) | Política de privacidade |
| `MESSAGE_SET_BRIGHTNESS` | 0x1E (30) | Ajustar brilho |

**Métodos nativos (JNI) — 22 métodos:**

| Método | Assinatura | Descrição |
|--------|-----------|-----------|
| `BackButtonPressed()` | `() -> void` | Tecla voltar pressionada |
| `SetDirectories(String, String)` | `(String, String) -> void` | Define diretórios de dados |
| `correctBoughtDLC1-5(int)` | `(int) -> void` | Corrige estado de compra DLC 1-5 |
| `getDLC1-5BOUGHT()` | `() -> int` | Consulta se DLC 1-5 foi comprada |
| `getExitFlag()` | `() -> int` | Consulta flag de saída (-1 = sair) |
| `getLogoShown()` | `() -> int` | Se o logo foi exibido |
| `getScreenshotFlag()` | `() -> int` | Flag de screenshot |
| `handleAccelerometer(float×3)` | `(f, f, f) -> void` | Dados do acelerômetro |
| `handleTouchEvent(int×4)` | `(i, i, i, i) -> void` | Evento de toque |
| `initialize(int, int)` | `(int, int) -> void` | **Inicialização do motor gráfico** |
| `isInMainMenu()` | `() -> int` | Se está no menu principal |
| `renderstep(long)` | `(long) -> void` | **Passo de renderização** |
| `resize(int, int)` | `(int, int) -> void` | Redimensionar viewport |
| `sendPauseSignalToGame()` | `() -> void` | Sinal de pausa |
| `sendResumeSignalToGame()` | `() -> void` | Sinal de retomada |
| `setAPKPath(String)` | `(String) -> void` | Caminho do APK |
| `setCountryCodeOfDevice(int)` | `(int) -> void` | Código do país |
| `setEnvironmentVariables(Context)` | `(Context) -> void` | Variáveis de ambiente |
| `setZIPPath(String)` | `(String) -> void` | Caminho do OBB/ZIP |
| `testPurchase(int)` | `(int) -> void` | **Testar compra (DEBUG!)** |

**Países mapeados:**
- 0=GB, 1=DE, 2=FR, 3=IT, 4=ES, 5=RU, 6=PL, 7=PT, 14=KR, 15=JP

---

### 2.3 `NativeFunctionCalls.smali` — Ponte Java-Nativa para IAP

**Classe:** `public class NativeFunctionCalls extends Object`

**Campo estático:** `Gof2Activity: GOF2HD2012` — referência estática à Activity

**Métodos (todos `protected static`):**

#### Compras IAP — Créditos Consumíveis:
| Método | Chama |
|--------|-------|
| `iap_buy_credits_100_000()` | `GooglePlayIAP.iap_buy_credits_100_000()` |
| `iap_buy_credits_300_000()` | `GooglePlayIAP.iap_buy_credits_300_000()` |
| `iap_buy_credits_1_000_000()` | `GooglePlayIAP.iap_buy_credits_1_000_000()` |
| `iap_buy_credits_3_000_000()` | `GooglePlayIAP.iap_buy_credits_3_000_000()` |
| `iap_buy_credits_10_000_000()` | `GooglePlayIAP.iap_buy_credits_10_000_000()` |

#### Compras IAP — DLCs Premium:
| Método | Chama | DLC Index |
|--------|-------|-----------|
| `iap_buy_dlc_valkyrie()` | `iap_buy_valkyrie()` | Premium SKU 0 |
| `iap_buy_dlc_kaamo_club()` | `iap_buy_kaamo_club()` | Premium SKU 1 |
| `iap_buy_dlc_supernova()` | `iap_buy_supernova()` | Premium SKU 2 |
| `iap_buy_dlc_vip()` | `iap_buy_vip_package()` | Premium SKU 3 |
| `iap_buy_dlc_full_package()` | `iap_buy_full_package()` | Premium SKU 4 |

#### Outros:
| Método | Ação |
|--------|------|
| `iap_restore_purchases()` | `GooglePlayIAP.iap_restore_purchases()` |
| `free_credits_watchVideo()` | Abre vídeo YouTube (msg 0x29) |
| `free_credits_likeGOF2OnFacebook()` | Abre Facebook GOF2 (msg 0x2A) |
| `free_credits_likeFishlabsOnFacebook()` | Abre Facebook Fishlabs (msg 0x2B) |
| `free_credits_subscribeToYoutubeChannel()` | Abre YouTube (msg 0x2C) |
| `free_credits_followOnTwitter()` | Abre Twitter (msg 0x2D) |
| `free_credits_rateGame()` | Abre Play Store (msg 0x2E) |
| `free_credits_open_offerwall()` | **VAZIO — offerwall removido** |
| `rateGame()` | Abre Play Store (msg 0x30) |
| `showMoreGames()` | Abre "Deep Silver" no Play Store (msg 0x2F) |
| `openTermsOfService()` | Abre URL ToS (msg 0x31) |
| `openPrivacyPolicy()` | Abre URL Privacy (msg 0x32) |

---

### 2.4 `GooglePlayIAP.smali` — Gerenciador de IAP

**Classe:** `public class GooglePlayIAP extends Object`
**Implementa:** `BillingManager.BillingUpdatesListener`, `SkuDetailsResponseListener`

#### Campos Estáticos (DLC Flags):
```
DLC_1_BOUGHT: boolean = true   ← INICIALIZADO COMO TRUE!
DLC_2_BOUGHT: boolean = true   ← INICIALIZADO COMO TRUE!
DLC_3_BOUGHT: boolean = true   ← INICIALIZADO COMO TRUE!
DLC_4_BOUGHT: boolean = true   ← INICIALIZADO COMO TRUE!
DLC_5_BOUGHT: boolean = true   ← INICIALIZADO COMO TRUE!
```

**Achado CRÍTICO:** Todos os DLC_BOUGHT flags são inicializados como `true` (comprado).

#### Constantes:
- `_AVAILABLE_CONSUMABLES = 5`
- `_AVAILABLE_PREMIUM_SKUS = 5`
- Descrições: "100.000", "300.000", "1.000.000", "3.000.000", "10.000.000"
- `_DESCRIPTION_MARKER = " $"`
- `_notAvailable = "-"`

#### Campos de Instância:
- `CONTEXT: Context`
- `ACTIVITY: Activity`
- `base64EncodedPublicKey: String` (chave vinda do JNI)
- `consumableSkuList: HashMap<String, Integer>` — SKU -> índice
- `consumableTokens: ConcurrentHashMap<String, Integer>` — token -> índice
- `mBillingClientSetupFinished: boolean`
- `mBillingManager: BillingManager`

#### Método Construtor (`<init>`):
1. Chama `setUpConsumables()`
2. Define CONTEXT e ACTIVITY
3. **Obtém chave pública via `ToJNI.gof2hd2012apk()`** (nativo)
4. Cria `BillingManager` com a chave

#### `getDLC_1-5_BOUGHT()` — **TODOS RETORNAM TRUE SEMPRE!**
```smali
.method public getDLC_1_BOUGHT()Z
    sget-boolean v0, ...DLC_1_BOUGHT:Z   ← lê o valor
    const/4 v0, 0x1                       ← SOBRESCREVE com TRUE
    return v0                              ← retorna TRUE
.end method
```
**Isso significa que TODOS os DLCs são considerados "comprados" independentemente do estado real.**

#### Fluxo `onPurchasesUpdated(List<Purchase>)`:
1. Constrói HashMap de premiumSKU -> índice (0-4)
2. Para cada compra:
   - Se SKU está na lista premium → chama `iapBoughtPremium(indice, 1)` via JNI + `setDLC_X_BOUGHT(true)`
   - Se SKU está na lista consumable → chama `consumeAsync(token)` e armazena token
3. Atribuição DLC por índice:
   - 0 → DLC_1 (Valkyrie)
   - 1 → DLC_2 (Kaamo Club)
   - 2 → DLC_3 (Supernova)
   - 3 → DLC_4 (VIP)
   - 4 → DLC_5 (Full Package)

#### `onConsumeFinished(String, int)`:
- Se resultCode == 0 (sucesso) → chama `iapBoughtConsumable(indice)` via JNI

---

### 2.5 `Security.smali` — Verificação de Compras

**Classe:** `public class Security extends Object`

**Constantes:**
- `KEY_FACTORY_ALGORITHM = "RSA"`
- `SIGNATURE_ALGORITHM = "SHA1withRSA"`
- `TAG = "IABUtil/Security"`

**Métodos:**
- `generatePublicKey(String)` → Decodifica Base64, gera `PublicKey` RSA via X509EncodedKeySpec
- `verify(PublicKey, String, String)` → Verifica assinatura SHA1withRSA
- **`verifyPurchase(String, String, String)` → RETORNA SEMPRE TRUE!**

```smali
.method public static verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    const/4 v0, 0x1
    return v0        ← SEMPRE RETORNA TRUE (VERIFIED)
.end method
```

**Achado CRÍTICO:** A verificação de assinatura de compra está DESABILITADA — `verifyPurchase()` sempre retorna `true`. Isso significa que qualquer "compra" (mesmo forjada) seria aceita.

---

### 2.6 `BillingManager.smali` — Google Play Billing Client

**Classe:** `public class BillingManager extends Object`
**Implementa:** `PurchasesUpdatedListener`

**Campos:**
- `BASE_64_ENCODED_PUBLIC_KEY = "CONSTRUCT_YOUR_KEY_AND_PLACE_IT_HERE"` ← placeholder (sobrescrito pelo construtor)
- `BILLING_MANAGER_NOT_INITIALIZED = -1`
- `mActivity: Activity`
- `mBillingClient: BillingClient`
- `mBillingClientResponseCode: int` (-1)
- `mBillingUpdatesListener: BillingUpdatesListener`
- `mIsServiceConnected: boolean`
- `mPurchases: List<Purchase>`
- `mTokensToBeConsumed: Set<String>`

**Construtor:**
1. Cria BillingClient com `newBuilder(context).setListener(this).build()`
2. Inicia conexão via `startServiceConnection()` com callback

**Métodos Principais:**
- `initiatePurchaseFlow(sku, type)` → Inicia fluxo de compra via BillingClient
- `consumeAsync(token)` → Consome item (para consumíveis)
- `queryPurchases()` → Consulta compras existentes (restore)
- `querySkuDetailsAsync(type, skuList, listener)` → Consulta detalhes de SKU
- `onPurchasesUpdated(responseCode, purchases)` → Callback do Google Play
  - Se code==0 → para cada compra chama `handlePurchase()`
  - Se code==1 → cancelado pelo usuário
- `handlePurchase(purchase)` → Verifica assinatura (via `verifyValidSignature()` que chama `Security.verifyPurchase()` — que SEMPRE retorna true)

---

### 2.7 `GOF2HD2012.smali` — Activity Principal do Jogo

**Classe:** `public class GOF2HD2012 extends BaseGameActivity`
**Implementa:** `View.OnSystemUiVisibilityChangeListener`

#### Bibliotecas Nativas Carregadas (clinit):
```
System.loadLibrary("fmodex")      ← FMOD Ex (áudio)
System.loadLibrary("fmodevent")   ← FMOD Event
System.loadLibrary("gof2hdaa")    ← Motor do jogo (contém JNI)
```

#### Campos Estáticos:
- `DIALOG_EXIT_ID = 0`
- `_USE_GOOGLEPLAY = true` ← flag de uso do Google Play
- `_surface_created = false`
- `audio: AudioManager`
- `currentVolume: int`
- `firstResume: boolean`
- `gpiap: GooglePlayIAP` ← instância do IAP
- `kgMgr: KeyguardManager`
- `ls: LocalizationService`
- `mGLView: GLView`
- `packageName = "net.fishlabs.gof2hdallandroid2012"`
- `staticGOF2: GOF2HD2012` ← referência estática
- `touchHandler: TouchHandler`

#### Campos de Instância:
- `RC_RESOLVE = 5000` (0x1388)
- `RC_UNUSED = 5001` (0x1389)
- `googleServicesPlayLinked: boolean`
- `looperHandler: Handler`
- `looperPrepared: boolean` (false)
- `mHandler: Handler` ← GOF2HD2012$1 (handleMessage)

#### Métodos Nativos Adicionais (JNI no gof2hdaa.so):
```
GetAchievementId(int) -> int
GetLeaderboardScore(int) -> int
GetLinkGameGP() -> int
GetShowAchievements() -> int
GetShowLeaderboards() -> int
ReleaseOrigamiSuperClub(String) -> void
ResetAchievements() -> void
ResetLeaderboardScore(int) -> int
ResetLinkGameGP() -> void
ResetShowAchievements() -> void
ResetShowLeaderboards() -> void
SetGPIsLinked(int) -> void
SetOrigamiSuperClub(String) -> void
```

---

### 2.8 `GOF2HD2012$1.smali` — Handler de Mensagens

**HandleMessage dispatch:**

| Message Code | Ação |
|-------------|------|
| 0x14 (20) | `exitApp()` |
| 0x29 (41) | Abre vídeo YouTube: `http://www.youtube.com/watch?feature=player_embedded&v=hN4K_5dppjU` |
| 0x2A (42) | Abre Facebook Fishlabs: `https://www.facebook.com/fishlabs` |
| 0x2B (43) | Abre Facebook Fishlabs: `https://www.facebook.com/fishlabs` |
| 0x2C (44) | Abre YouTube Fishlabs: `http://www.youtube.com/user/fishlabsgames` |
| 0x2D (45) | Abre Twitter DS Fishlabs: `https://twitter.com/dsfishlabs` |
| 0x2E (46) | Abre Play Store para avaliar: `market://details?id=net.fishlabs.gof2hdallandroid2012` |
| 0x2F (47) | Abre Play Store "Deep Silver": `market://search?q=pub:"Deep Silver"` |
| 0x30 (48) | Abre Play Store para avaliar |
| 0x31 (49) | Abre ToS: `https://www.dsfishlabs.com/terms_of_services` |
| 0x32 (50) | Abre Privacy: `https://www.dsfishlabs.com/privacy_policy` |

---

### 2.9 `DownloaderActivity.smali` — Activity de Download/Inicialização

**Classe:** `public class DownloaderActivity extends Activity`
**Implementa:** `IDownloaderClient`

#### Constantes:
- `FMODSIZE = 0x1606d040` (369,545,280 bytes ≈ 352 MB)
- `MAIN_OBBFILE_VERSION_CODE = 0x2DB9CFE` (47,947,006)
- `MAIN_OBBFILE_SIZE = 0x3C449A26` (1,011,427,878 bytes ≈ 965 MB)
- `PATCH_OBBFIILE_VERSION_CODE = ""` (vazio)
- `PERMISSION_REQUEST_ID = 0x1CD0` (7376)

#### Constantes de Intent:
- `INTENT_EXTERNAL_FILES_DIR = "APP_EXTERNAL_FILES_DIR"`
- `INTENT_EXTERNAL_OBB_DIR = "APP_EXTERNAL_PATH_TO_OBB_FILES"`
- `INTENT_EXTERNAL_MAIN_OBB_FILE_NAME = "APP_EXTERNAL_NAME_OF_OBB_FILE_MAIN"`
- `INTENT_EXTERNAL_PATCH_OBB_FILE_NAME = "APP_EXTERNAL_NAME_OF_OBB_FILE_PATCH"`

#### **Ponto de Entrada — `onCreate()`:**
```
1. XGzFW.rknQvDWUwPZwMfpWYlgzxFosNizCoAnohdzhSlCHzTBfiD(context) ← Ofuscação!
2. hideStatusBar()
3. setFlags(0x80) — FLAG_KEEP_SCREEN_ON
4. setPaths() — configura caminhos OBB
5. Cria FMODExtractionHandler
6. Configura XAPKFile[0]:
   - mIsMain = true
   - mFileSize = 0x3C449A26
   - mFileVersion = 0x2DB9CFE
7. Cria stub do downloader
8. initProgressDialogs()
9. initializeDownloadUI()
10. jJLvgvKugbhDGYOwePrkkhoHd.KVakUMkNSnLVcvvHOhxJSFehgeofHjiGXkcRaAumYxArpUPaNbJxP(context) ← Ofuscação!
```

**Observação:** Há duas chamadas a classes ofuscadas:
- `XGzFW.rknQvDWUwPZwMfpWYlgzxFosNizCoAnohdzhSlCHzTBfiD()` — chamada no início do onCreate
- `jJLvgvKugbhDGYOwePrkkhoHd.KVakUMkNSnLVcvvHOhxJSFehgeofHjiGXkcRaAumYxArpUPaNbJxP()` — chamada no final

#### `startGame()`:
- Cria Intent para `GOF2HD2012`
- Passa extras: externalFilesDir, obbFilePath, mainObbFileName, patchObbFileName
- Inicia a Activity e finaliza DownloaderActivity

#### `setPaths()`:
- `obbFilePath = "{externalStorage}/Android/obb/{packageName}/"`
- `mainObbFileName = "main.47947006.{packageName}.obb"`
- `patchObbFileName = "patch..{packageName}.obb"` (versão vazia)

#### `onStart()`:
- Se `startOnResume` → inicia o jogo diretamente
- Senão → solicita permissão `READ_EXTERNAL_STORAGE`

#### `onDownloadComplete()`:
- Se FMOD não extraído → mostra loading dialog e inicia FMODCopyTask
- Se FMOD já extraído → inicia jogo

---

### 2.10 `GLViewRenderer.smali` — Renderizador OpenGL

**Classe:** `public class GLViewRenderer extends Object implements GLSurfaceView.Renderer`

**Campos:**
- `frameRate = 33` (0x21) — limitado a ~30 FPS
- `waitingTime = 10000` (0x2710) — 10 segundos entre checks de DLC
- `_USE_FPS_LIMITER = true`
- `initialized = false`

#### `onDrawFrame(GL10)` — Loop Principal:
1. **Verificação periódica de DLC** (a cada 10 segundos):
   - Consulta `ToJNI.getDLC1-5BOUGHT()` (nativo)
   - Consulta `GooglePlayIAP.getDLC_1-5_BOUGHT()` (Java — sempre true!)
   - Se nativo=0 e Java=true → `correctBoughtDLCX(1)` (sincroniza)
   - Se nativo=1 e Java=false → `correctBoughtDLCX(0)` (sincroniza)
2. **Verifica exitFlag** — se -1 → envia msg 0x14 (sair)
3. **Verifica screenshotFlag** — se 1 → captura screenshot
4. **Reporta leaderboards e achievements** via Google Play Games
5. **Chama `ToJNI.renderstep(System.currentTimeMillis())`**
6. **FPS Limiter** — dorme até completar 33ms

#### `onSurfaceChanged(GL10, w, h)`:
- Se não inicializado → chama `ToJNI.initialize(w, h)`
- Chama `ToJNI.resize(w, h)`

#### `onSurfaceCreated(GL10, EGLConfig)`:
- Salva referência GL10
- Define `_surface_created = true`
- Chama `ToJNI.setEnvironmentVariables(context)`

---

### 2.11 `FMODExtractionHandler.smali` — Extração de Áudio

**Classe:** `public class FMODExtractionHandler extends Object`

**Campo:** `FMOD_STAMP_NAME = "fmod_stamp_001.47947"` (arquivo sentinel)

**Métodos:**
- `filesAlreadyExtracted()` → Verifica se o arquivo sentinel existe
- `extractFMODFiles()` →
  1. Verifica espaço disponível ≥ FMODSIZE (352 MB)
  2. Lista assets em "assets/data/audio"
  3. Se encontrou → copia do AssetManager
  4. Se não encontrou → extrai do OBB (ZipFile) procurando por "FMOD"
  5. Cria arquivo sentinel

---

### 2.12 `Gof2AchievementIDs.smali` — IDs de Conquistas

Mapeia IDs numéricos (1-107) para IDs do Google Play Games:
- Formato: `CgkI1aX--8sIEAIQxx` (Google Play Services ID)
- Alguns IDs retornam `"noId"` (desabilitados)
- Exemplo: ID 0x6B (107) → `CgkI1aX--8sIEAIQZA`

---

## 3. Fluxo Completo de Compra IAP

```
[Jogo Nativo (C++)]
    │
    │ chama NativeFunctionCalls.iap_buy_dlc_valkyrie() etc.
    ▼
[NativeFunctionCalls.smali]
    │
    │ obtém GooglePlayIAP via GOF2HD2012.getStaticIAP()
    ▼
[GooglePlayIAP.smali]
    │
    │ iap_buy_valkyrie():
    │   SKU = ToJNI.gof2hd2012getPremiumSKU(0) ← via JNI nativo
    │   mBillingManager.initiatePurchaseFlow(SKU, "inapp")
    ▼
[BillingManager.smali]
    │
    │ initiatePurchaseFlow():
    │   executeServiceRequest → BillingClient.launchBillingFlow()
    ▼
[Google Play BillingClient]
    │
    │ Usuário completa compra
    ▼
[BillingManager.onPurchasesUpdated(code, purchases)]
    │
    │ handlePurchase(purchase):
    │   verifyValidSignature(json, sig):
    │     Security.verifyPurchase(key, json, sig) → SEMPRE TRUE ← VULNERABILIDADE
    │   mPurchases.add(purchase)
    │
    │ mBillingUpdatesListener.onPurchasesUpdated(mPurchases)
    ▼
[GooglePlayIAP.onPurchasesUpdated(purchases)]
    │
    │ Para cada purchase:
    │   Se SKU ∈ premiumList:
    │     ToJNI.iapBoughtPremium(indice, 1) ← notifica nativo
    │     setDLC_X_BOUGHT(true) ← atualiza flag Java
    │
    │   Se SKU ∈ consumableList:
    │     consumableTokens.put(token, indice)
    │     mBillingManager.consumeAsync(token)
    ▼
[BillingManager.consumeAsync(token)]
    │
    │ BillingClient.consumeAsync(token)
    ▼
[GooglePlayIAP.onConsumeFinished(token, resultCode)]
    │
    │ Se resultCode == 0:
    │   ToJNI.iapBoughtConsumable(indice) ← notifica nativo
    ▼
[Motor Nativo (C++) — créditos adicionados]
```

---

## 4. Sistema de Flags DLC — Análise Completa

### DLCs Disponíveis:
| Índice | DLC | SKU Type |
|--------|-----|----------|
| 0 | **Valkyrie** | Premium |
| 1 | **Kaamo Club** | Premium |
| 2 | **Supernova** | Premium |
| 3 | **VIP Package** | Premium |
| 4 | **Full Package** | Premium |

### Mecanismo de Sincronização (GLViewRenderer.onDrawFrame):
A cada 10 segundos, o renderizador compara:
- **Estado nativo** (via `ToJNI.getDLCXBOUGHT()`) — armazenado em C++
- **Estado Java** (via `GooglePlayIAP.getDLC_X_BOUGHT()`) — **SEMPRE RETORNA TRUE**

Se houver divergência → `ToJNI.correctBoughtDLCX(valor)` sincroniza.

### **VULNERABILIDADE CRÍTICA:**
1. `GooglePlayIAP.getDLC_1-5_BOUGHT()` **sempre retorna `true`** (hardcoded)
2. `Security.verifyPurchase()` **sempre retorna `true`** (verificação desabilitada)
3. Os flags `DLC_X_BOUGHT` são inicializados como `true` no `<clinit>`
4. `ToJNI.testPurchase(int)` existe como método nativo — potencial bypass

**Resultado:** TODOS os DLCs são desbloqueados por padrão nesta versão. A verificação de compra é uma formalidade que nunca rejeita.

---

## 5. Fluxo de Inicialização do Jogo (onCreate)

### Fase 1: DownloaderActivity (Entry Point)
```
1. XGzFW.rknQvD...() ← chamada ofuscada (possível init de SDK/anti-tamper)
2. hideStatusBar()
3. FLAG_KEEP_SCREEN_ON
4. setPaths():
   - externalStorageDir = Environment.getExternalStorageDirectory()
   - externalFilesDir = getExternalFilesDir(null)
   - obbFilePath = "{ext}/Android/obb/{pkg}/"
   - mainObbFileName = "main.47947006.{pkg}.obb"
5. Cria FMODExtractionHandler(externalFilesDir, 369545280, assets, obbPath+mainOBB)
6. Configura XAPKFile[0] = {main=true, size=1011427878, version=47947006}
7. DownloaderClientMarshaller.CreateStub(this, FishlabsDownloaderService.class)
8. initProgressDialogs() — "Preparing for the first start!"
9. initializeDownloadUI() — barra de progresso
10. jJLvgvKugbhDGYOwePrkkhoHd.KVakUMkNS...() ← chamada ofuscada
```

### Fase 2: Download OBB + Extração FMOD
```
onStart():
  - Solicita READ_EXTERNAL_STORAGE
  - Após WRITE_EXTERNAL_STORAGE
  - startDownloadingProcess():
    - expansionFilesDelivered() → verifica OBB existe
    - Se NÃO → DownloaderClientMarshaller.startDownloadServiceIfRequired()
    - Se SIM → onDownloadComplete()
      - Se FMOD não extraído → loading dialog + FMODCopyTask
      - Se FMOD extraído → startGame()
```

### Fase 3: GOF2HD2012.onCreate()
```
1. super.onCreate() → BaseGameActivity.onCreate() → GameHelper.setup()
2. Fabric.with(this, Crashlytics, CrashlyticsNdk) ← crash reporting
3. Cria LocalizationService
4. staticGOF2 = this
5. kgMgr = KeyguardManager
6. NativeFunctionCalls.Gof2Activity = this
7. Lê Intent extras (externalFilesDir, obbPath, mainObbFileName)
8. ToJNI.setZIPPath(obbPath + mainOBB)
9. FLAG_KEEP_SCREEN_ON + FLAG_FULLSCREEN
10. setSystemUiVisibility(0x1706) — immersive mode
11. Cria GLView → GLViewRenderer
12. Calcula resolução (max 2048, escala para phones)
13. surfaceHolder.setFixedSize(width, height)
14. setContentView(mGLView)
15. TouchHandler(scaleX, scaleY)
16. StrictMode.permitAll() (se SDK > 9)
17. ToJNI.SetDirectories(externalFilesDir, obbPath)
18. ToJNI.setAPKPath(sourceDir)
19. setCountry(language, country) → ToJNI.setCountryCodeOfDevice()
20. Se _USE_GOOGLEPLAY:
    - Cria GooglePlayIAP(context, activity, packageName)
    - gpiap = new GooglePlayIAP(...)
21. checkGooglePlayLogin() → SetGPIsLinked()
22. SetOrigamiSuperClub(android_id)
```

### Fase 4: GLViewRenderer (GL Thread)
```
onSurfaceCreated():
  - setEnvironmentVariables(context) ← init nativo

onSurfaceChanged(w, h):
  - initialize(w, h) ← primeira vez: init motor gráfico
  - resize(w, h)

onDrawFrame() [loop]:
  - Verifica DLC flags (a cada 10s)
  - Verifica exit/screenshot flags
  - reportLeaderboardsAndAchievements()
  - checkGooglePlayGamesServiceAppFlags()
  - renderstep(timestamp) ← RENDERIZAÇÃO DO JOGO
  - FPS limiter (33ms)
```

---

## 6. Informações Adicionais

### Obfuscação Detectada:
- `XGzFW.rknQvDWUwPZwMfpWYlgzxFosNizCoAnohdzhSlCHzTBfiD(Context)` — chamada no onCreate do DownloaderActivity
- `jJLvgvKugbhDGYOwePrkkhoHd.KVakUMkNSnLVcvvHOhxJSFehgeofHjiGXkcRaAumYxArpUPaNbJxP(Context)` — chamada no final do onCreate

### URLs Importantes:
- Facebook Fishlabs: `https://www.facebook.com/fishlabs`
- Twitter DS Fishlabs: `https://twitter.com/dsfishlabs`
- YouTube Fishlabs: `http://www.youtube.com/user/fishlabsgames`
- YouTube Vídeo promo: `http://www.youtube.com/watch?feature=player_embedded&v=hN4K_5dppjU`
- ToS: `https://www.dsfishlabs.com/terms_of_services`
- Privacy: `https://www.dsfishlabs.com/privacy_policy`
- Play Store: `market://details?id=net.fishlabs.gof2hdallandroid2012`
- Publisher search: `market://search?q=pub:"Deep Silver"`

### DeviceInfo:
- `isPad()` → calcula diagonal da tela em polegadas (threshold 6.5")
- Identificador via IMEI → WiFi MAC → UUID aleatório (fallback)

### Arquivos OBB:
- Main OBB: `main.47947006.net.fishlabs.gof2hdallandroid2012.obb` (~965 MB)
- Patch OBB: `patch..net.fishlabs.gof2hdallandroid2012.obb` (versão vazia = sem patch)
- FMOD audio: ~352 MB extraído para externalFilesDir
- Sentinel: `fmod_stamp_001.47947`

---

## 7. Resumo de Achados Críticos

1. **DLCs Desbloqueados por Padrão:** `getDLC_1-5_BOUGHT()` sempre retorna `true` — todos DLCs ativos
2. **Verificação de Compras Desabilitada:** `Security.verifyPurchase()` sempre retorna `true`
3. **Chave Pública no Nativo:** A chave RSA está no `.so`, não no Java — mas como a verificação está bypassada, é irrelevante
4. **Método de Teste Nativo:** `testPurchase(int)` existe no JNI — possivelmente para debug
5. **Chamadas Ofuscadas:** Duas classes com nomes ofuscadas chamadas durante inicialização
6. **FMOD como OBB separado:** Áudio de ~352 MB é extraído do OBB na primeira execução
7. **Mensagem "LICENCE_NOT_VALID":** Existe no LocalizationService mas provavelmente nunca é exibida
8. **Flag `_USE_GOOGLEPLAY = true`:** Sempre habilitado; se fosse `false`, IAP seria ignorado
