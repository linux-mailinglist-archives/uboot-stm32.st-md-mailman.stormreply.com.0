Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 305087E9E21
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Nov 2023 15:07:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4790C6C83B;
	Mon, 13 Nov 2023 14:07:05 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B49C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 18:26:24 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 44ECB24002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 19:26:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1699640784; bh=YprkJIsGcm0kJ5Q5/nL0Qyn7ApwMKmpUI2NfeZh4vlk=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:
 Content-Transfer-Encoding:From;
 b=f9ZXChgiik+f++4Alw142OVu/2zWIppWjWuEDrxKsfBIuiCuuJLEUg8ZjEKAMeU3C
 Y+RzLbgf5JyzSpXVrvL+jkyg/jS5L/3e6RQqdJ55wkl68ZPkKX0v1RlvdHGkOt587d
 TqKssGcOnvapnPmu2uES4WeAz0YhKL9XKK7plkDVIosrtWf5OKqP5VWEeDflNeYJnR
 bljfTkP8jv3RxehqTmPx06C6DaUMHRnoS4Z7mhEpFAJE5g4TjHEOyyijqLGPvt3GgQ
 3BMVft/cSNtG3jqllfru8t3EhrX6Ty/JwdnYQxlHTpw6n7HbOZoD7tYPgPjPDaNWiC
 uH+nMVXCw1VTA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4SRnMZ1t4cz6txg;
 Fri, 10 Nov 2023 19:26:18 +0100 (CET)
Message-ID: <0223a2d6-f243-8e20-7712-2f091e4ecd34@posteo.net>
Date: Fri, 10 Nov 2023 18:26:10 +0000
MIME-Version: 1.0
From: Stefan Bosch <stefan_b@posteo.net>
To: Igor Prusov <ivprusov@salutedevices.com>, u-boot@lists.denx.de
References: <20231109171004.193521-1-ivprusov@salutedevices.com>
 <20231109171004.193521-2-ivprusov@salutedevices.com>
Content-Language: en-US, de-DE
In-Reply-To: <20231109171004.193521-2-ivprusov@salutedevices.com>
X-Mailman-Approved-At: Mon, 13 Nov 2023 14:07:04 +0000
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Baruch Siach <baruch@tkos.co.il>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, prusovigor@gmail.com,
 Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joel Stanley <joel@jms.id.au>, Anatolij Gustschin <agust@denx.de>,
 Sumit Garg <sumit.garg@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>, Heiko Schocher <hs@denx.de>,
 Chris Morgan <macromorgan@hotmail.com>, kernel@sberdevices.ru,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>, Alexander Dahl <ada@thorsis.com>,
 Simon Glass <sjg@chromium.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] treewide: use linux/time.h for time
 conversion defines
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 09.11.23 18:10, Igor Prusov wrote:
> Now that we have time conversion defines from in time.h there is no need
> for each driver to define their own version.
> 
> Signed-off-by: Igor Prusov <ivprusov@salutedevices.com>
> ---
> 
>   board/friendlyarm/nanopi2/onewire.c              |  5 +----
>   drivers/clk/at91/clk-main.c                      |  2 +-
>   drivers/i2c/stm32f7_i2c.c                        | 11 +++++------
>   drivers/memory/stm32-fmc2-ebi.c                  |  5 ++---
>   drivers/mmc/octeontx_hsmmc.h                     |  2 --
>   drivers/mtd/nand/raw/atmel/nand-controller.c     |  3 +--
>   drivers/mtd/nand/raw/mxs_nand.c                  |  3 +--
>   drivers/mtd/nand/raw/octeontx_nand.c             |  2 +-
>   drivers/mtd/nand/raw/stm32_fmc2_nand.c           |  5 ++---
>   drivers/phy/meson-axg-mipi-dphy.c                |  3 +--
>   drivers/phy/phy-core-mipi-dphy.c                 |  3 +--
>   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 +--
>   drivers/pwm/pwm-aspeed.c                         |  3 +--
>   drivers/pwm/pwm-at91.c                           |  2 +-
>   drivers/pwm/pwm-cadence-ttc.c                    |  3 +--
>   drivers/pwm/pwm-meson.c                          |  3 +--
>   drivers/pwm/pwm-mtk.c                            |  3 +--
>   drivers/pwm/pwm-ti-ehrpwm.c                      |  3 +--
>   drivers/serial/serial_msm_geni.c                 |  3 +--
>   drivers/spi/cadence_qspi.c                       |  3 +--
>   drivers/spi/fsl_dspi.c                           |  4 +---
>   drivers/ufs/cdns-platform.c                      |  3 +--
>   drivers/usb/dwc3/core.c                          |  3 +--
>   drivers/video/dw_mipi_dsi.c                      |  3 +--
>   drivers/video/rockchip/dw_mipi_dsi_rockchip.c    |  3 +--
>   drivers/video/tegra20/tegra-dsi.c                |  4 +---
>   drivers/watchdog/sunxi_wdt.c                     |  3 +--
>   fs/ubifs/ubifs.h                                 |  1 -
>   28 files changed, 32 insertions(+), 62 deletions(-)
> 

Reviewed-by: Stefan Bosch <stefan_b@posteo.net> #nanopi2

Thanks,
Stefan
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
