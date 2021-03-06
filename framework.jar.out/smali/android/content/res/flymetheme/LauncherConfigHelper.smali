.class public Landroid/content/res/flymetheme/LauncherConfigHelper;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "LauncherConfigHelper.java"


# static fields
.field public static final ATTR_NAME:Ljava/lang/String; = "name"

.field public static final TAG_CONFIG:Ljava/lang/String; = "config"

.field public static final TAG_ROOT:Ljava/lang/String; = "meizu_theme_values"


# instance fields
.field public final DRAW_DATE:Ljava/lang/String;

.field public final DRAW_SHADOW:Ljava/lang/String;

.field public final LOCKSCREEN_CHARGING_ANIM:Ljava/lang/String;

.field private mAttrName:Ljava/lang/String;

.field private mCurrentFlag:Z

.field private mLauncherConfig:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPreTag:Ljava/lang/String;

.field private mZipThemeManager:Landroid/content/res/flymetheme/MtpkManager;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    const-string v0, "draw_date"

    iput-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->DRAW_DATE:Ljava/lang/String;

    const-string v0, "draw_shadow"

    iput-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->DRAW_SHADOW:Ljava/lang/String;

    const-string v0, "lockscreen_charging_anim"

    iput-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->LOCKSCREEN_CHARGING_ANIM:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mLauncherConfig:Ljava/util/HashMap;

    iput-object v2, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mPreTag:Ljava/lang/String;

    iput-object v2, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mAttrName:Ljava/lang/String;

    iput-boolean v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mCurrentFlag:Z

    iput-boolean v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mCurrentFlag:Z

    invoke-virtual {p0}, Landroid/content/res/flymetheme/LauncherConfigHelper;->load()V

    return-void
.end method

.method private initFlymeThemeZipManager()V
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mZipThemeManager:Landroid/content/res/flymetheme/MtpkManager;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/res/flymetheme/MtpkManager;

    invoke-direct {v0}, Landroid/content/res/flymetheme/MtpkManager;-><init>()V

    iput-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mZipThemeManager:Landroid/content/res/flymetheme/MtpkManager;

    :cond_0
    return-void
.end method

.method private parseConfigFromXml(Ljava/io/InputStream;)V
    .locals 5
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    .local v3, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .local v2, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    .local v1, "reader":Lorg/xml/sax/XMLReader;
    invoke-interface {v1, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v1, v4}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .end local v1    # "reader":Lorg/xml/sax/XMLReader;
    .end local v2    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v3    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    :catch_0
    move-exception v4

    goto :goto_0

    :catch_1
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    const-string v4, "themeValueParser"

    invoke-static {v4, v0}, Landroid/content/res/flymetheme/FlymeLogUtil;->exception(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "themeValueParser"

    invoke-static {v4, v0}, Landroid/content/res/flymetheme/FlymeLogUtil;->exception(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public characters([CII)V
    .locals 3
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    iget-object v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mPreTag:Ljava/lang/String;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .local v0, "con":Ljava/lang/String;
    iget-object v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mPreTag:Ljava/lang/String;

    const-string v2, "config"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Ljava/lang/String;

    .end local v0    # "con":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p3}, Ljava/lang/String;-><init>([CII)V

    .restart local v0    # "con":Ljava/lang/String;
    iget-object v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mAttrName:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Landroid/content/res/flymetheme/LauncherConfigHelper;->setLauncherConfig(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mPreTag:Ljava/lang/String;

    goto :goto_0
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p2

    .local v0, "tagName":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "meizu_theme_values"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mCurrentFlag:Z

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .end local v0    # "tagName":Ljava/lang/String;
    :cond_1
    move-object v0, p3

    goto :goto_0
.end method

.method public getLauncherConfig(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mLauncherConfig:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/content/res/flymetheme/LauncherConfigHelper;->load()V

    :cond_0
    iget-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mLauncherConfig:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public load()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .local v0, "is":Ljava/io/InputStream;
    iget-object v2, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mZipThemeManager:Landroid/content/res/flymetheme/MtpkManager;

    if-nez v2, :cond_0

    invoke-direct {p0}, Landroid/content/res/flymetheme/LauncherConfigHelper;->initFlymeThemeZipManager()V

    :cond_0
    const-string v1, "theme_values.xml"

    .local v1, "resPath":Ljava/lang/String;
    iget-object v2, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mZipThemeManager:Landroid/content/res/flymetheme/MtpkManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/res/flymetheme/MtpkManager;->getStreamFromIcon(Ljava/lang/String;Landroid/util/TypedValue;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Landroid/content/res/flymetheme/LauncherConfigHelper;->parseConfigFromXml(Ljava/io/InputStream;)V

    :cond_1
    return-void
.end method

.method public setLauncherConfig(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mLauncherConfig:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    move-object v0, p2

    .local v0, "tagName":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "meizu_theme_values"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mCurrentFlag:Z

    :cond_0
    iget-boolean v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mCurrentFlag:Z

    if-eqz v1, :cond_1

    const-string v1, "config"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "name"

    invoke-interface {p4, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mAttrName:Ljava/lang/String;

    :cond_1
    iput-object p2, p0, Landroid/content/res/flymetheme/LauncherConfigHelper;->mPreTag:Ljava/lang/String;

    return-void

    .end local v0    # "tagName":Ljava/lang/String;
    :cond_2
    move-object v0, p3

    goto :goto_0
.end method
