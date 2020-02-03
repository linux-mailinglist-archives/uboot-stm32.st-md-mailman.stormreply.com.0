Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0423150012
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 01:04:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81D0CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 00:04:27 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A36CEC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 00:04:23 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h9so11946270otj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Feb 2020 16:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxptCfu2uDQaWR9j0vRVTg9IYGqRrbonhQ2uy5R2Rbs=;
 b=iQfR9DPdERwwZtQ/LXV5hPjQNbjNP/fx3RhNvye25Av0Xd4/IjiJLg2+QEfRdITnLx
 OQXeKLMfGmWXljgYSSV7fPiN5hc7uz4trJykI+FfHO2CctMgSGtXYWhYv+e23IKXkNuo
 NiQ4bRf0fR2BatNMOoBlKpeSjxfO/ty1Mt3Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxptCfu2uDQaWR9j0vRVTg9IYGqRrbonhQ2uy5R2Rbs=;
 b=kq56DdKQNSob/2szPWI05S0r2i4o6couw8ZmQfzVEPk9DwPSAjBr1zL28kaxVELOJA
 Y7ptCsrIqoIZZ+5e3GoveEqYuYsGfOKbGmHur5MRS3rVp8NQoryRTg7UvqRZtEAA/nnR
 zmQNBeDegHIy4LLkJuzgV4je/b14RDy54ckuKXqqX4j/eQ0JmllF81uc7WiDjV/1t8Dk
 q1nvGsYeH5XFGmnW6ticjduIvtSU6+HIyWJwWAY4SnDvqj2XxU/Z0cxw8PIwSukSV0I9
 920dk6xLv69Ex+24vJy7igSXMktWKeGKE1nAwyFxF4yn4bB/c43xLfNFLO0JwVrkJaDQ
 b14A==
X-Gm-Message-State: APjAAAXidwRZCp/s6+H5lDmxT4WgX7Wx9PHedCXwk9Tf5EjFsflJsUmI
 rlIdJgIlUEzDyiJHSZl8gNzCC/X4FrSnPxeashWQ8g==
X-Google-Smtp-Source: APXvYqwuKixqaaPR4aCt7jR+ap4Uoj3hNdedzJBVOHT4fayIcb8wTTPdw+ECRsn+qYgMlDL5lX++WHyhPpM2ctHF16c=
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr16673765oth.48.1580688261909; 
 Sun, 02 Feb 2020 16:04:21 -0800 (PST)
MIME-Version: 1.0
References: <faa9691528835dce9733dcfd1c1a8f20d13fa0bb.1580585884.git.tommyhebb@gmail.com>
 <6412a441fa9548f23086bf8c0a1b9b490d92dd0b.1580585884.git.tommyhebb@gmail.com>
In-Reply-To: <6412a441fa9548f23086bf8c0a1b9b490d92dd0b.1580585884.git.tommyhebb@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 2 Feb 2020 17:04:07 -0700
Message-ID: <CAPnjgZ0qV-qVwvvBrtwxBfJfa44DnPG4ZaqrVKgPPOQSLCH3Pw@mail.gmail.com>
To: Thomas Hebb <tommyhebb@gmail.com>
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Baruch Siach <baruch@tkos.co.il>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Lars Poeschel <poeschel@lemonage.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, Vignesh R <vigneshr@ti.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Arkadiusz Karas <arkadiusz.karas@somlabs.com>,
 =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Niel Fourie <lusus@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Javier_Mart=C3=ADnez_Canillas?= <javier@dowhile0.org>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Breno Lima <breno.lima@nxp.com>,
 Samuel Egli <samuel.egli@siemens.com>, Gilles Gameiro <gilles@gigadevices.com>,
 James Byrne <james.byrne@origamienergy.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Erik van Luijk <evanluijk@interact.nl>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Moses Christopher Bollavarapu <BollavarapuMoses.Christopher@in.bosch.com>,
 Silvio Fricke <open-source@softing.de>, Parthiban Nallathambi <pn@denx.de>,
 Yegor Yefremov <yegorslists@googlemail.com>, Stefano Babic <sbabic@denx.de>,
 Michal Simek <monstr@monstr.eu>, Anatolij Gustschin <agust@denx.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, "Andrew F. Davis" <afd@ti.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lothar Felten <lothar.felten@gmail.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Francesco Montefoschi <francesco.montefoschi@udoo.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Bin Meng <bmeng.cn@gmail.com>, Felix Brack <fb@ltec.ch>
Subject: Re: [Uboot-stm32] [PATCH 2/2] spl: get rid of SPL_LIBDISK_SUPPORT
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

On Sat, 1 Feb 2020 at 12:38, Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> This option hasn't actually affected what's linked into the build since
> commit 91ff6865629c ("blk: Rework guard around part_init call"), which
> switched libdisk in SPL to depend on (CONFIG_SPL_FRAMEWORK &&
> CONFIG_PARTITIONS). After removing one straggling reference that seems
> to been authored before 91ff6865629c landed, there are absolutely no
> references to this in the code. Let's remove it.
>
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
>
> ---
>
>  arch/arm/Kconfig                             |  1 -
>  arch/arm/mach-imx/mx6/Kconfig                |  1 -
>  arch/arm/mach-mvebu/Kconfig                  |  2 --
>  arch/arm/mach-omap2/Kconfig                  |  3 ---
>  arch/arm/mach-omap2/am33xx/Kconfig           |  2 --
>  arch/arm/mach-stm32mp/Kconfig                |  1 -
>  arch/arm/mach-zynq/Kconfig                   |  3 ---
>  arch/arm/mach-zynqmp/Kconfig                 |  3 ---
>  common/spl/Kconfig                           | 19 ++-----------------
>  configs/am335x_baltos_defconfig              |  1 -
>  configs/am335x_guardian_defconfig            |  1 -
>  configs/am335x_hs_evm_uart_defconfig         |  1 -
>  configs/am335x_igep003x_defconfig            |  1 -
>  configs/am335x_pdu001_defconfig              |  1 -
>  configs/am335x_shc_defconfig                 |  1 -
>  configs/am335x_shc_ict_defconfig             |  1 -
>  configs/am335x_shc_netboot_defconfig         |  1 -
>  configs/am335x_shc_sdboot_defconfig          |  1 -
>  configs/am335x_sl50_defconfig                |  1 -
>  configs/am65x_evm_a53_defconfig              |  1 -
>  configs/am65x_evm_r5_defconfig               |  1 -
>  configs/am65x_hs_evm_a53_defconfig           |  1 -
>  configs/am65x_hs_evm_r5_defconfig            |  1 -
>  configs/birdland_bav335a_defconfig           |  1 -
>  configs/birdland_bav335b_defconfig           |  1 -
>  configs/cgtqmx6eval_defconfig                |  1 -
>  configs/chiliboard_defconfig                 |  1 -
>  configs/cm_t335_defconfig                    |  1 -
>  configs/cm_t43_defconfig                     |  1 -
>  configs/draco_defconfig                      |  1 -
>  configs/etamin_defconfig                     |  1 -
>  configs/imx6qdl_icore_mipi_defconfig         |  1 -
>  configs/imx6qdl_icore_mmc_defconfig          |  1 -
>  configs/imx6qdl_icore_rqs_defconfig          |  1 -
>  configs/imx6ul_geam_mmc_defconfig            |  1 -
>  configs/imx6ul_isiot_emmc_defconfig          |  1 -
>  configs/j721e_evm_a72_defconfig              |  1 -
>  configs/j721e_evm_r5_defconfig               |  1 -
>  configs/j721e_hs_evm_a72_defconfig           |  1 -
>  configs/j721e_hs_evm_r5_defconfig            |  1 -
>  configs/mx6cuboxi_defconfig                  |  1 -
>  configs/mx6sabreauto_defconfig               |  1 -
>  configs/mx6sabresd_defconfig                 |  1 -
>  configs/mx6slevk_spl_defconfig               |  1 -
>  configs/mx6sxsabresd_spl_defconfig           |  1 -
>  configs/mx6ul_14x14_evk_defconfig            |  1 -
>  configs/mx6ul_9x9_evk_defconfig              |  1 -
>  configs/novena_defconfig                     |  1 -
>  configs/opos6uldev_defconfig                 |  1 -
>  configs/pcm051_rev1_defconfig                |  1 -
>  configs/pcm051_rev3_defconfig                |  1 -
>  configs/pcm058_defconfig                     |  1 -
>  configs/pengwyn_defconfig                    |  1 -
>  configs/pepper_defconfig                     |  1 -
>  configs/pfla02_defconfig                     |  1 -
>  configs/phycore-am335x-r2-wega_defconfig     |  1 -
>  configs/pico-dwarf-imx6ul_defconfig          |  1 -
>  configs/pico-hobbit-imx6ul_defconfig         |  1 -
>  configs/pico-imx6_defconfig                  |  1 -
>  configs/pico-imx6ul_defconfig                |  1 -
>  configs/pico-pi-imx6ul_defconfig             |  1 -
>  configs/picosam9g45_defconfig                |  1 -
>  configs/platinum_picon_defconfig             |  1 -
>  configs/platinum_titanium_defconfig          |  1 -
>  configs/pxm2_defconfig                       |  1 -
>  configs/rastaban_defconfig                   |  1 -
>  configs/riotboard_spl_defconfig              |  1 -
>  configs/rut_defconfig                        |  1 -
>  configs/sama5d27_som1_ek_mmc1_defconfig      |  1 -
>  configs/sama5d27_som1_ek_mmc_defconfig       |  1 -
>  configs/sama5d27_som1_ek_qspiflash_defconfig |  1 -
>  configs/sama5d27_wlsom1_ek_mmc_defconfig     |  1 -
>  configs/sama5d2_icp_mmc_defconfig            |  1 -
>  configs/sama5d2_xplained_emmc_defconfig      |  1 -
>  configs/sama5d2_xplained_mmc_defconfig       |  1 -
>  configs/sama5d2_xplained_qspiflash_defconfig |  1 -
>  configs/sama5d3_xplained_mmc_defconfig       |  1 -
>  configs/sama5d3xek_mmc_defconfig             |  1 -
>  configs/sama5d4_xplained_mmc_defconfig       |  1 -
>  configs/sama5d4ek_mmc_defconfig              |  1 -
>  configs/sksimx6_defconfig                    |  1 -
>  configs/thuban_defconfig                     |  1 -
>  configs/ti814x_evm_defconfig                 |  1 -
>  configs/ti816x_evm_defconfig                 |  1 -
>  configs/udoo_defconfig                       |  1 -
>  configs/udoo_neo_defconfig                   |  1 -
>  configs/vining_2000_defconfig                |  1 -
>  configs/wandboard_defconfig                  |  1 -
>  configs/woodburn_sd_defconfig                |  1 -
>  configs/xpress_spl_defconfig                 |  1 -
>  configs/zc5202_defconfig                     |  1 -
>  configs/zc5601_defconfig                     |  1 -
>  doc/README.SPL                               |  1 -
>  93 files changed, 2 insertions(+), 117 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
