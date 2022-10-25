Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC560D651
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Oct 2022 23:48:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E066C03FC9;
	Tue, 25 Oct 2022 21:48:51 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74B80C01E96
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 21:48:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id p3so11215029pld.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oHz6gxfxxE5j0bGS8weH1NZrnwjLmuT+6Q/cdK5U6Hw=;
 b=6LhoHdHenfnlKpDihsa3bJpA2GCSsSS9oGIauaoxiPcKNuLH2lQ/LRuagA900O1aBC
 0XXIi2zJBEDDYAXORslaOvAwVeB9yWx88n8WDEDz4IkcX2Foj6yMvVD9ADwxFDdNYab7
 rQiaBJKBXuIoeQqpG3Ey4u52rqN+vC4uwy8VnX2w8SpXe8UoGbEeaLNUYgbfXWrW5zBf
 p8jhZ4UPsPGDcZH1FYyTToh9DHLIJlPmLx30asWDRusEDxFvNprRXKAxI/2IR0Zcbyqi
 UZC6stdP4yUhfELpuWs8503YemIQNhlwNiior0b9Oaf0s5Iu5gPqtY/5mF1xLuvH+qHf
 M6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oHz6gxfxxE5j0bGS8weH1NZrnwjLmuT+6Q/cdK5U6Hw=;
 b=HESXzRMYRgqKG8ohlQ9cOubXrU8aptkv30FRxaKMzDn3Sn7wcjHJFvAaf/Au8ErwsB
 mrrntizPWUtqF3U2fm2j0Y07qJApQ4kNL8pk4yopbHu6qPcgXnUNaLvLXbK7I88x2fIv
 vUs4/oqptgeHl/4HmvgJDpMwCgJWmkvqJ52jYwog3CkcMAH+YQMRPOuXbD5d6Ce0dqfv
 mFrDpDHea6I6Vdk+EDsSX7cyI6UN1H3fZ7OpHFw8raoU1koYXBo2pe2taCIZGh/CDnuC
 PHHX/BEYfLmyoobRyPFu1YhUVnIdBIPUQ66/6+pt4P5srt0Fr2SrpSWtWXFGp3205a2B
 8psQ==
X-Gm-Message-State: ACrzQf1Y0q//Su9Bfbbur1yZnWtBM+Iy6tQCOY8FFOVAGd7ohrCjZwFT
 2L2ycw2hX4+4nZAPI8zLUch8pHurejF5NaXoGX8Zwg==
X-Google-Smtp-Source: AMsMyM41zHwLiM1g17OJldfVEff/Jjn5xxer+4RdglUr97YQo1TI6ixWCuDz8LYR8kQ1l9xYy4G/GET5e3NR8fMCywA=
X-Received: by 2002:a17:902:d490:b0:186:c544:8ac7 with SMTP id
 c16-20020a170902d49000b00186c5448ac7mr4083173plg.158.1666734527885; Tue, 25
 Oct 2022 14:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221019112356.1042065-1-sjg@chromium.org>
 <CAJ+vNU2s--gn6OGFqpDi6T_oOLDg6axJnPMhpD6DRKjZbrqO0g@mail.gmail.com>
 <CAPnjgZ3i_3TchfNHq+PNUOSiPZi1H0FHPqiZr-VE9NVoBO4dgA@mail.gmail.com>
In-Reply-To: <CAPnjgZ3i_3TchfNHq+PNUOSiPZi1H0FHPqiZr-VE9NVoBO4dgA@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 25 Oct 2022 14:48:35 -0700
Message-ID: <CAJ+vNU0OrwFtGE=7xx-0dzf6Q5AjRqD93T=S-9zW2SUf47ZJkQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
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

On Wed, Oct 19, 2022 at 10:52 AM Simon Glass <sjg@chromium.org> wrote:
>
> Hi Tim,
>
> On Wed, 19 Oct 2022 at 11:07, Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 4:58 AM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > The conversion to DM_VIDEO was completed some years ago. The old video
> > > code has been removed but the LCD code remains. This series removes it,
> > > to complete the driver model migration.
> > >
> > >
> > > Simon Glass (39):
> > >   video: Split SPLASH_SCREEN_ALIGN from bmp command
> > >   Convert CONFIG_HIDE_LOGO_VERSION to Kconfig
> > >   video: Rename CONFIG_SYS_VIDEO_LOGO_MAX_SIZE
> > >   Convert CONFIG_VIDEO_LOGO_MAX_SIZE to Kconfig
> > >   video: lcd: Drop console rotation
> > >   video: Drop CONFIG_LCD_ALIGNMENT
> > >   video: Drop CONFIG_LCD_MENU
> > >   video: Drop CONFIG_LCD_INFO_BELOW_LOGO
> > >   video: Drop CONFIG_LCD_INFO
> > >   video: Move bmp_display() prototype to video.h
> > >   api: Drop LCD implementation
> > >   Drop CONFIG_LCD_LOGO
> > >   video: Drop VCXK video controller
> > >   BuR: Drop old LCD code
> > >   video: Drop CONFIG_AM335X_LCD
> > >   video: atmel: Drop pre-DM parts of video driver
> > >   video: Drop ld9040 driver
> > >   video: atmel: Drop CONFIG_LCD_IN_PSRAM
> > >   treewide: Stop enabling CONFIG_LCD
> > >   video: Drop atmel LCD code
> > >   video: samsung: Drop old LCD code
> > >   nexell: Drop old LCD code
> > >   compulab: Drop old LCD code
> > >   tegra: Drop old LCD code
> > >   BuR: ronetix: siemens: Drop old LCD code
> > >   video: cmd: Drop old LCD code
> > >   efi: Drop old LCD code
> > >   video: Drop remaining references to CONFIG_LCD
> > >   fdt: Drop support for LCD fixup in simplefb
> > >   video: Drop LCD_BPP
> > >   video: Drop CONFIG_VIDEO
> > >   video: Drop CONFIG_VIDEO
> > >   video: Drop CONFIG_LCD
> > >   video: Drop use of the lcd header file
> > >   video: Drop common LCD implementation
> > >   video: Drop SPLASHIMAGE_CALLBACK
> > >   video: Make all video options depend on DM_VIDEO
> > >   pci: Drop test for DM_VIDEO
> > >   video: Rename CONFIG_DM_VIDEO to CONFIG_VIDEO
> > >
> >
> > Simon,
> >
> > Where can I find a repo with this series for testing? I can't get it
> > to apply to master/next.
>
> It is u-boot-dm/lcd-working
>
> Regards,
> Simon

Simon,

Thanks. I've tested the series with gwventana_nand with an LVDS
display as well as HDMI and the custom splash/position work fine as
well as vidconsole.

Tested-by: Tim Harvey <tharvey@gateworks.com> # gwventana /
gwventana_nand_defconfig

Best Regards,

Tim
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
