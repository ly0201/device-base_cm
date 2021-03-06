.class public Landroid/hardware/fingerprint/Fingerprint;
.super Ljava/lang/Object;
.source "Fingerprint.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/hardware/fingerprint/Fingerprint$JsonSerializer;,
        Landroid/hardware/fingerprint/Fingerprint$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/hardware/fingerprint/Fingerprint;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mFingerId:I

.field private mName:Ljava/lang/String;

.field private mUserId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-class v0, Landroid/hardware/fingerprint/Fingerprint;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/hardware/fingerprint/Fingerprint;->TAG:Ljava/lang/String;

    new-instance v0, Landroid/hardware/fingerprint/Fingerprint$1;

    invoke-direct {v0}, Landroid/hardware/fingerprint/Fingerprint$1;-><init>()V

    sput-object v0, Landroid/hardware/fingerprint/Fingerprint;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mFingerId:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mUserId:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Landroid/hardware/fingerprint/Fingerprint$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Landroid/hardware/fingerprint/Fingerprint$1;

    .prologue
    invoke-direct {p0, p1}, Landroid/hardware/fingerprint/Fingerprint;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "fingerId"    # Ljava/lang/Integer;
    .param p3, "userId"    # Ljava/lang/Integer;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/hardware/fingerprint/Fingerprint;->mName:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mFingerId:I

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mUserId:I

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    sget-object v0, Landroid/hardware/fingerprint/Fingerprint;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public getFingerId()Ljava/lang/Integer;
    .locals 1

    .prologue
    iget v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mFingerId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getUserId()Ljava/lang/Integer;
    .locals 1

    .prologue
    iget v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mUserId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    iget-object v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mFingerId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/hardware/fingerprint/Fingerprint;->mUserId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
