Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B1282EB0
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 03:52:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 864ADC424B2;
	Mon,  5 Oct 2020 01:52:35 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F28C7C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 01:52:33 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id l4so3705141ota.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Oct 2020 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqtYhHDuZLNGPley8kv3ELav721+CK3oKDoFjGluahs=;
 b=n9KlGPth5/iuJQV0vBJ8ULi9rPuzUIdnnCZq7msVDap6hsxY166dMrV2BffuLMhtJS
 55j82rY1V6NxQPftcGTODAklpEiIpyUKx2avmXZfQx5EG1uavsjZh9DZudjuf7VhawQY
 E64NxTXKuHA6BHeUuEGZO6IDloKqATCbQ/70E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqtYhHDuZLNGPley8kv3ELav721+CK3oKDoFjGluahs=;
 b=fHkAZMfuQlse7X4aPfUDy2SFWlYoVXRuFa0ME4lpBJrfHDSe/Ss2Bk4cdiQXGA+hlW
 AOWXwf9qqBNRzTAP/sWmbgZeLePhHa21jgZg3/dJ3cKqXINiFRgMPScGSYIeWdKELQan
 rIFesWONqRYgZAxrWiWtgfcxmIYUGegg6tpyUNUre4apoyUh/AQukZL8MfMVXvZQ98fm
 +SI6XaxXFwZiJphWiyGVqQ5yhvMFy0rJ/s+DGXT1GU9PKYiobAD/JKqc6g2sunSNGJ4n
 WYgzczb40ZygYBwh5U8c6RDt0GJHv6g+nd6OXsbueSo2G3HyNFQCkl1FRQf4N1EFpYjJ
 mINw==
X-Gm-Message-State: AOAM533/yHuBmyXd1k3/Rt7sk3EP4nC/vpxPso5nN1dvC6LDxbAg9lo1
 UNM6eRTOQLfGVTFUJH/GJSrNPHyG5r7+BwLRt8nHPg==
X-Google-Smtp-Source: ABdhPJxUJUuZboUA82FdaFdrvPfomEbRSiAZngHDoZo8RK7boJI67DGNq9vAK3MJvRw4b6N6JU4db7sg6WuR5orVb/E=
X-Received: by 2002:a9d:6c4d:: with SMTP id g13mr9249937otq.367.1601862752527; 
 Sun, 04 Oct 2020 18:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200928093017.19053-1-patrick.delaunay@st.com>
 <20200928093017.19053-2-patrick.delaunay@st.com>
In-Reply-To: <20200928093017.19053-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Oct 2020 19:52:20 -0600
Message-ID: <CAPnjgZ1bQVte9nJc_c-vZZZMsL=B6XVgJ+z6sO_oR_KABWWDMA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Baruch Siach <baruch@tkos.co.il>, Nikita Kiryanov <nikita@compulab.co.il>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Soeren Moch <smoch@web.de>,
 =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, u-boot-amlogic@groups.io,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] configs: migrate
	CONFIG_VIDEO_BMP_RLE8 to defconfigs
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

On Mon, 28 Sep 2020 at 03:31, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Done with:
> ./tools/moveconfig.py VIDEO_BMP_RLE8
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  README                                  | 6 ------
>  configs/apalis_imx6_defconfig           | 1 +
>  configs/aristainetos2_defconfig         | 1 +
>  configs/aristainetos2b_defconfig        | 1 +
>  configs/aristainetos2bcsl_defconfig     | 1 +
>  configs/aristainetos2c_defconfig        | 1 +
>  configs/cgtqmx6eval_defconfig           | 1 +
>  configs/cm_fx6_defconfig                | 1 +
>  configs/colibri-imx6ull_defconfig       | 1 +
>  configs/colibri_imx6_defconfig          | 1 +
>  configs/colibri_imx7_defconfig          | 1 +
>  configs/colibri_imx7_emmc_defconfig     | 1 +
>  configs/dms-ba16-1g_defconfig           | 1 +
>  configs/dms-ba16_defconfig              | 1 +
>  configs/imx6dl_icore_nand_defconfig     | 1 +
>  configs/imx6q_icore_nand_defconfig      | 1 +
>  configs/imx6qdl_icore_mmc_defconfig     | 1 +
>  configs/imx6qdl_icore_nand_defconfig    | 1 +
>  configs/imxrt1050-evk_defconfig         | 1 +
>  configs/khadas-vim3_defconfig           | 1 +
>  configs/khadas-vim3l_defconfig          | 1 +
>  configs/libretech-ac_defconfig          | 1 +
>  configs/libretech-cc_defconfig          | 1 +
>  configs/libretech-s905d-pc_defconfig    | 1 +
>  configs/libretech-s912-pc_defconfig     | 1 +
>  configs/m53menlo_defconfig              | 1 +
>  configs/marsboard_defconfig             | 1 +
>  configs/mx23evk_defconfig               | 1 +
>  configs/mx28evk_auart_console_defconfig | 1 +
>  configs/mx28evk_defconfig               | 1 +
>  configs/mx28evk_nand_defconfig          | 1 +
>  configs/mx28evk_spi_defconfig           | 1 +
>  configs/mx51evk_defconfig               | 1 +
>  configs/mx53loco_defconfig              | 1 +
>  configs/mx6cuboxi_defconfig             | 1 +
>  configs/mx6qsabrelite_defconfig         | 1 +
>  configs/mx6sabreauto_defconfig          | 1 +
>  configs/mx6sabresd_defconfig            | 1 +
>  configs/mx6sxsabresd_defconfig          | 1 +
>  configs/mx6ul_14x14_evk_defconfig       | 1 +
>  configs/mx6ul_9x9_evk_defconfig         | 1 +
>  configs/mx7dsabresd_defconfig           | 1 +
>  configs/mx7dsabresd_qspi_defconfig      | 1 +
>  configs/nitrogen6dl2g_defconfig         | 1 +
>  configs/nitrogen6dl_defconfig           | 1 +
>  configs/nitrogen6q2g_defconfig          | 1 +
>  configs/nitrogen6q_defconfig            | 1 +
>  configs/nitrogen6s1g_defconfig          | 1 +
>  configs/nitrogen6s_defconfig            | 1 +
>  configs/novena_defconfig                | 1 +
>  configs/odroid-c2_defconfig             | 1 +
>  configs/odroid-c4_defconfig             | 1 +
>  configs/odroid-n2_defconfig             | 1 +
>  configs/opos6uldev_defconfig            | 1 +
>  configs/pico-dwarf-imx6ul_defconfig     | 1 +
>  configs/pico-dwarf-imx7d_defconfig      | 1 +
>  configs/pico-hobbit-imx6ul_defconfig    | 1 +
>  configs/pico-hobbit-imx7d_defconfig     | 1 +
>  configs/pico-imx6_defconfig             | 1 +
>  configs/pico-imx7d_bl33_defconfig       | 1 +
>  configs/pico-imx7d_defconfig            | 1 +
>  configs/pico-nymph-imx7d_defconfig      | 1 +
>  configs/pico-pi-imx6ul_defconfig        | 1 +
>  configs/pico-pi-imx7d_defconfig         | 1 +
>  configs/pxm2_defconfig                  | 1 +
>  configs/riotboard_defconfig             | 1 +
>  configs/riotboard_spl_defconfig         | 1 +
>  configs/rut_defconfig                   | 1 +
>  configs/sandbox64_defconfig             | 1 +
>  configs/sandbox_defconfig               | 1 +
>  configs/sandbox_flattree_defconfig      | 1 +
>  configs/sandbox_spl_defconfig           | 1 +
>  configs/sei510_defconfig                | 1 +
>  configs/sei610_defconfig                | 1 +
>  configs/stm32f746-disco_defconfig       | 1 +
>  configs/stm32f769-disco_defconfig       | 1 +
>  configs/stm32mp15_basic_defconfig       | 1 +
>  configs/stm32mp15_dhcom_basic_defconfig | 1 +
>  configs/stm32mp15_dhcor_basic_defconfig | 1 +
>  configs/stm32mp15_trusted_defconfig     | 1 +
>  configs/tbs2910_defconfig               | 1 +
>  configs/wandboard_defconfig             | 1 +
>  drivers/video/Kconfig                   | 7 +++++++
>  include/configs/advantech_dms-ba16.h    | 1 -
>  include/configs/apalis_imx6.h           | 1 -
>  include/configs/aristainetos2.h         | 1 -
>  include/configs/cgtqmx6eval.h           | 1 -
>  include/configs/cm_fx6.h                | 2 --
>  include/configs/colibri-imx6ull.h       | 1 -
>  include/configs/colibri_imx6.h          | 1 -
>  include/configs/colibri_imx7.h          | 1 -
>  include/configs/embestmx6boards.h       | 1 -
>  include/configs/imx6-engicam.h          | 1 -
>  include/configs/imxrt1050-evk.h         | 1 -
>  include/configs/m53menlo.h              | 1 -
>  include/configs/meson64.h               | 1 -
>  include/configs/mx23evk.h               | 1 -
>  include/configs/mx28evk.h               | 1 -
>  include/configs/mx51evk.h               | 1 -
>  include/configs/mx53loco.h              | 1 -
>  include/configs/mx6cuboxi.h             | 1 -
>  include/configs/mx6sabre_common.h       | 1 -
>  include/configs/mx6sxsabresd.h          | 1 -
>  include/configs/mx6ul_14x14_evk.h       | 1 -
>  include/configs/mx7dsabresd.h           | 1 -
>  include/configs/nitrogen6x.h            | 1 -
>  include/configs/novena.h                | 1 -
>  include/configs/opos6uldev.h            | 1 -
>  include/configs/pico-imx6.h             | 1 -
>  include/configs/pico-imx6ul.h           | 1 -
>  include/configs/pico-imx7d.h            | 1 -
>  include/configs/pxm2.h                  | 1 -
>  include/configs/rut.h                   | 1 -
>  include/configs/sandbox.h               | 1 -
>  include/configs/stm32f746-disco.h       | 1 -
>  include/configs/stm32mp1.h              | 1 -
>  include/configs/tbs2910.h               | 1 -
>  include/configs/wandboard.h             | 1 -
>  scripts/config_whitelist.txt            | 1 -
>  119 files changed, 88 insertions(+), 43 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
