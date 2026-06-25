Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i3dGEb5IPWoy0wgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 17:26:54 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC726C70C6
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 17:26:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=G7Akid4H;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D13EC424DB;
	Thu, 25 Jun 2026 15:26:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D287AC1A979
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 07:21:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1137FC5CD49;
 Thu, 25 Jun 2026 07:21:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AE62D5FF03;
 Thu, 25 Jun 2026 07:21:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C43B106C8077; 
 Thu, 25 Jun 2026 09:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1782372094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=T5oJEDv/K5/IwhBeZzSILN/UL4wRUN7YnsNOwhZwILA=;
 b=G7Akid4HBiwTK4eCBkXNRvhHQG0owIBDwppX7RVg5KFW8ndETgmIfVwxsc+/tHdZJnYSuU
 4GqdZ/nnNHPeAn4CBL9COd8R/TwHBaQ1zsBswWVFD+q4RWq6Z+YLZnS1MbsnZm/JT62dIl
 ZISR1ZIvB4ErWnLmPk/MGRVUG3la6puxRE8UPdhPnTWyx99wQPmb9/PWVZY3OAoGgXZ3tt
 /vYqqz8tWCTRPoIT032mRza8j/p7pXYehYEaIjbEYZIGMhAPQOkjVnvs3Ko+ReH7/I/gwH
 J/ZMvcwgPJsrNQ6eu3kJSTfKYv8dHOLgfvUK59eZMi2C1eEDyzEdKKdHh1aTPg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Anshul Dalal <anshuld@ti.com>
Date: Thu, 25 Jun 2026 09:17:05 +0200
Message-ID: <keCefQZkQsG-lBkXoiS3bg@bootlin.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 25 Jun 2026 15:26:52 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, "Lucien. Jheng" <lucienzx159@gmail.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alice Guo <alice.guo@nxp.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Nick Hu <nick.hu@sifive.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mateus Lima Alves <mateuslima.ti@gmail.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Beiyan Yun <root@infi.wang>, Anshul Dalal <anshuld@ti.com>,
 Jonathan Stroud <jonathan.stroud@amd.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh <dinesh.maniyam@altera.com>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>,
 Angelo Dureghello <angelo@kernel-space.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>, Alexey Charkov <alchark@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
Content-Type: multipart/mixed; boundary="===============7166931916572801318=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,cherry.de,rock-chips.com,collabora.com,thingy.jp,ti.com,sifive.com,gmail.com,denx.de,konsulko.com,korsgaard.com,arm.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,bootlin.com,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,chromium.org,foss.st.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[romain.gantois@bootlin.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFC726C70C6

--===============7166931916572801318==
Content-Type: multipart/signed; boundary="nextPartUZwYaGtmRS6txwwpAygINA";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPartUZwYaGtmRS6txwwpAygINA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH] treewide: Kconfig: use bool instead of tristate
Date: Thu, 25 Jun 2026 09:17:05 +0200
Message-ID: <keCefQZkQsG-lBkXoiS3bg@bootlin.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
MIME-Version: 1.0

On Thursday, 25 June 2026 05:17:06 CEST Anshul Dalal wrote:
> U-Boot does not support modules, so having tristate options is useless.
> 
> Therefore this patch does a blind replace of all tristate options to
> bool tree-wide.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> CI: https://github.com/u-boot/u-boot/pull/998
> ---
> 
>  board/st/common/Kconfig      | 2 +-
>  cmd/Kconfig                  | 4 ++--
>  drivers/cache/Kconfig        | 2 +-
>  drivers/clk/Kconfig          | 2 +-
>  drivers/firmware/Kconfig     | 2 +-
>  drivers/i2c/Kconfig          | 6 +++---
>  drivers/i2c/muxes/Kconfig    | 6 +++---
>  drivers/i3c/Kconfig          | 2 +-
>  drivers/i3c/master/Kconfig   | 2 +-
>  drivers/memory/Kconfig       | 2 +-
>  drivers/misc/Kconfig         | 2 +-
>  drivers/mmc/Kconfig          | 4 ++--
>  drivers/mtd/nand/Kconfig     | 2 +-
>  drivers/net/phy/Kconfig      | 4 ++--
>  drivers/spi/Kconfig          | 2 +-
>  drivers/ufs/Kconfig          | 2 +-
>  drivers/usb/cdns3/Kconfig    | 6 +++---
>  drivers/usb/musb-new/Kconfig | 2 +-
>  drivers/usb/tcpm/Kconfig     | 4 ++--
>  19 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index 3d00f3f3331..aafbffbf6db 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -14,7 +14,7 @@ config DFU_ALT_RAM0
> 
>           This defines the partitions of ram used to build dfu dynamically.
>  
>  config TYPEC_STUSB160X
> 
> -       tristate "STMicroelectronics STUSB160X Type-C controller driver"
> +       bool "STMicroelectronics STUSB160X Type-C controller driver"
> 
>         depends on DM_I2C
>         help
>         
>           Say Y if your system has STMicroelectronics STUSB160X Type-C port
> 
> diff --git a/cmd/Kconfig b/cmd/Kconfig
> index 032e55e8127..452d11fc493 100644
> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -3177,7 +3177,7 @@ config CMD_STACKPROTECTOR_TEST
> 
>  endmenu
>  
>  config CMD_UBI
> 
> -       tristate "Enable UBI - Unsorted block images commands"
> +       bool "Enable UBI - Unsorted block images commands"
> 
>         select MTD_UBI
>         help
>         
>           UBI is a software layer above MTD layer which admits use of
> 
> LVM-like @@ -3197,7 +3197,7 @@ config CMD_UBI_RENAME
> 
>            ubi rename <oldname> <newname>
>  
>  config CMD_UBIFS
> 
> -       tristate "Enable UBIFS - Unsorted block images filesystem commands"
> +       bool "Enable UBIFS - Unsorted block images filesystem commands"
> 
>         depends on CMD_UBI
>         default y if CMD_UBI
>         select LZO
> 
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 3bf5c7f5dbf..5ebc8842acd 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -14,7 +14,7 @@ config CACHE
> 
>           configuring settings that be found from a device tree file.
>  
>  config L2X0_CACHE
> 
> -       tristate "PL310 cache driver"
> +       bool "PL310 cache driver"
> 
>         select CACHE
>         depends on ARM
>         help
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c2da7b3938b..9080a9750d8 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -216,7 +216,7 @@ config CLK_HSDK
> 
>           Synopsys ARC HSDK-4xD boards
>  
>  config CLK_VERSACLOCK
> 
> -       tristate "Enable VersaClock 5/6 devices"
> +       bool "Enable VersaClock 5/6 devices"
> 
>         depends on CLK
>         depends on CLK_CCF
>         depends on OF_CONTROL
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 220de731950..f524f741e54 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -14,7 +14,7 @@ config ARM_PSCI_FW
> 
>         select FIRMWARE
>  
>  config TI_SCI_PROTOCOL
> 
> -       tristate "TI System Control Interface (TISCI) Message Protocol"
> +       bool "TI System Control Interface (TISCI) Message Protocol"
> 
>         depends on K3_SEC_PROXY
>         select DEVRES
>         select FIRMWARE
> 
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index 8c2f71b9fe2..063db80b7bb 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -98,7 +98,7 @@ config SYS_I2C_EARLY_INIT
> 
>           board_early_init_f.
>  
>  config I2C_CROS_EC_TUNNEL
> 
> -       tristate "Chrome OS EC tunnel I2C bus"
> +       bool "Chrome OS EC tunnel I2C bus"
> 
>         depends on CROS_EC
>         help
>         
>           This provides an I2C bus that will tunnel i2c commands through to
> 
> @@ -213,14 +213,14 @@ config SYS_FSL_I2C4_OFFSET
> 
>  endif
>  
>  config SYS_I2C_CADENCE
> 
> -       tristate "Cadence I2C Controller"
> +       bool "Cadence I2C Controller"
> 
>         depends on DM_I2C
>         help
>         
>           Say yes here to select Cadence I2C Host Controller. This
> 
> controller is e.g. used by Xilinx Zynq.
> 
>  config SYS_I2C_CA
> 
> -       tristate "Cortina-Access I2C Controller"
> +       bool "Cortina-Access I2C Controller"
> 
>         depends on DM_I2C && CORTINA_PLATFORM
>         help
>         
>           Add support for the Cortina Access I2C host controller.
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index 3b1220b2105..89a4b82458a 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -26,14 +26,14 @@ config I2C_ARB_GPIO_CHALLENGE
> 
>           a GPIO.
>  
>  config I2C_MUX_PCA9541
> 
> -       tristate "NXP PCA9541 I2C Master Selector"
> +       bool "NXP PCA9541 I2C Master Selector"
> 
>         depends on I2C_MUX
>         help
>         
>           If you say yes here you get support for the NXP PCA9541
>           I2C Master Selector.
>  
>  config I2C_MUX_PCA954x
> 
> -       tristate "TI PCA954x I2C Mux/switches"
> +       bool "TI PCA954x I2C Mux/switches"
> 
>         depends on I2C_MUX
>         help
>         
>           If you say yes here you get support for the TI PCA954x I2C
> 
> mux/switch @@ -49,7 +49,7 @@ config I2C_MUX_PCA954x
> 
>                 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
>  
>  config I2C_MUX_GPIO
> 
> -        tristate "GPIO-based I2C multiplexer"
> +       bool "GPIO-based I2C multiplexer"
> 
>         depends on I2C_MUX && DM_GPIO
>         select DEVRES
>         help
> 
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 48341f9b873..41a4177b3ae 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -1,5 +1,5 @@
> 
>  menuconfig I3C
> 
> -       tristate "I3C support"
> +       bool "I3C support"
> 
>         select I2C
>         select DEVRES
>         help
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 79776f60ae4..63467ef9cc2 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -1,5 +1,5 @@
> 
>  config DW_I3C_MASTER
> 
> -       tristate "Synopsys DesignWare I3C master driver"
> +       bool "Synopsys DesignWare I3C master driver"
> 
>         depends on I3C
>         help
>         
>           Support for Synopsys DesignWare MIPI I3C Controller.
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 591d9d9c656..adec8efd58c 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -55,7 +55,7 @@ config STM32_OMM
> 
>             - the time between 2 transactions in multiplexed mode.
>  
>  config TI_AEMIF
> 
> -       tristate "Texas Instruments AEMIF driver"
> +       bool "Texas Instruments AEMIF driver"
> 
>         depends on ARCH_KEYSTONE || ARCH_DAVINCI
>         help
>         
>           This driver is for the AEMIF module available in Texas Instruments
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index ea785793d18..8205b501c7f 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -505,7 +505,7 @@ config TURRIS_OMNIA_MCU
> 
>           board power off.
>  
>  config USB_HUB_USB251XB
> 
> -       tristate "USB251XB Hub Controller Configuration Driver"
> +       bool "USB251XB Hub Controller Configuration Driver"
> 
>         depends on I2C
>         help
>         
>           This option enables support for configuration via SMBus of the
> 
> diff --git a/drivers/mmc/Kconfig b/drivers/mmc/Kconfig
> index 0996d9fc30d..8ddea79741b 100644
> --- a/drivers/mmc/Kconfig
> +++ b/drivers/mmc/Kconfig
> @@ -576,7 +576,7 @@ config MMC_SDHCI_ATMEL
> 
>           specification.
>  
>  config MMC_SDHCI_BCM2835
> 
> -       tristate "SDHCI support for the BCM2835 SD/MMC Controller"
> +       bool "SDHCI support for the BCM2835 SD/MMC Controller"
> 
>         depends on ARCH_BCM283X
>         depends on MMC_SDHCI
>         select MMC_SDHCI_IO_ACCESSORS
> 
> @@ -589,7 +589,7 @@ config MMC_SDHCI_BCM2835
> 
>           If unsure, say N.
>  
>  config MMC_SDHCI_BCMSTB
> 
> -       tristate "SDHCI support for the BCMSTB SD/MMC Controller"
> +       bool "SDHCI support for the BCMSTB SD/MMC Controller"
> 
>         depends on MMC_SDHCI && (ARCH_BCMSTB || ARCH_BCM283X)
>         help
>         
>           This selects the Broadcom set-top box SD/MMC controller.
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 78ae04bdcba..5ffec9502b6 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -1,5 +1,5 @@
> 
>  config MTD_NAND_CORE
> 
> -       tristate
> +       bool
> 
>  source "drivers/mtd/nand/raw/Kconfig"
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 0025c895f12..98d686d9f41 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -233,7 +233,7 @@ config PHY_MICREL_KSZ8XXX
> 
>  endif # PHY_MICREL
>  
>  config PHY_MOTORCOMM
> 
> -       tristate "Motorcomm PHYs"
> +       bool "Motorcomm PHYs"
> 
>         help
>         
>           Enables support for Motorcomm network PHYs.
>           Currently supports the YT8511 and YT8531 Gigabit Ethernet PHYs.
> 
> @@ -246,7 +246,7 @@ config PHY_NATSEMI
> 
>         bool "National Semiconductor Ethernet PHYs support"
>  
>  config PHY_NXP_C45_TJA11XX
> 
> -       tristate "NXP C45 TJA11XX PHYs"
> +       bool "NXP C45 TJA11XX PHYs"
> 
>         select DEVRES
>         help
>         
>           Enable support for NXP C45 TJA11XX PHYs.
> 
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index cfbedd64c4c..85016ec84b9 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -548,7 +548,7 @@ config SOFT_SPI
> 
>          the SPI protocol.
>  
>  config SPI_SN_F_OSPI
> 
> -       tristate "Socionext F_OSPI SPI flash controller"
> +       bool "Socionext F_OSPI SPI flash controller"
> 
>         select SPI_MEM
>         help
>         
>           This enables support for the Socionext F_OSPI controller
> 
> diff --git a/drivers/ufs/Kconfig b/drivers/ufs/Kconfig
> index 49472933de3..6ddf0820102 100644
> --- a/drivers/ufs/Kconfig
> +++ b/drivers/ufs/Kconfig
> @@ -24,7 +24,7 @@ config UFS_CADENCE
> 
>           controller present on present TI's J721e devices.
>  
>  config UFS_MEDIATEK
> 
> -       tristate "MediaTek UFS Host Controller Driver"
> +       bool "MediaTek UFS Host Controller Driver"
> 
>         depends on UFS && ARCH_MEDIATEK
>         select PHY_MTK_UFS
>         help
> 
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index 7964f3f41d5..ad0ef8ac2ba 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -1,5 +1,5 @@
> 
>  config USB_CDNS3
> 
> -       tristate "Cadence USB3 Dual-Role Controller"
> +       bool "Cadence USB3 Dual-Role Controller"
> 
>         depends on USB_XHCI_HCD || USB_GADGET
>         select DEVRES
>         help
> 
> @@ -51,14 +51,14 @@ config SPL_USB_CDNS3_HOST
> 
>           standard XHCI driver.
>  
>  config USB_CDNS3_STARFIVE
> 
> -       tristate "Cadence USB3 support on Starfive platforms"
> +       bool "Cadence USB3 support on Starfive platforms"
> 
>         default y if STARFIVE_JH7110
>         help
>         
>           Say 'Y' here if you are building for Starfive platforms
>           that contain Cadence USB3 controller core. E.g.: JH7110.
>  
>  config USB_CDNS3_TI
> 
> -       tristate "Cadence USB3 support on TI platforms"
> +       bool "Cadence USB3 support on TI platforms"
> 
>         default USB_CDNS3
>         help
>         
>           Say 'Y' here if you are building for Texas Instruments
> 
> diff --git a/drivers/usb/musb-new/Kconfig b/drivers/usb/musb-new/Kconfig
> index f8daaddc657..eb8c9af8020 100644
> --- a/drivers/usb/musb-new/Kconfig
> +++ b/drivers/usb/musb-new/Kconfig
> @@ -48,7 +48,7 @@ config USB_MUSB_TI
> 
>           silicon IP.
>  
>  config USB_MUSB_OMAP2PLUS
> 
> -       tristate "OMAP2430 and onwards"
> +       bool "OMAP2430 and onwards"
> 
>         depends on ARCH_OMAP2PLUS
>  
>  config USB_MUSB_AM35X
> 
> diff --git a/drivers/usb/tcpm/Kconfig b/drivers/usb/tcpm/Kconfig
> index 9be4b496e82..b1ea7253720 100644
> --- a/drivers/usb/tcpm/Kconfig
> +++ b/drivers/usb/tcpm/Kconfig
> @@ -1,14 +1,14 @@
> 
>  # SPDX-License-Identifier: GPL-2.0
>  
>  config TYPEC_TCPM
> 
> -       tristate "USB Type-C Port Controller Manager"
> +       bool "USB Type-C Port Controller Manager"
> 
>         depends on DM
>         help
>         
>           The Type-C Port Controller Manager provides a USB PD and USB
> 
> Type-C state machine for use with Type-C Port Controllers.
> 
>  config TYPEC_FUSB302
> 
> -       tristate "Fairchild FUSB302 Type-C chip driver"
> +       bool "Fairchild FUSB302 Type-C chip driver"
> 
>         depends on DM && DM_I2C && TYPEC_TCPM
>         help
>         
>           The Fairchild FUSB302 Type-C chip driver that works with
> 
> ---
> base-commit: 9f16b258e5632d74fa4a1c2c93bea4474e05234b
> change-id: 20260625-tristate_fix-00fbac6ead7e
> 
> Best regards,
> --
> Anshul Dalal <anshuld@ti.com>

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPartUZwYaGtmRS6txwwpAygINA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmo81fEACgkQKCYAIARz
eA7Jrw//d17XJguQX1aHNMDFRAdU+uHfWTK5CPGuAh3CCICGEtkpuBlvCxxSPbRx
5E/XLaoedhKNGTyAwBQkjB5GG21X4VomfRhbeW9iKPO9Tsnu1yo326rAVZ0LKpwK
LcwFYWaIWO/TC+PGwTgwmliR7IIgSEqfYPcwA0GqqqUn99noPTCVJnZmsbRSswOR
nano4Yzz0XhqsfbXABN/puqmS8J47+6vuj64TJqlvR2HlLOM8mOol6SIqq+LnZeB
q7QxxilzpwkoSvp0UQnXQhqCPZ6bdRa/o0wMbgsANnjQBSG+UbmqqMHezTevpjJd
8e6LYftGe03lUiE3Dpbhhos8+LFe8CGQ2dTESphbbyzO09YkzYKhiNH2D0R/hIqS
Wvh48yHvR4C40PchAsq26Lz6SAKEbWPJmyS/ZpJiPwDugzv47Mxch6sXayccFH89
psYtp7fMHZW50E/ynqv08y6QD8MfU43kUbQ6oyfiY+T6Mc7RptSFwBOvBg5JvAl/
EHH1P98/Wkhb8atD/EASI9szH9ucEQzp/Fhr1ToXfa3orOrt56qGky+UEUJdOIOl
/BlOpRKrhWRr3fkT+ztKV528hTiProz7PToZXiBHHLmMztIxODYAPUJKWWBx7CvS
Z36YpnvVnqbhPRgMu6BOpW7x+pCz9x6zRXmW+xvbwQH0a7pimdk=
=5b9y
-----END PGP SIGNATURE-----

--nextPartUZwYaGtmRS6txwwpAygINA--




--===============7166931916572801318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7166931916572801318==--



