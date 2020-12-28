Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D52E6782
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Dec 2020 17:26:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9695DC5663B;
	Mon, 28 Dec 2020 16:26:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6296C56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Dec 2020 16:26:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r7so11754728wrc.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Dec 2020 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=DYhzNxlRU5RU7MKiJK1L9kMtyAGC84EwCXhy3ZZ2/kw=;
 b=Wgy0rTy/2sGXLjO99r5IcHpTyAi07oCstryAeFwDTwVYogLweuclup+w6ya5hyVZvp
 8V2EHtHk/fVBXkUHQwG23Wj88Pr+5Wt619sSqXjv2wQT4Nz6VzIb7Uvr9h0++62M0Y63
 SeYtUDTGMfCWdInv2NxQuYztMpv+TXkX9DwoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=DYhzNxlRU5RU7MKiJK1L9kMtyAGC84EwCXhy3ZZ2/kw=;
 b=O7xlpXDdEzt09u5zDkLCyHp+KGdEfuYBPMSMtgp+/OY6D232InRxt7iWIy+W1tGpqz
 3VNXHPp+3Tsn+dzwyXQFp6FjiLPsJ775l6Eb2y71mu5u+9hBTHk6aEiLrrJnA/9idJXJ
 HfqGemQVOYiogN+iHVuKjOFZdmaPatJYz/d5r3ilfnlQhWFFQI3BTG3y2uLsR8ti+11p
 kybzp557/0GLvL3FnIXz6vo90YkeyY7bdpXp3ppX5wnIj8dtlD7eUH/mL54PZexXhaJ2
 7KjHrFN9S2ACzLysZd6jw1kWNN2176iV5RK+jWu9p95cvTQSlIM3uxHwYe/ZzRqQIDpN
 ElsA==
X-Gm-Message-State: AOAM531qR2MzxT4Z4m/L4XKlWvJ10I6pP6AUKNgPIhIegii/CEt5d9PZ
 XwXI151gBmwhZHKBGGxIm9ITHB97YZXs/pEgvyfrXQ==
X-Google-Smtp-Source: ABdhPJyEEGV51q6Z8pi934V0ESNKjIr0j9VRu5LOF0ioSj2lCEFMB6arntYEEfPRKI3ajRjxRicUX3+EblNkNxoZXuU=
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr50566151wru.43.1609172780713; 
 Mon, 28 Dec 2020 08:26:20 -0800 (PST)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Dec 2020 08:26:19 -0800
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20201219174018.1114146-21-sjg@chromium.org>
References: <20201219174018.1114146-21-sjg@chromium.org>
 <20201219174018.1114146-1-sjg@chromium.org>
Date: Mon, 28 Dec 2020 08:26:19 -0800
X-Google-Sender-Auth: bCdWhda9db9DVeDypmkeikw7EhE
Message-ID: <CAPnjgZ2iBdqjcA=fXByo1uMAQVPspu9BXMXUNkqq1wVCwFSGDg@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: uboot-snps-arc@synopsys.com, Peng Fan <peng.fan@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 u-boot-amlogic@groups.io, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@xilinx.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Marek Vasut <marex@denx.de>, Ryder Lee <ryder.lee@mediatek.com>,
 Luka Perkov <luka.perkov@sartura.hr>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Masahiro Yamada <masahiroy@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Suneel Garapati <sgarapati@marvell.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Anatolij Gustschin <agust@denx.de>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Stefan Roese <sr@denx.de>, Frank Wunderlich <frank-w@public-files.de>,
 Frank Wang <frank.wang@rock-chips.com>, Eugeniy Paltsev <paltsev@synopsys.com>,
 Robert Marko <robert.marko@sartura.hr>, "hui.song" <hui.song_1@nxp.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Aaron Williams <awilliams@marvell.com>, Luka Kovacic <luka.kovacic@sartura.hr>,
 Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 22/26] dm: core: Access device ofnode
	through functions
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

At present ofnode is present in the device even if it is never used. With
of-platdata this field is not used, so can be removed. In preparation for
this, change the access to go through inline functions.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-stm32mp/pwr_regulator.c     |  2 +-
 board/synopsys/hsdk/clk-lib.c             |  2 +-
 drivers/ata/mtk_ahci.c                    |  3 ++-
 drivers/clk/meson/axg.c                   |  2 +-
 drivers/clk/meson/g12a.c                  |  2 +-
 drivers/clk/meson/gxbb.c                  |  2 +-
 drivers/core/device.c                     |  2 +-
 drivers/core/root.c                       |  2 +-
 drivers/gpio/mpc8xxx_gpio.c               |  4 ++--
 drivers/gpio/octeon_gpio.c                |  2 +-
 drivers/misc/swap_case.c                  |  2 +-
 drivers/mmc/octeontx_hsmmc.c              | 23 +++++++++++++----------
 drivers/mtd/nand/raw/octeontx_nand.c      |  2 +-
 drivers/mtd/nand/spi/core.c               |  2 +-
 drivers/net/fm/eth.c                      |  4 ++--
 drivers/net/fsl_enetc.c                   |  8 ++++----
 drivers/net/fsl_enetc_mdio.c              |  2 +-
 drivers/net/mdio-ipq4019.c                |  4 ++--
 drivers/net/mdio_mux_i2creg.c             |  2 +-
 drivers/net/mvmdio.c                      |  4 ++--
 drivers/net/octeontx/smi.c                |  2 +-
 drivers/net/tsec.c                        |  3 ++-
 drivers/phy/phy-ti-am654.c                |  2 +-
 drivers/power/domain/meson-ee-pwrc.c      |  4 ++--
 drivers/power/domain/meson-gx-pwrc-vpu.c  |  4 ++--
 drivers/power/regulator/pbias_regulator.c |  3 ++-
 drivers/pwm/pwm-meson.c                   |  9 ++++++---
 drivers/reset/reset-socfpga.c             |  2 +-
 drivers/spi/fsl_dspi.c                    |  6 ++++--
 drivers/tee/optee/core.c                  |  2 +-
 drivers/usb/cdns3/core.c                  |  4 ++--
 drivers/usb/dwc3/core.c                   |  2 +-
 drivers/usb/dwc3/dwc3-generic.c           |  6 +++---
 drivers/usb/dwc3/dwc3-meson-g12a.c        |  2 +-
 drivers/usb/dwc3/dwc3-meson-gxl.c         |  2 +-
 drivers/usb/gadget/dwc2_udc_otg.c         |  4 ++--
 drivers/usb/host/dwc3-octeon-glue.c       |  2 +-
 drivers/usb/host/dwc3-sti-glue.c          |  5 +++--
 drivers/usb/host/ehci-mx6.c               |  2 +-
 drivers/usb/host/xhci-dwc3.c              |  2 +-
 drivers/usb/mtu3/mtu3_core.c              |  2 +-
 drivers/usb/mtu3/mtu3_plat.c              |  4 ++--
 drivers/usb/musb-new/ti-musb.c            |  2 +-
 drivers/video/nexell_display.c            |  2 +-
 drivers/video/rockchip/rk_mipi.c          |  2 +-
 include/dm/device.h                       | 23 +++++++++++++++++++++--
 include/dm/read.h                         |  2 +-
 include/linux/mtd/mtd.h                   |  4 ++--
 net/mdio-mux-uclass.c                     |  2 +-
 net/mdio-uclass.c                         |  8 ++++----
 50 files changed, 113 insertions(+), 82 deletions(-)

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
