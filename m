Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8F72ECFE9
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jan 2021 13:36:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC727C56634;
	Thu,  7 Jan 2021 12:36:34 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1675DC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jan 2021 12:36:30 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id s2so7224386oij.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Jan 2021 04:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/AtC5wJaC4zUYNIwOXwSJjq+chEpbbNNRRoG/goO2Q=;
 b=JJaSZCXAk3Kgb4u0WNufgAWYNwfIp8Khbu3FvYFi4A8MlXfz3GuxvfHRcWdKQYMGvW
 bhjY/pLfTRGK0HHXB/JM5Rk7UP1fgigdxpUZJw2TFvEmHI20FDiDBZ/DP68k+DyT1qBg
 SOVVzOur2X6q/66zC0jPsG6/a2LXv713CggZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/AtC5wJaC4zUYNIwOXwSJjq+chEpbbNNRRoG/goO2Q=;
 b=FPZaQq9D8FscHNcc9ECQSAeuZXEIOZHBhgAMtnL5ylfvYLBnz6w7e9OM55cUJu2D4p
 oa10frUi4l6sqYS29PwfMctS2Bw0wdJts0d21+E8zXAZN8sG5IfEm12Q4+lvlkVFYQuK
 FMdAsk9HGpbGbM3lZUpifSwxvTEO7e7wMIXez+MJ4BavcxIHN7b0xIhtWpUVJHEwYRI5
 uddUZ3Ffm3gCaTBJTi6GBnjKWXFw6NxKCGn8PeYhGS+Zq5x8wOp1CL36o8XAkVIjrZ6V
 9G5Ltgmj83Y7Vlm0JBgdTrR2yRqYemIWa2j5DlUE8loQ7AOapaWvkv92+waZoCqLJlx1
 1dDQ==
X-Gm-Message-State: AOAM533t7HbXyHxLX3ttxlzOJfoz67AmfEiDfSyKl5Gjh9FwqO7oL8t1
 lYpS2sUw3n4UZk4xfb5k14hqxrLWt8+J2v2YxZ1XTQ==
X-Google-Smtp-Source: ABdhPJwF6bFskRFEswsqntQlXss6896yLoC2yxkRHxw/MLWs8j7SGTw/VTyTAT7GTUyJvNiSvRZseJWafMQu4yVt8vY=
X-Received: by 2002:aca:f48c:: with SMTP id s134mr1144674oih.150.1610022988901; 
 Thu, 07 Jan 2021 04:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20201219174018.1114146-1-sjg@chromium.org>
 <20201219174018.1114146-21-sjg@chromium.org>
 <1c2c4185-cb77-3713-41f9-e1549d0f88d1@foss.st.com>
In-Reply-To: <1c2c4185-cb77-3713-41f9-e1549d0f88d1@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 7 Jan 2021 05:36:14 -0700
Message-ID: <CAPnjgZ2wdnm2VF7mxCrpW38BOrM7Q=JHQecpMHuOn3qWzicqJw@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Peng Fan <peng.fan@nxp.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, uboot-snps-arc@synopsys.com,
 Stefan Bosch <stefan_b@posteo.net>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Marek Vasut <marex@denx.de>, Ryder Lee <ryder.lee@mediatek.com>,
 Luka Perkov <luka.perkov@sartura.hr>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Masahiro Yamada <masahiroy@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Frank Wang <frank.wang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Anatolij Gustschin <agust@denx.de>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Stefan Roese <sr@denx.de>, Suneel Garapati <sgarapati@marvell.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Eugeniy Paltsev <paltsev@synopsys.com>, Robert Marko <robert.marko@sartura.hr>,
 "hui.song" <hui.song_1@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Aaron Williams <awilliams@marvell.com>,
 Luka Kovacic <luka.kovacic@sartura.hr>,
 Patrice Chotard <patrice.chotard@st.com>, Bin Meng <bmeng.cn@gmail.com>,
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

Hi Patrick,

On Mon, 4 Jan 2021 at 06:02, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Simon,
>
>
> On 12/19/20 6:40 PM, Simon Glass wrote:
> > At present ofnode is present in the device even if it is never used. With
> > of-platdata this field is not used, so can be removed. In preparation for
> > this, change the access to go through inline functions.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> >   arch/arm/mach-stm32mp/pwr_regulator.c     |  2 +-
> >   board/synopsys/hsdk/clk-lib.c             |  2 +-
> >   drivers/ata/mtk_ahci.c                    |  3 ++-
> >   drivers/clk/meson/axg.c                   |  2 +-
> >   drivers/clk/meson/g12a.c                  |  2 +-
> >   drivers/clk/meson/gxbb.c                  |  2 +-
> >   drivers/core/device.c                     |  2 +-
> >   drivers/core/root.c                       |  2 +-
> >   drivers/gpio/mpc8xxx_gpio.c               |  4 ++--
> >   drivers/gpio/octeon_gpio.c                |  2 +-
> >   drivers/misc/swap_case.c                  |  2 +-
> >   drivers/mmc/octeontx_hsmmc.c              | 23 +++++++++++++----------
> >   drivers/mtd/nand/raw/octeontx_nand.c      |  2 +-
> >   drivers/mtd/nand/spi/core.c               |  2 +-
> >   drivers/net/fm/eth.c                      |  4 ++--
> >   drivers/net/fsl_enetc.c                   |  8 ++++----
> >   drivers/net/fsl_enetc_mdio.c              |  2 +-
> >   drivers/net/mdio-ipq4019.c                |  4 ++--
> >   drivers/net/mdio_mux_i2creg.c             |  2 +-
> >   drivers/net/mvmdio.c                      |  4 ++--
> >   drivers/net/octeontx/smi.c                |  2 +-
> >   drivers/net/tsec.c                        |  3 ++-
> >   drivers/phy/phy-ti-am654.c                |  2 +-
> >   drivers/power/domain/meson-ee-pwrc.c      |  4 ++--
> >   drivers/power/domain/meson-gx-pwrc-vpu.c  |  4 ++--
> >   drivers/power/regulator/pbias_regulator.c |  3 ++-
> >   drivers/pwm/pwm-meson.c                   |  9 ++++++---
> >   drivers/reset/reset-socfpga.c             |  2 +-
> >   drivers/spi/fsl_dspi.c                    |  6 ++++--
> >   drivers/tee/optee/core.c                  |  2 +-
> >   drivers/usb/cdns3/core.c                  |  4 ++--
> >   drivers/usb/dwc3/core.c                   |  2 +-
> >   drivers/usb/dwc3/dwc3-generic.c           |  6 +++---
> >   drivers/usb/dwc3/dwc3-meson-g12a.c        |  2 +-
> >   drivers/usb/dwc3/dwc3-meson-gxl.c         |  2 +-
> >   drivers/usb/gadget/dwc2_udc_otg.c         |  4 ++--
> >   drivers/usb/host/dwc3-octeon-glue.c       |  2 +-
> >   drivers/usb/host/dwc3-sti-glue.c          |  5 +++--
> >   drivers/usb/host/ehci-mx6.c               |  2 +-
> >   drivers/usb/host/xhci-dwc3.c              |  2 +-
> >   drivers/usb/mtu3/mtu3_core.c              |  2 +-
> >   drivers/usb/mtu3/mtu3_plat.c              |  4 ++--
> >   drivers/usb/musb-new/ti-musb.c            |  2 +-
> >   drivers/video/nexell_display.c            |  2 +-
> >   drivers/video/rockchip/rk_mipi.c          |  2 +-
> >   include/dm/device.h                       | 23 +++++++++++++++++++++--
> >   include/dm/read.h                         |  2 +-
> >   include/linux/mtd/mtd.h                   |  4 ++--
> >   net/mdio-mux-uclass.c                     |  2 +-
> >   net/mdio-uclass.c                         |  8 ++++----
> >   50 files changed, 113 insertions(+), 82 deletions(-)
>
> in all the modified drivers,
> for the functions ofnode_XXXX(dev->node,...) modified to ofnode_XXXX(dev_ofnode(dev),
> they can also modified to dev_XXX function :
>
> ofnode_read_u32(dev_ofnode(dev), ...) => dev_read_u32(dev,....)
> ofnode_read_string(dev_ofnode(dev), ...) => dev_read_string(dev,....)
> ofnode_valid(dev_ofnode(dev)) => dev_has_ofnode(dev)
>
> but you prefer perhaps minizes the modifications in this patchset and if
> it is the case :
>
> Reviewed-by: Patrick Delaunay
>
>
> You can found some other examples below.

Thanks for that.

I wonder if we can press coccinelle into service here. I think the
dev_read() API came later so people didn't know about it?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
