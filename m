Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39F282EB2
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 03:52:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92409C424BD;
	Mon,  5 Oct 2020 01:52:36 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D1BCC32EA4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 01:52:35 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q21so7166083ota.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Oct 2020 18:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4pGznNXyZEER4lEVTVbtFELK8GKG06rtM22dcET0DO0=;
 b=VVTvkVPOiW/HWyFuLV/ZAuRIXwdUOQO+5T33KKQTmqBUEIdlvVC03V2Ly72A76pmUY
 h2p1vwkMLvnpgKDjyS24Z4qyZisQUrtrAS8p6QUwuQ1Zu1QvfsHnQDIzrhj9WurMDRSk
 DwSIKk1PRHehzfgM4bTDga+7TBovmzHOhvcno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4pGznNXyZEER4lEVTVbtFELK8GKG06rtM22dcET0DO0=;
 b=URdRoAAvsmNvd48qZLd80OhVweUv54meRKiphGTDI7g402VGAiC+wxJIJPoOl1XPZF
 DY1M4Aq7Emd/k5+Vuj99H7ucJ3KAY1tLMDWoDiHcSPeOUELALE4+SDJMVQSY4fY9bZbn
 8STx+Bx1SIfu49IDtXIciAlXA1I3ir/OFop3b38u/UHo/pSiDBW9E++PzQyACJ4Rwmqc
 D5uit3PYV3aA6JNAv/5VxtuCRa411hPCzCwbB4L7VeujaOJYomRBzkk89JEnN7YcySkI
 uR8DHTxL2imL/MFdp9tYRZZP0Pc5Ua7BvE9nug+iYF8yzkhhY10Jqq42+oY/wGdCgyu6
 8puQ==
X-Gm-Message-State: AOAM530kVRJFoByGthDoXC6HtHs0Ew7v7DopC9g70KKuMmuWK5fP7lu3
 AOI+ur4zzUXh9KKkxpewrPrdHQ4rlbspxHzT7AeSZA==
X-Google-Smtp-Source: ABdhPJwn+OCeyoOzwbBfZf+HRBeb4PiJ3vjWB8AcGeJQj6KWBhV64hbpRdrK6nAjlUb9REDP92BsRiGy5rkgbxiKsjg=
X-Received: by 2002:a9d:7616:: with SMTP id k22mr9239366otl.87.1601862753916; 
 Sun, 04 Oct 2020 18:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200928093017.19053-1-patrick.delaunay@st.com>
 <20200928093017.19053-3-patrick.delaunay@st.com>
In-Reply-To: <20200928093017.19053-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Oct 2020 19:52:21 -0600
Message-ID: <CAPnjgZ1apJragfZhtJc2crgFz6ujvqTRRNw3YX1Wk5uZyXgG9g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Baruch Siach <baruch@tkos.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Alonso <adrian.alonso@nxp.com>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>,
 Stefan Roese <sr@denx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] configs: migrate
	CONFIG_BMP_16/24/32BPP to defconfigs
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
> ./tools/moveconfig.py BMP_16BPP BMP_24BPP BMP_32BPP
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/apalis_imx6_defconfig                  |  1 +
>  configs/aristainetos2_defconfig                |  1 +
>  configs/aristainetos2b_defconfig               |  1 +
>  configs/aristainetos2bcsl_defconfig            |  1 +
>  configs/aristainetos2c_defconfig               |  1 +
>  configs/cgtqmx6eval_defconfig                  |  1 +
>  configs/colibri-imx6ull_defconfig              |  1 +
>  configs/colibri_imx6_defconfig                 |  1 +
>  configs/colibri_imx7_defconfig                 |  1 +
>  configs/colibri_imx7_emmc_defconfig            |  1 +
>  configs/imx6dl_icore_nand_defconfig            |  1 +
>  configs/imx6q_icore_nand_defconfig             |  1 +
>  configs/imx6qdl_icore_mmc_defconfig            |  1 +
>  configs/imx6qdl_icore_nand_defconfig           |  1 +
>  configs/imxrt1050-evk_defconfig                |  1 +
>  configs/khadas-vim3_defconfig                  |  3 +++
>  configs/khadas-vim3l_defconfig                 |  3 +++
>  configs/libretech-ac_defconfig                 |  3 +++
>  configs/libretech-cc_defconfig                 |  3 +++
>  configs/libretech-s905d-pc_defconfig           |  3 +++
>  configs/libretech-s912-pc_defconfig            |  3 +++
>  configs/m53menlo_defconfig                     |  1 +
>  configs/marsboard_defconfig                    |  1 +
>  configs/mx6cuboxi_defconfig                    |  1 +
>  configs/mx6qsabrelite_defconfig                |  1 +
>  configs/mx6sabreauto_defconfig                 |  1 +
>  configs/mx6sabresd_defconfig                   |  1 +
>  configs/mx6ul_14x14_evk_defconfig              |  1 +
>  configs/mx6ul_9x9_evk_defconfig                |  1 +
>  configs/nitrogen6dl2g_defconfig                |  1 +
>  configs/nitrogen6dl_defconfig                  |  1 +
>  configs/nitrogen6q2g_defconfig                 |  1 +
>  configs/nitrogen6q_defconfig                   |  1 +
>  configs/nitrogen6s1g_defconfig                 |  1 +
>  configs/nitrogen6s_defconfig                   |  1 +
>  configs/novena_defconfig                       |  1 +
>  configs/odroid-c2_defconfig                    |  3 +++
>  configs/odroid-c4_defconfig                    |  3 +++
>  configs/odroid-n2_defconfig                    |  3 +++
>  configs/opos6uldev_defconfig                   |  3 +++
>  configs/pico-dwarf-imx7d_defconfig             |  1 +
>  configs/pico-hobbit-imx7d_defconfig            |  1 +
>  configs/pico-imx6_defconfig                    |  1 +
>  configs/pico-imx7d_bl33_defconfig              |  1 +
>  configs/pico-imx7d_defconfig                   |  1 +
>  configs/pico-nymph-imx7d_defconfig             |  1 +
>  configs/pico-pi-imx7d_defconfig                |  1 +
>  configs/puma-rk3399_defconfig                  |  3 +++
>  configs/riotboard_defconfig                    |  1 +
>  configs/riotboard_spl_defconfig                |  1 +
>  configs/s5p4418_nanopi2_defconfig              |  1 +
>  configs/sei510_defconfig                       |  3 +++
>  configs/sei610_defconfig                       |  3 +++
>  configs/stm32f746-disco_defconfig              |  3 +++
>  configs/stm32f769-disco_defconfig              |  3 +++
>  configs/stm32mp15_basic_defconfig              |  3 +++
>  configs/stm32mp15_dhcom_basic_defconfig        |  3 +++
>  configs/stm32mp15_dhcor_basic_defconfig        |  3 +++
>  configs/stm32mp15_trusted_defconfig            |  3 +++
>  ...rable-x86-conga-qa3-e3845-pcie-x4_defconfig |  1 +
>  .../theadorable-x86-conga-qa3-e3845_defconfig  |  1 +
>  configs/theadorable-x86-dfi-bt700_defconfig    |  1 +
>  configs/theadorable_debug_defconfig            |  3 +++
>  configs/wandboard_defconfig                    |  1 +
>  drivers/video/Kconfig                          | 18 ++++++++++++++++++
>  include/configs/advantech_dms-ba16.h           |  1 -
>  include/configs/apalis_imx6.h                  |  1 -
>  include/configs/aristainetos2.h                |  1 -
>  include/configs/cgtqmx6eval.h                  |  1 -
>  include/configs/colibri-imx6ull.h              |  1 -
>  include/configs/colibri_imx6.h                 |  1 -
>  include/configs/colibri_imx7.h                 |  1 -
>  include/configs/embestmx6boards.h              |  1 -
>  include/configs/imx6-engicam.h                 |  1 -
>  include/configs/imxrt1050-evk.h                |  1 -
>  include/configs/m53menlo.h                     |  1 -
>  include/configs/meson64.h                      |  3 ---
>  include/configs/mx23evk.h                      |  1 -
>  include/configs/mx28evk.h                      |  1 -
>  include/configs/mx51evk.h                      |  1 -
>  include/configs/mx53loco.h                     |  1 -
>  include/configs/mx6cuboxi.h                    |  1 -
>  include/configs/mx6sabre_common.h              |  1 -
>  include/configs/mx6sxsabresd.h                 |  1 -
>  include/configs/mx6ul_14x14_evk.h              |  1 -
>  include/configs/mx7dsabresd.h                  |  1 -
>  include/configs/nitrogen6x.h                   |  1 -
>  include/configs/novena.h                       |  1 -
>  include/configs/opos6uldev.h                   |  3 ---
>  include/configs/pico-imx6.h                    |  1 -
>  include/configs/pico-imx6ul.h                  |  1 -
>  include/configs/pico-imx7d.h                   |  1 -
>  include/configs/puma_rk3399.h                  |  4 ----
>  include/configs/s5p4418_nanopi2.h              |  5 -----
>  include/configs/s5pc210_universal.h            |  1 -
>  include/configs/stm32f746-disco.h              |  5 -----
>  include/configs/stm32mp1.h                     |  6 ------
>  include/configs/theadorable-x86-common.h       |  1 -
>  include/configs/theadorable.h                  |  4 ----
>  include/configs/trats.h                        |  1 -
>  include/configs/trats2.h                       |  1 -
>  include/configs/wandboard.h                    |  1 -
>  scripts/config_whitelist.txt                   |  3 ---
>  103 files changed, 122 insertions(+), 63 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
