Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 128717E7BA5
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 12:04:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACF19C6B457;
	Fri, 10 Nov 2023 11:04:44 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8DE3C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 11:04:42 +0000 (UTC)
Received: from [100.94.55.57] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FD8C66073EB;
 Fri, 10 Nov 2023 11:04:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699614282;
 bh=k3MNr4vsonB/nZFlZpUiVqk9fKfmgS0mKlyrROccdWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZLw6QtsWEROP9eNVaPMRNqhvUxvzKuxQe5B/v67bRCxqVfUYkIDVzpSAycjKvRQY1
 hSp4OuJLnW9fKqJ9W2AmlDtz1cLV9b/Xe+2ZGVsmPB1nx/UwzfozZUcJ7yZE0bO5UZ
 rKV4UwGI1SoRQBFwScIxI8YA00ncPxaFgQMybD/Jpr9zKeCXeLO9gvyNgHNNcHR82w
 eKA7usYz8QDyzMjD/2qx9i7zA4GUkL5UCAtdxljl0fzA03C27Arb9aIZNkEPO6a+31
 i5elJOBw/BIc7LAJIYYYr5F95CzRmCwWmTllZZWxXa1Uk7q/l2ULRu5ossifykbwYW
 9ixhGU4+V4HPQ==
Message-ID: <9b9a1c05-19f3-4247-95e2-0fb94cda1db4@collabora.com>
Date: Fri, 10 Nov 2023 13:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Prusov <ivprusov@salutedevices.com>, u-boot@lists.denx.de
References: <20231109171004.193521-1-ivprusov@salutedevices.com>
 <20231109171004.193521-2-ivprusov@salutedevices.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231109171004.193521-2-ivprusov@salutedevices.com>
Cc: Baruch Siach <baruch@tkos.co.il>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 uboot-stm32@st-md-mailman.stormreply.com, Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, prusovigor@gmail.com,
 Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Joel Stanley <joel@jms.id.au>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Heiko Schocher <hs@denx.de>,
 Chris Morgan <macromorgan@hotmail.com>, kernel@sberdevices.ru,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Neha Malcom Francis <n-francis@ti.com>,
 Alexander Dahl <ada@thorsis.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Balaji Prakash J <bjagadee@codeaurora.org>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Sumit Garg <sumit.garg@linaro.org>
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

On 11/9/23 19:10, Igor Prusov wrote:
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

Reviewed-by: Eugen Hristev <eugen.hristev@collabora.com> #at91

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
