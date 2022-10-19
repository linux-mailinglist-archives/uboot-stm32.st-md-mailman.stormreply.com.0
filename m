Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA0607164
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Oct 2022 09:48:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D121C65041;
	Fri, 21 Oct 2022 07:48:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80FA8C63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 17:06:56 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d10so17824957pfh.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yQsn4kpw9rF/7GBncURCqQaRulPzd466kir4VV7o2wE=;
 b=UcFY6t7dWsIzOAf7avIkFnrTxw760VT39B2wT/xjWlq0TDTwFgQnijr3k1Ct/W1vTV
 x/z2GIMUX9CerRtqlvNAzjkKCWa7pkQq8Xj8AYmHU55fY9cSj42uFqz9grUfR2kHt2nb
 NAHjl2J97GNLrjllsPodfyy/+xjjyA6/jEbhh34d1gd/t+Hcz+6FWSwnHp288xACv1LK
 fZePNgUCpGlUfOvY2DMBek205hKh55n7IIt/OM4SxN5dQnuXkibIqGy7AthONID+hFVC
 sibaG+a3jgC4yWgAzAMvlFc/tFW09Nvli5JJ7zlLtXGN5AIQkdEUAVFqSL1K7icySi2u
 JN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQsn4kpw9rF/7GBncURCqQaRulPzd466kir4VV7o2wE=;
 b=Y+/yXlTalh5raXUP+Bz/ZP2X22fuEqNab3Zg7T7WOUizTwjfEaPN+zDxAoh/qhH2a6
 fdcOalQ7Xvx+6yqQucxAIv68fbwTIEsu0ORwoW+D3CjnsFXUuToPLiB28yNdipCRpZWS
 0YxuC0R1jlKW1qNr9219NbApvKYFLda6DiX3nCB/fr3+J4TcKJ5DQV4fRI0LhNIky6RI
 oc5mXlJkdNBOjtICbj5EWhgr263QmpbOMvAm6jTYALcVvQTyk+3pS3qfS3uKmF/bSNNX
 NKqE/W/+yEhlo2LObmW1G7sKfxqVknLgqNkgAWhfPH8sZlM5Jjj1q9sTKVD0owVPEgHZ
 flJQ==
X-Gm-Message-State: ACrzQf0TSpaOBeDZ4WdYGXtf3Qeff6cZLAWVVUoOOJMw+0DPi/QZ2V3B
 /zLfrP2VXpu/AWICPY9ipeHJUqbMMTMsOTT7PSwLFQ==
X-Google-Smtp-Source: AMsMyM7wmvq5S8dAULBMC4NQXki/9JLQCQrrN07QfVUWT+vQifWy0C7xo01FCgzzDNx5k3u+D9lBAjAjrsMEDXBC7KY=
X-Received: by 2002:a63:1508:0:b0:438:eb90:52d1 with SMTP id
 v8-20020a631508000000b00438eb9052d1mr8235415pgl.252.1666199214985; Wed, 19
 Oct 2022 10:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221019112356.1042065-1-sjg@chromium.org>
In-Reply-To: <20221019112356.1042065-1-sjg@chromium.org>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 19 Oct 2022 10:06:42 -0700
Message-ID: <CAJ+vNU2s--gn6OGFqpDi6T_oOLDg6axJnPMhpD6DRKjZbrqO0g@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:48:23 +0000
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

On Wed, Oct 19, 2022 at 4:58 AM Simon Glass <sjg@chromium.org> wrote:
>
> The conversion to DM_VIDEO was completed some years ago. The old video
> code has been removed but the LCD code remains. This series removes it,
> to complete the driver model migration.
>
>
> Simon Glass (39):
>   video: Split SPLASH_SCREEN_ALIGN from bmp command
>   Convert CONFIG_HIDE_LOGO_VERSION to Kconfig
>   video: Rename CONFIG_SYS_VIDEO_LOGO_MAX_SIZE
>   Convert CONFIG_VIDEO_LOGO_MAX_SIZE to Kconfig
>   video: lcd: Drop console rotation
>   video: Drop CONFIG_LCD_ALIGNMENT
>   video: Drop CONFIG_LCD_MENU
>   video: Drop CONFIG_LCD_INFO_BELOW_LOGO
>   video: Drop CONFIG_LCD_INFO
>   video: Move bmp_display() prototype to video.h
>   api: Drop LCD implementation
>   Drop CONFIG_LCD_LOGO
>   video: Drop VCXK video controller
>   BuR: Drop old LCD code
>   video: Drop CONFIG_AM335X_LCD
>   video: atmel: Drop pre-DM parts of video driver
>   video: Drop ld9040 driver
>   video: atmel: Drop CONFIG_LCD_IN_PSRAM
>   treewide: Stop enabling CONFIG_LCD
>   video: Drop atmel LCD code
>   video: samsung: Drop old LCD code
>   nexell: Drop old LCD code
>   compulab: Drop old LCD code
>   tegra: Drop old LCD code
>   BuR: ronetix: siemens: Drop old LCD code
>   video: cmd: Drop old LCD code
>   efi: Drop old LCD code
>   video: Drop remaining references to CONFIG_LCD
>   fdt: Drop support for LCD fixup in simplefb
>   video: Drop LCD_BPP
>   video: Drop CONFIG_VIDEO
>   video: Drop CONFIG_VIDEO
>   video: Drop CONFIG_LCD
>   video: Drop use of the lcd header file
>   video: Drop common LCD implementation
>   video: Drop SPLASHIMAGE_CALLBACK
>   video: Make all video options depend on DM_VIDEO
>   pci: Drop test for DM_VIDEO
>   video: Rename CONFIG_DM_VIDEO to CONFIG_VIDEO
>

Simon,

Where can I find a repo with this series for testing? I can't get it
to apply to master/next.

Best Regards,

Tim
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
