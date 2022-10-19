Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 908DB604F26
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 19:52:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FAAAC64101;
	Wed, 19 Oct 2022 17:52:26 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3911C55596
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 17:52:24 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id p89so7678934uap.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3rttrwoFo2aK6SVHFCgtGUPYDSGhRampUXyYBkSvNsk=;
 b=QQ06MwDJHkA2VeP3dV5NttbZI1PJK2ek/KVsUEgfr2CNFkF/v0OrIoF7l/4Eh2spKh
 VgEhitUQCYBcaRT/NF2gWswbTqADtgIZGOLfxKU7pcp8Ue49BNJORvEzhkWblWmQUeZr
 1qvIDi0dRAcoxkR1ngS3u8LMJ69H6ZRJzv0xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rttrwoFo2aK6SVHFCgtGUPYDSGhRampUXyYBkSvNsk=;
 b=hwpOl6jn4ttUfPRTD5vvJcScfwhncmYNNGJ5iNN0dLeklNwjaC2yODTLRAAn/bkY6u
 p/HViKMGymbYq8UrtZbrTCQEwM8Wp0VtMW938ubto7pEIqrNCaSi2XoVzmBzZbMzUdXP
 p0V0WqneHVkDl5RzO/wLy6hicpQOUkZm8PDAuhU70vbuJN2PmTz05GyIPAjNbXQD+ZEr
 zVPlWbzjah2IR8WHOoEC0CZLSw15irwGX5wiP5siZXoJufs/lSCeYoXGiGApM5lzypQ0
 hrS/U2iWrVOHC9ILmvA3yjqHmIWvC9mU6XDBoSsX2u0Lar+X+/vDcsyDkAaV3Q9zRFkZ
 kUcg==
X-Gm-Message-State: ACrzQf15m/zji14vyNamOUz2gLxHGteN9KFxkpLe1azTrVzHDIuv3GH2
 DTbsNUcHANWNN5aJgLZJJndy23IrSyVoFFjHAurEvw==
X-Google-Smtp-Source: AMsMyM5iSjyIrU2g6EA2O2fnF5ZAztLE/bzkej5aSSPjVaZ11mCHP6UXC6+bjosT+U20ROXenGz2xoTA/PfE/AV6BM4=
X-Received: by 2002:ab0:5b01:0:b0:39f:9086:8227 with SMTP id
 u1-20020ab05b01000000b0039f90868227mr2237527uae.77.1666201943413; Wed, 19 Oct
 2022 10:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221019112356.1042065-1-sjg@chromium.org>
 <CAJ+vNU2s--gn6OGFqpDi6T_oOLDg6axJnPMhpD6DRKjZbrqO0g@mail.gmail.com>
In-Reply-To: <CAJ+vNU2s--gn6OGFqpDi6T_oOLDg6axJnPMhpD6DRKjZbrqO0g@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 19 Oct 2022 11:52:11 -0600
Message-ID: <CAPnjgZ3i_3TchfNHq+PNUOSiPZi1H0FHPqiZr-VE9NVoBO4dgA@mail.gmail.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Wolfgang Denk <wd@denx.de>,
 Marek Vasut <marex@denx.de>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>, Ian Ray <ian.ray@ge.com>,
 Minkyu Kang <mk7.kang@samsung.com>, Rui Miguel Silva <rui.silva@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Sven Schwermer <sven@svenschwermer.de>, Jason Liu <jason.hui.liu@nxp.com>,
 Mario Six <mario.six@gdsys.cc>, Harald Seiler <hws@denx.de>,
 Vikas Manocha <vikas.manocha@st.com>, Icenowy Zheng <icenowy@aosc.io>,
 Michal Suchanek <msuchanek@suse.de>, Ye Li <ye.li@nxp.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>, Samuel Holland <samuel@sholland.org>,
 Ilko Iliev <iliev@ronetix.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Andrew Scull <ascull@google.com>, Suniel Mahesh <sunil@amarulasolutions.com>,
 Jens Scharsig <esw@bus-elektronik.de>, Michal Simek <michal.simek@amd.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Anatolij Gustschin <agust@denx.de>,
 =?UTF-8?Q?Antti_M=C3=A4entausta?= <antti.maentausta@ge.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Artem Lapkin <email2tema@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Jesse Taube <Mr.Bossman075@gmail.com>, John Keeping <john@metanate.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alban Bedel <alban.bedel@avionic-design.de>
Subject: Re: [Uboot-stm32] [PATCH 00/39] lcd: Drop old LCD support
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Tim,

On Wed, 19 Oct 2022 at 11:07, Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Wed, Oct 19, 2022 at 4:58 AM Simon Glass <sjg@chromium.org> wrote:
> >
> > The conversion to DM_VIDEO was completed some years ago. The old video
> > code has been removed but the LCD code remains. This series removes it,
> > to complete the driver model migration.
> >
> >
> > Simon Glass (39):
> >   video: Split SPLASH_SCREEN_ALIGN from bmp command
> >   Convert CONFIG_HIDE_LOGO_VERSION to Kconfig
> >   video: Rename CONFIG_SYS_VIDEO_LOGO_MAX_SIZE
> >   Convert CONFIG_VIDEO_LOGO_MAX_SIZE to Kconfig
> >   video: lcd: Drop console rotation
> >   video: Drop CONFIG_LCD_ALIGNMENT
> >   video: Drop CONFIG_LCD_MENU
> >   video: Drop CONFIG_LCD_INFO_BELOW_LOGO
> >   video: Drop CONFIG_LCD_INFO
> >   video: Move bmp_display() prototype to video.h
> >   api: Drop LCD implementation
> >   Drop CONFIG_LCD_LOGO
> >   video: Drop VCXK video controller
> >   BuR: Drop old LCD code
> >   video: Drop CONFIG_AM335X_LCD
> >   video: atmel: Drop pre-DM parts of video driver
> >   video: Drop ld9040 driver
> >   video: atmel: Drop CONFIG_LCD_IN_PSRAM
> >   treewide: Stop enabling CONFIG_LCD
> >   video: Drop atmel LCD code
> >   video: samsung: Drop old LCD code
> >   nexell: Drop old LCD code
> >   compulab: Drop old LCD code
> >   tegra: Drop old LCD code
> >   BuR: ronetix: siemens: Drop old LCD code
> >   video: cmd: Drop old LCD code
> >   efi: Drop old LCD code
> >   video: Drop remaining references to CONFIG_LCD
> >   fdt: Drop support for LCD fixup in simplefb
> >   video: Drop LCD_BPP
> >   video: Drop CONFIG_VIDEO
> >   video: Drop CONFIG_VIDEO
> >   video: Drop CONFIG_LCD
> >   video: Drop use of the lcd header file
> >   video: Drop common LCD implementation
> >   video: Drop SPLASHIMAGE_CALLBACK
> >   video: Make all video options depend on DM_VIDEO
> >   pci: Drop test for DM_VIDEO
> >   video: Rename CONFIG_DM_VIDEO to CONFIG_VIDEO
> >
>
> Simon,
>
> Where can I find a repo with this series for testing? I can't get it
> to apply to master/next.

It is u-boot-dm/lcd-working

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
