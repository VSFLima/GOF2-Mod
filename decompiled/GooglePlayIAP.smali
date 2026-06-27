.class public Lnet/fishlabs/googleplay/GooglePlayIAP;
.super Ljava/lang/Object;
.source "GooglePlayIAP.java"

# interfaces
.implements Lnet/fishlabs/googleplay/BillingManager$BillingUpdatesListener;
.implements Lcom/android/billingclient/api/SkuDetailsResponseListener;


# static fields
.field private static DLC_1_BOUGHT:Z = true

.field private static DLC_2_BOUGHT:Z = true

.field private static DLC_3_BOUGHT:Z = true

.field private static DLC_4_BOUGHT:Z = true

.field private static DLC_5_BOUGHT:Z = true

.field private static final _AVAILABLE_CONSUMABLES:I = 0x5

.field private static final _AVAILABLE_PREMIUM_SKUS:I = 0x5

.field private static final _DESCRIPTION_100_000:Ljava/lang/String;

.field private static final _DESCRIPTION_10_000_000:Ljava/lang/String;

.field private static final _DESCRIPTION_1_000_000:Ljava/lang/String;

.field private static final _DESCRIPTION_300_000:Ljava/lang/String;

.field private static final _DESCRIPTION_3_000_000:Ljava/lang/String;

.field private static final _DESCRIPTION_MARKER:Ljava/lang/String;

.field private static final _notAvailable:Ljava/lang/String;

.field private static itemListCurrency:[Ljava/lang/String;

.field private static itemListDescription:[Ljava/lang/String;

.field private static itemListIDs:[Ljava/lang/String;

.field private static itemListNames:[Ljava/lang/String;

.field private static itemListPrices:[Ljava/lang/String;


# instance fields
.field private ACTIVITY:Landroid/app/Activity;

.field private CONTEXT:Landroid/content/Context;

.field private base64EncodedPublicKey:Ljava/lang/String;

.field private final consumableSkuList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final consumableTokens:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mBillingClientSetupFinished:Z

.field private mBillingManager:Lnet/fishlabs/googleplay/BillingManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, " $"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_MARKER:Ljava/lang/String;

    const-string v0, "100.000"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_100_000:Ljava/lang/String;

    const-string v0, "300.000"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_300_000:Ljava/lang/String;

    const-string v0, "1.000.000"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_1_000_000:Ljava/lang/String;

    const-string v0, "3.000.000"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_3_000_000:Ljava/lang/String;

    const-string v0, "10.000.000"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_10_000_000:Ljava/lang/String;

    const-string v0, "-"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->_notAvailable:Ljava/lang/String;

    const/4 v0, 0x5

    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListCurrency:[Ljava/lang/String;

    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListIDs:[Ljava/lang/String;

    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListNames:[Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListPrices:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableSkuList:Ljava/util/HashMap;

    new-instance p3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p3, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableTokens:Ljava/util/concurrent/ConcurrentHashMap;

    const/4 p3, 0x0

    iput-boolean p3, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingClientSetupFinished:Z

    invoke-direct {p0}, Lnet/fishlabs/googleplay/GooglePlayIAP;->setUpConsumables()V

    iput-object p1, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->CONTEXT:Landroid/content/Context;

    iput-object p2, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->ACTIVITY:Landroid/app/Activity;

    invoke-static {}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012apk()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->base64EncodedPublicKey:Ljava/lang/String;

    new-instance p1, Lnet/fishlabs/googleplay/BillingManager;

    iget-object p2, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->ACTIVITY:Landroid/app/Activity;

    iget-object p3, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->base64EncodedPublicKey:Ljava/lang/String;

    invoke-direct {p1, p2, p0, p3}, Lnet/fishlabs/googleplay/BillingManager;-><init>(Landroid/app/Activity;Lnet/fishlabs/googleplay/BillingManager$BillingUpdatesListener;Ljava/lang/String;)V

    iput-object p1, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    return-void
.end method

.method private alert(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->CONTEXT:Landroid/content/Context;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->CONTEXT:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string p1, "OK"

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method private complain(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lnet/fishlabs/googleplay/GooglePlayIAP;->alert(Ljava/lang/String;)V

    return-void
.end method

.method private setUpConsumables()V
    .locals 5

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_100_000:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_MARKER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_300_000:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_MARKER:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    aput-object v1, v0, v3

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_1_000_000:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_MARKER:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x2

    aput-object v1, v0, v3

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_3_000_000:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_MARKER:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x3

    aput-object v1, v0, v3

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_10_000_000:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->_DESCRIPTION_MARKER:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x4

    aput-object v1, v0, v3

    :goto_0
    const/4 v0, 0x5

    if-ge v2, v0, :cond_0

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListIDs:[Ljava/lang/String;

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->_notAvailable:Ljava/lang/String;

    aput-object v1, v0, v2

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListNames:[Ljava/lang/String;

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->_notAvailable:Ljava/lang/String;

    aput-object v1, v0, v2

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListCurrency:[Ljava/lang/String;

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->_notAvailable:Ljava/lang/String;

    aput-object v1, v0, v2

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListPrices:[Ljava/lang/String;

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->_notAvailable:Ljava/lang/String;

    aput-object v1, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListIDs:[Ljava/lang/String;

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListNames:[Ljava/lang/String;

    sget-object v2, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    sget-object v3, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListCurrency:[Ljava/lang/String;

    sget-object v4, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListPrices:[Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, v4}, Lnet/fishlabs/googleplay/ToJNI;->iapSetNativeItemInformationList([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    invoke-virtual {v0}, Lnet/fishlabs/googleplay/BillingManager;->destroy()V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingClientSetupFinished:Z

    return-void
.end method

.method public getDLC_1_BOUGHT()Z
    .locals 1

    sget-boolean v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_1_BOUGHT:Z

    const/4 v0, 0x1

    return v0
.end method

.method public getDLC_2_BOUGHT()Z
    .locals 1

    sget-boolean v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_2_BOUGHT:Z

    const/4 v0, 0x1

    return v0
.end method

.method public getDLC_3_BOUGHT()Z
    .locals 1

    sget-boolean v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_3_BOUGHT:Z

    const/4 v0, 0x1

    return v0
.end method

.method public getDLC_4_BOUGHT()Z
    .locals 1

    sget-boolean v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_4_BOUGHT:Z

    const/4 v0, 0x1

    return v0
.end method

.method public getDLC_5_BOUGHT()Z
    .locals 1

    sget-boolean v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_5_BOUGHT:Z

    const/4 v0, 0x1

    return v0
.end method

.method public iap_buy_credits_100_000()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x0

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getConsumableSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_credits_10_000_000()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x4

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getConsumableSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_credits_1_000_000()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x2

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getConsumableSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_credits_300_000()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x1

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getConsumableSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_credits_3_000_000()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x3

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getConsumableSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_full_package()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x4

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getPremiumSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_kaamo_club()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x1

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getPremiumSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_supernova()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x2

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getPremiumSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_valkyrie()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x0

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getPremiumSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_buy_vip_package()V
    .locals 3

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    const/4 v1, 0x3

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getPremiumSKU(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "inapp"

    invoke-virtual {v0, v1, v2}, Lnet/fishlabs/googleplay/BillingManager;->initiatePurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public iap_restore_purchases()V
    .locals 1

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    invoke-virtual {v0}, Lnet/fishlabs/googleplay/BillingManager;->queryPurchases()V

    :cond_0
    return-void
.end method

.method public isSetUp()Z
    .locals 1

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingClientSetupFinished:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onBillingClientSetupFinished()V
    .locals 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingClientSetupFinished:Z

    iget-object v0, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableSkuList:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x5

    if-ge v0, v1, :cond_1

    invoke-static {v0}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getConsumableSKU(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableSkuList:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onConsumeFinished(Ljava/lang/String;I)V
    .locals 0

    if-nez p2, :cond_0

    iget-object p2, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableTokens:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {p2}, Lnet/fishlabs/googleplay/ToJNI;->iapBoughtConsumable(I)V

    iget-object p2, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableSkuList:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public onPurchasesUpdated(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x5

    if-ge v1, v2, :cond_1

    invoke-static {v1}, Lnet/fishlabs/googleplay/ToJNI;->gof2hd2012getPremiumSKU(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/Purchase;

    if-nez v1, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lnet/fishlabs/googleplay/ToJNI;->iapBoughtPremium(II)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p0, v2}, Lnet/fishlabs/googleplay/GooglePlayIAP;->setDLC_5_BOUGHT(Z)V

    goto :goto_1

    :pswitch_1
    invoke-virtual {p0, v2}, Lnet/fishlabs/googleplay/GooglePlayIAP;->setDLC_4_BOUGHT(Z)V

    goto :goto_1

    :pswitch_2
    invoke-virtual {p0, v2}, Lnet/fishlabs/googleplay/GooglePlayIAP;->setDLC_3_BOUGHT(Z)V

    goto :goto_1

    :pswitch_3
    invoke-virtual {p0, v2}, Lnet/fishlabs/googleplay/GooglePlayIAP;->setDLC_2_BOUGHT(Z)V

    goto :goto_1

    :pswitch_4
    invoke-virtual {p0, v2}, Lnet/fishlabs/googleplay/GooglePlayIAP;->setDLC_1_BOUGHT(Z)V

    goto :goto_1

    :cond_4
    iget-object v3, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableSkuList:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableTokens:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->mBillingManager:Lnet/fishlabs/googleplay/BillingManager;

    invoke-virtual {v2, v1}, Lnet/fishlabs/googleplay/BillingManager;->consumeAsync(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSkuDetailsResponse(ILjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/SkuDetails;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/billingclient/api/SkuDetails;

    invoke-virtual {p2}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnet/fishlabs/googleplay/GooglePlayIAP;->consumableSkuList:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListPrices:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p2}, Lcom/android/billingclient/api/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v0

    goto :goto_0

    :cond_1
    sget-object p1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListIDs:[Ljava/lang/String;

    sget-object p2, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListNames:[Ljava/lang/String;

    sget-object v0, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListDescription:[Ljava/lang/String;

    sget-object v1, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListCurrency:[Ljava/lang/String;

    sget-object v2, Lnet/fishlabs/googleplay/GooglePlayIAP;->itemListPrices:[Ljava/lang/String;

    invoke-static {p1, p2, v0, v1, v2}, Lnet/fishlabs/googleplay/ToJNI;->iapSetNativeItemInformationList([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public setDLC_1_BOUGHT(Z)V
    .locals 0

    sput-boolean p1, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_1_BOUGHT:Z

    return-void
.end method

.method public setDLC_2_BOUGHT(Z)V
    .locals 0

    sput-boolean p1, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_2_BOUGHT:Z

    return-void
.end method

.method public setDLC_3_BOUGHT(Z)V
    .locals 0

    sput-boolean p1, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_3_BOUGHT:Z

    return-void
.end method

.method public setDLC_4_BOUGHT(Z)V
    .locals 0

    sput-boolean p1, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_4_BOUGHT:Z

    return-void
.end method

.method public setDLC_5_BOUGHT(Z)V
    .locals 0

    sput-boolean p1, Lnet/fishlabs/googleplay/GooglePlayIAP;->DLC_5_BOUGHT:Z

    return-void
.end method
