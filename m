Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BEC9909
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2019 09:34:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0D13C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2019 07:34:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A598C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 07:25:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x937G5Yg008534; Thu, 3 Oct 2019 09:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4vSWlQ4GxNb2VMmqnKh+yYgzoN52Q2mFTvEgOiYRTKk=;
 b=IivxDAfYO/Ir/gTb25dhpRzR7u89xWqoalAVpCPxEX267CQLUnW3nJ3fg5Jm3VLuZJ4H
 ZJpajxkreO7fYlpfTR4Kob64zJ9NH9nfOimjmhiCLzuh4l98Nhl247/oWVtAoJcblH22
 +sHrEJEK46HFIpWPYnDAeXJHiYPIojTuJUw69jar0xcizh6b/by8D9TkQs6mc3A/a/ll
 PeeE6ug34L310RPSbSpbEHAnqQfXgn/h5dfR3q6jz9p999BQvdsfMZjyA1fJvL9znuUm
 UFkd8oxk4Pw+wnC8xnpm29dgJwF08w/d0M6SvF/EXcOKsdjqTLYeJZgOUQNferIsqrgK og== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9vnak53a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 09:24:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1EAAE4E;
 Thu,  3 Oct 2019 07:24:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E5022A9703;
 Thu,  3 Oct 2019 09:24:51 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 3 Oct 2019
 09:24:51 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 3 Oct 2019 09:24:50
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Oct 2019 09:24:28 +0200
Message-ID: <20191003072428.19197-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003072428.19197-1-patrick.delaunay@st.com>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_03:2019-10-01,2019-10-03 signatures=0
X-Mailman-Approved-At: Thu, 03 Oct 2019 07:34:51 +0000
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Wolfgang Denk <wd@denx.de>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam
 Ford <aford173@gmail.com>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v4 3/3] env: Add CONFIG_ENV_FULL_SUPPORT
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

Add a new flag CONFIG_ENV_FULL_SUPPORT to compile all
the environment features (attributes, callbacks
and flags) in U-Boot, TPL and SPL.

This flag replace the existing flags for SPL and TPL
(CONFIG_SPL_ENV_SUPPORT / CONFIG_TPL_ENV_SUPPORT), because
the same support of environment features is mandatory for U-Boot,
SPL and TPL.

To deactivate the load/save environment support in SPL / TPL,
the board need to activate CONFIG_SPL_ENV_IS_NOWHERE or
CONFIG_TPL_ENV_IS_NOWHERE.

With this patch, the environment is activated by default in SPL
and TPL, which include the content of default_environment[] as
U-boot. To avoid to increase their size, this patch also add
3 new confif : CONFIG_$(SPL_TPL_)ENV_DEFAULT.
It is deactivated by default for SPL/TPL and activated by
default for U-Boot, the default environment for SPL/TPL is empty
and it will be populated only when it will be loaded from storage
medium.

All the test on CONFIG_SPL_ENV_SUPPORT are replaced by the
ENV_IS_SOMEWHERE macro, which tests if the environment is
storage medium.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4:
- Add CONFIG_$(SPL_TPL_)ENV_DEFAULT: empty default environment
  when not activated

Changes in v3:
- It is a version 3 of
  http://patchwork.ozlabs.org/project/uboot/list/?series=129339
  "env: Add CONFIG_ENV_SUPPORT"
  after Tom Rimi and Wolfgang Denk remarks

Changes in v2:
- Update commit message after Lukasz Majewki review

 arch/arm/mach-omap2/Kconfig                   |  1 -
 arch/arm/mach-omap2/am33xx/Kconfig            |  2 --
 board/birdland/bav335x/board.c                |  2 +-
 board/gateworks/gw_ventana/gw_ventana_spl.c   |  2 +-
 board/liebherr/display5/spl.c                 |  4 +--
 board/tcl/sl50/board.c                        |  2 +-
 board/ti/am335x/board.c                       |  2 +-
 board/ti/am57xx/board.c                       |  2 +-
 board/ti/dra7xx/evm.c                         |  2 +-
 cmd/Kconfig                                   |  2 ++
 cmd/nvedit.c                                  |  2 --
 common/spl/Kconfig                            | 20 -----------
 common/spl/spl_ext.c                          |  2 +-
 common/spl/spl_fat.c                          |  2 +-
 configs/A10-OLinuXino-Lime_defconfig          |  1 +
 configs/A10s-OLinuXino-M_defconfig            |  1 +
 configs/A13-OLinuXinoM_defconfig              |  1 +
 configs/A13-OLinuXino_defconfig               |  1 +
 configs/A20-OLinuXino-Lime2-eMMC_defconfig    |  1 +
 configs/A20-OLinuXino-Lime2_defconfig         |  1 +
 configs/A20-OLinuXino-Lime_defconfig          |  1 +
 configs/A20-OLinuXino_MICRO-eMMC_defconfig    |  1 +
 configs/A20-OLinuXino_MICRO_defconfig         |  1 +
 configs/A20-Olimex-SOM-EVB_defconfig          |  1 +
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig  |  1 +
 configs/A20-Olimex-SOM204-EVB_defconfig       |  1 +
 configs/A33-OLinuXino_defconfig               |  1 +
 configs/Ainol_AW1_defconfig                   |  1 +
 configs/Ampe_A76_defconfig                    |  1 +
 configs/Auxtek-T003_defconfig                 |  1 +
 configs/Auxtek-T004_defconfig                 |  1 +
 configs/B4420QDS_NAND_defconfig               |  1 -
 configs/B4860QDS_NAND_defconfig               |  1 -
 configs/BSC9131RDB_NAND_SYSCLK100_defconfig   |  1 +
 configs/BSC9131RDB_NAND_defconfig             |  1 +
 configs/BSC9132QDS_NAND_DDRCLK100_defconfig   |  1 +
 configs/BSC9132QDS_NAND_DDRCLK133_defconfig   |  1 +
 configs/Bananapi_M2_Ultra_defconfig           |  1 +
 configs/Bananapi_defconfig                    |  1 +
 configs/Bananapi_m2m_defconfig                |  1 +
 configs/Bananapro_defconfig                   |  1 +
 configs/C29XPCIE_NAND_defconfig               |  2 +-
 configs/CHIP_pro_defconfig                    |  1 +
 configs/CSQ_CS908_defconfig                   |  1 +
 configs/Chuwi_V7_CW0825_defconfig             |  1 +
 configs/Colombus_defconfig                    |  1 +
 configs/Cubieboard2_defconfig                 |  1 +
 configs/Cubieboard4_defconfig                 |  1 +
 configs/Cubieboard_defconfig                  |  1 +
 configs/Cubietruck_defconfig                  |  1 +
 configs/Cubietruck_plus_defconfig             |  1 +
 configs/Empire_electronix_d709_defconfig      |  1 +
 configs/Empire_electronix_m712_defconfig      |  1 +
 configs/Hummingbird_A31_defconfig             |  1 +
 configs/Hyundai_A7HD_defconfig                |  1 +
 configs/Itead_Ibox_A20_defconfig              |  1 +
 configs/Lamobo_R1_defconfig                   |  1 +
 configs/LicheePi_Zero_defconfig               |  1 +
 configs/Linksprite_pcDuino3_Nano_defconfig    |  1 +
 configs/Linksprite_pcDuino3_defconfig         |  1 +
 configs/Linksprite_pcDuino_defconfig          |  1 +
 configs/MK808C_defconfig                      |  1 +
 configs/MPC8313ERDB_NAND_33_defconfig         |  1 +
 configs/MPC8313ERDB_NAND_66_defconfig         |  1 +
 configs/MSI_Primo73_defconfig                 |  1 +
 configs/MSI_Primo81_defconfig                 |  1 +
 configs/Marsboard_A10_defconfig               |  1 +
 configs/Mele_A1000G_quad_defconfig            |  1 +
 configs/Mele_A1000_defconfig                  |  1 +
 configs/Mele_I7_defconfig                     |  1 +
 configs/Mele_M3_defconfig                     |  1 +
 configs/Mele_M5_defconfig                     |  1 +
 configs/Mele_M9_defconfig                     |  1 +
 configs/Merrii_A80_Optimus_defconfig          |  1 +
 configs/Mini-X_defconfig                      |  1 +
 configs/Orangepi_defconfig                    |  1 +
 configs/Orangepi_mini_defconfig               |  1 +
 configs/P1010RDB-PA_36BIT_NAND_defconfig      |  2 +-
 configs/P1010RDB-PA_36BIT_SDCARD_defconfig    |  1 -
 configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig  |  1 -
 configs/P1010RDB-PA_NAND_defconfig            |  2 +-
 configs/P1010RDB-PA_SDCARD_defconfig          |  1 -
 configs/P1010RDB-PA_SPIFLASH_defconfig        |  1 -
 configs/P1010RDB-PB_36BIT_NAND_defconfig      |  2 +-
 configs/P1010RDB-PB_36BIT_SDCARD_defconfig    |  1 -
 configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig  |  1 -
 configs/P1010RDB-PB_NAND_defconfig            |  2 +-
 configs/P1010RDB-PB_SDCARD_defconfig          |  1 -
 configs/P1010RDB-PB_SPIFLASH_defconfig        |  1 -
 configs/P1020MBG-PC_36BIT_SDCARD_defconfig    |  1 -
 configs/P1020MBG-PC_SDCARD_defconfig          |  1 -
 configs/P1020RDB-PC_36BIT_NAND_defconfig      |  2 +-
 configs/P1020RDB-PC_36BIT_SDCARD_defconfig    |  1 -
 configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig  |  1 -
 configs/P1020RDB-PC_NAND_defconfig            |  2 +-
 configs/P1020RDB-PC_SDCARD_defconfig          |  1 -
 configs/P1020RDB-PC_SPIFLASH_defconfig        |  1 -
 configs/P1020RDB-PD_NAND_defconfig            |  2 +-
 configs/P1020RDB-PD_SDCARD_defconfig          |  1 -
 configs/P1020RDB-PD_SPIFLASH_defconfig        |  1 -
 configs/P1020UTM-PC_36BIT_SDCARD_defconfig    |  1 -
 configs/P1020UTM-PC_SDCARD_defconfig          |  1 -
 configs/P1021RDB-PC_36BIT_NAND_defconfig      |  2 +-
 configs/P1021RDB-PC_36BIT_SDCARD_defconfig    |  1 -
 configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig  |  1 -
 configs/P1021RDB-PC_NAND_defconfig            |  2 +-
 configs/P1021RDB-PC_SDCARD_defconfig          |  1 -
 configs/P1021RDB-PC_SPIFLASH_defconfig        |  1 -
 configs/P1022DS_36BIT_NAND_defconfig          |  2 +-
 configs/P1022DS_36BIT_SDCARD_defconfig        |  1 -
 configs/P1022DS_36BIT_SPIFLASH_defconfig      |  1 -
 configs/P1022DS_NAND_defconfig                |  2 +-
 configs/P1022DS_SDCARD_defconfig              |  1 -
 configs/P1022DS_SPIFLASH_defconfig            |  1 -
 configs/P1024RDB_NAND_defconfig               |  2 +-
 configs/P1024RDB_SDCARD_defconfig             |  1 -
 configs/P1024RDB_SPIFLASH_defconfig           |  1 -
 configs/P1025RDB_NAND_defconfig               |  2 +-
 configs/P1025RDB_SDCARD_defconfig             |  1 -
 configs/P1025RDB_SPIFLASH_defconfig           |  1 -
 configs/P2020RDB-PC_36BIT_NAND_defconfig      |  2 +-
 configs/P2020RDB-PC_36BIT_SDCARD_defconfig    |  1 -
 configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig  |  1 -
 configs/P2020RDB-PC_NAND_defconfig            |  2 +-
 configs/P2020RDB-PC_SDCARD_defconfig          |  1 -
 configs/P2020RDB-PC_SPIFLASH_defconfig        |  1 -
 configs/Sinlinx_SinA31s_defconfig             |  1 +
 configs/Sinlinx_SinA33_defconfig              |  1 +
 configs/Sinovoip_BPI_M2_defconfig             |  1 +
 configs/Sinovoip_BPI_M3_defconfig             |  1 +
 configs/Sunchip_CX-A99_defconfig              |  1 +
 configs/T1023RDB_NAND_defconfig               |  1 -
 configs/T1023RDB_SDCARD_defconfig             |  1 -
 configs/T1023RDB_SPIFLASH_defconfig           |  1 -
 configs/T1024QDS_NAND_defconfig               |  1 -
 configs/T1024QDS_SDCARD_defconfig             |  1 -
 configs/T1024QDS_SPIFLASH_defconfig           |  1 -
 configs/T1024RDB_NAND_defconfig               |  1 -
 configs/T1024RDB_SDCARD_defconfig             |  1 -
 configs/T1024RDB_SPIFLASH_defconfig           |  1 -
 configs/T1040D4RDB_NAND_defconfig             |  1 -
 configs/T1040D4RDB_SDCARD_defconfig           |  1 -
 configs/T1040D4RDB_SPIFLASH_defconfig         |  1 -
 configs/T1040RDB_NAND_defconfig               |  1 -
 configs/T1040RDB_SDCARD_defconfig             |  1 -
 configs/T1040RDB_SPIFLASH_defconfig           |  1 -
 configs/T1042D4RDB_NAND_defconfig             |  1 -
 configs/T1042D4RDB_SDCARD_defconfig           |  1 -
 configs/T1042D4RDB_SPIFLASH_defconfig         |  1 -
 .../T1042RDB_PI_NAND_SECURE_BOOT_defconfig    |  1 -
 configs/T1042RDB_PI_NAND_defconfig            |  1 -
 configs/T1042RDB_PI_SDCARD_defconfig          |  1 -
 configs/T1042RDB_PI_SPIFLASH_defconfig        |  1 -
 configs/T2080QDS_NAND_defconfig               |  1 -
 configs/T2080QDS_SDCARD_defconfig             |  1 -
 configs/T2080QDS_SPIFLASH_defconfig           |  1 -
 configs/T2080RDB_NAND_defconfig               |  1 -
 configs/T2080RDB_SDCARD_defconfig             |  1 -
 configs/T2080RDB_SPIFLASH_defconfig           |  1 -
 configs/T2081QDS_NAND_defconfig               |  1 -
 configs/T2081QDS_SDCARD_defconfig             |  1 -
 configs/T2081QDS_SPIFLASH_defconfig           |  1 -
 configs/T4160QDS_NAND_defconfig               |  1 -
 configs/T4160QDS_SDCARD_defconfig             |  1 -
 configs/T4240QDS_NAND_defconfig               |  1 -
 configs/T4240QDS_SDCARD_defconfig             |  1 -
 configs/T4240RDB_SDCARD_defconfig             |  1 -
 configs/UTOO_P66_defconfig                    |  1 +
 configs/Wexler_TAB7200_defconfig              |  1 +
 configs/Wits_Pro_A20_DKT_defconfig            |  1 +
 configs/Wobo_i5_defconfig                     |  1 +
 configs/Yones_Toptech_BD1078_defconfig        |  1 +
 configs/Yones_Toptech_BS1078_V2_defconfig     |  1 +
 configs/a64-olinuxino_defconfig               |  1 +
 configs/ae350_rv32_xip_defconfig              |  1 +
 configs/alt_defconfig                         |  1 +
 configs/am335x_guardian_defconfig             |  1 -
 configs/am335x_hs_evm_defconfig               |  2 +-
 configs/am335x_hs_evm_uart_defconfig          |  2 +-
 configs/am335x_igep003x_defconfig             |  1 +
 configs/am335x_shc_defconfig                  |  1 +
 configs/am335x_shc_ict_defconfig              |  1 +
 configs/am335x_shc_netboot_defconfig          |  1 -
 configs/am335x_shc_sdboot_defconfig           |  1 +
 configs/am335x_sl50_defconfig                 |  1 -
 configs/am3517_crane_defconfig                |  1 +
 configs/am3517_evm_defconfig                  |  1 +
 configs/am65x_evm_a53_defconfig               |  1 +
 configs/am65x_evm_r5_defconfig                |  1 +
 configs/am65x_hs_evm_a53_defconfig            |  1 +
 configs/am65x_hs_evm_r5_defconfig             |  1 +
 configs/amarula_a64_relic_defconfig           |  1 +
 configs/apalis-tk1_defconfig                  |  1 +
 configs/apalis_imx6_defconfig                 |  1 +
 configs/apalis_t30_defconfig                  |  1 +
 configs/apf27_defconfig                       |  1 +
 configs/apx4devkit_defconfig                  |  1 +
 configs/arndale_defconfig                     |  1 +
 configs/axm_defconfig                         |  1 +
 configs/ba10_tv_box_defconfig                 |  1 +
 configs/bananapi_m1_plus_defconfig            |  1 +
 configs/bananapi_m2_berry_defconfig           |  1 +
 configs/bananapi_m2_plus_h3_defconfig         |  1 +
 configs/bananapi_m2_plus_h5_defconfig         |  1 +
 configs/bananapi_m2_zero_defconfig            |  1 +
 configs/bananapi_m64_defconfig                |  1 +
 configs/beaver_defconfig                      |  1 +
 configs/beelink_gs1_defconfig                 |  1 +
 configs/beelink_x2_defconfig                  |  1 +
 configs/bitmain_antminer_s9_defconfig         |  1 +
 configs/brppt1_mmc_defconfig                  |  1 +
 configs/brppt1_nand_defconfig                 |  1 +
 configs/brppt1_spi_defconfig                  |  1 +
 configs/brsmarc1_defconfig                    |  1 +
 configs/brxre1_defconfig                      |  1 +
 configs/cairo_defconfig                       |  1 +
 configs/cardhu_defconfig                      |  1 +
 configs/cei-tk1-som_defconfig                 |  1 +
 configs/cgtqmx6eval_defconfig                 |  1 +
 configs/chiliboard_defconfig                  |  1 +
 configs/chromebook_bob_defconfig              |  1 +
 configs/chromebook_link64_defconfig           |  1 -
 configs/chromebook_samus_tpl_defconfig        |  2 ++
 configs/ci20_mmc_defconfig                    |  1 +
 configs/cl-som-imx7_defconfig                 |  1 +
 configs/clearfog_defconfig                    |  1 +
 configs/cm_fx6_defconfig                      |  1 +
 configs/cm_t335_defconfig                     |  1 +
 configs/cm_t35_defconfig                      |  1 +
 configs/cm_t43_defconfig                      |  1 +
 configs/colibri_imx6_defconfig                |  1 +
 configs/colibri_t20_defconfig                 |  1 +
 configs/colibri_t30_defconfig                 |  1 +
 configs/colorfly_e708_q1_defconfig            |  1 +
 configs/controlcenterdc_defconfig             |  1 +
 configs/corvus_defconfig                      |  1 +
 configs/da850evm_defconfig                    |  1 +
 configs/da850evm_nand_defconfig               |  1 +
 configs/dalmore_defconfig                     |  1 +
 configs/db-88f6720_defconfig                  |  1 +
 configs/db-88f6820-amc_defconfig              |  1 +
 configs/db-88f6820-gp_defconfig               |  1 +
 configs/db-mv784mp-gp_defconfig               |  1 +
 configs/devkit3250_defconfig                  |  1 +
 configs/devkit8000_defconfig                  |  1 +
 configs/dh_imx6_defconfig                     |  1 +
 configs/difrnce_dit4350_defconfig             |  1 +
 configs/display5_defconfig                    |  1 -
 configs/display5_factory_defconfig            |  1 +
 configs/draco_defconfig                       |  1 +
 configs/ds414_defconfig                       |  1 +
 configs/dserve_dsrv9703c_defconfig            |  1 +
 configs/edminiv2_defconfig                    |  1 +
 configs/emlid_neutis_n5_devboard_defconfig    |  1 +
 configs/etamin_defconfig                      |  1 +
 configs/evb-px5_defconfig                     |  2 ++
 configs/evb-rk3229_defconfig                  |  2 ++
 configs/evb-rk3288_defconfig                  |  2 ++
 configs/evb-rk3328_defconfig                  |  2 ++
 configs/evb-rk3399_defconfig                  |  2 ++
 configs/ficus-rk3399_defconfig                |  1 +
 configs/firefly-rk3288_defconfig              |  1 +
 configs/firefly-rk3399_defconfig              |  2 ++
 configs/ga10h_v1_1_defconfig                  |  1 +
 .../gardena-smart-gateway-at91sam_defconfig   |  1 +
 configs/gose_defconfig                        |  1 +
 configs/gt90h_v4_defconfig                    |  1 +
 configs/gwventana_emmc_defconfig              |  1 +
 configs/gwventana_gw5904_defconfig            |  1 +
 configs/gwventana_nand_defconfig              |  1 +
 configs/h8_homlet_v2_defconfig                |  1 +
 configs/harmony_defconfig                     |  1 +
 configs/helios4_defconfig                     |  1 +
 configs/i12-tvbox_defconfig                   |  1 +
 configs/iNet_3F_defconfig                     |  1 +
 configs/iNet_3W_defconfig                     |  1 +
 configs/iNet_86VS_defconfig                   |  1 +
 configs/iNet_D978_rev2_defconfig              |  1 +
 configs/icnova-a20-swac_defconfig             |  1 +
 configs/igep00x0_defconfig                    |  1 +
 configs/imx6dl_icore_nand_defconfig           |  1 +
 configs/imx6dl_mamoj_defconfig                |  1 +
 configs/imx6q_icore_nand_defconfig            |  1 +
 configs/imx6q_logic_defconfig                 |  1 +
 configs/imx6qdl_icore_mipi_defconfig          |  1 +
 configs/imx6qdl_icore_mmc_defconfig           |  1 +
 configs/imx6qdl_icore_nand_defconfig          |  1 +
 configs/imx6qdl_icore_rqs_defconfig           |  1 +
 configs/imx6ul_geam_mmc_defconfig             |  1 +
 configs/imx6ul_geam_nand_defconfig            |  1 +
 configs/imx6ul_isiot_emmc_defconfig           |  1 +
 configs/imx6ul_isiot_nand_defconfig           |  1 +
 configs/imx8mq_evk_defconfig                  |  1 +
 configs/imx8qm_mek_defconfig                  |  1 +
 configs/imx8qxp_mek_defconfig                 |  1 +
 configs/inet1_defconfig                       |  1 +
 configs/inet86dz_defconfig                    |  1 +
 configs/inet97fv2_defconfig                   |  1 +
 configs/inet98v_rev2_defconfig                |  1 +
 configs/inet9f_rev03_defconfig                |  1 +
 configs/inet_q972_defconfig                   |  1 +
 configs/j721e_evm_r5_defconfig                |  1 -
 configs/jesurun_q5_defconfig                  |  1 +
 configs/jetson-tk1_defconfig                  |  1 +
 configs/k2e_evm_defconfig                     |  1 +
 configs/k2g_evm_defconfig                     |  1 +
 configs/k2hk_evm_defconfig                    |  1 +
 configs/k2l_evm_defconfig                     |  1 +
 configs/khadas-edge-captain-rk3399_defconfig  |  2 ++
 configs/khadas-edge-rk3399_defconfig          |  2 ++
 configs/khadas-edge-v-rk3399_defconfig        |  2 ++
 configs/koelsch_defconfig                     |  1 +
 configs/kp_imx6q_tpc_defconfig                |  1 +
 configs/kylin-rk3036_defconfig                |  1 +
 configs/lager_defconfig                       |  1 +
 configs/libretech_all_h3_cc_h2_plus_defconfig |  1 +
 configs/libretech_all_h3_cc_h3_defconfig      |  1 +
 configs/libretech_all_h3_cc_h5_defconfig      |  1 +
 configs/lion-rk3368_defconfig                 |  2 ++
 configs/liteboard_defconfig                   |  1 +
 configs/ls1021aiot_sdcard_defconfig           |  1 +
 configs/ls1021aqds_nand_defconfig             |  1 -
 configs/ls1021aqds_sdcard_ifc_defconfig       |  1 -
 configs/ls1021aqds_sdcard_qspi_defconfig      |  1 -
 configs/ls1021atsn_sdcard_defconfig           |  1 -
 ...s1021atwr_sdcard_ifc_SECURE_BOOT_defconfig |  1 -
 configs/ls1021atwr_sdcard_ifc_defconfig       |  1 -
 configs/ls1021atwr_sdcard_qspi_defconfig      |  1 -
 configs/ls1043aqds_nand_defconfig             |  1 -
 configs/ls1043aqds_sdcard_ifc_defconfig       |  1 -
 configs/ls1043aqds_sdcard_qspi_defconfig      |  1 -
 configs/ls1043ardb_nand_SECURE_BOOT_defconfig |  1 -
 configs/ls1043ardb_nand_defconfig             |  1 -
 .../ls1043ardb_sdcard_SECURE_BOOT_defconfig   |  1 -
 configs/ls1043ardb_sdcard_defconfig           |  1 -
 configs/ls1046aqds_nand_defconfig             |  1 +
 configs/ls1046aqds_sdcard_ifc_defconfig       |  1 -
 configs/ls1046aqds_sdcard_qspi_defconfig      |  1 -
 configs/ls1046ardb_emmc_defconfig             |  1 -
 configs/ls1046ardb_qspi_spl_defconfig         |  1 -
 .../ls1046ardb_sdcard_SECURE_BOOT_defconfig   |  1 -
 configs/ls1046ardb_sdcard_defconfig           |  1 -
 configs/ls1088aqds_sdcard_ifc_defconfig       |  1 -
 configs/ls1088aqds_sdcard_qspi_defconfig      |  1 -
 ...1088ardb_sdcard_qspi_SECURE_BOOT_defconfig |  1 -
 configs/ls1088ardb_sdcard_qspi_defconfig      |  1 -
 configs/ls2080aqds_nand_defconfig             |  1 -
 configs/ls2080aqds_sdcard_defconfig           |  1 -
 configs/ls2080ardb_nand_defconfig             |  1 -
 configs/m53menlo_defconfig                    |  1 +
 configs/maxbcm_defconfig                      |  1 +
 configs/mccmon6_nor_defconfig                 |  1 -
 configs/mccmon6_sd_defconfig                  |  1 -
 configs/medcom-wide_defconfig                 |  1 +
 configs/miqi-rk3288_defconfig                 |  1 +
 configs/mixtile_loftq_defconfig               |  1 +
 configs/mk802_a10s_defconfig                  |  1 +
 configs/mk802_defconfig                       |  1 +
 configs/mk802ii_defconfig                     |  1 +
 configs/mx23_olinuxino_defconfig              |  1 +
 configs/mx23evk_defconfig                     |  1 +
 configs/mx28evk_auart_console_defconfig       |  1 +
 configs/mx28evk_defconfig                     |  1 +
 configs/mx28evk_nand_defconfig                |  1 +
 configs/mx31pdk_defconfig                     |  1 +
 configs/mx6cuboxi_defconfig                   |  1 +
 configs/mx6sabreauto_defconfig                |  1 +
 configs/mx6sabresd_defconfig                  |  1 +
 configs/mx6slevk_spl_defconfig                |  1 +
 configs/mx6sxsabresd_spl_defconfig            |  1 +
 configs/mx6ul_14x14_evk_defconfig             |  1 +
 configs/mx6ul_9x9_evk_defconfig               |  1 +
 configs/nanopc-t4-rk3399_defconfig            |  2 ++
 configs/nanopi-m4-rk3399_defconfig            |  2 ++
 configs/nanopi-neo4-rk3399_defconfig          |  2 ++
 configs/nanopi_a64_defconfig                  |  1 +
 configs/nanopi_m1_defconfig                   |  1 +
 configs/nanopi_m1_plus_defconfig              |  1 +
 configs/nanopi_neo2_defconfig                 |  1 +
 configs/nanopi_neo_air_defconfig              |  1 +
 configs/nanopi_neo_defconfig                  |  1 +
 configs/nanopi_neo_plus2_defconfig            |  1 +
 configs/novena_defconfig                      |  1 +
 configs/nyan-big_defconfig                    |  1 +
 configs/oceanic_5205_5inmfd_defconfig         |  1 +
 configs/omap35_logic_defconfig                |  1 +
 configs/omap35_logic_somlv_defconfig          |  1 +
 configs/omap3_beagle_defconfig                |  1 +
 configs/omap3_evm_defconfig                   |  1 +
 configs/omap3_ha_defconfig                    |  1 +
 configs/omap3_logic_defconfig                 |  1 +
 configs/omap3_logic_somlv_defconfig           |  1 +
 configs/omap3_overo_defconfig                 |  1 +
 configs/omap4_panda_defconfig                 |  1 +
 configs/omap4_sdp4430_defconfig               |  1 +
 configs/omapl138_lcdk_defconfig               |  1 +
 configs/opos6uldev_defconfig                  |  1 -
 configs/orangepi-rk3399_defconfig             |  2 ++
 configs/orangepi_2_defconfig                  |  1 +
 configs/orangepi_lite2_defconfig              |  1 +
 configs/orangepi_lite_defconfig               |  1 +
 configs/orangepi_one_defconfig                |  1 +
 configs/orangepi_one_plus_defconfig           |  1 +
 configs/orangepi_pc2_defconfig                |  1 +
 configs/orangepi_pc_defconfig                 |  1 +
 configs/orangepi_pc_plus_defconfig            |  1 +
 configs/orangepi_plus2e_defconfig             |  1 +
 configs/orangepi_plus_defconfig               |  1 +
 configs/orangepi_prime_defconfig              |  1 +
 configs/orangepi_r1_defconfig                 |  1 +
 configs/orangepi_win_defconfig                |  1 +
 configs/orangepi_zero_defconfig               |  1 +
 configs/orangepi_zero_plus2_defconfig         |  1 +
 configs/orangepi_zero_plus_defconfig          |  1 +
 configs/origen_defconfig                      |  1 +
 configs/ot1200_spl_defconfig                  |  1 +
 configs/parrot_r16_defconfig                  |  1 +
 configs/paz00_defconfig                       |  1 +
 configs/pcm051_rev1_defconfig                 |  1 -
 configs/pcm051_rev3_defconfig                 |  1 -
 configs/pcm058_defconfig                      |  1 +
 configs/peach-pi_defconfig                    |  1 +
 configs/peach-pit_defconfig                   |  1 +
 configs/pengwyn_defconfig                     |  1 -
 configs/phycore-am335x-r2-wega_defconfig      |  1 +
 configs/phycore-rk3288_defconfig              |  1 +
 configs/pico-hobbit-imx6ul_defconfig          |  1 +
 configs/pico-hobbit-imx7d_defconfig           |  1 +
 configs/pico-imx6ul_defconfig                 |  1 +
 configs/pico-imx7d_bl33_defconfig             |  1 +
 configs/pico-imx7d_defconfig                  |  1 +
 configs/pico-pi-imx6ul_defconfig              |  1 +
 configs/pico-pi-imx7d_defconfig               |  1 +
 configs/picosam9g45_defconfig                 |  1 +
 configs/pine64-lts_defconfig                  |  1 +
 configs/pine64_plus_defconfig                 |  1 +
 configs/pine_h64_defconfig                    |  1 +
 configs/pinebook_defconfig                    |  1 +
 configs/platinum_picon_defconfig              |  1 +
 configs/platinum_titanium_defconfig           |  1 +
 configs/plutux_defconfig                      |  1 +
 configs/polaroid_mid2407pxe03_defconfig       |  1 +
 configs/polaroid_mid2809pxe04_defconfig       |  1 +
 configs/popmetal-rk3288_defconfig             |  1 +
 configs/porter_defconfig                      |  1 +
 configs/pov_protab2_ips9_defconfig            |  1 +
 configs/puma-rk3399_defconfig                 |  1 +
 configs/pxm2_defconfig                        |  1 +
 configs/q8_a13_tablet_defconfig               |  1 +
 configs/q8_a23_tablet_800x480_defconfig       |  1 +
 configs/q8_a33_tablet_1024x600_defconfig      |  1 +
 configs/q8_a33_tablet_800x480_defconfig       |  1 +
 configs/qemu-riscv32_smode_defconfig          |  1 +
 configs/qemu-x86_64_defconfig                 |  1 -
 configs/r7-tv-dongle_defconfig                |  1 +
 configs/r8a7795_salvator-x_defconfig          |  1 +
 configs/r8a7795_ulcb_defconfig                |  1 +
 configs/r8a77965_salvator-x_defconfig         |  1 +
 configs/r8a77965_ulcb_defconfig               |  1 +
 configs/r8a7796_salvator-x_defconfig          |  1 +
 configs/r8a7796_ulcb_defconfig                |  1 +
 configs/r8a77970_eagle_defconfig              |  1 +
 configs/r8a77980_condor_defconfig             |  1 +
 configs/r8a77990_ebisu_defconfig              |  1 +
 configs/r8a77995_draak_defconfig              |  1 +
 configs/rastaban_defconfig                    |  1 +
 configs/riotboard_spl_defconfig               |  1 +
 configs/roc-rk3399-pc_defconfig               |  2 ++
 configs/rock-pi-4-rk3399_defconfig            |  2 ++
 configs/rock2_defconfig                       |  1 +
 configs/rock64-rk3328_defconfig               |  2 ++
 configs/rock960-rk3399_defconfig              |  1 +
 configs/rock_defconfig                        |  1 +
 configs/rockpro64-rk3399_defconfig            |  2 ++
 configs/rut_defconfig                         |  1 +
 configs/sama5d27_som1_ek_mmc1_defconfig       |  1 +
 configs/sama5d27_som1_ek_mmc_defconfig        |  1 +
 configs/sama5d27_som1_ek_qspiflash_defconfig  |  1 +
 configs/sama5d2_icp_mmc_defconfig             |  1 +
 configs/sama5d2_xplained_emmc_defconfig       |  1 +
 configs/sama5d2_xplained_mmc_defconfig        |  1 +
 configs/sama5d2_xplained_qspiflash_defconfig  |  1 +
 configs/sama5d2_xplained_spiflash_defconfig   |  1 +
 configs/sama5d3_xplained_mmc_defconfig        |  1 +
 configs/sama5d3_xplained_nandflash_defconfig  |  1 +
 configs/sama5d3xek_mmc_defconfig              |  1 +
 configs/sama5d3xek_nandflash_defconfig        |  1 +
 configs/sama5d3xek_spiflash_defconfig         |  1 +
 configs/sama5d4_xplained_mmc_defconfig        |  1 +
 configs/sama5d4_xplained_nandflash_defconfig  |  1 +
 configs/sama5d4_xplained_spiflash_defconfig   |  1 +
 configs/sama5d4ek_mmc_defconfig               |  1 +
 configs/sama5d4ek_nandflash_defconfig         |  1 +
 configs/sama5d4ek_spiflash_defconfig          |  1 +
 configs/sandbox_spl_defconfig                 |  1 -
 configs/sc_sps_1_defconfig                    |  1 +
 configs/seaboard_defconfig                    |  1 +
 configs/sh7752evb_defconfig                   |  1 +
 configs/silk_defconfig                        |  1 +
 configs/sksimx6_defconfig                     |  1 +
 configs/smartweb_defconfig                    |  1 +
 configs/smdk5250_defconfig                    |  1 +
 configs/smdk5420_defconfig                    |  1 +
 configs/smdkv310_defconfig                    |  1 +
 configs/snow_defconfig                        |  1 +
 configs/socfpga_arria10_defconfig             |  1 -
 configs/socfpga_arria5_defconfig              |  1 +
 configs/socfpga_cyclone5_defconfig            |  1 +
 configs/socfpga_dbm_soc1_defconfig            |  1 +
 configs/socfpga_de0_nano_soc_defconfig        |  1 +
 configs/socfpga_de10_nano_defconfig           |  1 +
 configs/socfpga_de1_soc_defconfig             |  1 +
 configs/socfpga_is1_defconfig                 |  1 +
 configs/socfpga_mcvevk_defconfig              |  1 +
 configs/socfpga_sockit_defconfig              |  1 +
 configs/socfpga_socrates_defconfig            |  1 +
 configs/socfpga_sr1500_defconfig              |  1 +
 configs/socfpga_stratix10_defconfig           |  1 +
 configs/socfpga_vining_fpga_defconfig         |  1 +
 configs/sopine_baseboard_defconfig            |  1 +
 configs/spring_defconfig                      |  1 +
 configs/stout_defconfig                       |  1 +
 configs/sun8i_a23_evb_defconfig               |  1 +
 configs/sunxi_Gemei_G9_defconfig              |  1 +
 configs/tao3530_defconfig                     |  1 +
 configs/taurus_defconfig                      |  1 +
 configs/tbs_a711_defconfig                    |  1 +
 configs/tec-ng_defconfig                      |  1 +
 configs/tec_defconfig                         |  1 +
 configs/teres_i_defconfig                     |  1 +
 configs/theadorable_debug_defconfig           |  1 +
 configs/thuban_defconfig                      |  1 +
 configs/ti816x_evm_defconfig                  |  1 +
 configs/tinker-rk3288_defconfig               |  2 ++
 configs/tricorder_defconfig                   |  1 +
 configs/trimslice_defconfig                   |  1 +
 configs/ts4600_defconfig                      |  1 +
 configs/turris_omnia_defconfig                |  1 +
 configs/udoo_defconfig                        |  1 +
 configs/udoo_neo_defconfig                    |  1 -
 configs/venice2_defconfig                     |  1 +
 configs/ventana_defconfig                     |  1 +
 configs/vyasa-rk3288_defconfig                |  2 ++
 configs/wandboard_defconfig                   |  1 +
 configs/wb45n_defconfig                       |  1 +
 configs/wb50n_defconfig                       |  1 +
 configs/woodburn_sd_defconfig                 |  1 +
 configs/work_92105_defconfig                  |  1 +
 configs/x530_defconfig                        |  1 +
 configs/x600_defconfig                        |  1 +
 .../xilinx_zynqmp_zc1751_xm015_dc1_defconfig  |  1 +
 .../xilinx_zynqmp_zc1751_xm018_dc4_defconfig  |  1 +
 .../xilinx_zynqmp_zc1751_xm019_dc5_defconfig  |  1 +
 configs/xilinx_zynqmp_zcu102_rev1_0_defconfig |  1 +
 configs/xilinx_zynqmp_zcu102_revA_defconfig   |  1 +
 configs/xilinx_zynqmp_zcu102_revB_defconfig   |  1 +
 configs/xilinx_zynqmp_zcu104_revA_defconfig   |  1 +
 configs/xilinx_zynqmp_zcu104_revC_defconfig   |  1 +
 configs/xilinx_zynqmp_zcu106_revA_defconfig   |  1 +
 configs/xilinx_zynqmp_zcu111_revA_defconfig   |  1 +
 configs/xpress_spl_defconfig                  |  1 +
 configs/zc5202_defconfig                      |  1 +
 configs/zc5601_defconfig                      |  1 +
 configs/zynq_dlc20_rev1_0_defconfig           |  1 +
 configs/zynq_microzed_defconfig               |  1 +
 configs/zynq_minized_defconfig                |  1 +
 configs/zynq_zc702_defconfig                  |  1 +
 configs/zynq_zc706_defconfig                  |  1 +
 configs/zynq_zc770_xm010_defconfig            |  1 +
 configs/zynq_zc770_xm012_defconfig            |  1 +
 configs/zynq_zed_defconfig                    |  1 +
 configs/zynq_zybo_defconfig                   |  1 +
 configs/zynq_zybo_z7_defconfig                |  1 +
 drivers/input/input.c                         |  2 +-
 drivers/mtd/nand/raw/Makefile                 |  4 +--
 drivers/reset/reset-socfpga.c                 |  2 +-
 env/Kconfig                                   | 33 +++++++++++++++++--
 env/Makefile                                  | 11 +++----
 env/common.c                                  |  6 ++--
 include/configs/ls1021aiot.h                  |  1 -
 include/configs/ls1046a_common.h              |  1 -
 include/configs/xilinx_zynqmp.h               |  1 -
 include/env_callback.h                        |  4 +++
 include/env_default.h                         |  4 +++
 include/env_flags.h                           |  4 +++
 585 files changed, 529 insertions(+), 189 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index ed8056e871..d2c48d2d52 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -58,7 +58,6 @@ config OMAP54XX
 	imply NAND_OMAP_ELM
 	imply NAND_OMAP_GPMC
 	imply SPL_DISPLAY_PRINT
-	imply SPL_ENV_SUPPORT
 	imply SPL_FS_EXT4
 	imply SPL_FS_FAT
 	imply SPL_GPIO_SUPPORT
diff --git a/arch/arm/mach-omap2/am33xx/Kconfig b/arch/arm/mach-omap2/am33xx/Kconfig
index 7f6b344c82..0f12f46d10 100644
--- a/arch/arm/mach-omap2/am33xx/Kconfig
+++ b/arch/arm/mach-omap2/am33xx/Kconfig
@@ -37,7 +37,6 @@ config TARGET_AM335X_EVM
 	imply CMD_DM
 	imply SPL_DM
 	imply SPL_DM_SEQ_ALIAS
-	imply SPL_ENV_SUPPORT
 	imply SPL_FS_EXT4
 	imply SPL_FS_FAT
 	imply SPL_GPIO_SUPPORT
@@ -248,7 +247,6 @@ config TARGET_AM43XX_EVM
 	imply DM_I2C
 	imply DM_SPI
 	imply DM_SPI_FLASH
-	imply SPL_ENV_SUPPORT
 	imply SPL_FS_EXT4
 	imply SPL_FS_FAT
 	imply SPL_GPIO_SUPPORT
diff --git a/board/birdland/bav335x/board.c b/board/birdland/bav335x/board.c
index 8811583ac6..57b86fbc0d 100644
--- a/board/birdland/bav335x/board.c
+++ b/board/birdland/bav335x/board.c
@@ -159,7 +159,7 @@ int spl_start_uboot(void)
 	if (serial_tstc() && serial_getc() == 'c')
 		return 1;
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_SOMEWHERE
 	env_init();
 	env_load();
 	if (env_get_yesno("boot_os") != 1)
diff --git a/board/gateworks/gw_ventana/gw_ventana_spl.c b/board/gateworks/gw_ventana/gw_ventana_spl.c
index b0891379a1..98ed0379d0 100644
--- a/board/gateworks/gw_ventana/gw_ventana_spl.c
+++ b/board/gateworks/gw_ventana/gw_ventana_spl.c
@@ -756,7 +756,7 @@ int spl_start_uboot(void)
 	unsigned char ret = 1;
 
 	debug("%s\n", __func__);
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	env_init();
 	env_load();
 	debug("boot_os=%s\n", env_get("boot_os"));
diff --git a/board/liebherr/display5/spl.c b/board/liebherr/display5/spl.c
index 354b63e431..3fc30f5975 100644
--- a/board/liebherr/display5/spl.c
+++ b/board/liebherr/display5/spl.c
@@ -280,7 +280,7 @@ void board_boot_order(u32 *spl_boot_list)
 	if (board_check_emergency_pad())
 		return;
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	/* 'fastboot' */
 	const char *s;
 
@@ -312,7 +312,7 @@ int spl_start_uboot(void)
 	if (serial_tstc() && serial_getc() == 'c')
 		return 1;
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	if (env_get_yesno("boot_os") != 1)
 		return 1;
 #endif
diff --git a/board/tcl/sl50/board.c b/board/tcl/sl50/board.c
index c7eed31946..66e70aeb85 100644
--- a/board/tcl/sl50/board.c
+++ b/board/tcl/sl50/board.c
@@ -73,7 +73,7 @@ int spl_start_uboot(void)
 	if (serial_tstc() && serial_getc() == 'c')
 		return 1;
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	env_init();
 	env_load();
 	if (env_get_yesno("boot_os") != 1)
diff --git a/board/ti/am335x/board.c b/board/ti/am335x/board.c
index 7eaa6cd96d..f124e88e15 100644
--- a/board/ti/am335x/board.c
+++ b/board/ti/am335x/board.c
@@ -249,7 +249,7 @@ int spl_start_uboot(void)
 		return 1;
 #endif
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	env_init();
 	env_load();
 	if (env_get_yesno("boot_os") != 1)
diff --git a/board/ti/am57xx/board.c b/board/ti/am57xx/board.c
index f78e6c2e1f..537aacda85 100644
--- a/board/ti/am57xx/board.c
+++ b/board/ti/am57xx/board.c
@@ -869,7 +869,7 @@ int spl_start_uboot(void)
 	if (serial_tstc() && serial_getc() == 'c')
 		return 1;
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	env_init();
 	env_load();
 	if (env_get_yesno("boot_os") != 1)
diff --git a/board/ti/dra7xx/evm.c b/board/ti/dra7xx/evm.c
index 74d04bb1e3..f1bb7df561 100644
--- a/board/ti/dra7xx/evm.c
+++ b/board/ti/dra7xx/evm.c
@@ -978,7 +978,7 @@ int spl_start_uboot(void)
 	if (serial_tstc() && serial_getc() == 'c')
 		return 1;
 
-#ifdef CONFIG_SPL_ENV_SUPPORT
+#if ENV_IS_IN_SOMEWHERE
 	env_init();
 	env_load();
 	if (env_get_yesno("boot_os") != 1)
diff --git a/cmd/Kconfig b/cmd/Kconfig
index 98647f58b7..217c948b40 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -465,6 +465,7 @@ config CMD_ENV_EXISTS
 
 config CMD_ENV_CALLBACK
 	bool "env callbacks - print callbacks and their associated variables"
+	depends on ENV_FULL_SUPPORT
 	help
 	  Some environment variable have callbacks defined by
 	  U_BOOT_ENV_CALLBACK. These are called when the variable changes.
@@ -473,6 +474,7 @@ config CMD_ENV_CALLBACK
 
 config CMD_ENV_FLAGS
 	bool "env flags -print variables that have non-default flags"
+	depends on ENV_FULL_SUPPORT
 	help
 	  Some environment variables have special flags that control their
 	  behaviour. For example, serial# can only be written once and cannot
diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 7a6ec5ae30..388cd5aae6 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -40,13 +40,11 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
 #if	!ENV_IS_IN_SOMEWHERE		&& \
 	!CONFIG_IS_ENABLED(ENV_IS_NOWHERE)
 # error Define one of CONFIG_ENV_IS_IN_{EEPROM|FLASH|MMC|FAT|EXT4|\
 NAND|NVRAM|ONENAND|SATA|SPI_FLASH|REMOTE|UBI} or CONFIG_ENV_IS_NOWHERE
 #endif
-#endif
 
 /*
  * Maximum expected input data size for import command
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index f467eca2be..2d7b7b093f 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -162,7 +162,6 @@ config SPL_BOOTROM_SUPPORT
 
 config SPL_BOOTCOUNT_LIMIT
 	bool "Support bootcount in SPL"
-	depends on SPL_ENV_SUPPORT
 	help
 	  On some boards, which use 'falcon' mode, it is necessary to check
 	  and increment the number of boot attempts. Such boards do not
@@ -460,21 +459,8 @@ config SPL_DRIVERS_MISC_SUPPORT
 	  option to build the drivers in drivers/misc as part of an SPL
 	  build, for those that support building in SPL (not all drivers do).
 
-config SPL_ENV_SUPPORT
-	bool "Support an environment"
-	help
-	  Enable environment support in SPL. The U-Boot environment provides
-	  a number of settings (essentially name/value pairs) which can
-	  control many aspects of U-Boot's operation. Normally this is not
-	  needed in SPL as it has a much simpler task with less
-	  configuration. But some boards use this to support 'Falcon' boot
-	  on EXT2 and FAT, where SPL boots directly into Linux without
-	  starting U-Boot first. Enabling this option will make env_get()
-	  and env_set() available in SPL.
-
 config SPL_SAVEENV
 	bool "Support save environment"
-	depends on SPL_ENV_SUPPORT
 	select SPL_MMC_WRITE if ENV_IS_IN_MMC
 	help
 	  Enable save environment support in SPL after setenv. By default
@@ -488,7 +474,6 @@ config SPL_SAVEENV
 
 config SPL_ETH_SUPPORT
 	bool "Support Ethernet"
-	depends on SPL_ENV_SUPPORT
 	help
 	  Enable access to the network subsystem and associated Ethernet
 	  drivers in SPL. This permits SPL to load U-Boot over an Ethernet
@@ -1270,11 +1255,6 @@ config TPL_DRIVERS_MISC_SUPPORT
 	  option to build the drivers in drivers/misc as part of an TPL
 	  build, for those that support building in TPL (not all drivers do).
 
-config TPL_ENV_SUPPORT
-	bool "Support an environment"
-	help
-	  Enable environment support in TPL. See SPL_ENV_SUPPORT for details.
-
 config TPL_GPIO_SUPPORT
 	bool "Support GPIO in TPL"
 	help
diff --git a/common/spl/spl_ext.c b/common/spl/spl_ext.c
index 2a6252229c..0ee3368659 100644
--- a/common/spl/spl_ext.c
+++ b/common/spl/spl_ext.c
@@ -86,7 +86,7 @@ int spl_load_image_ext_os(struct spl_image_info *spl_image,
 #endif
 		return -1;
 	}
-#if defined(CONFIG_SPL_ENV_SUPPORT)
+#if ENV_IS_IN_SOMEWHERE
 	file = env_get("falcon_args_file");
 	if (file) {
 		err = ext4fs_open(file, &filelen);
diff --git a/common/spl/spl_fat.c b/common/spl/spl_fat.c
index aa371ab52c..07a76f071e 100644
--- a/common/spl/spl_fat.c
+++ b/common/spl/spl_fat.c
@@ -122,7 +122,7 @@ int spl_load_image_fat_os(struct spl_image_info *spl_image,
 	if (err)
 		return err;
 
-#if defined(CONFIG_SPL_ENV_SUPPORT) && defined(CONFIG_SPL_OS_BOOT)
+#if ENV_IS_IN_SOMEWHERE
 	file = env_get("falcon_args_file");
 	if (file) {
 		err = file_fat_read(file, (void *)CONFIG_SYS_SPL_ARGS_ADDR, 0);
diff --git a/configs/A10-OLinuXino-Lime_defconfig b/configs/A10-OLinuXino-Lime_defconfig
index 9eea922d10..3c3fecad98 100644
--- a/configs/A10-OLinuXino-Lime_defconfig
+++ b/configs/A10-OLinuXino-Lime_defconfig
@@ -17,6 +17,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-olinuxino-lime"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
diff --git a/configs/A10s-OLinuXino-M_defconfig b/configs/A10s-OLinuXino-M_defconfig
index d92a70e4d0..42098fa80a 100644
--- a/configs/A10s-OLinuXino-M_defconfig
+++ b/configs/A10s-OLinuXino-M_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-olinuxino-micro"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
 CONFIG_AXP152_POWER=y
diff --git a/configs/A13-OLinuXinoM_defconfig b/configs/A13-OLinuXinoM_defconfig
index da80d35054..fc0dec5fb4 100644
--- a/configs/A13-OLinuXinoM_defconfig
+++ b/configs/A13-OLinuXinoM_defconfig
@@ -18,6 +18,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-olinuxino-micro"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUNXI_NO_PMIC=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/A13-OLinuXino_defconfig b/configs/A13-OLinuXino_defconfig
index dfd439a52e..b8760639b9 100644
--- a/configs/A13-OLinuXino_defconfig
+++ b/configs/A13-OLinuXino_defconfig
@@ -23,6 +23,7 @@ CONFIG_CMD_USB_MASS_STORAGE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-olinuxino"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_AXP_ALDO3_VOLT=3300
diff --git a/configs/A20-OLinuXino-Lime2-eMMC_defconfig b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
index 7e48328290..fc91e0f60e 100644
--- a/configs/A20-OLinuXino-Lime2-eMMC_defconfig
+++ b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_USB_MASS_STORAGE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime2-emmc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/A20-OLinuXino-Lime2_defconfig b/configs/A20-OLinuXino-Lime2_defconfig
index 084dab0ceb..134b025887 100644
--- a/configs/A20-OLinuXino-Lime2_defconfig
+++ b/configs/A20-OLinuXino-Lime2_defconfig
@@ -19,6 +19,7 @@ CONFIG_CMD_USB_MASS_STORAGE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/A20-OLinuXino-Lime_defconfig b/configs/A20-OLinuXino-Lime_defconfig
index ffeeda414e..99d33a6e80 100644
--- a/configs/A20-OLinuXino-Lime_defconfig
+++ b/configs/A20-OLinuXino-Lime_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/A20-OLinuXino_MICRO-eMMC_defconfig b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
index f4c6c54cfd..e4ac729007 100644
--- a/configs/A20-OLinuXino_MICRO-eMMC_defconfig
+++ b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
@@ -17,6 +17,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-micro-emmc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/A20-OLinuXino_MICRO_defconfig b/configs/A20-OLinuXino_MICRO_defconfig
index 440eebbeec..535dad48b0 100644
--- a/configs/A20-OLinuXino_MICRO_defconfig
+++ b/configs/A20-OLinuXino_MICRO_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-micro"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/A20-Olimex-SOM-EVB_defconfig b/configs/A20-Olimex-SOM-EVB_defconfig
index 48c4c3e53a..fd6852b243 100644
--- a/configs/A20-Olimex-SOM-EVB_defconfig
+++ b/configs/A20-Olimex-SOM-EVB_defconfig
@@ -19,6 +19,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olimex-som-evb"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
index 193e20aa8b..7a5a4340cb 100644
--- a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
@@ -19,6 +19,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olimex-som204-evb-emmc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_PHY_ADDR=3
diff --git a/configs/A20-Olimex-SOM204-EVB_defconfig b/configs/A20-Olimex-SOM204-EVB_defconfig
index 42a73c8057..8d8661c6dc 100644
--- a/configs/A20-Olimex-SOM204-EVB_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olimex-som204-evb"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_PHY_ADDR=3
diff --git a/configs/A33-OLinuXino_defconfig b/configs/A33-OLinuXino_defconfig
index 6ea4238342..409fe3651c 100644
--- a/configs/A33-OLinuXino_defconfig
+++ b/configs/A33-OLinuXino_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a33-olinuxino"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DCDC1_VOLT=3300
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Ainol_AW1_defconfig b/configs/Ainol_AW1_defconfig
index 9b7f19736c..609bb22e2f 100644
--- a/configs/Ainol_AW1_defconfig
+++ b/configs/Ainol_AW1_defconfig
@@ -20,5 +20,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-ainol-aw1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Ampe_A76_defconfig b/configs/Ampe_A76_defconfig
index 1810d48a0b..dddb1ae75d 100644
--- a/configs/Ampe_A76_defconfig
+++ b/configs/Ampe_A76_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-ampe-a76"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Auxtek-T003_defconfig b/configs/Auxtek-T003_defconfig
index 2dc6c8d8e2..879b15e89e 100644
--- a/configs/Auxtek-T003_defconfig
+++ b/configs/Auxtek-T003_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-auxtek-t003"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP152_POWER=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/Auxtek-T004_defconfig b/configs/Auxtek-T004_defconfig
index 4395d5b724..ebbc68d692 100644
--- a/configs/Auxtek-T004_defconfig
+++ b/configs/Auxtek-T004_defconfig
@@ -12,6 +12,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-auxtek-t004"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP152_POWER=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/B4420QDS_NAND_defconfig b/configs/B4420QDS_NAND_defconfig
index 2afce5e54e..a7f3dc110d 100644
--- a/configs/B4420QDS_NAND_defconfig
+++ b/configs/B4420QDS_NAND_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/B4860QDS_NAND_defconfig b/configs/B4860QDS_NAND_defconfig
index 8e0fb2baf0..9b3c5d7087 100644
--- a/configs/B4860QDS_NAND_defconfig
+++ b/configs/B4860QDS_NAND_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/BSC9131RDB_NAND_SYSCLK100_defconfig b/configs/BSC9131RDB_NAND_SYSCLK100_defconfig
index b221db1748..8f179bc5a2 100644
--- a/configs/BSC9131RDB_NAND_SYSCLK100_defconfig
+++ b/configs/BSC9131RDB_NAND_SYSCLK100_defconfig
@@ -32,6 +32,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash,"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:1m(uboot),8m(kernel),512k(dtb),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_NAND=y
diff --git a/configs/BSC9131RDB_NAND_defconfig b/configs/BSC9131RDB_NAND_defconfig
index 921c90fffe..27a8291a6d 100644
--- a/configs/BSC9131RDB_NAND_defconfig
+++ b/configs/BSC9131RDB_NAND_defconfig
@@ -31,6 +31,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash,"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:1m(uboot),8m(kernel),512k(dtb),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_NAND=y
diff --git a/configs/BSC9132QDS_NAND_DDRCLK100_defconfig b/configs/BSC9132QDS_NAND_DDRCLK100_defconfig
index a82544df14..75cc29a375 100644
--- a/configs/BSC9132QDS_NAND_DDRCLK100_defconfig
+++ b/configs/BSC9132QDS_NAND_DDRCLK100_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=88000000.nor,nand0=ff800000.flash,"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=88000000.nor:256k(dtb),7m(kernel),55m(fs),1m(uboot);ff800000.flash:1m(uboot),8m(kernel),512k(dtb),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/BSC9132QDS_NAND_DDRCLK133_defconfig b/configs/BSC9132QDS_NAND_DDRCLK133_defconfig
index 037337254d..9822e58e39 100644
--- a/configs/BSC9132QDS_NAND_DDRCLK133_defconfig
+++ b/configs/BSC9132QDS_NAND_DDRCLK133_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=88000000.nor,nand0=ff800000.flash,"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=88000000.nor:256k(dtb),7m(kernel),55m(fs),1m(uboot);ff800000.flash:1m(uboot),8m(kernel),512k(dtb),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/Bananapi_M2_Ultra_defconfig b/configs/Bananapi_M2_Ultra_defconfig
index 40b60599d5..7bee14d92c 100644
--- a/configs/Bananapi_M2_Ultra_defconfig
+++ b/configs/Bananapi_M2_Ultra_defconfig
@@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
 CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_CMD_FLASH is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-r40-bananapi-m2-ultra"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_RGMII=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/Bananapi_defconfig b/configs/Bananapi_defconfig
index abd7d3d125..8c75c2d2b9 100644
--- a/configs/Bananapi_defconfig
+++ b/configs/Bananapi_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-bananapi"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
diff --git a/configs/Bananapi_m2m_defconfig b/configs/Bananapi_m2m_defconfig
index b4f3794153..a6871968a8 100644
--- a/configs/Bananapi_m2m_defconfig
+++ b/configs/Bananapi_m2m_defconfig
@@ -15,6 +15,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-r16-bananapi-m2m"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/Bananapro_defconfig b/configs/Bananapro_defconfig
index c5d33a2e14..4f9b2702df 100644
--- a/configs/Bananapro_defconfig
+++ b/configs/Bananapro_defconfig
@@ -17,6 +17,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-bananapro"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
diff --git a/configs/C29XPCIE_NAND_defconfig b/configs/C29XPCIE_NAND_defconfig
index 1a0666fcf2..1693e094a6 100644
--- a/configs/C29XPCIE_NAND_defconfig
+++ b/configs/C29XPCIE_NAND_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -35,6 +34,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_DOS_PARTITION=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/CHIP_pro_defconfig b/configs/CHIP_pro_defconfig
index 82994212a2..5bbbc42590 100644
--- a/configs/CHIP_pro_defconfig
+++ b/configs/CHIP_pro_defconfig
@@ -15,6 +15,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-gr8-chip-pro"
 CONFIG_ENV_IS_IN_UBI=y
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot-env"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_MMC is not set
 CONFIG_NAND=y
 CONFIG_SYS_NAND_BLOCK_SIZE=0x40000
diff --git a/configs/CSQ_CS908_defconfig b/configs/CSQ_CS908_defconfig
index 65b6777e0e..4ca57f4c1a 100644
--- a/configs/CSQ_CS908_defconfig
+++ b/configs/CSQ_CS908_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-cs908"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/Chuwi_V7_CW0825_defconfig b/configs/Chuwi_V7_CW0825_defconfig
index 39caa75ff3..b888fc0fab 100644
--- a/configs/Chuwi_V7_CW0825_defconfig
+++ b/configs/Chuwi_V7_CW0825_defconfig
@@ -20,6 +20,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-chuwi-v7-cw0825"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
 CONFIG_VIDEO_LCD_SPI_CS="PA0"
diff --git a/configs/Colombus_defconfig b/configs/Colombus_defconfig
index 9065792149..2ba90baba2 100644
--- a/configs/Colombus_defconfig
+++ b/configs/Colombus_defconfig
@@ -22,6 +22,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31-colombus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
 CONFIG_MII=y
diff --git a/configs/Cubieboard2_defconfig b/configs/Cubieboard2_defconfig
index ee5412cdb8..2eae804a80 100644
--- a/configs/Cubieboard2_defconfig
+++ b/configs/Cubieboard2_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-cubieboard2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Cubieboard4_defconfig b/configs/Cubieboard4_defconfig
index e44d79e0c2..cb8825b048 100644
--- a/configs/Cubieboard4_defconfig
+++ b/configs/Cubieboard4_defconfig
@@ -17,5 +17,6 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun9i-a80-cubieboard4"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP809_POWER=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Cubieboard_defconfig b/configs/Cubieboard_defconfig
index 593dbe86a1..e9edb1dfb4 100644
--- a/configs/Cubieboard_defconfig
+++ b/configs/Cubieboard_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-cubieboard"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
diff --git a/configs/Cubietruck_defconfig b/configs/Cubietruck_defconfig
index fe92f64644..5c048e15c0 100644
--- a/configs/Cubietruck_defconfig
+++ b/configs/Cubietruck_defconfig
@@ -21,6 +21,7 @@ CONFIG_CMD_USB_MASS_STORAGE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-cubietruck"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/Cubietruck_plus_defconfig b/configs/Cubietruck_plus_defconfig
index 9748805dca..ef52c8b41e 100644
--- a/configs/Cubietruck_plus_defconfig
+++ b/configs/Cubietruck_plus_defconfig
@@ -21,6 +21,7 @@ CONFIG_CONSOLE_MUX=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a83t-cubietruck-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_AXP_DLDO3_VOLT=2500
diff --git a/configs/Empire_electronix_d709_defconfig b/configs/Empire_electronix_d709_defconfig
index ff6562df5c..8b0362d2a8 100644
--- a/configs/Empire_electronix_d709_defconfig
+++ b/configs/Empire_electronix_d709_defconfig
@@ -22,6 +22,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-empire-electronix-d709"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Empire_electronix_m712_defconfig b/configs/Empire_electronix_m712_defconfig
index 767d497b3c..e79d38cbcf 100644
--- a/configs/Empire_electronix_m712_defconfig
+++ b/configs/Empire_electronix_m712_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-empire-electronix-m712"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Hummingbird_A31_defconfig b/configs/Hummingbird_A31_defconfig
index 44a66028bd..c1607b9272 100644
--- a/configs/Hummingbird_A31_defconfig
+++ b/configs/Hummingbird_A31_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31-hummingbird"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
 CONFIG_MII=y
diff --git a/configs/Hyundai_A7HD_defconfig b/configs/Hyundai_A7HD_defconfig
index 0fe7c11300..dc0c5112f9 100644
--- a/configs/Hyundai_A7HD_defconfig
+++ b/configs/Hyundai_A7HD_defconfig
@@ -21,5 +21,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-hyundai-a7hd"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Itead_Ibox_A20_defconfig b/configs/Itead_Ibox_A20_defconfig
index 01f259f45d..64937340eb 100644
--- a/configs/Itead_Ibox_A20_defconfig
+++ b/configs/Itead_Ibox_A20_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-itead-ibox"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Lamobo_R1_defconfig b/configs/Lamobo_R1_defconfig
index 974ff1c76b..946fb3bf5b 100644
--- a/configs/Lamobo_R1_defconfig
+++ b/configs/Lamobo_R1_defconfig
@@ -16,6 +16,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-lamobo-r1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_B53_SWITCH=y
 CONFIG_B53_PHY_PORTS=0x1f
diff --git a/configs/LicheePi_Zero_defconfig b/configs/LicheePi_Zero_defconfig
index ca0bcc0cf2..097a693f68 100644
--- a/configs/LicheePi_Zero_defconfig
+++ b/configs/LicheePi_Zero_defconfig
@@ -9,5 +9,6 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-v3s-licheepi-zero"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_NETDEVICES is not set
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Linksprite_pcDuino3_Nano_defconfig b/configs/Linksprite_pcDuino3_Nano_defconfig
index 23651ec985..fea06b58e5 100644
--- a/configs/Linksprite_pcDuino3_Nano_defconfig
+++ b/configs/Linksprite_pcDuino3_Nano_defconfig
@@ -16,6 +16,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-pcduino3-nano"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Linksprite_pcDuino3_defconfig b/configs/Linksprite_pcDuino3_defconfig
index 6cb36637a3..154692cf07 100644
--- a/configs/Linksprite_pcDuino3_defconfig
+++ b/configs/Linksprite_pcDuino3_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-pcduino3"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Linksprite_pcDuino_defconfig b/configs/Linksprite_pcDuino_defconfig
index dd2b2802e4..ab77b0c810 100644
--- a/configs/Linksprite_pcDuino_defconfig
+++ b/configs/Linksprite_pcDuino_defconfig
@@ -12,6 +12,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-pcduino"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/MK808C_defconfig b/configs/MK808C_defconfig
index 7f23f9e608..a26941768a 100644
--- a/configs/MK808C_defconfig
+++ b/configs/MK808C_defconfig
@@ -11,6 +11,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-mk808c"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/MPC8313ERDB_NAND_33_defconfig b/configs/MPC8313ERDB_NAND_33_defconfig
index 48c1977ea4..5e0b00126e 100644
--- a/configs/MPC8313ERDB_NAND_33_defconfig
+++ b/configs/MPC8313ERDB_NAND_33_defconfig
@@ -150,6 +150,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=e2800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e2800000.flash:512k(uboot),128k(env),6m@1m(kernel),-(fs)"
 # CONFIG_ENV_IS_IN_FLASH is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8313ERDB_NAND_66_defconfig b/configs/MPC8313ERDB_NAND_66_defconfig
index eee9227d4d..1e60ff1e93 100644
--- a/configs/MPC8313ERDB_NAND_66_defconfig
+++ b/configs/MPC8313ERDB_NAND_66_defconfig
@@ -149,6 +149,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=e2800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e2800000.flash:512k(uboot),128k(env),6m@1m(kernel),-(fs)"
 # CONFIG_ENV_IS_IN_FLASH is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MSI_Primo73_defconfig b/configs/MSI_Primo73_defconfig
index a4d137cd23..b40d361c29 100644
--- a/configs/MSI_Primo73_defconfig
+++ b/configs/MSI_Primo73_defconfig
@@ -16,4 +16,5 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-primo73"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/MSI_Primo81_defconfig b/configs/MSI_Primo81_defconfig
index 12f8bd91b5..3f0eabf00c 100644
--- a/configs/MSI_Primo81_defconfig
+++ b/configs/MSI_Primo81_defconfig
@@ -18,6 +18,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-primo81"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Marsboard_A10_defconfig b/configs/Marsboard_A10_defconfig
index d4cdcb7907..84c6981722 100644
--- a/configs/Marsboard_A10_defconfig
+++ b/configs/Marsboard_A10_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-marsboard"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
diff --git a/configs/Mele_A1000G_quad_defconfig b/configs/Mele_A1000G_quad_defconfig
index 08d847989d..1bc9a5a48f 100644
--- a/configs/Mele_A1000G_quad_defconfig
+++ b/configs/Mele_A1000G_quad_defconfig
@@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31-mele-a1000g-quad"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/Mele_A1000_defconfig b/configs/Mele_A1000_defconfig
index d1cd98db90..6b6ec09a82 100644
--- a/configs/Mele_A1000_defconfig
+++ b/configs/Mele_A1000_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-a1000"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
diff --git a/configs/Mele_I7_defconfig b/configs/Mele_I7_defconfig
index 3b3b35d6d5..0b3dc91d29 100644
--- a/configs/Mele_I7_defconfig
+++ b/configs/Mele_I7_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31-i7"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/Mele_M3_defconfig b/configs/Mele_M3_defconfig
index 8f03d1e96a..89c1574d03 100644
--- a/configs/Mele_M3_defconfig
+++ b/configs/Mele_M3_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-m3"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/Mele_M5_defconfig b/configs/Mele_M5_defconfig
index d455a56315..65aff36c80 100644
--- a/configs/Mele_M5_defconfig
+++ b/configs/Mele_M5_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-m5"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Mele_M9_defconfig b/configs/Mele_M9_defconfig
index 9865e83f06..07e9ded0f7 100644
--- a/configs/Mele_M9_defconfig
+++ b/configs/Mele_M9_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31-m9"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/Merrii_A80_Optimus_defconfig b/configs/Merrii_A80_Optimus_defconfig
index b45b6cde1c..a8df69ebdf 100644
--- a/configs/Merrii_A80_Optimus_defconfig
+++ b/configs/Merrii_A80_Optimus_defconfig
@@ -17,5 +17,6 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun9i-a80-optimus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP809_POWER=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Mini-X_defconfig b/configs/Mini-X_defconfig
index 7d440d1813..b0757e3731 100644
--- a/configs/Mini-X_defconfig
+++ b/configs/Mini-X_defconfig
@@ -12,6 +12,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-mini-xplus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Orangepi_defconfig b/configs/Orangepi_defconfig
index 1ff40a09ef..fb23872184 100644
--- a/configs/Orangepi_defconfig
+++ b/configs/Orangepi_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-orangepi"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Orangepi_mini_defconfig b/configs/Orangepi_mini_defconfig
index af98dc8396..026eb58c3d 100644
--- a/configs/Orangepi_mini_defconfig
+++ b/configs/Orangepi_mini_defconfig
@@ -20,6 +20,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-orangepi-mini"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/P1010RDB-PA_36BIT_NAND_defconfig b/configs/P1010RDB-PA_36BIT_NAND_defconfig
index f8effe8950..c31985c5fd 100644
--- a/configs/P1010RDB-PA_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NAND_defconfig
@@ -24,7 +24,6 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -43,6 +42,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
index 5fea3ed5c1..6da65ed227 100644
--- a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
index 73bcdc109e..a0832f39c6 100644
--- a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PA_NAND_defconfig b/configs/P1010RDB-PA_NAND_defconfig
index 0b8b67a5a5..0e92678d50 100644
--- a/configs/P1010RDB-PA_NAND_defconfig
+++ b/configs/P1010RDB-PA_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -42,6 +41,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PA_SDCARD_defconfig b/configs/P1010RDB-PA_SDCARD_defconfig
index 3e4088b3cb..483b1afff8 100644
--- a/configs/P1010RDB-PA_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PA_SPIFLASH_defconfig b/configs/P1010RDB-PA_SPIFLASH_defconfig
index adc4da14eb..b4d257a138 100644
--- a/configs/P1010RDB-PA_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PB_36BIT_NAND_defconfig b/configs/P1010RDB-PB_36BIT_NAND_defconfig
index a6ff61648f..98cc52eb69 100644
--- a/configs/P1010RDB-PB_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NAND_defconfig
@@ -24,7 +24,6 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -43,6 +42,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
index 9b8a1e2777..03b9120dc7 100644
--- a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
index 0f10bf97a9..10438e6c9d 100644
--- a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PB_NAND_defconfig b/configs/P1010RDB-PB_NAND_defconfig
index bc8dce25d6..cb73bfc7db 100644
--- a/configs/P1010RDB-PB_NAND_defconfig
+++ b/configs/P1010RDB-PB_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
 CONFIG_TPL_DRIVERS_MISC_SUPPORT=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -42,6 +41,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PB_SDCARD_defconfig b/configs/P1010RDB-PB_SDCARD_defconfig
index 944198823e..f8d9c759d1 100644
--- a/configs/P1010RDB-PB_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1010RDB-PB_SPIFLASH_defconfig b/configs/P1010RDB-PB_SPIFLASH_defconfig
index b8695ec492..6acbb88263 100644
--- a/configs/P1010RDB-PB_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xD0001000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020MBG-PC_36BIT_SDCARD_defconfig b/configs/P1020MBG-PC_36BIT_SDCARD_defconfig
index bb21c607f3..8e39a1af4e 100644
--- a/configs/P1020MBG-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1020MBG-PC_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020MBG-PC_SDCARD_defconfig b/configs/P1020MBG-PC_SDCARD_defconfig
index 4b9ec4d0c5..3c6c350aed 100644
--- a/configs/P1020MBG-PC_SDCARD_defconfig
+++ b/configs/P1020MBG-PC_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020RDB-PC_36BIT_NAND_defconfig b/configs/P1020RDB-PC_36BIT_NAND_defconfig
index c4e41f2010..5a3e12bf62 100644
--- a/configs/P1020RDB-PC_36BIT_NAND_defconfig
+++ b/configs/P1020RDB-PC_36BIT_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -45,6 +44,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p1020rdb-pc_36b"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1020RDB-PC_36BIT_SDCARD_defconfig b/configs/P1020RDB-PC_36BIT_SDCARD_defconfig
index b21fc2159b..33454a105c 100644
--- a/configs/P1020RDB-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1020RDB-PC_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig b/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig
index 2f69683379..53830019e2 100644
--- a/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig
+++ b/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020RDB-PC_NAND_defconfig b/configs/P1020RDB-PC_NAND_defconfig
index 832c96967e..15e72f4f7f 100644
--- a/configs/P1020RDB-PC_NAND_defconfig
+++ b/configs/P1020RDB-PC_NAND_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -44,6 +43,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p1020rdb-pc"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1020RDB-PC_SDCARD_defconfig b/configs/P1020RDB-PC_SDCARD_defconfig
index 2b5537bc32..2243daecc0 100644
--- a/configs/P1020RDB-PC_SDCARD_defconfig
+++ b/configs/P1020RDB-PC_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020RDB-PC_SPIFLASH_defconfig b/configs/P1020RDB-PC_SPIFLASH_defconfig
index dc4f7d6a70..4924efecd7 100644
--- a/configs/P1020RDB-PC_SPIFLASH_defconfig
+++ b/configs/P1020RDB-PC_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020RDB-PD_NAND_defconfig b/configs/P1020RDB-PD_NAND_defconfig
index acbb9e0159..40aa72b82d 100644
--- a/configs/P1020RDB-PD_NAND_defconfig
+++ b/configs/P1020RDB-PD_NAND_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -47,6 +46,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=ec000000.nor:128k(dtb),6016k(kernel),57088k(fs
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p1020rdb-pd"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1020RDB-PD_SDCARD_defconfig b/configs/P1020RDB-PD_SDCARD_defconfig
index 208138f594..4f0ff3a296 100644
--- a/configs/P1020RDB-PD_SDCARD_defconfig
+++ b/configs/P1020RDB-PD_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020RDB-PD_SPIFLASH_defconfig b/configs/P1020RDB-PD_SPIFLASH_defconfig
index 960f2718a9..abcf7f8b76 100644
--- a/configs/P1020RDB-PD_SPIFLASH_defconfig
+++ b/configs/P1020RDB-PD_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020UTM-PC_36BIT_SDCARD_defconfig b/configs/P1020UTM-PC_36BIT_SDCARD_defconfig
index 04aa24d2e3..b4a61c780a 100644
--- a/configs/P1020UTM-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1020UTM-PC_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1020UTM-PC_SDCARD_defconfig b/configs/P1020UTM-PC_SDCARD_defconfig
index 571889ac87..f5d3199619 100644
--- a/configs/P1020UTM-PC_SDCARD_defconfig
+++ b/configs/P1020UTM-PC_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1021RDB-PC_36BIT_NAND_defconfig b/configs/P1021RDB-PC_36BIT_NAND_defconfig
index cd73bdd2fb..0015197c7b 100644
--- a/configs/P1021RDB-PC_36BIT_NAND_defconfig
+++ b/configs/P1021RDB-PC_36BIT_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -47,6 +46,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fef000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fef000000.nor:256k(vsc7385-firmware),256k(dtb),4608k(kernel),9728k(fs),256k(qe-ucode-firmware),1280k(u-boot)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1021RDB-PC_36BIT_SDCARD_defconfig b/configs/P1021RDB-PC_36BIT_SDCARD_defconfig
index d30d4df9ee..c7e7a8ea5d 100644
--- a/configs/P1021RDB-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1021RDB-PC_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig b/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig
index e11be022c8..3e252f4652 100644
--- a/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig
+++ b/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1021RDB-PC_NAND_defconfig b/configs/P1021RDB-PC_NAND_defconfig
index ada720a75f..bc27028a4c 100644
--- a/configs/P1021RDB-PC_NAND_defconfig
+++ b/configs/P1021RDB-PC_NAND_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -46,6 +45,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=ef000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ef000000.nor:256k(vsc7385-firmware),256k(dtb),4608k(kernel),9728k(fs),256k(qe-ucode-firmware),1280k(u-boot)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1021RDB-PC_SDCARD_defconfig b/configs/P1021RDB-PC_SDCARD_defconfig
index 28830f90a2..c37818cae6 100644
--- a/configs/P1021RDB-PC_SDCARD_defconfig
+++ b/configs/P1021RDB-PC_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1021RDB-PC_SPIFLASH_defconfig b/configs/P1021RDB-PC_SPIFLASH_defconfig
index 19d2b0f47f..c6adc41c1d 100644
--- a/configs/P1021RDB-PC_SPIFLASH_defconfig
+++ b/configs/P1021RDB-PC_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1022DS_36BIT_NAND_defconfig b/configs/P1022DS_36BIT_NAND_defconfig
index 62072dc7b9..a19c08964d 100644
--- a/configs/P1022DS_36BIT_NAND_defconfig
+++ b/configs/P1022DS_36BIT_NAND_defconfig
@@ -21,7 +21,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -45,6 +44,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:48m(ramdisk),14m(diagnostic),2m(dink),6m(kernel),58112k(fs),512k(dtb),768k(u-boot)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1022DS_36BIT_SDCARD_defconfig b/configs/P1022DS_36BIT_SDCARD_defconfig
index aadc417e47..bc5bea1d40 100644
--- a/configs/P1022DS_36BIT_SDCARD_defconfig
+++ b/configs/P1022DS_36BIT_SDCARD_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1022DS_36BIT_SPIFLASH_defconfig b/configs/P1022DS_36BIT_SPIFLASH_defconfig
index e5b7cfff6d..cb72f7d571 100644
--- a/configs/P1022DS_36BIT_SPIFLASH_defconfig
+++ b/configs/P1022DS_36BIT_SPIFLASH_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1022DS_NAND_defconfig b/configs/P1022DS_NAND_defconfig
index 8089012708..27cc46fa4b 100644
--- a/configs/P1022DS_NAND_defconfig
+++ b/configs/P1022DS_NAND_defconfig
@@ -20,7 +20,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -44,6 +43,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=e8000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e8000000.nor:48m(ramdisk),14m(diagnostic),2m(dink),6m(kernel),58112k(fs),512k(dtb),768k(u-boot)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1022DS_SDCARD_defconfig b/configs/P1022DS_SDCARD_defconfig
index 71e0daa60e..71ed069be9 100644
--- a/configs/P1022DS_SDCARD_defconfig
+++ b/configs/P1022DS_SDCARD_defconfig
@@ -18,7 +18,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1022DS_SPIFLASH_defconfig b/configs/P1022DS_SPIFLASH_defconfig
index 76962987ce..4745c9db56 100644
--- a/configs/P1022DS_SPIFLASH_defconfig
+++ b/configs/P1022DS_SPIFLASH_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1024RDB_NAND_defconfig b/configs/P1024RDB_NAND_defconfig
index a08f5d9667..5f3a168e2f 100644
--- a/configs/P1024RDB_NAND_defconfig
+++ b/configs/P1024RDB_NAND_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -42,6 +41,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1024RDB_SDCARD_defconfig b/configs/P1024RDB_SDCARD_defconfig
index d09e71dee0..62938eae78 100644
--- a/configs/P1024RDB_SDCARD_defconfig
+++ b/configs/P1024RDB_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1024RDB_SPIFLASH_defconfig b/configs/P1024RDB_SPIFLASH_defconfig
index da09d21f63..4c14adfbb7 100644
--- a/configs/P1024RDB_SPIFLASH_defconfig
+++ b/configs/P1024RDB_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1025RDB_NAND_defconfig b/configs/P1025RDB_NAND_defconfig
index 5259a2ff43..461ed2bcbe 100644
--- a/configs/P1025RDB_NAND_defconfig
+++ b/configs/P1025RDB_NAND_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -44,6 +43,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1025RDB_SDCARD_defconfig b/configs/P1025RDB_SDCARD_defconfig
index 485750c901..214987165f 100644
--- a/configs/P1025RDB_SDCARD_defconfig
+++ b/configs/P1025RDB_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P1025RDB_SPIFLASH_defconfig b/configs/P1025RDB_SPIFLASH_defconfig
index af6c7b4ee0..c9c6bbd2fe 100644
--- a/configs/P1025RDB_SPIFLASH_defconfig
+++ b/configs/P1025RDB_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P2020RDB-PC_36BIT_NAND_defconfig b/configs/P2020RDB-PC_36BIT_NAND_defconfig
index 5e279814a1..ffb4e8d28b 100644
--- a/configs/P2020RDB-PC_36BIT_NAND_defconfig
+++ b/configs/P2020RDB-PC_36BIT_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -49,6 +48,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fef000000.nor:256k(vsc7385-firmware),256k(dtb)
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p2020rdb-pc_36b"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P2020RDB-PC_36BIT_SDCARD_defconfig b/configs/P2020RDB-PC_36BIT_SDCARD_defconfig
index 49a7c8052d..b10f5365a7 100644
--- a/configs/P2020RDB-PC_36BIT_SDCARD_defconfig
+++ b/configs/P2020RDB-PC_36BIT_SDCARD_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig b/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig
index 59fce53690..04c5d57c26 100644
--- a/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig
+++ b/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P2020RDB-PC_NAND_defconfig b/configs/P2020RDB-PC_NAND_defconfig
index 3c65108d7d..860145bb70 100644
--- a/configs/P2020RDB-PC_NAND_defconfig
+++ b/configs/P2020RDB-PC_NAND_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xFF800000
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_TPL=y
-CONFIG_TPL_ENV_SUPPORT=y
 CONFIG_TPL_I2C_SUPPORT=y
 CONFIG_TPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_TPL_NAND_SUPPORT=y
@@ -48,6 +47,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=ef000000.nor:256k(vsc7385-firmware),256k(dtb),
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p2020rdb-pc"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P2020RDB-PC_SDCARD_defconfig b/configs/P2020RDB-PC_SDCARD_defconfig
index 05f42aef8a..a15c10f636 100644
--- a/configs/P2020RDB-PC_SDCARD_defconfig
+++ b/configs/P2020RDB-PC_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/P2020RDB-PC_SPIFLASH_defconfig b/configs/P2020RDB-PC_SPIFLASH_defconfig
index bfb7026f2d..ca8e44dd9a 100644
--- a/configs/P2020RDB-PC_SPIFLASH_defconfig
+++ b/configs/P2020RDB-PC_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 # CONFIG_SPL_FRAMEWORK is not set
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_TEXT_BASE=0xf8f81000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/Sinlinx_SinA31s_defconfig b/configs/Sinlinx_SinA31s_defconfig
index 3588a2c9dd..8b4ceb952a 100644
--- a/configs/Sinlinx_SinA31s_defconfig
+++ b/configs/Sinlinx_SinA31s_defconfig
@@ -16,6 +16,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-sina31s"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/Sinlinx_SinA33_defconfig b/configs/Sinlinx_SinA33_defconfig
index a7383f1eda..ab6a3ca06b 100644
--- a/configs/Sinlinx_SinA33_defconfig
+++ b/configs/Sinlinx_SinA33_defconfig
@@ -19,6 +19,7 @@ CONFIG_CMD_DFU=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a33-sinlinx-sina33"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/Sinovoip_BPI_M2_defconfig b/configs/Sinovoip_BPI_M2_defconfig
index 691fd85f47..26c8601139 100644
--- a/configs/Sinovoip_BPI_M2_defconfig
+++ b/configs/Sinovoip_BPI_M2_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-sinovoip-bpi-m2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
 CONFIG_MII=y
diff --git a/configs/Sinovoip_BPI_M3_defconfig b/configs/Sinovoip_BPI_M3_defconfig
index 6ded24e294..c8197e8a58 100644
--- a/configs/Sinovoip_BPI_M3_defconfig
+++ b/configs/Sinovoip_BPI_M3_defconfig
@@ -22,6 +22,7 @@ CONFIG_CONSOLE_MUX=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a83t-bananapi-m3"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_AXP_DCDC5_VOLT=1200
diff --git a/configs/Sunchip_CX-A99_defconfig b/configs/Sunchip_CX-A99_defconfig
index 8bc353112b..a5bbeda09e 100644
--- a/configs/Sunchip_CX-A99_defconfig
+++ b/configs/Sunchip_CX-A99_defconfig
@@ -17,4 +17,5 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun9i-a80-cx-a99"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/T1023RDB_NAND_defconfig b/configs/T1023RDB_NAND_defconfig
index 858d998d18..5444c04904 100644
--- a/configs/T1023RDB_NAND_defconfig
+++ b/configs/T1023RDB_NAND_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1023RDB_SDCARD_defconfig b/configs/T1023RDB_SDCARD_defconfig
index 4d97fdae40..d65bee17b7 100644
--- a/configs/T1023RDB_SDCARD_defconfig
+++ b/configs/T1023RDB_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1023RDB_SPIFLASH_defconfig b/configs/T1023RDB_SPIFLASH_defconfig
index a3679115b8..77e80fabbe 100644
--- a/configs/T1023RDB_SPIFLASH_defconfig
+++ b/configs/T1023RDB_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1024QDS_NAND_defconfig b/configs/T1024QDS_NAND_defconfig
index 5dccb0f550..735c964bd9 100644
--- a/configs/T1024QDS_NAND_defconfig
+++ b/configs/T1024QDS_NAND_defconfig
@@ -24,7 +24,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1024QDS_SDCARD_defconfig b/configs/T1024QDS_SDCARD_defconfig
index 7b56c0db4e..1218205c06 100644
--- a/configs/T1024QDS_SDCARD_defconfig
+++ b/configs/T1024QDS_SDCARD_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1024QDS_SPIFLASH_defconfig b/configs/T1024QDS_SPIFLASH_defconfig
index 34cd506d02..5bc2aa1006 100644
--- a/configs/T1024QDS_SPIFLASH_defconfig
+++ b/configs/T1024QDS_SPIFLASH_defconfig
@@ -24,7 +24,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1024RDB_NAND_defconfig b/configs/T1024RDB_NAND_defconfig
index c38912dc38..adc21d5ff2 100644
--- a/configs/T1024RDB_NAND_defconfig
+++ b/configs/T1024RDB_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1024RDB_SDCARD_defconfig b/configs/T1024RDB_SDCARD_defconfig
index 5215953caf..3fd50c6965 100644
--- a/configs/T1024RDB_SDCARD_defconfig
+++ b/configs/T1024RDB_SDCARD_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1024RDB_SPIFLASH_defconfig b/configs/T1024RDB_SPIFLASH_defconfig
index 2e6b81b0c2..59c67684c0 100644
--- a/configs/T1024RDB_SPIFLASH_defconfig
+++ b/configs/T1024RDB_SPIFLASH_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1040D4RDB_NAND_defconfig b/configs/T1040D4RDB_NAND_defconfig
index 3087cf62d2..957bc82967 100644
--- a/configs/T1040D4RDB_NAND_defconfig
+++ b/configs/T1040D4RDB_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1040D4RDB_SDCARD_defconfig b/configs/T1040D4RDB_SDCARD_defconfig
index 608c09a11d..3cbe2b0264 100644
--- a/configs/T1040D4RDB_SDCARD_defconfig
+++ b/configs/T1040D4RDB_SDCARD_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1040D4RDB_SPIFLASH_defconfig b/configs/T1040D4RDB_SPIFLASH_defconfig
index 8c603c8a86..be933e1ea5 100644
--- a/configs/T1040D4RDB_SPIFLASH_defconfig
+++ b/configs/T1040D4RDB_SPIFLASH_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1040RDB_NAND_defconfig b/configs/T1040RDB_NAND_defconfig
index 82cec34336..8df46103da 100644
--- a/configs/T1040RDB_NAND_defconfig
+++ b/configs/T1040RDB_NAND_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1040RDB_SDCARD_defconfig b/configs/T1040RDB_SDCARD_defconfig
index be0f26257f..9ffb43a297 100644
--- a/configs/T1040RDB_SDCARD_defconfig
+++ b/configs/T1040RDB_SDCARD_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1040RDB_SPIFLASH_defconfig b/configs/T1040RDB_SPIFLASH_defconfig
index a3ad573d38..d1d99af68e 100644
--- a/configs/T1040RDB_SPIFLASH_defconfig
+++ b/configs/T1040RDB_SPIFLASH_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1042D4RDB_NAND_defconfig b/configs/T1042D4RDB_NAND_defconfig
index 920af5b4c4..350c8a599e 100644
--- a/configs/T1042D4RDB_NAND_defconfig
+++ b/configs/T1042D4RDB_NAND_defconfig
@@ -24,7 +24,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1042D4RDB_SDCARD_defconfig b/configs/T1042D4RDB_SDCARD_defconfig
index e532366218..ca2982a807 100644
--- a/configs/T1042D4RDB_SDCARD_defconfig
+++ b/configs/T1042D4RDB_SDCARD_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1042D4RDB_SPIFLASH_defconfig b/configs/T1042D4RDB_SPIFLASH_defconfig
index 78e4582113..9818f7644e 100644
--- a/configs/T1042D4RDB_SPIFLASH_defconfig
+++ b/configs/T1042D4RDB_SPIFLASH_defconfig
@@ -24,7 +24,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
index ae81f93d10..764da1f972 100644
--- a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
+++ b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
@@ -27,7 +27,6 @@ CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
 CONFIG_SPL_CRYPTO_SUPPORT=y
 CONFIG_SPL_HASH_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1042RDB_PI_NAND_defconfig b/configs/T1042RDB_PI_NAND_defconfig
index f3ec5e624f..2821ab381f 100644
--- a/configs/T1042RDB_PI_NAND_defconfig
+++ b/configs/T1042RDB_PI_NAND_defconfig
@@ -24,7 +24,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T1042RDB_PI_SDCARD_defconfig b/configs/T1042RDB_PI_SDCARD_defconfig
index e5bd44e251..b4ae0e2fc8 100644
--- a/configs/T1042RDB_PI_SDCARD_defconfig
+++ b/configs/T1042RDB_PI_SDCARD_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T1042RDB_PI_SPIFLASH_defconfig b/configs/T1042RDB_PI_SPIFLASH_defconfig
index 07e75aac1d..037e4cef53 100644
--- a/configs/T1042RDB_PI_SPIFLASH_defconfig
+++ b/configs/T1042RDB_PI_SPIFLASH_defconfig
@@ -24,7 +24,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T2080QDS_NAND_defconfig b/configs/T2080QDS_NAND_defconfig
index 0db930f733..d35a2cb16e 100644
--- a/configs/T2080QDS_NAND_defconfig
+++ b/configs/T2080QDS_NAND_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T2080QDS_SDCARD_defconfig b/configs/T2080QDS_SDCARD_defconfig
index f5cca80a6d..488cccbf44 100644
--- a/configs/T2080QDS_SDCARD_defconfig
+++ b/configs/T2080QDS_SDCARD_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T2080QDS_SPIFLASH_defconfig b/configs/T2080QDS_SPIFLASH_defconfig
index 60539f4380..a7a42d6dbd 100644
--- a/configs/T2080QDS_SPIFLASH_defconfig
+++ b/configs/T2080QDS_SPIFLASH_defconfig
@@ -21,7 +21,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T2080RDB_NAND_defconfig b/configs/T2080RDB_NAND_defconfig
index dcd57f7b3a..ff7dda7c41 100644
--- a/configs/T2080RDB_NAND_defconfig
+++ b/configs/T2080RDB_NAND_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T2080RDB_SDCARD_defconfig b/configs/T2080RDB_SDCARD_defconfig
index 235e8ee514..ba860e0d86 100644
--- a/configs/T2080RDB_SDCARD_defconfig
+++ b/configs/T2080RDB_SDCARD_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T2080RDB_SPIFLASH_defconfig b/configs/T2080RDB_SPIFLASH_defconfig
index 7b64b7d490..cd5f0cadee 100644
--- a/configs/T2080RDB_SPIFLASH_defconfig
+++ b/configs/T2080RDB_SPIFLASH_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T2081QDS_NAND_defconfig b/configs/T2081QDS_NAND_defconfig
index da722a86d9..e07ed67ac0 100644
--- a/configs/T2081QDS_NAND_defconfig
+++ b/configs/T2081QDS_NAND_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T2081QDS_SDCARD_defconfig b/configs/T2081QDS_SDCARD_defconfig
index 1769b55cc4..75c56b3994 100644
--- a/configs/T2081QDS_SDCARD_defconfig
+++ b/configs/T2081QDS_SDCARD_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T2081QDS_SPIFLASH_defconfig b/configs/T2081QDS_SPIFLASH_defconfig
index 5093fa3283..7ad7f88edf 100644
--- a/configs/T2081QDS_SPIFLASH_defconfig
+++ b/configs/T2081QDS_SPIFLASH_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_SPI_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T4160QDS_NAND_defconfig b/configs/T4160QDS_NAND_defconfig
index f880a46aae..5592e90884 100644
--- a/configs/T4160QDS_NAND_defconfig
+++ b/configs/T4160QDS_NAND_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T4160QDS_SDCARD_defconfig b/configs/T4160QDS_SDCARD_defconfig
index edf39f1c3a..4afefebf4b 100644
--- a/configs/T4160QDS_SDCARD_defconfig
+++ b/configs/T4160QDS_SDCARD_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T4240QDS_NAND_defconfig b/configs/T4240QDS_NAND_defconfig
index 2a98f960ca..9fce2ac65a 100644
--- a/configs/T4240QDS_NAND_defconfig
+++ b/configs/T4240QDS_NAND_defconfig
@@ -20,7 +20,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_NAND_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/T4240QDS_SDCARD_defconfig b/configs/T4240QDS_SDCARD_defconfig
index 83815e58e3..0dc9e7d174 100644
--- a/configs/T4240QDS_SDCARD_defconfig
+++ b/configs/T4240QDS_SDCARD_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/T4240RDB_SDCARD_defconfig b/configs/T4240RDB_SDCARD_defconfig
index 7f97166860..2bb1eca573 100644
--- a/configs/T4240RDB_SDCARD_defconfig
+++ b/configs/T4240RDB_SDCARD_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOARD_EARLY_INIT_R=y
 CONFIG_SPL_MMC_BOOT=y
 CONFIG_SPL_FSL_PBL=y
 CONFIG_SPL_TEXT_BASE=0xFFFD8000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/UTOO_P66_defconfig b/configs/UTOO_P66_defconfig
index 2b10629cbf..bcb4c8ae9a 100644
--- a/configs/UTOO_P66_defconfig
+++ b/configs/UTOO_P66_defconfig
@@ -26,6 +26,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-utoo-p66"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Wexler_TAB7200_defconfig b/configs/Wexler_TAB7200_defconfig
index 6413fabf84..d03c1f1c7a 100644
--- a/configs/Wexler_TAB7200_defconfig
+++ b/configs/Wexler_TAB7200_defconfig
@@ -19,6 +19,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-wexler-tab7200"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Wits_Pro_A20_DKT_defconfig b/configs/Wits_Pro_A20_DKT_defconfig
index 437c86795b..09f092c580 100644
--- a/configs/Wits_Pro_A20_DKT_defconfig
+++ b/configs/Wits_Pro_A20_DKT_defconfig
@@ -18,6 +18,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-wits-pro-a20-dkt"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Wobo_i5_defconfig b/configs/Wobo_i5_defconfig
index e21e4e0ab4..3145825b7c 100644
--- a/configs/Wobo_i5_defconfig
+++ b/configs/Wobo_i5_defconfig
@@ -13,6 +13,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-wobo-i5"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_ALDO3_VOLT=3300
 CONFIG_AXP_ALDO4_VOLT=3300
 CONFIG_CONS_INDEX=2
diff --git a/configs/Yones_Toptech_BD1078_defconfig b/configs/Yones_Toptech_BD1078_defconfig
index 0f8c8afc29..396467af4b 100644
--- a/configs/Yones_Toptech_BD1078_defconfig
+++ b/configs/Yones_Toptech_BD1078_defconfig
@@ -25,5 +25,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-yones-toptech-bd1078"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/Yones_Toptech_BS1078_V2_defconfig b/configs/Yones_Toptech_BS1078_V2_defconfig
index 9c8107c50d..4ecd7743cf 100644
--- a/configs/Yones_Toptech_BS1078_V2_defconfig
+++ b/configs/Yones_Toptech_BS1078_V2_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-yones-toptech-bs1078-v2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/a64-olinuxino_defconfig b/configs/a64-olinuxino_defconfig
index 8a3561bed5..383bd1ef8b 100644
--- a/configs/a64-olinuxino_defconfig
+++ b/configs/a64-olinuxino_defconfig
@@ -11,6 +11,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-olinuxino"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/ae350_rv32_xip_defconfig b/configs/ae350_rv32_xip_defconfig
index 8ec72f4507..748a2a4027 100644
--- a/configs/ae350_rv32_xip_defconfig
+++ b/configs/ae350_rv32_xip_defconfig
@@ -17,6 +17,7 @@ CONFIG_BOOTP_PREFER_SERVERIP=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="ae350_32"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_IN_SPI_FLASH=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_MMC=y
 CONFIG_FTSDC010=y
diff --git a/configs/alt_defconfig b/configs/alt_defconfig
index 49254e149d..670f98a528 100644
--- a/configs/alt_defconfig
+++ b/configs/alt_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7794-alt-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index 3cada51d35..2f78595034 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -21,7 +21,6 @@ CONFIG_VERSION_VARIABLE=y
 CONFIG_ARCH_MISC_INIT=y
 # CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
 CONFIG_SPL_SEPARATE_BSS=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_ETH_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MUSB_NEW_SUPPORT=y
diff --git a/configs/am335x_hs_evm_defconfig b/configs/am335x_hs_evm_defconfig
index f5da7f674f..ed82b2a62f 100644
--- a/configs/am335x_hs_evm_defconfig
+++ b/configs/am335x_hs_evm_defconfig
@@ -17,7 +17,6 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
 CONFIG_ARCH_MISC_INIT=y
 CONFIG_SPL_FIT_IMAGE_TINY=y
-# CONFIG_SPL_ENV_SUPPORT is not set
 # CONFIG_SPL_FS_EXT4 is not set
 CONFIG_SPL_MTD_SUPPORT=y
 # CONFIG_SPL_NAND_SUPPORT is not set
@@ -33,6 +32,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-evm"
 CONFIG_OF_LIST="am335x-evm am335x-bone am335x-boneblack am335x-evmsk am335x-bonegreen am335x-icev2"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_NAND=y
diff --git a/configs/am335x_hs_evm_uart_defconfig b/configs/am335x_hs_evm_uart_defconfig
index 3708a6f623..e8b027af65 100644
--- a/configs/am335x_hs_evm_uart_defconfig
+++ b/configs/am335x_hs_evm_uart_defconfig
@@ -20,7 +20,6 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
 CONFIG_ARCH_MISC_INIT=y
 CONFIG_SPL_FIT_IMAGE_TINY=y
-# CONFIG_SPL_ENV_SUPPORT is not set
 # CONFIG_SPL_FS_EXT4 is not set
 CONFIG_SPL_MTD_SUPPORT=y
 # CONFIG_SPL_NAND_SUPPORT is not set
@@ -35,6 +34,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-evm"
 CONFIG_OF_LIST="am335x-evm am335x-bone am335x-boneblack am335x-evmsk am335x-bonegreen am335x-icev2"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_NAND=y
diff --git a/configs/am335x_igep003x_defconfig b/configs/am335x_igep003x_defconfig
index 8ed52a5ffb..3de3d45a6f 100644
--- a/configs/am335x_igep003x_defconfig
+++ b/configs/am335x_igep003x_defconfig
@@ -60,6 +60,7 @@ CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="config"
 CONFIG_ENV_UBI_VOLUME_REDUND="config_r"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
diff --git a/configs/am335x_shc_defconfig b/configs/am335x_shc_defconfig
index 5698208f84..a31d340e77 100644
--- a/configs/am335x_shc_defconfig
+++ b/configs/am335x_shc_defconfig
@@ -44,6 +44,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_PHY_ADDR_ENABLE=y
diff --git a/configs/am335x_shc_ict_defconfig b/configs/am335x_shc_ict_defconfig
index 3f8a6bad03..802bd4bab1 100644
--- a/configs/am335x_shc_ict_defconfig
+++ b/configs/am335x_shc_ict_defconfig
@@ -45,6 +45,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_PHY_ADDR_ENABLE=y
diff --git a/configs/am335x_shc_netboot_defconfig b/configs/am335x_shc_netboot_defconfig
index d0a7d62a24..358a7023cd 100644
--- a/configs/am335x_shc_netboot_defconfig
+++ b/configs/am335x_shc_netboot_defconfig
@@ -22,7 +22,6 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_DEFAULT_FDT_FILE="am335x-shc"
 CONFIG_VERSION_VARIABLE=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_NAND_SUPPORT is not set
diff --git a/configs/am335x_shc_sdboot_defconfig b/configs/am335x_shc_sdboot_defconfig
index 30fa40abda..a55e84a91d 100644
--- a/configs/am335x_shc_sdboot_defconfig
+++ b/configs/am335x_shc_sdboot_defconfig
@@ -45,6 +45,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_PHY_ADDR_ENABLE=y
diff --git a/configs/am335x_sl50_defconfig b/configs/am335x_sl50_defconfig
index 01fc52b4ed..751fd92e30 100644
--- a/configs/am335x_sl50_defconfig
+++ b/configs/am335x_sl50_defconfig
@@ -16,7 +16,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="EMMC_BOOT"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_NAND_SUPPORT is not set
diff --git a/configs/am3517_crane_defconfig b/configs/am3517_crane_defconfig
index 07067a59c3..f714ed9a8c 100644
--- a/configs/am3517_crane_defconfig
+++ b/configs/am3517_crane_defconfig
@@ -25,6 +25,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_JFFS2=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
 CONFIG_SYS_NAND_BUSWIDTH_16BIT=y
diff --git a/configs/am3517_evm_defconfig b/configs/am3517_evm_defconfig
index ade4fd7c14..1fac4d97a5 100644
--- a/configs/am3517_evm_defconfig
+++ b/configs/am3517_evm_defconfig
@@ -44,6 +44,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am3517-evm"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_SPL_OF_TRANSLATE=y
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index 9d02dbc01a..77b776fe23 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -44,6 +44,7 @@ CONFIG_DEFAULT_DEVICE_TREE="k3-am654-base-board"
 CONFIG_SPL_MULTI_DTB_FIT=y
 CONFIG_SPL_MULTI_DTB_FIT_NO_COMPRESSION=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index c59b7d98dc..201174d95b 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -51,6 +51,7 @@ CONFIG_SPL_MULTI_DTB_FIT_NO_COMPRESSION=y
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_INTERFACE="mmc"
 CONFIG_ENV_FAT_DEVICE_AND_PART="1:1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index 87547ed9ab..f45649c4a8 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -48,6 +48,7 @@ CONFIG_SPL_MULTI_DTB_FIT_NO_COMPRESSION=y
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_INTERFACE="mmc"
 CONFIG_ENV_FAT_DEVICE_AND_PART="1:1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index 86113b2629..1dedd7ac28 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -53,6 +53,7 @@ CONFIG_SPL_MULTI_DTB_FIT_NO_COMPRESSION=y
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_INTERFACE="mmc"
 CONFIG_ENV_FAT_DEVICE_AND_PART="1:1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index 9eda731a77..37c1478cbc 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-amarula-relic"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_GADGET=y
diff --git a/configs/apalis-tk1_defconfig b/configs/apalis-tk1_defconfig
index be0554b150..184da8fa18 100644
--- a/configs/apalis-tk1_defconfig
+++ b/configs/apalis-tk1_defconfig
@@ -30,6 +30,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra124-apalis"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_BLOCKSIZE=16352
 CONFIG_SPL_DM=y
diff --git a/configs/apalis_imx6_defconfig b/configs/apalis_imx6_defconfig
index 7b73265abd..785d76b9bf 100644
--- a/configs/apalis_imx6_defconfig
+++ b/configs/apalis_imx6_defconfig
@@ -52,6 +52,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6-apalis"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_BLOCKSIZE=4096
 CONFIG_DWC_AHSATA=y
diff --git a/configs/apalis_t30_defconfig b/configs/apalis_t30_defconfig
index 75b5a1dca3..855bae5ede 100644
--- a/configs/apalis_t30_defconfig
+++ b/configs/apalis_t30_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra30-apalis"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_BLOCKSIZE=16352
 CONFIG_SPL_DM=y
diff --git a/configs/apf27_defconfig b/configs/apf27_defconfig
index 29e9e3b9a9..114cc93db9 100644
--- a/configs/apf27_defconfig
+++ b/configs/apf27_defconfig
@@ -39,6 +39,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=mxc_nand.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=mxc_nand.0:1M(u-boot)ro,512K(env),512K(env2),512K(firmware),512K(dtb),5M(kernel),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FPGA_XILINX=y
 CONFIG_FPGA_SPARTAN3=y
 CONFIG_MXC_GPIO=y
diff --git a/configs/apx4devkit_defconfig b/configs/apx4devkit_defconfig
index 138cfa648c..c0909e37e3 100644
--- a/configs/apx4devkit_defconfig
+++ b/configs/apx4devkit_defconfig
@@ -31,6 +31,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=gpmi-nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:128k(bootstrap),1024k(boot),768k(env),-(root)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
 CONFIG_NAND=y
diff --git a/configs/arndale_defconfig b/configs/arndale_defconfig
index 012d6f571d..636ce5c8f6 100644
--- a/configs/arndale_defconfig
+++ b/configs/arndale_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_SOUND=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="exynos5250-arndale"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/axm_defconfig b/configs/axm_defconfig
index a1d374aeb5..39850a87de 100644
--- a/configs/axm_defconfig
+++ b/configs/axm_defconfig
@@ -51,6 +51,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g20-taurus"
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_BLK=y
 CONFIG_HAVE_BLOCK_DEVICE=y
diff --git a/configs/ba10_tv_box_defconfig b/configs/ba10_tv_box_defconfig
index a384399b41..106e2a28a8 100644
--- a/configs/ba10_tv_box_defconfig
+++ b/configs/ba10_tv_box_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-ba10-tvbox"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
index 549d13ee48..13b333c334 100644
--- a/configs/bananapi_m1_plus_defconfig
+++ b/configs/bananapi_m1_plus_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-bananapi-m1-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_ETH_DESIGNWARE=y
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 75fd0b173a..2a870b40b4 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -11,6 +11,7 @@ CONFIG_USE_PREBOOT=y
 CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_CMD_FLASH is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-v40-bananapi-m2-berry"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_AXP_DLDO4_VOLT=2500
 CONFIG_AXP_ELDO3_VOLT=1200
diff --git a/configs/bananapi_m2_plus_h3_defconfig b/configs/bananapi_m2_plus_h3_defconfig
index fbfa273069..38a6c7b765 100644
--- a/configs/bananapi_m2_plus_h3_defconfig
+++ b/configs/bananapi_m2_plus_h3_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-bananapi-m2-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/bananapi_m2_plus_h5_defconfig b/configs/bananapi_m2_plus_h5_defconfig
index 3bc83134b3..5d1e30ad7e 100644
--- a/configs/bananapi_m2_plus_h5_defconfig
+++ b/configs/bananapi_m2_plus_h5_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-bananapi-m2-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index 933ec4db43..ebb530631e 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -10,3 +10,4 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h2-plus-bananapi-m2-zero"
+CONFIG_SPL_ENV_IS_NOWHERE=y
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 498b6601a5..2ef8fdbc2a 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-bananapi-m64"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/beaver_defconfig b/configs/beaver_defconfig
index ec0850d00b..803a45a322 100644
--- a/configs/beaver_defconfig
+++ b/configs/beaver_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra30-beaver"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index c89fba5b83..5b7b81d500 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-beelink-gs1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/beelink_x2_defconfig b/configs/beelink_x2_defconfig
index 7c62944e98..b5757bbc7c 100644
--- a/configs/beelink_x2_defconfig
+++ b/configs/beelink_x2_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-beelink-x2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/bitmain_antminer_s9_defconfig b/configs/bitmain_antminer_s9_defconfig
index 14f8d769bb..9e59bf2833 100644
--- a/configs/bitmain_antminer_s9_defconfig
+++ b/configs/bitmain_antminer_s9_defconfig
@@ -49,6 +49,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="bitmain-antminer-s9"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BOOTCOUNT_LIMIT=y
diff --git a/configs/brppt1_mmc_defconfig b/configs/brppt1_mmc_defconfig
index d0ee6194cf..287b25332c 100644
--- a/configs/brppt1_mmc_defconfig
+++ b/configs/brppt1_mmc_defconfig
@@ -66,6 +66,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-brppt1-mmc"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clocks clock-names interrupt-parent interrupt-controller interrupt-cells dma-names dmas "
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/brppt1_nand_defconfig b/configs/brppt1_nand_defconfig
index ff227de4b7..c493c5cb75 100644
--- a/configs/brppt1_nand_defconfig
+++ b/configs/brppt1_nand_defconfig
@@ -67,6 +67,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-brppt1-nand"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clocks clock-names interrupt-parent interrupt-controller interrupt-cells dma-names dmas "
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/brppt1_spi_defconfig b/configs/brppt1_spi_defconfig
index a29dc0385e..66327c0f3c 100644
--- a/configs/brppt1_spi_defconfig
+++ b/configs/brppt1_spi_defconfig
@@ -73,6 +73,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-brppt1-spi"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clocks clock-names interrupt-parent interrupt-controller interrupt-cells dma-names dmas "
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/brsmarc1_defconfig b/configs/brsmarc1_defconfig
index 8863a2d5cc..55e9b10d10 100644
--- a/configs/brsmarc1_defconfig
+++ b/configs/brsmarc1_defconfig
@@ -69,6 +69,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-brsmarc1"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_DM=y
diff --git a/configs/brxre1_defconfig b/configs/brxre1_defconfig
index d4169c0327..1c4bf8c6fc 100644
--- a/configs/brxre1_defconfig
+++ b/configs/brxre1_defconfig
@@ -62,6 +62,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-brxre1"
 CONFIG_OF_SPL_REMOVE_PROPS=""
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_DM=y
diff --git a/configs/cairo_defconfig b/configs/cairo_defconfig
index f26f2c9054..2076d2ad4c 100644
--- a/configs/cairo_defconfig
+++ b/configs/cairo_defconfig
@@ -28,6 +28,7 @@ CONFIG_CMD_SPI=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_TWL4030_LED=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
diff --git a/configs/cardhu_defconfig b/configs/cardhu_defconfig
index cc519d0755..882bbfbbee 100644
--- a/configs/cardhu_defconfig
+++ b/configs/cardhu_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra30-cardhu"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SYS_I2C_TEGRA=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/cei-tk1-som_defconfig b/configs/cei-tk1-som_defconfig
index 677014028f..4256e766c9 100644
--- a/configs/cei-tk1-som_defconfig
+++ b/configs/cei-tk1-som_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra124-cei-tk1-som"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
diff --git a/configs/cgtqmx6eval_defconfig b/configs/cgtqmx6eval_defconfig
index fd4e3077ac..44c39cc521 100644
--- a/configs/cgtqmx6eval_defconfig
+++ b/configs/cgtqmx6eval_defconfig
@@ -51,6 +51,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DWC_AHSATA=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_SF=y
diff --git a/configs/chiliboard_defconfig b/configs/chiliboard_defconfig
index f275d21d16..0315c85312 100644
--- a/configs/chiliboard_defconfig
+++ b/configs/chiliboard_defconfig
@@ -35,6 +35,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=8000000.nand:128k(NAND.SPL),128k(NAND.SPL.back
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-chiliboard"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DM_GPIO=y
 CONFIG_MISC=y
diff --git a/configs/chromebook_bob_defconfig b/configs/chromebook_bob_defconfig
index 967162248c..2035537860 100644
--- a/configs/chromebook_bob_defconfig
+++ b/configs/chromebook_bob_defconfig
@@ -41,6 +41,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-gru-bob"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SYS_I2C_ROCKCHIP=y
diff --git a/configs/chromebook_link64_defconfig b/configs/chromebook_link64_defconfig
index 4bbd7a67dc..9094b71fc6 100644
--- a/configs/chromebook_link64_defconfig
+++ b/configs/chromebook_link64_defconfig
@@ -25,7 +25,6 @@ CONFIG_LAST_STAGE_INIT=y
 CONFIG_SPL_TEXT_BASE=0xfffd0000
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_CPU_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_PCI=y
diff --git a/configs/chromebook_samus_tpl_defconfig b/configs/chromebook_samus_tpl_defconfig
index 973460082d..6c1e0db2fc 100644
--- a/configs/chromebook_samus_tpl_defconfig
+++ b/configs/chromebook_samus_tpl_defconfig
@@ -59,6 +59,8 @@ CONFIG_ISO_PARTITION=y
 CONFIG_EFI_PARTITION=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="chromebook_samus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 # CONFIG_NET is not set
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/ci20_mmc_defconfig b/configs/ci20_mmc_defconfig
index 69a449f9e7..b6c1c13864 100644
--- a/configs/ci20_mmc_defconfig
+++ b/configs/ci20_mmc_defconfig
@@ -28,6 +28,7 @@ CONFIG_CMD_FAT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="ci20"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_DM_WARN is not set
 # CONFIG_DM_DEVICE_REMOVE is not set
 CONFIG_JZ4780_EFUSE=y
diff --git a/configs/cl-som-imx7_defconfig b/configs/cl-som-imx7_defconfig
index 04d1042060..6229875dc7 100644
--- a/configs/cl-som-imx7_defconfig
+++ b/configs/cl-som-imx7_defconfig
@@ -49,6 +49,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx7d-sdb"
 # CONFIG_ENV_IS_IN_MMC is not set
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/clearfog_defconfig b/configs/clearfog_defconfig
index 040e6b9969..42763d69b6 100644
--- a/configs/clearfog_defconfig
+++ b/configs/clearfog_defconfig
@@ -41,6 +41,7 @@ CONFIG_CMD_TIME=y
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="armada-388-clearfog"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_AHCI_MVEBU=y
diff --git a/configs/cm_fx6_defconfig b/configs/cm_fx6_defconfig
index fd0db4db5c..a092ea1420 100644
--- a/configs/cm_fx6_defconfig
+++ b/configs/cm_fx6_defconfig
@@ -54,6 +54,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-cm-fx6"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DWC_AHSATA=y
 # CONFIG_DWC_AHSATA_AHCI is not set
 CONFIG_DM_KEYBOARD=y
diff --git a/configs/cm_t335_defconfig b/configs/cm_t335_defconfig
index ab9f1fde44..f59e8b795c 100644
--- a/configs/cm_t335_defconfig
+++ b/configs/cm_t335_defconfig
@@ -39,6 +39,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:2m(spl),1m(u-boot),1m(u-boot-env),1m(dtb),4m(splash),6m(kernel),-(rootfs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CMD_PCA953X=y
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS_GPIO=y
diff --git a/configs/cm_t35_defconfig b/configs/cm_t35_defconfig
index 44b66a468e..b8c1ee5ba2 100644
--- a/configs/cm_t35_defconfig
+++ b/configs/cm_t35_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:512k(x-loader),1920k(u-boot),256k(u-boot-env),4m(kernel),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS_GPIO=y
 CONFIG_LED_STATUS0=y
diff --git a/configs/cm_t43_defconfig b/configs/cm_t43_defconfig
index 214a054ac4..2c859299b2 100644
--- a/configs/cm_t43_defconfig
+++ b/configs/cm_t43_defconfig
@@ -50,6 +50,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DM_GPIO=y
 CONFIG_MMC_OMAP_HS=y
diff --git a/configs/colibri_imx6_defconfig b/configs/colibri_imx6_defconfig
index 6f8b63949c..85941fe999 100644
--- a/configs/colibri_imx6_defconfig
+++ b/configs/colibri_imx6_defconfig
@@ -52,6 +52,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6-colibri"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_BLOCKSIZE=16352
 CONFIG_DM_GPIO=y
diff --git a/configs/colibri_t20_defconfig b/configs/colibri_t20_defconfig
index 73d13bbb06..075be4de90 100644
--- a/configs/colibri_t20_defconfig
+++ b/configs/colibri_t20_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-colibri"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_BLOCKSIZE=1536
 CONFIG_SPL_DM=y
diff --git a/configs/colibri_t30_defconfig b/configs/colibri_t30_defconfig
index 1e2268a105..148b74cd0f 100644
--- a/configs/colibri_t30_defconfig
+++ b/configs/colibri_t30_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra30-colibri"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_BLOCKSIZE=16352
 CONFIG_SPL_DM=y
diff --git a/configs/colorfly_e708_q1_defconfig b/configs/colorfly_e708_q1_defconfig
index 45653089f1..eb4f537c70 100644
--- a/configs/colorfly_e708_q1_defconfig
+++ b/configs/colorfly_e708_q1_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-colorfly-e708-q1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_AXP_DLDO2_VOLT=1800
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/controlcenterdc_defconfig b/configs/controlcenterdc_defconfig
index 46fe75365b..90a577856f 100644
--- a/configs/controlcenterdc_defconfig
+++ b/configs/controlcenterdc_defconfig
@@ -51,6 +51,7 @@ CONFIG_DEFAULT_DEVICE_TREE="armada-38x-controlcenterdc"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_DM_GPIO=y
diff --git a/configs/corvus_defconfig b/configs/corvus_defconfig
index f4d45272ba..cf1a6dab2d 100644
--- a/configs/corvus_defconfig
+++ b/configs/corvus_defconfig
@@ -41,6 +41,7 @@ CONFIG_DOS_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g45-corvus"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BLK=y
 CONFIG_CLK=y
 CONFIG_CLK_AT91=y
diff --git a/configs/da850evm_defconfig b/configs/da850evm_defconfig
index cfd910ad26..86831e91cc 100644
--- a/configs/da850evm_defconfig
+++ b/configs/da850evm_defconfig
@@ -46,6 +46,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="da850-evm"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/da850evm_nand_defconfig b/configs/da850evm_nand_defconfig
index 701093977e..0eafb5db26 100644
--- a/configs/da850evm_nand_defconfig
+++ b/configs/da850evm_nand_defconfig
@@ -43,6 +43,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="da850-evm"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/dalmore_defconfig b/configs/dalmore_defconfig
index 4802e2d8d8..e7124bd084 100644
--- a/configs/dalmore_defconfig
+++ b/configs/dalmore_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra114-dalmore"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
diff --git a/configs/db-88f6720_defconfig b/configs/db-88f6720_defconfig
index 8270b77309..9c2d1687d8 100644
--- a/configs/db-88f6720_defconfig
+++ b/configs/db-88f6720_defconfig
@@ -45,6 +45,7 @@ CONFIG_DEFAULT_DEVICE_TREE="armada-375-db"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_BLK=y
diff --git a/configs/db-88f6820-amc_defconfig b/configs/db-88f6820-amc_defconfig
index 82308b4196..a9046a8211 100644
--- a/configs/db-88f6820-amc_defconfig
+++ b/configs/db-88f6820-amc_defconfig
@@ -49,6 +49,7 @@ CONFIG_DEFAULT_DEVICE_TREE="armada-385-db-88f6820-amc"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_BLK=y
 # CONFIG_SPL_BLK is not set
diff --git a/configs/db-88f6820-gp_defconfig b/configs/db-88f6820-gp_defconfig
index 7beca5d80b..99f1c3bc23 100644
--- a/configs/db-88f6820-gp_defconfig
+++ b/configs/db-88f6820-gp_defconfig
@@ -50,6 +50,7 @@ CONFIG_DEFAULT_DEVICE_TREE="armada-388-gp"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_AHCI_MVEBU=y
 CONFIG_DM_MMC=y
diff --git a/configs/db-mv784mp-gp_defconfig b/configs/db-mv784mp-gp_defconfig
index 7d86e065e3..4354e25554 100644
--- a/configs/db-mv784mp-gp_defconfig
+++ b/configs/db-mv784mp-gp_defconfig
@@ -48,6 +48,7 @@ CONFIG_EFI_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="armada-xp-gp"
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_SATA_MV=y
 CONFIG_BLK=y
diff --git a/configs/devkit3250_defconfig b/configs/devkit3250_defconfig
index ae7be20f99..512d155550 100644
--- a/configs/devkit3250_defconfig
+++ b/configs/devkit3250_defconfig
@@ -32,6 +32,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_JFFS2=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/devkit8000_defconfig b/configs/devkit8000_defconfig
index da09b3af12..99f1890db5 100644
--- a/configs/devkit8000_defconfig
+++ b/configs/devkit8000_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:512k(x-loader),1920k(u-boot),128k(u-boot-env),4m(kernel),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_TWL4030_LED=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
diff --git a/configs/dh_imx6_defconfig b/configs/dh_imx6_defconfig
index f59f2e78ae..696452597c 100644
--- a/configs/dh_imx6_defconfig
+++ b/configs/dh_imx6_defconfig
@@ -45,6 +45,7 @@ CONFIG_DEFAULT_DEVICE_TREE="imx6q-dhcom-pdk2"
 CONFIG_OF_LIST="imx6q-dhcom-pdk2 imx6dl-dhcom-pdk2"
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DWC_AHSATA=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DM_GPIO=y
diff --git a/configs/difrnce_dit4350_defconfig b/configs/difrnce_dit4350_defconfig
index 7e28dec718..71931d95cf 100644
--- a/configs/difrnce_dit4350_defconfig
+++ b/configs/difrnce_dit4350_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-difrnce-dit4350"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/display5_defconfig b/configs/display5_defconfig
index 8609cd5a8c..71099ea547 100644
--- a/configs/display5_defconfig
+++ b/configs/display5_defconfig
@@ -27,7 +27,6 @@ CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SPL_BOOTCOUNT_LIMIT=y
 # CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR is not set
 CONFIG_SPL_DMA_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_SAVEENV=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_OS_BOOT=y
diff --git a/configs/display5_factory_defconfig b/configs/display5_factory_defconfig
index 70c64260d8..2bb8ef2302 100644
--- a/configs/display5_factory_defconfig
+++ b/configs/display5_factory_defconfig
@@ -63,6 +63,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=02008000.spi.1:128k(SPL),1m(u-boot),64k(env1),
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_PARTITION_TYPE_GUID=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_SF=y
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/draco_defconfig b/configs/draco_defconfig
index 4ba3bde2e6..11d486460e 100644
--- a/configs/draco_defconfig
+++ b/configs/draco_defconfig
@@ -59,6 +59,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/ds414_defconfig b/configs/ds414_defconfig
index 2f365ddfb2..cea8705e08 100644
--- a/configs/ds414_defconfig
+++ b/configs/ds414_defconfig
@@ -46,6 +46,7 @@ CONFIG_ISO_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="armada-xp-synology-ds414"
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_BLK=y
diff --git a/configs/dserve_dsrv9703c_defconfig b/configs/dserve_dsrv9703c_defconfig
index c664bf5684..d9037608ad 100644
--- a/configs/dserve_dsrv9703c_defconfig
+++ b/configs/dserve_dsrv9703c_defconfig
@@ -20,5 +20,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-dserve-dsrv9703c"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/edminiv2_defconfig b/configs/edminiv2_defconfig
index d663090992..32b571cc58 100644
--- a/configs/edminiv2_defconfig
+++ b/configs/edminiv2_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_EXT2=y
 CONFIG_ISO_PARTITION=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/emlid_neutis_n5_devboard_defconfig b/configs/emlid_neutis_n5_devboard_defconfig
index e85287e3ec..bfd588bc8e 100644
--- a/configs/emlid_neutis_n5_devboard_defconfig
+++ b/configs/emlid_neutis_n5_devboard_defconfig
@@ -13,3 +13,4 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-emlid-neutis-n5-devboard"
+CONFIG_SPL_ENV_IS_NOWHERE=y
diff --git a/configs/etamin_defconfig b/configs/etamin_defconfig
index 31e711d32f..2a120615b8 100644
--- a/configs/etamin_defconfig
+++ b/configs/etamin_defconfig
@@ -60,6 +60,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/evb-px5_defconfig b/configs/evb-px5_defconfig
index 5a06b2a99f..bb19ab98db 100644
--- a/configs/evb-px5_defconfig
+++ b/configs/evb-px5_defconfig
@@ -44,6 +44,8 @@ CONFIG_DEFAULT_DEVICE_TREE="rk3368-px5-evb"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names interrupt-parent"
 CONFIG_TPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_TPL_DM=y
 CONFIG_REGMAP=y
diff --git a/configs/evb-rk3229_defconfig b/configs/evb-rk3229_defconfig
index 128fbcd64c..81e02bc9cd 100644
--- a/configs/evb-rk3229_defconfig
+++ b/configs/evb-rk3229_defconfig
@@ -33,6 +33,8 @@ CONFIG_TPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3229-evb"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
diff --git a/configs/evb-rk3288_defconfig b/configs/evb-rk3288_defconfig
index 405fde0c80..bd5358904f 100644
--- a/configs/evb-rk3288_defconfig
+++ b/configs/evb-rk3288_defconfig
@@ -35,6 +35,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-evb"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
diff --git a/configs/evb-rk3328_defconfig b/configs/evb-rk3328_defconfig
index 37610774c1..840487b116 100644
--- a/configs/evb-rk3328_defconfig
+++ b/configs/evb-rk3328_defconfig
@@ -36,6 +36,8 @@ CONFIG_DEFAULT_DEVICE_TREE="rk3328-evb"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_TPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_TPL_DM=y
 CONFIG_REGMAP=y
diff --git a/configs/evb-rk3399_defconfig b/configs/evb-rk3399_defconfig
index a0d215a5f1..2a97dd8748 100644
--- a/configs/evb-rk3399_defconfig
+++ b/configs/evb-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-evb"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
diff --git a/configs/ficus-rk3399_defconfig b/configs/ficus-rk3399_defconfig
index 8b3692cdf0..9c2745db98 100644
--- a/configs/ficus-rk3399_defconfig
+++ b/configs/ficus-rk3399_defconfig
@@ -25,6 +25,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-ficus"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
diff --git a/configs/firefly-rk3288_defconfig b/configs/firefly-rk3288_defconfig
index 7ca522b479..54a41677be 100644
--- a/configs/firefly-rk3288_defconfig
+++ b/configs/firefly-rk3288_defconfig
@@ -38,6 +38,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-firefly"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
diff --git a/configs/firefly-rk3399_defconfig b/configs/firefly-rk3399_defconfig
index d022631465..c554105682 100644
--- a/configs/firefly-rk3399_defconfig
+++ b/configs/firefly-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-firefly"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/ga10h_v1_1_defconfig b/configs/ga10h_v1_1_defconfig
index b82325dfe8..65fd667c4c 100644
--- a/configs/ga10h_v1_1_defconfig
+++ b/configs/ga10h_v1_1_defconfig
@@ -22,6 +22,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a33-ga10h-v1.1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/gardena-smart-gateway-at91sam_defconfig b/configs/gardena-smart-gateway-at91sam_defconfig
index c495ba4612..723c3feae2 100644
--- a/configs/gardena-smart-gateway-at91sam_defconfig
+++ b/configs/gardena-smart-gateway-at91sam_defconfig
@@ -55,6 +55,7 @@ CONFIG_ENV_IS_IN_UBI=y
 CONFIG_ENV_UBI_PART="ubi"
 CONFIG_ENV_UBI_VOLUME="env"
 CONFIG_ENV_UBI_VOLUME_REDUND="env_r"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/gose_defconfig b/configs/gose_defconfig
index f9906ebfb8..aaa2dd8f7a 100644
--- a/configs/gose_defconfig
+++ b/configs/gose_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7793-gose-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/gt90h_v4_defconfig b/configs/gt90h_v4_defconfig
index b317d4d1d7..d52fe18d2f 100644
--- a/configs/gt90h_v4_defconfig
+++ b/configs/gt90h_v4_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a23-gt90h-v4"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index 5d869c08e1..f8df47ad1a 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -59,6 +59,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_SUPPORT_EMMC_RPMB=y
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index df3d35acc4..5b1efdbc23 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -59,6 +59,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_SUPPORT_EMMC_RPMB=y
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index a0d38ae97b..e44a709b89 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -62,6 +62,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_SUPPORT_EMMC_RPMB=y
diff --git a/configs/h8_homlet_v2_defconfig b/configs/h8_homlet_v2_defconfig
index 70c566da6a..8e3f5c9afc 100644
--- a/configs/h8_homlet_v2_defconfig
+++ b/configs/h8_homlet_v2_defconfig
@@ -16,6 +16,7 @@ CONFIG_CONSOLE_MUX=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a83t-allwinner-h8homlet-v2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO4_VOLT=3300
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/harmony_defconfig b/configs/harmony_defconfig
index 04212c96fb..4dbbe68ee4 100644
--- a/configs/harmony_defconfig
+++ b/configs/harmony_defconfig
@@ -28,6 +28,7 @@ CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-harmony"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_MTD=y
 CONFIG_MTD_UBI_FASTMAP=y
diff --git a/configs/helios4_defconfig b/configs/helios4_defconfig
index cd6b476e10..d060a4159c 100644
--- a/configs/helios4_defconfig
+++ b/configs/helios4_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_TIME=y
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="armada-388-helios4"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/i12-tvbox_defconfig b/configs/i12-tvbox_defconfig
index c512d36ba0..6c7e99e73e 100644
--- a/configs/i12-tvbox_defconfig
+++ b/configs/i12-tvbox_defconfig
@@ -13,6 +13,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-i12-tvbox"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/iNet_3F_defconfig b/configs/iNet_3F_defconfig
index 6c047ca98b..dcb38ee461 100644
--- a/configs/iNet_3F_defconfig
+++ b/configs/iNet_3F_defconfig
@@ -20,5 +20,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-inet-3f"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/iNet_3W_defconfig b/configs/iNet_3W_defconfig
index 3b4ffe494b..da7062c25c 100644
--- a/configs/iNet_3W_defconfig
+++ b/configs/iNet_3W_defconfig
@@ -20,5 +20,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-inet-3w"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/iNet_86VS_defconfig b/configs/iNet_86VS_defconfig
index 5fff4ad585..84fe143084 100644
--- a/configs/iNet_86VS_defconfig
+++ b/configs/iNet_86VS_defconfig
@@ -19,6 +19,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-inet-86vs"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/iNet_D978_rev2_defconfig b/configs/iNet_D978_rev2_defconfig
index d36c3eec7d..9144bc5fed 100644
--- a/configs/iNet_D978_rev2_defconfig
+++ b/configs/iNet_D978_rev2_defconfig
@@ -22,6 +22,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a33-inet-d978-rev2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_CONS_INDEX=5
diff --git a/configs/icnova-a20-swac_defconfig b/configs/icnova-a20-swac_defconfig
index 1372c7606c..f379413953 100644
--- a/configs/icnova-a20-swac_defconfig
+++ b/configs/icnova-a20-swac_defconfig
@@ -20,6 +20,7 @@ CONFIG_CMD_UNZIP=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-icnova-swac"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 CONFIG_SUN7I_GMAC=y
diff --git a/configs/igep00x0_defconfig b/configs/igep00x0_defconfig
index 43aef5d26e..ff7fbd1773 100644
--- a/configs/igep00x0_defconfig
+++ b/configs/igep00x0_defconfig
@@ -46,6 +46,7 @@ CONFIG_ENV_IS_IN_UBI=y
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="config"
 CONFIG_ENV_UBI_VOLUME_REDUND="config_r"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_OMAP_HS=y
diff --git a/configs/imx6dl_icore_nand_defconfig b/configs/imx6dl_icore_nand_defconfig
index 6eb7c7ab3a..7ccdfe32a0 100644
--- a/configs/imx6dl_icore_nand_defconfig
+++ b/configs/imx6dl_icore_nand_defconfig
@@ -38,6 +38,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:2m(spl),2m(uboot),1m(env),8m(kernel)
 CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6dl-icore"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/imx6dl_mamoj_defconfig b/configs/imx6dl_mamoj_defconfig
index 44486cbfa3..2fa0492a30 100644
--- a/configs/imx6dl_mamoj_defconfig
+++ b/configs/imx6dl_mamoj_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_PMIC=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6dl-mamoj"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0x12000000
diff --git a/configs/imx6q_icore_nand_defconfig b/configs/imx6q_icore_nand_defconfig
index fc990a8add..65d4b488f1 100644
--- a/configs/imx6q_icore_nand_defconfig
+++ b/configs/imx6q_icore_nand_defconfig
@@ -39,6 +39,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:2m(spl),2m(uboot),1m(env),8m(kernel)
 CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-icore"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/imx6q_logic_defconfig b/configs/imx6q_logic_defconfig
index 12f49db790..9b925ef9f5 100644
--- a/configs/imx6q_logic_defconfig
+++ b/configs/imx6q_logic_defconfig
@@ -60,6 +60,7 @@ CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_FAT_INTERFACE="mmc"
 CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_SPL_OF_TRANSLATE=y
diff --git a/configs/imx6qdl_icore_mipi_defconfig b/configs/imx6qdl_icore_mipi_defconfig
index 5442ce7db4..f87e783a47 100644
--- a/configs/imx6qdl_icore_mipi_defconfig
+++ b/configs/imx6qdl_icore_mipi_defconfig
@@ -43,6 +43,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-icore-mipi"
 CONFIG_OF_LIST="imx6q-icore-mipi imx6dl-icore-mipi"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index c7544c68c8..1d22edb863 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -50,6 +50,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-icore"
 CONFIG_OF_LIST="imx6q-icore imx6dl-icore"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 CONFIG_SYS_BOOTCOUNT_MAGIC=0x0B01C041
diff --git a/configs/imx6qdl_icore_nand_defconfig b/configs/imx6qdl_icore_nand_defconfig
index fc990a8add..65d4b488f1 100644
--- a/configs/imx6qdl_icore_nand_defconfig
+++ b/configs/imx6qdl_icore_nand_defconfig
@@ -39,6 +39,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:2m(spl),2m(uboot),1m(env),8m(kernel)
 CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-icore"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/imx6qdl_icore_rqs_defconfig b/configs/imx6qdl_icore_rqs_defconfig
index 9f0cc0ffed..0f19484a01 100644
--- a/configs/imx6qdl_icore_rqs_defconfig
+++ b/configs/imx6qdl_icore_rqs_defconfig
@@ -40,6 +40,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-icore-rqs"
 CONFIG_OF_LIST="imx6q-icore-rqs imx6dl-icore-rqs"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
diff --git a/configs/imx6ul_geam_mmc_defconfig b/configs/imx6ul_geam_mmc_defconfig
index 620d979342..72755f2f05 100644
--- a/configs/imx6ul_geam_mmc_defconfig
+++ b/configs/imx6ul_geam_mmc_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-geam"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
diff --git a/configs/imx6ul_geam_nand_defconfig b/configs/imx6ul_geam_nand_defconfig
index 94d43fdd04..408d09f061 100644
--- a/configs/imx6ul_geam_nand_defconfig
+++ b/configs/imx6ul_geam_nand_defconfig
@@ -40,6 +40,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:2m(spl),2m(uboot),1m(env),8m(kernel)
 CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-geam"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/imx6ul_isiot_emmc_defconfig b/configs/imx6ul_isiot_emmc_defconfig
index f0f53bada7..f3e1bdfcd6 100644
--- a/configs/imx6ul_isiot_emmc_defconfig
+++ b/configs/imx6ul_isiot_emmc_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-isiot-emmc"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
diff --git a/configs/imx6ul_isiot_nand_defconfig b/configs/imx6ul_isiot_nand_defconfig
index 05e0498a5e..20409d3907 100644
--- a/configs/imx6ul_isiot_nand_defconfig
+++ b/configs/imx6ul_isiot_nand_defconfig
@@ -40,6 +40,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:2m(spl),2m(uboot),1m(env),8m(kernel)
 CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-isiot-nand"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SYS_I2C_MXC=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/imx8mq_evk_defconfig b/configs/imx8mq_evk_defconfig
index 48b16a4e24..005060fcf4 100644
--- a/configs/imx8mq_evk_defconfig
+++ b/configs/imx8mq_evk_defconfig
@@ -25,6 +25,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-imx8mq-evk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SAVED_DRAM_TIMING_BASE=0x40000000
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
diff --git a/configs/imx8qm_mek_defconfig b/configs/imx8qm_mek_defconfig
index 3294931ef8..05b243366f 100644
--- a/configs/imx8qm_mek_defconfig
+++ b/configs/imx8qm_mek_defconfig
@@ -38,6 +38,7 @@ CONFIG_CMD_FAT=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-imx8qm-mek"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_CLK=y
 CONFIG_CLK_IMX8=y
diff --git a/configs/imx8qxp_mek_defconfig b/configs/imx8qxp_mek_defconfig
index d7974e8fad..6d8a3ba330 100644
--- a/configs/imx8qxp_mek_defconfig
+++ b/configs/imx8qxp_mek_defconfig
@@ -42,6 +42,7 @@ CONFIG_CMD_FAT=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-imx8qxp-mek"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_CLK=y
 CONFIG_CLK_IMX8=y
diff --git a/configs/inet1_defconfig b/configs/inet1_defconfig
index 3cb6664157..ce362c64d9 100644
--- a/configs/inet1_defconfig
+++ b/configs/inet1_defconfig
@@ -20,6 +20,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-inet1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/inet86dz_defconfig b/configs/inet86dz_defconfig
index 9038811eac..d46141c4b9 100644
--- a/configs/inet86dz_defconfig
+++ b/configs/inet86dz_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a23-inet86dz"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/inet97fv2_defconfig b/configs/inet97fv2_defconfig
index 2b43142bc6..5a40e689a6 100644
--- a/configs/inet97fv2_defconfig
+++ b/configs/inet97fv2_defconfig
@@ -19,5 +19,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-inet97fv2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/inet98v_rev2_defconfig b/configs/inet98v_rev2_defconfig
index 76baeec5f2..d72cc0be98 100644
--- a/configs/inet98v_rev2_defconfig
+++ b/configs/inet98v_rev2_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-inet-98v-rev2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/inet9f_rev03_defconfig b/configs/inet9f_rev03_defconfig
index 771dc1fadf..1c74efa631 100644
--- a/configs/inet9f_rev03_defconfig
+++ b/configs/inet9f_rev03_defconfig
@@ -19,5 +19,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-inet9f-rev03"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/inet_q972_defconfig b/configs/inet_q972_defconfig
index 4b26a926a6..03ec676d29 100644
--- a/configs/inet_q972_defconfig
+++ b/configs/inet_q972_defconfig
@@ -20,6 +20,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31s-inet-q972"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index b516f9d0e5..4296bf0a8d 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_TEXT_BASE=0x41c00000
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_SEPARATE_BSS=y
 CONFIG_SPL_EARLY_BSS=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_RESET=y
diff --git a/configs/jesurun_q5_defconfig b/configs/jesurun_q5_defconfig
index ab4a2718de..ff27cd0421 100644
--- a/configs/jesurun_q5_defconfig
+++ b/configs/jesurun_q5_defconfig
@@ -14,6 +14,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-jesurun-q5"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MII=y
 CONFIG_SUN4I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/jetson-tk1_defconfig b/configs/jetson-tk1_defconfig
index 14351bb5d5..13fefbadc8 100644
--- a/configs/jetson-tk1_defconfig
+++ b/configs/jetson-tk1_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra124-jetson-tk1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
diff --git a/configs/k2e_evm_defconfig b/configs/k2e_evm_defconfig
index 260605533e..e8c5327186 100644
--- a/configs/k2e_evm_defconfig
+++ b/configs/k2e_evm_defconfig
@@ -38,6 +38,7 @@ CONFIG_DEFAULT_DEVICE_TREE="keystone-k2e-evm"
 CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SYS_I2C_DAVINCI=y
diff --git a/configs/k2g_evm_defconfig b/configs/k2g_evm_defconfig
index 27804517fe..612f845357 100644
--- a/configs/k2g_evm_defconfig
+++ b/configs/k2g_evm_defconfig
@@ -38,6 +38,7 @@ CONFIG_OF_LIST="keystone-k2g-generic keystone-k2g-evm keystone-k2g-ice"
 CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_SYS_I2C_DAVINCI=y
diff --git a/configs/k2hk_evm_defconfig b/configs/k2hk_evm_defconfig
index 2d5f1934d0..272c121475 100644
--- a/configs/k2hk_evm_defconfig
+++ b/configs/k2hk_evm_defconfig
@@ -38,6 +38,7 @@ CONFIG_DEFAULT_DEVICE_TREE="keystone-k2hk-evm"
 CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SYS_I2C_DAVINCI=y
diff --git a/configs/k2l_evm_defconfig b/configs/k2l_evm_defconfig
index b0898b0000..3c2128cb83 100644
--- a/configs/k2l_evm_defconfig
+++ b/configs/k2l_evm_defconfig
@@ -38,6 +38,7 @@ CONFIG_DEFAULT_DEVICE_TREE="keystone-k2l-evm"
 CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SYS_I2C_DAVINCI=y
diff --git a/configs/khadas-edge-captain-rk3399_defconfig b/configs/khadas-edge-captain-rk3399_defconfig
index acfd91dbe7..cf598148a8 100644
--- a/configs/khadas-edge-captain-rk3399_defconfig
+++ b/configs/khadas-edge-captain-rk3399_defconfig
@@ -27,6 +27,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-khadas-edge-captain"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
diff --git a/configs/khadas-edge-rk3399_defconfig b/configs/khadas-edge-rk3399_defconfig
index b71fd3a286..c74937ff16 100644
--- a/configs/khadas-edge-rk3399_defconfig
+++ b/configs/khadas-edge-rk3399_defconfig
@@ -27,6 +27,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-khadas-edge"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/khadas-edge-v-rk3399_defconfig b/configs/khadas-edge-v-rk3399_defconfig
index 0a789872dc..a47e406f05 100644
--- a/configs/khadas-edge-v-rk3399_defconfig
+++ b/configs/khadas-edge-v-rk3399_defconfig
@@ -27,6 +27,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-khadas-edge-v"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
diff --git a/configs/koelsch_defconfig b/configs/koelsch_defconfig
index 86c8dba9fe..d1f9fffa2c 100644
--- a/configs/koelsch_defconfig
+++ b/configs/koelsch_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7791-koelsch-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/kp_imx6q_tpc_defconfig b/configs/kp_imx6q_tpc_defconfig
index 578e7010e5..04040fdb99 100644
--- a/configs/kp_imx6q_tpc_defconfig
+++ b/configs/kp_imx6q_tpc_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_EFI_PARTITION is not set
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
 CONFIG_PHY_ATHEROS=y
diff --git a/configs/kylin-rk3036_defconfig b/configs/kylin-rk3036_defconfig
index c254d3e5cf..761a13c657 100644
--- a/configs/kylin-rk3036_defconfig
+++ b/configs/kylin-rk3036_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_TIME=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="rk3036-sdk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 # CONFIG_SPL_BLK is not set
diff --git a/configs/lager_defconfig b/configs/lager_defconfig
index 1d10b373e0..37e214efe5 100644
--- a/configs/lager_defconfig
+++ b/configs/lager_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7790-lager-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/libretech_all_h3_cc_h2_plus_defconfig b/configs/libretech_all_h3_cc_h2_plus_defconfig
index d9c9b6de47..741fb75922 100644
--- a/configs/libretech_all_h3_cc_h2_plus_defconfig
+++ b/configs/libretech_all_h3_cc_h2_plus_defconfig
@@ -11,6 +11,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h2-plus-libretech-all-h3-cc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_cc_h3_defconfig b/configs/libretech_all_h3_cc_h3_defconfig
index e99dc5c172..8c5d63d5ef 100644
--- a/configs/libretech_all_h3_cc_h3_defconfig
+++ b/configs/libretech_all_h3_cc_h3_defconfig
@@ -11,6 +11,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-libretech-all-h3-cc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_cc_h5_defconfig b/configs/libretech_all_h3_cc_h5_defconfig
index 088246d60b..7a45f690a4 100644
--- a/configs/libretech_all_h3_cc_h5_defconfig
+++ b/configs/libretech_all_h3_cc_h5_defconfig
@@ -11,6 +11,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-libretech-all-h3-cc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/lion-rk3368_defconfig b/configs/lion-rk3368_defconfig
index 77dbb281f1..acd8c4fec8 100644
--- a/configs/lion-rk3368_defconfig
+++ b/configs/lion-rk3368_defconfig
@@ -50,6 +50,8 @@ CONFIG_DEFAULT_DEVICE_TREE="rk3368-lion"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names interrupt-parent"
 CONFIG_TPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_TPL_DM=y
 CONFIG_REGMAP=y
diff --git a/configs/liteboard_defconfig b/configs/liteboard_defconfig
index 03a0e88635..34bae1fc58 100644
--- a/configs/liteboard_defconfig
+++ b/configs/liteboard_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-liteboard"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
diff --git a/configs/ls1021aiot_sdcard_defconfig b/configs/ls1021aiot_sdcard_defconfig
index 93eb83471c..3698740e49 100644
--- a/configs/ls1021aiot_sdcard_defconfig
+++ b/configs/ls1021aiot_sdcard_defconfig
@@ -21,6 +21,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-iot-duart"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021aqds_nand_defconfig b/configs/ls1021aqds_nand_defconfig
index 3e0075d08d..80e1e7be09 100644
--- a/configs/ls1021aqds_nand_defconfig
+++ b/configs/ls1021aqds_nand_defconfig
@@ -22,7 +22,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/ls1021aqds_sdcard_ifc_defconfig b/configs/ls1021aqds_sdcard_ifc_defconfig
index daabf7680b..2c9de31b77 100644
--- a/configs/ls1021aqds_sdcard_ifc_defconfig
+++ b/configs/ls1021aqds_sdcard_ifc_defconfig
@@ -21,7 +21,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1021aqds_sdcard_qspi_defconfig b/configs/ls1021aqds_sdcard_qspi_defconfig
index cc71c28259..415f3af31d 100644
--- a/configs/ls1021aqds_sdcard_qspi_defconfig
+++ b/configs/ls1021aqds_sdcard_qspi_defconfig
@@ -21,7 +21,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1021atsn_sdcard_defconfig b/configs/ls1021atsn_sdcard_defconfig
index 77a105b319..924d636d6c 100644
--- a/configs/ls1021atsn_sdcard_defconfig
+++ b/configs/ls1021atsn_sdcard_defconfig
@@ -20,7 +20,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
index ad07a98440..782d988afa 100644
--- a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
+++ b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
@@ -27,7 +27,6 @@ CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
 CONFIG_SPL_CRYPTO_SUPPORT=y
 CONFIG_SPL_HASH_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1021atwr_sdcard_ifc_defconfig b/configs/ls1021atwr_sdcard_ifc_defconfig
index 1a01e5fdbc..26bf03508b 100644
--- a/configs/ls1021atwr_sdcard_ifc_defconfig
+++ b/configs/ls1021atwr_sdcard_ifc_defconfig
@@ -25,7 +25,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1021atwr_sdcard_qspi_defconfig b/configs/ls1021atwr_sdcard_qspi_defconfig
index 2dad37e6d7..d2160b45ea 100644
--- a/configs/ls1021atwr_sdcard_qspi_defconfig
+++ b/configs/ls1021atwr_sdcard_qspi_defconfig
@@ -25,7 +25,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xe8
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1043aqds_nand_defconfig b/configs/ls1043aqds_nand_defconfig
index 10d08f8d6f..4d8da18fdf 100644
--- a/configs/ls1043aqds_nand_defconfig
+++ b/configs/ls1043aqds_nand_defconfig
@@ -22,7 +22,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xf0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/ls1043aqds_sdcard_ifc_defconfig b/configs/ls1043aqds_sdcard_ifc_defconfig
index 5ab5ef6545..31794e1b54 100644
--- a/configs/ls1043aqds_sdcard_ifc_defconfig
+++ b/configs/ls1043aqds_sdcard_ifc_defconfig
@@ -23,7 +23,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xf0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1043aqds_sdcard_qspi_defconfig b/configs/ls1043aqds_sdcard_qspi_defconfig
index ecd30238af..26544a3561 100644
--- a/configs/ls1043aqds_sdcard_qspi_defconfig
+++ b/configs/ls1043aqds_sdcard_qspi_defconfig
@@ -23,7 +23,6 @@ CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xf0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
index 3e2ecf414a..970235be68 100644
--- a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
@@ -24,7 +24,6 @@ CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xf0
 CONFIG_SPL_CRYPTO_SUPPORT=y
 CONFIG_SPL_HASH_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1043ardb_nand_defconfig b/configs/ls1043ardb_nand_defconfig
index 68865fa363..15c8da27f5 100644
--- a/configs/ls1043ardb_nand_defconfig
+++ b/configs/ls1043ardb_nand_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xf0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
index 759d3703cd..c207100746 100644
--- a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
@@ -24,7 +24,6 @@ CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x110
 CONFIG_SPL_CRYPTO_SUPPORT=y
 CONFIG_SPL_HASH_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
 CONFIG_CMD_IMLS=y
diff --git a/configs/ls1043ardb_sdcard_defconfig b/configs/ls1043ardb_sdcard_defconfig
index ddfa7ca430..5620d2dfbd 100644
--- a/configs/ls1043ardb_sdcard_defconfig
+++ b/configs/ls1043ardb_sdcard_defconfig
@@ -22,7 +22,6 @@ CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0xf0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
 CONFIG_CMD_IMLS=y
diff --git a/configs/ls1046aqds_nand_defconfig b/configs/ls1046aqds_nand_defconfig
index a6b6866a8a..83e582359d 100644
--- a/configs/ls1046aqds_nand_defconfig
+++ b/configs/ls1046aqds_nand_defconfig
@@ -38,6 +38,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1046a-qds-duart"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1046aqds_sdcard_ifc_defconfig b/configs/ls1046aqds_sdcard_ifc_defconfig
index 77dc0b015b..a72019224d 100644
--- a/configs/ls1046aqds_sdcard_ifc_defconfig
+++ b/configs/ls1046aqds_sdcard_ifc_defconfig
@@ -24,7 +24,6 @@ CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x110
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1046aqds_sdcard_qspi_defconfig b/configs/ls1046aqds_sdcard_qspi_defconfig
index 723a04f017..b9cbe53a5e 100644
--- a/configs/ls1046aqds_sdcard_qspi_defconfig
+++ b/configs/ls1046aqds_sdcard_qspi_defconfig
@@ -24,7 +24,6 @@ CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x110
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1046ardb_emmc_defconfig b/configs/ls1046ardb_emmc_defconfig
index 855edc726e..c76efe7c79 100644
--- a/configs/ls1046ardb_emmc_defconfig
+++ b/configs/ls1046ardb_emmc_defconfig
@@ -24,7 +24,6 @@ CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x110
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1046ardb_qspi_spl_defconfig b/configs/ls1046ardb_qspi_spl_defconfig
index 6326c47cdb..7b9fca0a8e 100644
--- a/configs/ls1046ardb_qspi_spl_defconfig
+++ b/configs/ls1046ardb_qspi_spl_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOOTARGS="console=ttyS0,115200 root=/dev/ram0 earlycon=uart8250,mmio,0x21
 CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NOR_SUPPORT=y
diff --git a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
index 7bf23ad7fd..283bfdb0a4 100644
--- a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
@@ -24,7 +24,6 @@ CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x110
 CONFIG_SPL_CRYPTO_SUPPORT=y
 CONFIG_SPL_HASH_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1046ardb_sdcard_defconfig b/configs/ls1046ardb_sdcard_defconfig
index 829861b03b..57d1629657 100644
--- a/configs/ls1046ardb_sdcard_defconfig
+++ b/configs/ls1046ardb_sdcard_defconfig
@@ -23,7 +23,6 @@ CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x110
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
diff --git a/configs/ls1088aqds_sdcard_ifc_defconfig b/configs/ls1088aqds_sdcard_ifc_defconfig
index 58a6795b6d..150d66224e 100644
--- a/configs/ls1088aqds_sdcard_ifc_defconfig
+++ b/configs/ls1088aqds_sdcard_ifc_defconfig
@@ -21,7 +21,6 @@ CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_SPL_TEXT_BASE=0x1800a000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x8b0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/ls1088aqds_sdcard_qspi_defconfig b/configs/ls1088aqds_sdcard_qspi_defconfig
index 5b5cbfa5d6..8be88462f7 100644
--- a/configs/ls1088aqds_sdcard_qspi_defconfig
+++ b/configs/ls1088aqds_sdcard_qspi_defconfig
@@ -24,7 +24,6 @@ CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_SPL_TEXT_BASE=0x1800a000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x8b0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_CMD_GREPENV=y
diff --git a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
index 3d531295ae..5ab90e85f8 100644
--- a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
@@ -27,7 +27,6 @@ CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x8b0
 CONFIG_SPL_CRYPTO_SUPPORT=y
 CONFIG_SPL_HASH_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_CMD_GREPENV=y
diff --git a/configs/ls1088ardb_sdcard_qspi_defconfig b/configs/ls1088ardb_sdcard_qspi_defconfig
index 51b74e7c35..3938f37697 100644
--- a/configs/ls1088ardb_sdcard_qspi_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_defconfig
@@ -25,7 +25,6 @@ CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_SPL_TEXT_BASE=0x1800a000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x8b0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_CMD_GREPENV=y
diff --git a/configs/ls2080aqds_nand_defconfig b/configs/ls2080aqds_nand_defconfig
index 3a3694107d..6a3ae0eda4 100644
--- a/configs/ls2080aqds_nand_defconfig
+++ b/configs/ls2080aqds_nand_defconfig
@@ -18,7 +18,6 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 root=/dev/ram0 earlycon=uart8250,mmio,0x21c0500 ramdisk_size=0x2000000 default_hugepagesz=2m hugepagesz=2m hugepages=256"
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_SPL_TEXT_BASE=0x1800a000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/ls2080aqds_sdcard_defconfig b/configs/ls2080aqds_sdcard_defconfig
index 9d1715f03f..5d51756efe 100644
--- a/configs/ls2080aqds_sdcard_defconfig
+++ b/configs/ls2080aqds_sdcard_defconfig
@@ -22,7 +22,6 @@ CONFIG_BOOTARGS="console=ttyS0,115200 root=/dev/ram0 earlycon=uart8250,mmio,0x21
 CONFIG_SPL_TEXT_BASE=0x1800a000
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x8b0
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_CMD_GREPENV=y
diff --git a/configs/ls2080ardb_nand_defconfig b/configs/ls2080ardb_nand_defconfig
index 56b78feab2..174af9e51b 100644
--- a/configs/ls2080ardb_nand_defconfig
+++ b/configs/ls2080ardb_nand_defconfig
@@ -19,7 +19,6 @@ CONFIG_BOOTARGS="console=ttyS1,115200 root=/dev/ram0 earlycon=uart8250,mmio,0x21
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_MISC_INIT_R=y
 CONFIG_SPL_TEXT_BASE=0x1800a000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT=y
 CONFIG_SPL_NAND_SUPPORT=y
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index 6d7a3dde9f..901c4a1278 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -56,6 +56,7 @@ CONFIG_CMD_UBI=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx53-m53menlo"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/maxbcm_defconfig b/configs/maxbcm_defconfig
index 54f2c14aa0..3065d2eb23 100644
--- a/configs/maxbcm_defconfig
+++ b/configs/maxbcm_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_TIME=y
 CONFIG_DEFAULT_DEVICE_TREE="armada-xp-maxbcm"
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/mccmon6_nor_defconfig b/configs/mccmon6_nor_defconfig
index 66f49c0e54..43fb9f87bc 100644
--- a/configs/mccmon6_nor_defconfig
+++ b/configs/mccmon6_nor_defconfig
@@ -14,7 +14,6 @@ CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/liebherr/mccmon6/mon6_imximage_nor.cf
 CONFIG_BOUNCE_BUFFER=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SPL_BOARD_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_NOR_SUPPORT=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
diff --git a/configs/mccmon6_sd_defconfig b/configs/mccmon6_sd_defconfig
index 501eaf6942..ffd5347cb2 100644
--- a/configs/mccmon6_sd_defconfig
+++ b/configs/mccmon6_sd_defconfig
@@ -15,7 +15,6 @@ CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/liebherr/mccmon6/mon6_imximage_sd.cfg
 CONFIG_BOUNCE_BUFFER=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SPL_BOARD_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_NOR_SUPPORT=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
diff --git a/configs/medcom-wide_defconfig b/configs/medcom-wide_defconfig
index ee9044ee7a..eb568b9ac8 100644
--- a/configs/medcom-wide_defconfig
+++ b/configs/medcom-wide_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-medcom-wide"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_PMIC=y
 CONFIG_DM_REGULATOR=y
diff --git a/configs/miqi-rk3288_defconfig b/configs/miqi-rk3288_defconfig
index 1fee1be58a..eb2c749df7 100644
--- a/configs/miqi-rk3288_defconfig
+++ b/configs/miqi-rk3288_defconfig
@@ -38,6 +38,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-miqi"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
diff --git a/configs/mixtile_loftq_defconfig b/configs/mixtile_loftq_defconfig
index 04d2426361..b699827f81 100644
--- a/configs/mixtile_loftq_defconfig
+++ b/configs/mixtile_loftq_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun6i-a31-mixtile-loftq"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
 CONFIG_MII=y
diff --git a/configs/mk802_a10s_defconfig b/configs/mk802_a10s_defconfig
index 396879015e..5ddc65f24c 100644
--- a/configs/mk802_a10s_defconfig
+++ b/configs/mk802_a10s_defconfig
@@ -13,6 +13,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-mk802"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP152_POWER=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/mk802_defconfig b/configs/mk802_defconfig
index 416cb9a9c2..fa82171229 100644
--- a/configs/mk802_defconfig
+++ b/configs/mk802_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-mk802"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUNXI_NO_PMIC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/mk802ii_defconfig b/configs/mk802ii_defconfig
index 221c2bc88b..8538b235db 100644
--- a/configs/mk802ii_defconfig
+++ b/configs/mk802ii_defconfig
@@ -10,6 +10,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-mk802ii"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/mx23_olinuxino_defconfig b/configs/mx23_olinuxino_defconfig
index fd045ad162..e77381555d 100644
--- a/configs/mx23_olinuxino_defconfig
+++ b/configs/mx23_olinuxino_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS_GPIO=y
diff --git a/configs/mx23evk_defconfig b/configs/mx23evk_defconfig
index bb04623a8f..13432035a0 100644
--- a/configs/mx23evk_defconfig
+++ b/configs/mx23evk_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_NET is not set
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
diff --git a/configs/mx28evk_auart_console_defconfig b/configs/mx28evk_auart_console_defconfig
index d7909e2fa9..e3a0c75a5e 100644
--- a/configs/mx28evk_auart_console_defconfig
+++ b/configs/mx28evk_auart_console_defconfig
@@ -38,6 +38,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=gpmi-nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:3m(bootloader)ro,512k(environment),512k(redundant-environment),4m(kernel),512k(fdt),8m(ramdisk),-(filesystem)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
 CONFIG_NAND=y
diff --git a/configs/mx28evk_defconfig b/configs/mx28evk_defconfig
index 7f000c8c38..d5cfe5c9b3 100644
--- a/configs/mx28evk_defconfig
+++ b/configs/mx28evk_defconfig
@@ -38,6 +38,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=gpmi-nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:3m(bootloader)ro,512k(environment),512k(redundant-environment),4m(kernel),512k(fdt),8m(ramdisk),-(filesystem)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
 CONFIG_NAND=y
diff --git a/configs/mx28evk_nand_defconfig b/configs/mx28evk_nand_defconfig
index 248d8b1fc9..1f7b6da3e7 100644
--- a/configs/mx28evk_nand_defconfig
+++ b/configs/mx28evk_nand_defconfig
@@ -37,6 +37,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=gpmi-nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:3m(bootloader)ro,512k(environment),512k(redundant-environment),4m(kernel),512k(fdt),8m(ramdisk),-(filesystem)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
 CONFIG_NAND=y
diff --git a/configs/mx31pdk_defconfig b/configs/mx31pdk_defconfig
index 7eb07e6413..f2c6211fe1 100644
--- a/configs/mx31pdk_defconfig
+++ b/configs/mx31pdk_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXC_GPIO=y
 # CONFIG_MMC is not set
 CONFIG_NAND=y
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index 3d73734609..b4156b8ed3 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -33,6 +33,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index 516aac1f14..e02041187a 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -58,6 +58,7 @@ CONFIG_MULTI_DTB_FIT=y
 CONFIG_SPL_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_SF=y
 CONFIG_DM_GPIO=y
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index 2c88fe67c2..e36c5826ed 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -66,6 +66,7 @@ CONFIG_SPL_OF_LIST="imx6dl-sabresd imx6q-sabresd imx6qp-sabresd"
 CONFIG_SPL_MULTI_DTB_FIT_NO_COMPRESSION=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0x12000000
 CONFIG_FASTBOOT_BUF_SIZE=0x10000000
diff --git a/configs/mx6slevk_spl_defconfig b/configs/mx6slevk_spl_defconfig
index 9b3f2252de..c2273c09e9 100644
--- a/configs/mx6slevk_spl_defconfig
+++ b/configs/mx6slevk_spl_defconfig
@@ -39,6 +39,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6sl-evk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
diff --git a/configs/mx6sxsabresd_spl_defconfig b/configs/mx6sxsabresd_spl_defconfig
index 82093af750..c9f2e5c315 100644
--- a/configs/mx6sxsabresd_spl_defconfig
+++ b/configs/mx6sxsabresd_spl_defconfig
@@ -44,6 +44,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6sx-sdb"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
 CONFIG_DM_MMC=y
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index c848c530a8..f5813388b7 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -41,6 +41,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-14x14-evk"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
 CONFIG_DM_MMC=y
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index 274fec0e58..5c5006eaa0 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -41,6 +41,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-9x9-evk"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
 CONFIG_DM_MMC=y
diff --git a/configs/nanopc-t4-rk3399_defconfig b/configs/nanopc-t4-rk3399_defconfig
index 1d4c8f8a02..c02f6929e1 100644
--- a/configs/nanopc-t4-rk3399_defconfig
+++ b/configs/nanopc-t4-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-nanopc-t4"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/nanopi-m4-rk3399_defconfig b/configs/nanopi-m4-rk3399_defconfig
index 7375b758a2..8a2149a326 100644
--- a/configs/nanopi-m4-rk3399_defconfig
+++ b/configs/nanopi-m4-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-nanopi-m4"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/nanopi-neo4-rk3399_defconfig b/configs/nanopi-neo4-rk3399_defconfig
index 874ee5efb6..b590f0b3e9 100644
--- a/configs/nanopi-neo4-rk3399_defconfig
+++ b/configs/nanopi-neo4-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-nanopi-neo4"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/nanopi_a64_defconfig b/configs/nanopi_a64_defconfig
index 95a9c965f7..dc7c4305ba 100644
--- a/configs/nanopi_a64_defconfig
+++ b/configs/nanopi_a64_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-nanopi-a64"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 7568fb1b4b..dcef11b4e1 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-m1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index a359de8069..a21c21f43d 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-m1-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo2_defconfig b/configs/nanopi_neo2_defconfig
index cfda325442..1a21d86644 100644
--- a/configs/nanopi_neo2_defconfig
+++ b/configs/nanopi_neo2_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-nanopi-neo2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_air_defconfig b/configs/nanopi_neo_air_defconfig
index 246658b699..f4d2d59e38 100644
--- a/configs/nanopi_neo_air_defconfig
+++ b/configs/nanopi_neo_air_defconfig
@@ -12,6 +12,7 @@ CONFIG_CONSOLE_MUX=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-neo-air"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index fba6ff516d..8e4481da81 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -12,6 +12,7 @@ CONFIG_CONSOLE_MUX=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-neo"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_plus2_defconfig b/configs/nanopi_neo_plus2_defconfig
index 5f78a8b63a..e3dba8f850 100644
--- a/configs/nanopi_neo_plus2_defconfig
+++ b/configs/nanopi_neo_plus2_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-nanopi-neo-plus2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/novena_defconfig b/configs/novena_defconfig
index c928b258b1..81dde8a3c2 100644
--- a/configs/novena_defconfig
+++ b/configs/novena_defconfig
@@ -45,6 +45,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-novena"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_DM_GPIO=y
diff --git a/configs/nyan-big_defconfig b/configs/nyan-big_defconfig
index ac7b505dc7..ee35cee891 100644
--- a/configs/nyan-big_defconfig
+++ b/configs/nyan-big_defconfig
@@ -45,6 +45,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="tegra124-nyan-big"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
index 854ada3ee2..a5257688c1 100644
--- a/configs/oceanic_5205_5inmfd_defconfig
+++ b/configs/oceanic_5205_5inmfd_defconfig
@@ -16,6 +16,7 @@ CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-oceanic-5205-5inmfd"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/omap35_logic_defconfig b/configs/omap35_logic_defconfig
index bd1b1605c0..7148678e82 100644
--- a/configs/omap35_logic_defconfig
+++ b/configs/omap35_logic_defconfig
@@ -42,6 +42,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="logicpd-torpedo-35xx-devkit"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_DM_I2C=y
diff --git a/configs/omap35_logic_somlv_defconfig b/configs/omap35_logic_somlv_defconfig
index 8ed962c255..5caa45edd8 100644
--- a/configs/omap35_logic_somlv_defconfig
+++ b/configs/omap35_logic_somlv_defconfig
@@ -42,6 +42,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="logicpd-som-lv-35xx-devkit"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_I2C=y
 CONFIG_DM_MMC=y
diff --git a/configs/omap3_beagle_defconfig b/configs/omap3_beagle_defconfig
index 44bfd5e0d4..24c9f52451 100644
--- a/configs/omap3_beagle_defconfig
+++ b/configs/omap3_beagle_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="omap3-beagle"
 CONFIG_OF_SPL_REMOVE_PROPS="clocks clock-names interrupt-parent"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_SPL_OF_TRANSLATE=y
diff --git a/configs/omap3_evm_defconfig b/configs/omap3_evm_defconfig
index 9763b6aca1..8f58a702cf 100644
--- a/configs/omap3_evm_defconfig
+++ b/configs/omap3_evm_defconfig
@@ -45,6 +45,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="omap3-evm"
 CONFIG_OF_SPL_REMOVE_PROPS="clocks clock-names interrupt-parent"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_SPL_OF_TRANSLATE=y
diff --git a/configs/omap3_ha_defconfig b/configs/omap3_ha_defconfig
index 49229ec1f7..37bc447b6c 100644
--- a/configs/omap3_ha_defconfig
+++ b/configs/omap3_ha_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:512k(x-loader),1920k(u-boot),128k(u-boot-env),4m(kernel),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_TWL4030_LED=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
diff --git a/configs/omap3_logic_defconfig b/configs/omap3_logic_defconfig
index 278ce2c2a3..266e043c06 100644
--- a/configs/omap3_logic_defconfig
+++ b/configs/omap3_logic_defconfig
@@ -41,6 +41,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="logicpd-torpedo-37xx-devkit"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_I2C=y
 CONFIG_DM_MMC=y
diff --git a/configs/omap3_logic_somlv_defconfig b/configs/omap3_logic_somlv_defconfig
index d93ec395d0..39d474b197 100644
--- a/configs/omap3_logic_somlv_defconfig
+++ b/configs/omap3_logic_somlv_defconfig
@@ -42,6 +42,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="logicpd-som-lv-37xx-devkit"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_I2C=y
 CONFIG_DM_MMC=y
diff --git a/configs/omap3_overo_defconfig b/configs/omap3_overo_defconfig
index 59867914cb..913ace5067 100644
--- a/configs/omap3_overo_defconfig
+++ b/configs/omap3_overo_defconfig
@@ -34,6 +34,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=omap2-nand.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=omap2-nand.0:512k(xloader),1792k(u-boot),256k(environ),8m(linux),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_TWL4030_LED=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
diff --git a/configs/omap4_panda_defconfig b/configs/omap4_panda_defconfig
index 806b7a5241..c7e4127f9c 100644
--- a/configs/omap4_panda_defconfig
+++ b/configs/omap4_panda_defconfig
@@ -28,6 +28,7 @@ CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_INTERFACE="mmc"
 CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_CONS_INDEX=3
 CONFIG_SYS_NS16550=y
diff --git a/configs/omap4_sdp4430_defconfig b/configs/omap4_sdp4430_defconfig
index 7f251acd94..f065b05166 100644
--- a/configs/omap4_sdp4430_defconfig
+++ b/configs/omap4_sdp4430_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_SPL_PARTITION_UUIDS=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_CONS_INDEX=3
 CONFIG_SYS_NS16550=y
diff --git a/configs/omapl138_lcdk_defconfig b/configs/omapl138_lcdk_defconfig
index d2342c37cf..4299425be8 100644
--- a/configs/omapl138_lcdk_defconfig
+++ b/configs/omapl138_lcdk_defconfig
@@ -37,6 +37,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="da850-lcdk"
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index 1b68b8e12f..0e42e555bf 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -25,7 +25,6 @@ CONFIG_VERSION_VARIABLE=y
 CONFIG_BOUNCE_BUFFER=y
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_SPL_BOARD_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
 CONFIG_SPL_YMODEM_SUPPORT=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/orangepi-rk3399_defconfig b/configs/orangepi-rk3399_defconfig
index 7b02c59f08..df3ffe6e0f 100644
--- a/configs/orangepi-rk3399_defconfig
+++ b/configs/orangepi-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-orangepi"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/orangepi_2_defconfig b/configs/orangepi_2_defconfig
index 664b4b3541..fc0d322928 100644
--- a/configs/orangepi_2_defconfig
+++ b/configs/orangepi_2_defconfig
@@ -13,6 +13,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SY8106A_POWER=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 0d6101fc68..b4700347f2 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -12,5 +12,6 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-orangepi-lite2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 5638c4a3a6..dc1a9108d8 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-lite"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 4fe81f8ab9..a2a3cb2747 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -10,6 +10,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-one"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_one_plus_defconfig b/configs/orangepi_one_plus_defconfig
index 890e6abd45..dac981d9dd 100644
--- a/configs/orangepi_one_plus_defconfig
+++ b/configs/orangepi_one_plus_defconfig
@@ -12,5 +12,6 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-orangepi-one-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index ba0f2d562b..a76de44b4d 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -15,6 +15,7 @@ CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-orangepi-pc2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 6ac46649c9..4205d8904d 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -11,6 +11,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-pc"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SY8106A_POWER=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 685b577a31..8d10c6133b 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -12,6 +12,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-pc-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SY8106A_POWER=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_plus2e_defconfig b/configs/orangepi_plus2e_defconfig
index 79da5ce235..66fa98ca7d 100644
--- a/configs/orangepi_plus2e_defconfig
+++ b/configs/orangepi_plus2e_defconfig
@@ -13,6 +13,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-plus2e"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SY8106A_POWER=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index 808f937b1d..7899f559ec 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -15,6 +15,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-orangepi-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SY8106A_POWER=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
index d7b80040de..89efc9a555 100644
--- a/configs/orangepi_prime_defconfig
+++ b/configs/orangepi_prime_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-orangepi-prime"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index e0a530d4b8..4f8b376fc5 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -12,6 +12,7 @@ CONFIG_CONSOLE_MUX=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_CMD_FLASH is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h2-plus-orangepi-r1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
index 28395031b7..dd9626d914 100644
--- a/configs/orangepi_win_defconfig
+++ b/configs/orangepi_win_defconfig
@@ -12,6 +12,7 @@ CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-orangepi-win"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index f8dda05c08..fc14e83e75 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -12,6 +12,7 @@ CONFIG_CONSOLE_MUX=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_CMD_FLASH is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-h2-plus-orangepi-zero"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 7cfb39dcdf..80e8d67e77 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-orangepi-zero-plus2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index c63b70f20c..de66cc21df 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h5-orangepi-zero-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/origen_defconfig b/configs/origen_defconfig
index d9e9931e91..b442d4ea7c 100644
--- a/configs/origen_defconfig
+++ b/configs/origen_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="exynos4210-origen"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/ot1200_spl_defconfig b/configs/ot1200_spl_defconfig
index 35bbbfd314..f0271b9d4e 100644
--- a/configs/ot1200_spl_defconfig
+++ b/configs/ot1200_spl_defconfig
@@ -40,6 +40,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_CMD_PCA953X=y
diff --git a/configs/parrot_r16_defconfig b/configs/parrot_r16_defconfig
index d0ef1b6fa5..91eb78bf70 100644
--- a/configs/parrot_r16_defconfig
+++ b/configs/parrot_r16_defconfig
@@ -17,6 +17,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-r16-parrot"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/paz00_defconfig b/configs/paz00_defconfig
index 3b0ca3bc2d..3dc489e1f5 100644
--- a/configs/paz00_defconfig
+++ b/configs/paz00_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-paz00"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_PMIC=y
 CONFIG_DM_REGULATOR=y
diff --git a/configs/pcm051_rev1_defconfig b/configs/pcm051_rev1_defconfig
index 17433768f7..845c7166ac 100644
--- a/configs/pcm051_rev1_defconfig
+++ b/configs/pcm051_rev1_defconfig
@@ -17,7 +17,6 @@ CONFIG_SYS_EXTRA_OPTIONS="REV1"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
 CONFIG_ARCH_MISC_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_ETH_SUPPORT=y
 CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C_SUPPORT=y
diff --git a/configs/pcm051_rev3_defconfig b/configs/pcm051_rev3_defconfig
index d85e3fc8de..65c7aa689e 100644
--- a/configs/pcm051_rev3_defconfig
+++ b/configs/pcm051_rev3_defconfig
@@ -17,7 +17,6 @@ CONFIG_SYS_EXTRA_OPTIONS="REV3"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
 CONFIG_ARCH_MISC_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_ETH_SUPPORT=y
 CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C_SUPPORT=y
diff --git a/configs/pcm058_defconfig b/configs/pcm058_defconfig
index 3a2b35f461..5d40bbcc8b 100644
--- a/configs/pcm058_defconfig
+++ b/configs/pcm058_defconfig
@@ -43,6 +43,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_FSL_USDHC=y
 CONFIG_MTD=y
diff --git a/configs/peach-pi_defconfig b/configs/peach-pi_defconfig
index a4848d5c7b..4b88d37b1c 100644
--- a/configs/peach-pi_defconfig
+++ b/configs/peach-pi_defconfig
@@ -33,6 +33,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos5800-peach-pi"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=1
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=y
diff --git a/configs/peach-pit_defconfig b/configs/peach-pit_defconfig
index e3bca5f61a..6a59332bb7 100644
--- a/configs/peach-pit_defconfig
+++ b/configs/peach-pit_defconfig
@@ -32,6 +32,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos5420-peach-pit"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=1
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=y
diff --git a/configs/pengwyn_defconfig b/configs/pengwyn_defconfig
index bd7d0a6d8b..89f2cb08e6 100644
--- a/configs/pengwyn_defconfig
+++ b/configs/pengwyn_defconfig
@@ -17,7 +17,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
 CONFIG_ARCH_MISC_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_ETH_SUPPORT=y
 CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C_SUPPORT=y
diff --git a/configs/phycore-am335x-r2-wega_defconfig b/configs/phycore-am335x-r2-wega_defconfig
index 43acb55c41..801dcde255 100644
--- a/configs/phycore-am335x-r2-wega_defconfig
+++ b/configs/phycore-am335x-r2-wega_defconfig
@@ -52,6 +52,7 @@ CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_FAT_INTERFACE="mmc"
 CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DM_I2C=y
diff --git a/configs/phycore-rk3288_defconfig b/configs/phycore-rk3288_defconfig
index 7cfbd50c1e..2a149b645f 100644
--- a/configs/phycore-rk3288_defconfig
+++ b/configs/phycore-rk3288_defconfig
@@ -41,6 +41,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-phycore-rdk"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/pico-hobbit-imx6ul_defconfig b/configs/pico-hobbit-imx6ul_defconfig
index 7395598599..9948617754 100644
--- a/configs/pico-hobbit-imx6ul_defconfig
+++ b/configs/pico-hobbit-imx6ul_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-pico-hobbit"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_SIZE=0x10000000
diff --git a/configs/pico-hobbit-imx7d_defconfig b/configs/pico-hobbit-imx7d_defconfig
index 3869eb70cc..3441346a52 100644
--- a/configs/pico-hobbit-imx7d_defconfig
+++ b/configs/pico-hobbit-imx7d_defconfig
@@ -42,6 +42,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx7d-pico-hobbit"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0x82000000
diff --git a/configs/pico-imx6ul_defconfig b/configs/pico-imx6ul_defconfig
index ad29af1b71..7d6e0913d0 100644
--- a/configs/pico-imx6ul_defconfig
+++ b/configs/pico-imx6ul_defconfig
@@ -38,6 +38,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-pico-hobbit"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_SIZE=0x10000000
diff --git a/configs/pico-imx7d_bl33_defconfig b/configs/pico-imx7d_bl33_defconfig
index a2cddfcf4f..ccf7a4618b 100644
--- a/configs/pico-imx7d_bl33_defconfig
+++ b/configs/pico-imx7d_bl33_defconfig
@@ -39,6 +39,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx7d-pico-pi"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
diff --git a/configs/pico-imx7d_defconfig b/configs/pico-imx7d_defconfig
index 3d45872a84..261862f7e8 100644
--- a/configs/pico-imx7d_defconfig
+++ b/configs/pico-imx7d_defconfig
@@ -42,6 +42,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx7d-pico-pi"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0x82000000
diff --git a/configs/pico-pi-imx6ul_defconfig b/configs/pico-pi-imx6ul_defconfig
index 1a8a4541c6..5558ebd689 100644
--- a/configs/pico-pi-imx6ul_defconfig
+++ b/configs/pico-pi-imx6ul_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-pico-pi"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_SIZE=0x10000000
diff --git a/configs/pico-pi-imx7d_defconfig b/configs/pico-pi-imx7d_defconfig
index b864b537c3..d9c3366a52 100644
--- a/configs/pico-pi-imx7d_defconfig
+++ b/configs/pico-pi-imx7d_defconfig
@@ -42,6 +42,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx7d-pico-pi"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0x82000000
diff --git a/configs/picosam9g45_defconfig b/configs/picosam9g45_defconfig
index abae023915..1bda5d2511 100644
--- a/configs/picosam9g45_defconfig
+++ b/configs/picosam9g45_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_USB=y
diff --git a/configs/pine64-lts_defconfig b/configs/pine64-lts_defconfig
index 283c1dcdf3..9ffb7f1952 100644
--- a/configs/pine64-lts_defconfig
+++ b/configs/pine64-lts_defconfig
@@ -16,6 +16,7 @@ CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-pine64-lts"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
index a7ea1bcc89..d83685002f 100644
--- a/configs/pine64_plus_defconfig
+++ b/configs/pine64_plus_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-pine64-plus"
 CONFIG_OF_LIST="sun50i-a64-pine64 sun50i-a64-pine64-plus"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_PHY_REALTEK=y
 CONFIG_RTL8211E_PINE64_GIGABIT_FIX=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pine_h64_defconfig b/configs/pine_h64_defconfig
index c840ca0a18..a5bd59fd29 100644
--- a/configs/pine_h64_defconfig
+++ b/configs/pine_h64_defconfig
@@ -14,5 +14,6 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-pine-h64"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/pinebook_defconfig b/configs/pinebook_defconfig
index 1ed907df7a..c2049e41de 100644
--- a/configs/pinebook_defconfig
+++ b/configs/pinebook_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-pinebook"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_PWM=y
diff --git a/configs/platinum_picon_defconfig b/configs/platinum_picon_defconfig
index 886ddacba2..2a1b034e70 100644
--- a/configs/platinum_picon_defconfig
+++ b/configs/platinum_picon_defconfig
@@ -48,6 +48,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=gpmi-nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:14M(spl),2M(uboot),512k(env1),512k(env2),495M(ubi0),14M(res0),2M(res1),512k(res2),512k(res3),-(ubi1)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
 CONFIG_NAND_MXS=y
diff --git a/configs/platinum_titanium_defconfig b/configs/platinum_titanium_defconfig
index 2367a17dd1..6e17d35ddd 100644
--- a/configs/platinum_titanium_defconfig
+++ b/configs/platinum_titanium_defconfig
@@ -48,6 +48,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=gpmi-nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:14M(spl),2M(uboot),512k(env1),512k(env2),-(ubi)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
 CONFIG_NAND_MXS=y
diff --git a/configs/plutux_defconfig b/configs/plutux_defconfig
index 8ac0d40d61..f74285e6e1 100644
--- a/configs/plutux_defconfig
+++ b/configs/plutux_defconfig
@@ -23,6 +23,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-plutux"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SYS_NS16550=y
 CONFIG_USB=y
diff --git a/configs/polaroid_mid2407pxe03_defconfig b/configs/polaroid_mid2407pxe03_defconfig
index 012e1f2434..bc714e457c 100644
--- a/configs/polaroid_mid2407pxe03_defconfig
+++ b/configs/polaroid_mid2407pxe03_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a23-polaroid-mid2407pxe03"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/polaroid_mid2809pxe04_defconfig b/configs/polaroid_mid2809pxe04_defconfig
index 3564ddc9a1..216fc9d88f 100644
--- a/configs/polaroid_mid2809pxe04_defconfig
+++ b/configs/polaroid_mid2809pxe04_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a23-polaroid-mid2809pxe04"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/popmetal-rk3288_defconfig b/configs/popmetal-rk3288_defconfig
index efa20d0800..bc4e4d5fa2 100644
--- a/configs/popmetal-rk3288_defconfig
+++ b/configs/popmetal-rk3288_defconfig
@@ -39,6 +39,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-popmetal"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/porter_defconfig b/configs/porter_defconfig
index 8c802b0d19..4806cbadba 100644
--- a/configs/porter_defconfig
+++ b/configs/porter_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7791-porter-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/pov_protab2_ips9_defconfig b/configs/pov_protab2_ips9_defconfig
index 0b6bf6dfd8..6f382bc102 100644
--- a/configs/pov_protab2_ips9_defconfig
+++ b/configs/pov_protab2_ips9_defconfig
@@ -20,5 +20,6 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-pov-protab2-ips9"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/puma-rk3399_defconfig b/configs/puma-rk3399_defconfig
index faf95c5505..546af40cd1 100644
--- a/configs/puma-rk3399_defconfig
+++ b/configs/puma-rk3399_defconfig
@@ -44,6 +44,7 @@ CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-puma-ddr1600"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MISC=y
diff --git a/configs/pxm2_defconfig b/configs/pxm2_defconfig
index 201b9c9357..9056a8e1e7 100644
--- a/configs/pxm2_defconfig
+++ b/configs/pxm2_defconfig
@@ -61,6 +61,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-pxm50"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/q8_a13_tablet_defconfig b/configs/q8_a13_tablet_defconfig
index 4933e6f861..5fced244d3 100644
--- a/configs/q8_a13_tablet_defconfig
+++ b/configs/q8_a13_tablet_defconfig
@@ -21,6 +21,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-q8-tablet"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_MUSB_HOST=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/q8_a23_tablet_800x480_defconfig b/configs/q8_a23_tablet_800x480_defconfig
index 59683190cc..c0b0013edf 100644
--- a/configs/q8_a23_tablet_800x480_defconfig
+++ b/configs/q8_a23_tablet_800x480_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a23-q8-tablet"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/q8_a33_tablet_1024x600_defconfig b/configs/q8_a33_tablet_1024x600_defconfig
index 05a82c41f8..cbce8e7666 100644
--- a/configs/q8_a33_tablet_1024x600_defconfig
+++ b/configs/q8_a33_tablet_1024x600_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a33-q8-tablet"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/q8_a33_tablet_800x480_defconfig b/configs/q8_a33_tablet_800x480_defconfig
index 94a680ce8b..7558fcea7a 100644
--- a/configs/q8_a33_tablet_800x480_defconfig
+++ b/configs/q8_a33_tablet_800x480_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a33-q8-tablet"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/qemu-riscv32_smode_defconfig b/configs/qemu-riscv32_smode_defconfig
index 7103324421..c1c3434131 100644
--- a/configs/qemu-riscv32_smode_defconfig
+++ b/configs/qemu-riscv32_smode_defconfig
@@ -9,3 +9,4 @@ CONFIG_DISPLAY_BOARDINFO=y
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 # CONFIG_CMD_MII is not set
 CONFIG_OF_PRIOR_STAGE=y
+CONFIG_SPL_ENV_IS_IN_NAND=y
diff --git a/configs/qemu-x86_64_defconfig b/configs/qemu-x86_64_defconfig
index e735ba8675..0709372e6b 100644
--- a/configs/qemu-x86_64_defconfig
+++ b/configs/qemu-x86_64_defconfig
@@ -27,7 +27,6 @@ CONFIG_LAST_STAGE_INIT=y
 CONFIG_SPL_TEXT_BASE=0xfffd0000
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_CPU_SUPPORT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_NET_SUPPORT=y
 CONFIG_SPL_PCI=y
 CONFIG_SPL_PCH_SUPPORT=y
diff --git a/configs/r7-tv-dongle_defconfig b/configs/r7-tv-dongle_defconfig
index b7d738526d..1aa2901410 100644
--- a/configs/r7-tv-dongle_defconfig
+++ b/configs/r7-tv-dongle_defconfig
@@ -12,6 +12,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-r7-tv-dongle"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_AXP152_POWER=y
 CONFIG_CONS_INDEX=2
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/r8a7795_salvator-x_defconfig b/configs/r8a7795_salvator-x_defconfig
index a33338a69f..2158902521 100644
--- a/configs/r8a7795_salvator-x_defconfig
+++ b/configs/r8a7795_salvator-x_defconfig
@@ -34,6 +34,7 @@ CONFIG_OF_LIST="r8a7795-salvator-x-u-boot r8a7796-salvator-x-u-boot r8a77965-sal
 CONFIG_MULTI_DTB_FIT_LZO=y
 CONFIG_MULTI_DTB_FIT_USER_DEFINED_AREA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a7795_ulcb_defconfig b/configs/r8a7795_ulcb_defconfig
index 5fa760c057..6be1c6f7ca 100644
--- a/configs/r8a7795_ulcb_defconfig
+++ b/configs/r8a7795_ulcb_defconfig
@@ -34,6 +34,7 @@ CONFIG_OF_LIST="r8a7795-h3ulcb-u-boot r8a7796-m3ulcb-u-boot r8a77965-m3nulcb-u-b
 CONFIG_MULTI_DTB_FIT_LZO=y
 CONFIG_MULTI_DTB_FIT_USER_DEFINED_AREA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a77965_salvator-x_defconfig b/configs/r8a77965_salvator-x_defconfig
index 14a10f0865..7e7c044eff 100644
--- a/configs/r8a77965_salvator-x_defconfig
+++ b/configs/r8a77965_salvator-x_defconfig
@@ -35,6 +35,7 @@ CONFIG_OF_LIST="r8a7795-salvator-x-u-boot r8a7796-salvator-x-u-boot r8a77965-sal
 CONFIG_MULTI_DTB_FIT_LZO=y
 CONFIG_MULTI_DTB_FIT_USER_DEFINED_AREA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a77965_ulcb_defconfig b/configs/r8a77965_ulcb_defconfig
index d9b83c5abd..ff89be16ae 100644
--- a/configs/r8a77965_ulcb_defconfig
+++ b/configs/r8a77965_ulcb_defconfig
@@ -34,6 +34,7 @@ CONFIG_OF_LIST="r8a7795-h3ulcb-u-boot r8a7796-m3ulcb-u-boot r8a77965-m3nulcb-u-b
 CONFIG_MULTI_DTB_FIT_LZO=y
 CONFIG_MULTI_DTB_FIT_USER_DEFINED_AREA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a7796_salvator-x_defconfig b/configs/r8a7796_salvator-x_defconfig
index d909aeb2b9..5aeb5feb45 100644
--- a/configs/r8a7796_salvator-x_defconfig
+++ b/configs/r8a7796_salvator-x_defconfig
@@ -35,6 +35,7 @@ CONFIG_OF_LIST="r8a7795-salvator-x-u-boot r8a7796-salvator-x-u-boot r8a77965-sal
 CONFIG_MULTI_DTB_FIT_LZO=y
 CONFIG_MULTI_DTB_FIT_USER_DEFINED_AREA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a7796_ulcb_defconfig b/configs/r8a7796_ulcb_defconfig
index 54495394ef..af063405b2 100644
--- a/configs/r8a7796_ulcb_defconfig
+++ b/configs/r8a7796_ulcb_defconfig
@@ -34,6 +34,7 @@ CONFIG_OF_LIST="r8a7795-h3ulcb-u-boot r8a7796-m3ulcb-u-boot r8a77965-m3nulcb-u-b
 CONFIG_MULTI_DTB_FIT_LZO=y
 CONFIG_MULTI_DTB_FIT_USER_DEFINED_AREA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a77970_eagle_defconfig b/configs/r8a77970_eagle_defconfig
index 6a5de19b22..80b85ba1b0 100644
--- a/configs/r8a77970_eagle_defconfig
+++ b/configs/r8a77970_eagle_defconfig
@@ -32,6 +32,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a77970-eagle-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_BLK=y
diff --git a/configs/r8a77980_condor_defconfig b/configs/r8a77980_condor_defconfig
index f3c7948328..de0ee38631 100644
--- a/configs/r8a77980_condor_defconfig
+++ b/configs/r8a77980_condor_defconfig
@@ -32,6 +32,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a77980-condor-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_BLK=y
diff --git a/configs/r8a77990_ebisu_defconfig b/configs/r8a77990_ebisu_defconfig
index 7fd513483c..8b063d54ee 100644
--- a/configs/r8a77990_ebisu_defconfig
+++ b/configs/r8a77990_ebisu_defconfig
@@ -31,6 +31,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a77990-ebisu-u-boot"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/r8a77995_draak_defconfig b/configs/r8a77995_draak_defconfig
index 8e54013560..7de184020c 100644
--- a/configs/r8a77995_draak_defconfig
+++ b/configs/r8a77995_draak_defconfig
@@ -31,6 +31,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a77995-draak-u-boot"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 CONFIG_CLK=y
diff --git a/configs/rastaban_defconfig b/configs/rastaban_defconfig
index 452e761412..6751b17cec 100644
--- a/configs/rastaban_defconfig
+++ b/configs/rastaban_defconfig
@@ -59,6 +59,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/riotboard_spl_defconfig b/configs/riotboard_spl_defconfig
index cf3647a8f1..8e80fc1693 100644
--- a/configs/riotboard_spl_defconfig
+++ b/configs/riotboard_spl_defconfig
@@ -30,6 +30,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/roc-rk3399-pc_defconfig b/configs/roc-rk3399-pc_defconfig
index 28b18333d7..73324d762c 100644
--- a/configs/roc-rk3399-pc_defconfig
+++ b/configs/roc-rk3399-pc_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-roc-pc"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/rock-pi-4-rk3399_defconfig b/configs/rock-pi-4-rk3399_defconfig
index 554945dd19..9259278bbf 100644
--- a/configs/rock-pi-4-rk3399_defconfig
+++ b/configs/rock-pi-4-rk3399_defconfig
@@ -27,6 +27,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-rock-pi-4"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/rock2_defconfig b/configs/rock2_defconfig
index 9d5f3b59e8..3477cb015d 100644
--- a/configs/rock2_defconfig
+++ b/configs/rock2_defconfig
@@ -38,6 +38,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-rock2-square"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
diff --git a/configs/rock64-rk3328_defconfig b/configs/rock64-rk3328_defconfig
index 3ab0af1158..68960e9aeb 100644
--- a/configs/rock64-rk3328_defconfig
+++ b/configs/rock64-rk3328_defconfig
@@ -39,6 +39,8 @@ CONFIG_DEFAULT_DEVICE_TREE="rk3328-rock64"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_TPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_TPL_DM=y
 CONFIG_REGMAP=y
diff --git a/configs/rock960-rk3399_defconfig b/configs/rock960-rk3399_defconfig
index abcc53fc8e..6aa8d17dbf 100644
--- a/configs/rock960-rk3399_defconfig
+++ b/configs/rock960-rk3399_defconfig
@@ -28,6 +28,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-rock960"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/rock_defconfig b/configs/rock_defconfig
index d5a57d6544..a76983229d 100644
--- a/configs/rock_defconfig
+++ b/configs/rock_defconfig
@@ -32,6 +32,7 @@ CONFIG_DEFAULT_DEVICE_TREE="rk3188-radxarock"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
 # CONFIG_SPL_SIMPLE_BUS is not set
diff --git a/configs/rockpro64-rk3399_defconfig b/configs/rockpro64-rk3399_defconfig
index 40ebad5abb..194b00fcdb 100644
--- a/configs/rockpro64-rk3399_defconfig
+++ b/configs/rockpro64-rk3399_defconfig
@@ -26,6 +26,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3399-rockpro64"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_ROCKCHIP_GPIO=y
 CONFIG_SYS_I2C_ROCKCHIP=y
 CONFIG_MMC_DW=y
diff --git a/configs/rut_defconfig b/configs/rut_defconfig
index ec31d52377..c3cb51fe65 100644
--- a/configs/rut_defconfig
+++ b/configs/rut_defconfig
@@ -62,6 +62,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-rut"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/sama5d27_som1_ek_mmc1_defconfig b/configs/sama5d27_som1_ek_mmc1_defconfig
index 29d364ce17..7e9b7b9bc8 100644
--- a/configs/sama5d27_som1_ek_mmc1_defconfig
+++ b/configs/sama5d27_som1_ek_mmc1_defconfig
@@ -47,6 +47,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d27_som1_ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_DEVICE_AND_PART="1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d27_som1_ek_mmc_defconfig b/configs/sama5d27_som1_ek_mmc_defconfig
index bb74c63993..14a84d77fc 100644
--- a/configs/sama5d27_som1_ek_mmc_defconfig
+++ b/configs/sama5d27_som1_ek_mmc_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d27_som1_ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d27_som1_ek_qspiflash_defconfig b/configs/sama5d27_som1_ek_qspiflash_defconfig
index 50b7983850..8ae919f85d 100644
--- a/configs/sama5d27_som1_ek_qspiflash_defconfig
+++ b/configs/sama5d27_som1_ek_qspiflash_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d27_som1_ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d2_icp_mmc_defconfig b/configs/sama5d2_icp_mmc_defconfig
index 535aab5a12..99794e7263 100644
--- a/configs/sama5d2_icp_mmc_defconfig
+++ b/configs/sama5d2_icp_mmc_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d2_icp"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d2_xplained_emmc_defconfig b/configs/sama5d2_xplained_emmc_defconfig
index 92d7c5e9cf..10e2a81c8c 100644
--- a/configs/sama5d2_xplained_emmc_defconfig
+++ b/configs/sama5d2_xplained_emmc_defconfig
@@ -46,6 +46,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d2_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d2_xplained_mmc_defconfig b/configs/sama5d2_xplained_mmc_defconfig
index 43990336fa..796aab6998 100644
--- a/configs/sama5d2_xplained_mmc_defconfig
+++ b/configs/sama5d2_xplained_mmc_defconfig
@@ -48,6 +48,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d2_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_FAT_DEVICE_AND_PART="1:1"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d2_xplained_qspiflash_defconfig b/configs/sama5d2_xplained_qspiflash_defconfig
index f24dac6c4f..1176f38cea 100644
--- a/configs/sama5d2_xplained_qspiflash_defconfig
+++ b/configs/sama5d2_xplained_qspiflash_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d2_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d2_xplained_spiflash_defconfig b/configs/sama5d2_xplained_spiflash_defconfig
index 6958621cdf..59bcb348e6 100644
--- a/configs/sama5d2_xplained_spiflash_defconfig
+++ b/configs/sama5d2_xplained_spiflash_defconfig
@@ -48,6 +48,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d2_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d3_xplained_mmc_defconfig b/configs/sama5d3_xplained_mmc_defconfig
index ebd3a402ac..3b17658b8e 100644
--- a/configs/sama5d3_xplained_mmc_defconfig
+++ b/configs/sama5d3_xplained_mmc_defconfig
@@ -50,6 +50,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d3_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d3_xplained_nandflash_defconfig b/configs/sama5d3_xplained_nandflash_defconfig
index 2ebba96c23..1ba71293d5 100644
--- a/configs/sama5d3_xplained_nandflash_defconfig
+++ b/configs/sama5d3_xplained_nandflash_defconfig
@@ -45,6 +45,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d3_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d3xek_mmc_defconfig b/configs/sama5d3xek_mmc_defconfig
index 86b375f7cc..9b009cec0f 100644
--- a/configs/sama5d3xek_mmc_defconfig
+++ b/configs/sama5d3xek_mmc_defconfig
@@ -52,6 +52,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sama5d36ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d3xek_nandflash_defconfig b/configs/sama5d3xek_nandflash_defconfig
index 120461add3..1d482d3803 100644
--- a/configs/sama5d3xek_nandflash_defconfig
+++ b/configs/sama5d3xek_nandflash_defconfig
@@ -46,6 +46,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sama5d36ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d3xek_spiflash_defconfig b/configs/sama5d3xek_spiflash_defconfig
index b27a288b4a..1a44777119 100644
--- a/configs/sama5d3xek_spiflash_defconfig
+++ b/configs/sama5d3xek_spiflash_defconfig
@@ -50,6 +50,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sama5d36ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d4_xplained_mmc_defconfig b/configs/sama5d4_xplained_mmc_defconfig
index f9d7389613..a32e9219fb 100644
--- a/configs/sama5d4_xplained_mmc_defconfig
+++ b/configs/sama5d4_xplained_mmc_defconfig
@@ -45,6 +45,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_CLK=y
diff --git a/configs/sama5d4_xplained_nandflash_defconfig b/configs/sama5d4_xplained_nandflash_defconfig
index d25cd615d6..5e64c0f1fd 100644
--- a/configs/sama5d4_xplained_nandflash_defconfig
+++ b/configs/sama5d4_xplained_nandflash_defconfig
@@ -41,6 +41,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_CLK=y
diff --git a/configs/sama5d4_xplained_spiflash_defconfig b/configs/sama5d4_xplained_spiflash_defconfig
index a2e9595088..84a62f4c61 100644
--- a/configs/sama5d4_xplained_spiflash_defconfig
+++ b/configs/sama5d4_xplained_spiflash_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d4ek_mmc_defconfig b/configs/sama5d4ek_mmc_defconfig
index 711de5572a..31f9bfac6c 100644
--- a/configs/sama5d4ek_mmc_defconfig
+++ b/configs/sama5d4ek_mmc_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d4ek_nandflash_defconfig b/configs/sama5d4ek_nandflash_defconfig
index 7b1f44c451..86f8d67d2e 100644
--- a/configs/sama5d4ek_nandflash_defconfig
+++ b/configs/sama5d4ek_nandflash_defconfig
@@ -43,6 +43,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sama5d4ek_spiflash_defconfig b/configs/sama5d4ek_spiflash_defconfig
index aa1a492997..f726fb936e 100644
--- a/configs/sama5d4ek_spiflash_defconfig
+++ b/configs/sama5d4ek_spiflash_defconfig
@@ -47,6 +47,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 0b3391a2a6..b82a39f73c 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -23,7 +23,6 @@ CONFIG_SILENT_CONSOLE=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_HANDOFF=y
 CONFIG_SPL_BOARD_INIT=y
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_CMD_CPU=y
 CONFIG_CMD_LICENSE=y
 CONFIG_CMD_BOOTZ=y
diff --git a/configs/sc_sps_1_defconfig b/configs/sc_sps_1_defconfig
index e3fd8be605..40afb1e810 100644
--- a/configs/sc_sps_1_defconfig
+++ b/configs/sc_sps_1_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
 CONFIG_PHYLIB=y
diff --git a/configs/seaboard_defconfig b/configs/seaboard_defconfig
index efc8586e8b..a1bb250a13 100644
--- a/configs/seaboard_defconfig
+++ b/configs/seaboard_defconfig
@@ -25,6 +25,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-seaboard"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SYS_I2C_TEGRA=y
 CONFIG_TEGRA_KEYBOARD=y
diff --git a/configs/sh7752evb_defconfig b/configs/sh7752evb_defconfig
index d9fa1ca57f..271279a319 100644
--- a/configs/sh7752evb_defconfig
+++ b/configs/sh7752evb_defconfig
@@ -34,3 +34,4 @@ CONFIG_SH_ETHER=y
 CONFIG_SCIF_CONSOLE=y
 CONFIG_SPI=y
 CONFIG_USE_PRIVATE_LIBGCC=y
+CONFIG_SPL_ENV_IS_IN_MMC=y
diff --git a/configs/silk_defconfig b/configs/silk_defconfig
index 64a01651ac..b169b4a3fc 100644
--- a/configs/silk_defconfig
+++ b/configs/silk_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7794-silk-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/sksimx6_defconfig b/configs/sksimx6_defconfig
index 7bc687f64d..1a441344f9 100644
--- a/configs/sksimx6_defconfig
+++ b/configs/sksimx6_defconfig
@@ -32,6 +32,7 @@ CONFIG_CMD_MMC=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
diff --git a/configs/smartweb_defconfig b/configs/smartweb_defconfig
index 9e73051def..9720207b93 100644
--- a/configs/smartweb_defconfig
+++ b/configs/smartweb_defconfig
@@ -43,6 +43,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9260-smartweb"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_AT91=y
 CONFIG_DFU_NAND=y
diff --git a/configs/smdk5250_defconfig b/configs/smdk5250_defconfig
index 6c7eb9315c..40fd402521 100644
--- a/configs/smdk5250_defconfig
+++ b/configs/smdk5250_defconfig
@@ -34,6 +34,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos5250-smdk5250"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=1
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/smdk5420_defconfig b/configs/smdk5420_defconfig
index 714c9636cd..aac1a53e3b 100644
--- a/configs/smdk5420_defconfig
+++ b/configs/smdk5420_defconfig
@@ -29,6 +29,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos5420-smdk5420"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=1
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/smdkv310_defconfig b/configs/smdkv310_defconfig
index 880867fdca..6a8cb41d66 100644
--- a/configs/smdkv310_defconfig
+++ b/configs/smdkv310_defconfig
@@ -18,6 +18,7 @@ CONFIG_CMD_CACHE=y
 # CONFIG_CMD_MISC is not set
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="exynos4210-smdkv310"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_SDMA=y
diff --git a/configs/snow_defconfig b/configs/snow_defconfig
index e4d3703e00..73f4289906 100644
--- a/configs/snow_defconfig
+++ b/configs/snow_defconfig
@@ -38,6 +38,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos5250-snow"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=1
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_I2C_CROS_EC_LDO=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=y
diff --git a/configs/socfpga_arria10_defconfig b/configs/socfpga_arria10_defconfig
index 69e492accc..adb9d0ed01 100644
--- a/configs/socfpga_arria10_defconfig
+++ b/configs/socfpga_arria10_defconfig
@@ -17,7 +17,6 @@ CONFIG_DEFAULT_FDT_FILE="socfpga_arria10_socdk_sdmmc.dtb"
 CONFIG_VERSION_VARIABLE=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_SPL_TEXT_BASE=0xFFE00000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_FPGA_SUPPORT=y
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
diff --git a/configs/socfpga_arria5_defconfig b/configs/socfpga_arria5_defconfig
index 89e5ff8c71..41d68ebd5a 100644
--- a/configs/socfpga_arria5_defconfig
+++ b/configs/socfpga_arria5_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_arria5_socdk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
diff --git a/configs/socfpga_cyclone5_defconfig b/configs/socfpga_cyclone5_defconfig
index 00f2104276..71c79780bb 100644
--- a/configs/socfpga_cyclone5_defconfig
+++ b/configs/socfpga_cyclone5_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_socdk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
diff --git a/configs/socfpga_dbm_soc1_defconfig b/configs/socfpga_dbm_soc1_defconfig
index 1877010a19..48d1bbb6e7 100644
--- a/configs/socfpga_dbm_soc1_defconfig
+++ b/configs/socfpga_dbm_soc1_defconfig
@@ -38,6 +38,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_dbm_soc1"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
 CONFIG_DWAPB_GPIO=y
diff --git a/configs/socfpga_de0_nano_soc_defconfig b/configs/socfpga_de0_nano_soc_defconfig
index de50f17174..4407782501 100644
--- a/configs/socfpga_de0_nano_soc_defconfig
+++ b/configs/socfpga_de0_nano_soc_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_de0_nano_soc"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
 CONFIG_DWAPB_GPIO=y
diff --git a/configs/socfpga_de10_nano_defconfig b/configs/socfpga_de10_nano_defconfig
index 03961195ac..eba360bb24 100644
--- a/configs/socfpga_de10_nano_defconfig
+++ b/configs/socfpga_de10_nano_defconfig
@@ -31,6 +31,7 @@ CONFIG_MTDIDS_DEFAULT="nor0=ff705000.spi.0"
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_de10_nano"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
 CONFIG_DWAPB_GPIO=y
diff --git a/configs/socfpga_de1_soc_defconfig b/configs/socfpga_de1_soc_defconfig
index cb52b6ab07..38d66b56f0 100644
--- a/configs/socfpga_de1_soc_defconfig
+++ b/configs/socfpga_de1_soc_defconfig
@@ -30,6 +30,7 @@ CONFIG_MTDIDS_DEFAULT="nor0=ff705000.spi.0"
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_de1_soc"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_GPIO=y
 CONFIG_DWAPB_GPIO=y
 CONFIG_DM_I2C=y
diff --git a/configs/socfpga_is1_defconfig b/configs/socfpga_is1_defconfig
index 6ea06c1104..a6236ff4d7 100644
--- a/configs/socfpga_is1_defconfig
+++ b/configs/socfpga_is1_defconfig
@@ -33,6 +33,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_is1"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DM_GPIO=y
diff --git a/configs/socfpga_mcvevk_defconfig b/configs/socfpga_mcvevk_defconfig
index 161bd6fca3..eea779154a 100644
--- a/configs/socfpga_mcvevk_defconfig
+++ b/configs/socfpga_mcvevk_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_mcvevk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
 CONFIG_DWAPB_GPIO=y
diff --git a/configs/socfpga_sockit_defconfig b/configs/socfpga_sockit_defconfig
index 8ec1c05571..525b2b8ed6 100644
--- a/configs/socfpga_sockit_defconfig
+++ b/configs/socfpga_sockit_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_sockit"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
diff --git a/configs/socfpga_socrates_defconfig b/configs/socfpga_socrates_defconfig
index 15f81d1a4b..840792559f 100644
--- a/configs/socfpga_socrates_defconfig
+++ b/configs/socfpga_socrates_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_socrates"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
 CONFIG_DM_GPIO=y
diff --git a/configs/socfpga_sr1500_defconfig b/configs/socfpga_sr1500_defconfig
index 941bf1124a..1511633c6f 100644
--- a/configs/socfpga_sr1500_defconfig
+++ b/configs/socfpga_sr1500_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_sr1500"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DM_GPIO=y
diff --git a/configs/socfpga_stratix10_defconfig b/configs/socfpga_stratix10_defconfig
index ad83f50032..5981a7ab17 100644
--- a/configs/socfpga_stratix10_defconfig
+++ b/configs/socfpga_stratix10_defconfig
@@ -30,6 +30,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_stratix10_socdk"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_SPL_ALTERA_SDRAM=y
diff --git a/configs/socfpga_vining_fpga_defconfig b/configs/socfpga_vining_fpga_defconfig
index 96f806ab5f..7043c73179 100644
--- a/configs/socfpga_vining_fpga_defconfig
+++ b/configs/socfpga_vining_fpga_defconfig
@@ -41,6 +41,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_vining_fpga"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/sopine_baseboard_defconfig b/configs/sopine_baseboard_defconfig
index 5833234b63..041ee6628a 100644
--- a/configs/sopine_baseboard_defconfig
+++ b/configs/sopine_baseboard_defconfig
@@ -17,6 +17,7 @@ CONFIG_SYS_SPI_U_BOOT_OFFS=0x8000
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-sopine-baseboard"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/spring_defconfig b/configs/spring_defconfig
index bdbfc64b4c..ee40d01873 100644
--- a/configs/spring_defconfig
+++ b/configs/spring_defconfig
@@ -38,6 +38,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos5250-spring"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=1
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_I2C_CROS_EC_LDO=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=y
diff --git a/configs/stout_defconfig b/configs/stout_defconfig
index 309709f6c5..3097ac8d93 100644
--- a/configs/stout_defconfig
+++ b/configs/stout_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7790-stout-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/sun8i_a23_evb_defconfig b/configs/sun8i_a23_evb_defconfig
index 34cbb1e0c1..19a7b26054 100644
--- a/configs/sun8i_a23_evb_defconfig
+++ b/configs/sun8i_a23_evb_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a23-evb"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/sunxi_Gemei_G9_defconfig b/configs/sunxi_Gemei_G9_defconfig
index f3d77f1cd1..6a32137f97 100644
--- a/configs/sunxi_Gemei_G9_defconfig
+++ b/configs/sunxi_Gemei_G9_defconfig
@@ -17,6 +17,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-gemei-g9"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
diff --git a/configs/tao3530_defconfig b/configs/tao3530_defconfig
index f752e92d28..75dde4b680 100644
--- a/configs/tao3530_defconfig
+++ b/configs/tao3530_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:512k(x-loader),1920k(u-boot),128k(u-boot-env),4m(kernel),-(fs)"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_TWL4030_LED=y
 CONFIG_MMC_OMAP_HS=y
 CONFIG_NAND=y
diff --git a/configs/taurus_defconfig b/configs/taurus_defconfig
index 3676ecd419..97cba43dfd 100644
--- a/configs/taurus_defconfig
+++ b/configs/taurus_defconfig
@@ -59,6 +59,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g20-taurus"
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_BLK=y
 CONFIG_CLK=y
diff --git a/configs/tbs_a711_defconfig b/configs/tbs_a711_defconfig
index 196c4ce400..33dcbb3496 100644
--- a/configs/tbs_a711_defconfig
+++ b/configs/tbs_a711_defconfig
@@ -18,6 +18,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun8i-a83t-tbs-a711"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_AXP_DCDC5_VOLT=1200
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/tec-ng_defconfig b/configs/tec-ng_defconfig
index 513e301710..e193d09c99 100644
--- a/configs/tec-ng_defconfig
+++ b/configs/tec-ng_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra30-tec-ng"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SYS_I2C_TEGRA=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/tec_defconfig b/configs/tec_defconfig
index ab92b8429a..79ebc36db6 100644
--- a/configs/tec_defconfig
+++ b/configs/tec_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-tec"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_PMIC=y
 CONFIG_DM_REGULATOR=y
diff --git a/configs/teres_i_defconfig b/configs/teres_i_defconfig
index cfd696f8a3..cf1f261b73 100644
--- a/configs/teres_i_defconfig
+++ b/configs/teres_i_defconfig
@@ -12,6 +12,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-teres-i"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_PWM=y
diff --git a/configs/theadorable_debug_defconfig b/configs/theadorable_debug_defconfig
index b88a922678..333c6cbd60 100644
--- a/configs/theadorable_debug_defconfig
+++ b/configs/theadorable_debug_defconfig
@@ -52,6 +52,7 @@ CONFIG_EFI_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="armada-xp-theadorable"
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_SATA_MV=y
diff --git a/configs/thuban_defconfig b/configs/thuban_defconfig
index ade82c86e3..43d5cb814e 100644
--- a/configs/thuban_defconfig
+++ b/configs/thuban_defconfig
@@ -59,6 +59,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/ti816x_evm_defconfig b/configs/ti816x_evm_defconfig
index d341633fe1..982c76a1aa 100644
--- a/configs/ti816x_evm_defconfig
+++ b/configs/ti816x_evm_defconfig
@@ -40,6 +40,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nand.0:128k(NAND.SPL),128k(NAND.SPL.backup1),1
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="dm8168-evm"
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
diff --git a/configs/tinker-rk3288_defconfig b/configs/tinker-rk3288_defconfig
index 443f4d88b9..13ba53da87 100644
--- a/configs/tinker-rk3288_defconfig
+++ b/configs/tinker-rk3288_defconfig
@@ -36,6 +36,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-tinker"
 CONFIG_OF_SPL_REMOVE_PROPS="clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/tricorder_defconfig b/configs/tricorder_defconfig
index 53e8256b96..dce37d6404 100644
--- a/configs/tricorder_defconfig
+++ b/configs/tricorder_defconfig
@@ -26,6 +26,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=omap2-nand.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=omap2-nand.0:128k(SPL),1m(u-boot),384k(u-boot-env1),1152k(mtdoops),384k(u-boot-env2),5m(kernel),2m(fdt),-(ubi)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_NET is not set
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS0=y
diff --git a/configs/trimslice_defconfig b/configs/trimslice_defconfig
index d8ce65f053..2d249c0ab7 100644
--- a/configs/trimslice_defconfig
+++ b/configs/trimslice_defconfig
@@ -27,6 +27,7 @@ CONFIG_DEFAULT_DEVICE_TREE="tegra20-trimslice"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=48000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_SYS_I2C_TEGRA=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/ts4600_defconfig b/configs/ts4600_defconfig
index b52ec639d7..79cfc20969 100644
--- a/configs/ts4600_defconfig
+++ b/configs/ts4600_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
 CONFIG_CONS_INDEX=0
diff --git a/configs/turris_omnia_defconfig b/configs/turris_omnia_defconfig
index c0bedf4999..8c94b4da44 100644
--- a/configs/turris_omnia_defconfig
+++ b/configs/turris_omnia_defconfig
@@ -54,6 +54,7 @@ CONFIG_DEFAULT_DEVICE_TREE="armada-385-turris-omnia"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_AHCI_PCI=y
 CONFIG_AHCI_MVEBU=y
diff --git a/configs/udoo_defconfig b/configs/udoo_defconfig
index ea6da7aa65..5a0e105ac0 100644
--- a/configs/udoo_defconfig
+++ b/configs/udoo_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/udoo_neo_defconfig b/configs/udoo_neo_defconfig
index 597f557f7b..b27041f971 100644
--- a/configs/udoo_neo_defconfig
+++ b/configs/udoo_neo_defconfig
@@ -17,7 +17,6 @@ CONFIG_BOOTCOMMAND="run findfdt; run distro_bootcmd"
 CONFIG_BOUNCE_BUFFER=y
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SPL_TEXT_BASE=0x00908000
-CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
 # CONFIG_CMD_FLASH is not set
diff --git a/configs/venice2_defconfig b/configs/venice2_defconfig
index 7f7befba7b..357b864cc7 100644
--- a/configs/venice2_defconfig
+++ b/configs/venice2_defconfig
@@ -25,6 +25,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra124-venice2"
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
diff --git a/configs/ventana_defconfig b/configs/ventana_defconfig
index c16ddb97c1..d56d295758 100644
--- a/configs/ventana_defconfig
+++ b/configs/ventana_defconfig
@@ -23,6 +23,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="tegra20-ventana"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_DM=y
 CONFIG_DM_PMIC=y
 CONFIG_DM_REGULATOR=y
diff --git a/configs/vyasa-rk3288_defconfig b/configs/vyasa-rk3288_defconfig
index c74c1457a7..ba251faef4 100644
--- a/configs/vyasa-rk3288_defconfig
+++ b/configs/vyasa-rk3288_defconfig
@@ -37,6 +37,8 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="rk3288-vyasa"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clock-names interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents"
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
+CONFIG_TPL_ENV_IS_NOWHERE=y
 CONFIG_REGMAP=y
 CONFIG_SPL_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index f07ec5f651..60fce07089 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -45,6 +45,7 @@ CONFIG_OF_LIST="imx6q-wandboard-revb1 imx6qp-wandboard-revd1 imx6dl-wandboard-re
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
 CONFIG_DM_GPIO=y
diff --git a/configs/wb45n_defconfig b/configs/wb45n_defconfig
index be6744b82b..59bbe45d50 100644
--- a/configs/wb45n_defconfig
+++ b/configs/wb45n_defconfig
@@ -28,6 +28,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
diff --git a/configs/wb50n_defconfig b/configs/wb50n_defconfig
index ef427f350d..289fd4c0fe 100644
--- a/configs/wb50n_defconfig
+++ b/configs/wb50n_defconfig
@@ -28,6 +28,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
diff --git a/configs/woodburn_sd_defconfig b/configs/woodburn_sd_defconfig
index 72e6ab4721..10c11ef90a 100644
--- a/configs/woodburn_sd_defconfig
+++ b/configs/woodburn_sd_defconfig
@@ -39,6 +39,7 @@ CONFIG_EFI_PARTITION=y
 # CONFIG_PARTITION_UUIDS is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_MXC_GPIO=y
 CONFIG_FSL_ESDHC_IMX=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/work_92105_defconfig b/configs/work_92105_defconfig
index 5131805c4a..0b516f5715 100644
--- a/configs/work_92105_defconfig
+++ b/configs/work_92105_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_DOS_PARTITION=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 # CONFIG_MMC is not set
 CONFIG_PHYLIB=y
 CONFIG_PHY_ADDR_ENABLE=y
diff --git a/configs/x530_defconfig b/configs/x530_defconfig
index 05526fe8ee..136bf921d2 100644
--- a/configs/x530_defconfig
+++ b/configs/x530_defconfig
@@ -45,6 +45,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="armada-385-atl-x530"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_BLK=y
 CONFIG_DM_GPIO=y
diff --git a/configs/x600_defconfig b/configs/x600_defconfig
index e4e5c57a74..41c8247a1a 100644
--- a/configs/x600_defconfig
+++ b/configs/x600_defconfig
@@ -44,6 +44,7 @@ CONFIG_MTDIDS_DEFAULT="nand0=nand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:64M(ubi0),64M(ubi1)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_FPGA_XILINX=y
 CONFIG_FPGA_SPARTAN3=y
diff --git a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
index 7b1f5e9d0a..063c431de3 100644
--- a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
+++ b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
@@ -43,6 +43,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zc1751-xm015-dc1"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
index cc2af6dce0..c064af72e5 100644
--- a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
+++ b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zc1751-xm018-dc4"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
index bf66171335..722f195b14 100644
--- a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
+++ b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zc1751-xm019-dc5"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
index ef291a7d38..4f994b9af1 100644
--- a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
+++ b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
@@ -45,6 +45,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-rev1.0"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu102_revA_defconfig b/configs/xilinx_zynqmp_zcu102_revA_defconfig
index 975e9f5eb1..833670fb60 100644
--- a/configs/xilinx_zynqmp_zcu102_revA_defconfig
+++ b/configs/xilinx_zynqmp_zcu102_revA_defconfig
@@ -45,6 +45,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-revA"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu102_revB_defconfig b/configs/xilinx_zynqmp_zcu102_revB_defconfig
index 34918aa171..950fdcefd0 100644
--- a/configs/xilinx_zynqmp_zcu102_revB_defconfig
+++ b/configs/xilinx_zynqmp_zcu102_revB_defconfig
@@ -45,6 +45,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-revB"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu104_revA_defconfig b/configs/xilinx_zynqmp_zcu104_revA_defconfig
index e4090dc281..33388afcda 100644
--- a/configs/xilinx_zynqmp_zcu104_revA_defconfig
+++ b/configs/xilinx_zynqmp_zcu104_revA_defconfig
@@ -39,6 +39,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu104-revA"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu104_revC_defconfig b/configs/xilinx_zynqmp_zcu104_revC_defconfig
index 25a2515d15..563ef36afc 100644
--- a/configs/xilinx_zynqmp_zcu104_revC_defconfig
+++ b/configs/xilinx_zynqmp_zcu104_revC_defconfig
@@ -39,6 +39,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu104-revC"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu106_revA_defconfig b/configs/xilinx_zynqmp_zcu106_revA_defconfig
index 212de924a6..efe1a5d974 100644
--- a/configs/xilinx_zynqmp_zcu106_revA_defconfig
+++ b/configs/xilinx_zynqmp_zcu106_revA_defconfig
@@ -42,6 +42,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xilinx_zynqmp_zcu111_revA_defconfig b/configs/xilinx_zynqmp_zcu111_revA_defconfig
index dec894787e..5574fa426c 100644
--- a/configs/xilinx_zynqmp_zcu111_revA_defconfig
+++ b/configs/xilinx_zynqmp_zcu111_revA_defconfig
@@ -38,6 +38,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu111-revA"
 CONFIG_ENV_IS_IN_FAT=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/xpress_spl_defconfig b/configs/xpress_spl_defconfig
index 913d577bcd..7e73fbeeb2 100644
--- a/configs/xpress_spl_defconfig
+++ b/configs/xpress_spl_defconfig
@@ -36,6 +36,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_FSL_USDHC=y
 CONFIG_PHYLIB=y
diff --git a/configs/zc5202_defconfig b/configs/zc5202_defconfig
index 6ba4bd54f7..c6e2c59ac2 100644
--- a/configs/zc5202_defconfig
+++ b/configs/zc5202_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_FSL_USDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/zc5601_defconfig b/configs/zc5601_defconfig
index 676691d19e..553e5d10cd 100644
--- a/configs/zc5601_defconfig
+++ b/configs/zc5601_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_FSL_USDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/zynq_dlc20_rev1_0_defconfig b/configs/zynq_dlc20_rev1_0_defconfig
index b6751ad35b..5282464ebf 100644
--- a/configs/zynq_dlc20_rev1_0_defconfig
+++ b/configs/zynq_dlc20_rev1_0_defconfig
@@ -40,6 +40,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-dlc20-rev1.0"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index d30581b241..4af93fb863 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_minized_defconfig b/configs/zynq_minized_defconfig
index 3c95f0aceb..23cfeb7687 100644
--- a/configs/zynq_minized_defconfig
+++ b/configs/zynq_minized_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-minized"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index 6b670aefc9..de5a1e5ce7 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -40,6 +40,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zc702"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 3d0cd314c6..cb0bb6dced 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -42,6 +42,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_zc770_xm010_defconfig b/configs/zynq_zc770_xm010_defconfig
index 53108ff03c..ca15856771 100644
--- a/configs/zynq_zc770_xm010_defconfig
+++ b/configs/zynq_zc770_xm010_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zc770-xm010"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_FPGA_XILINX=y
diff --git a/configs/zynq_zc770_xm012_defconfig b/configs/zynq_zc770_xm012_defconfig
index 01e3d5fb84..ab6f5535b4 100644
--- a/configs/zynq_zc770_xm012_defconfig
+++ b/configs/zynq_zc770_xm012_defconfig
@@ -30,6 +30,7 @@ CONFIG_CMD_CACHE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zc770-xm012"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BLK=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 9b6d754872..492374a71c 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
index 2abc6db0d0..b39e691129 100644
--- a/configs/zynq_zybo_defconfig
+++ b/configs/zynq_zybo_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zybo"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/configs/zynq_zybo_z7_defconfig b/configs/zynq_zybo_z7_defconfig
index eda1416a9b..ba75929e0d 100644
--- a/configs/zynq_zybo_z7_defconfig
+++ b/configs/zynq_zybo_z7_defconfig
@@ -37,6 +37,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zybo-z7"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_SPL_ENV_IS_NOWHERE=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_DFU_MMC=y
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 6ab378b979..92badc51c0 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -653,7 +653,7 @@ int input_stdio_register(struct stdio_dev *dev)
 	int error;
 
 	error = stdio_register(dev);
-#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
+#if ENV_IS_IN_SOMEWHERE
 	/* check if this is the standard input device */
 	if (!error && strcmp(env_get("stdin"), dev->name) == 0) {
 		/* reassign the console */
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 9337f6482e..a948324456 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -17,9 +17,7 @@ obj-$(CONFIG_SPL_NAND_ECC) += nand_ecc.o
 obj-$(CONFIG_SPL_NAND_BASE) += nand_base.o
 obj-$(CONFIG_SPL_NAND_IDENT) += nand_ids.o nand_timings.o
 obj-$(CONFIG_SPL_NAND_INIT) += nand.o
-ifeq ($(CONFIG_SPL_ENV_SUPPORT),y)
-obj-$(CONFIG_ENV_IS_IN_NAND) += nand_util.o
-endif
+obj-$(CONFIG_SPL_ENV_IS_IN_NAND) += nand_util.o
 
 else # not spl
 
diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 93ec9cfdb6..b4ec412f04 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -44,7 +44,7 @@ struct socfpga_reset_data {
  */
 static bool socfpga_reset_keep_enabled(void)
 {
-#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
+#if ENV_IS_IN_SOMEWHERE
 	const char *env_str;
 	long val;
 
diff --git a/env/Kconfig b/env/Kconfig
index 74db2f38cc..c1a9e37b4a 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -1,5 +1,20 @@
 menu "Environment"
 
+config ENV_FULL_SUPPORT
+	bool "Support all environment features"
+	default y
+	help
+	  Enable full environment support in U-Boot,
+	  including attributes, callbacks and flags.
+
+config ENV_DEFAULT
+	bool "Support default enviromnent"
+	default y
+	help
+	  Enable a default enviromnent in U-Boot,
+	  The default enviromnent if pre-populated with many variables
+	  .
+
 config ENV_IS_NOWHERE
 	bool "Environment is not stored"
 	default y if !ENV_IS_IN_EEPROM && !ENV_IS_IN_EXT4 && \
@@ -526,6 +541,7 @@ endif
 
 config USE_DEFAULT_ENV_FILE
 	bool "Create default environment from file"
+	depends on ENV_DEFAULT
 	help
 	  Normally, the default environment is automatically generated
 	  based on the settings of various CONFIG_* options, as well
@@ -549,7 +565,14 @@ config ENV_VARS_UBOOT_RUNTIME_CONFIG
 	  run-time determined information about the hardware to the
 	  environment.  These will be named board_name, board_rev.
 
-if SPL_ENV_SUPPORT
+if SPL
+
+config SPL_ENV_DEFAULT
+	bool "SPL default enviromnent"
+	default n
+	help
+	  Similar to ENV_DEFAULT, used for SPL environment.
+
 config SPL_ENV_IS_NOWHERE
 	bool "SPL Environment is not stored"
 	default y if ENV_IS_NOWHERE
@@ -606,7 +629,13 @@ config SPL_ENV_IS_IN_FLASH
 
 endif
 
-if TPL_ENV_SUPPORT
+if TPL
+
+config TPL_ENV_DEFAULT
+	bool "TPL default enviromnent"
+	default n
+	help
+	  Similar to ENV_DEFAULT, used for TPL environment.
 
 config TPL_ENV_IS_NOWHERE
 	bool "TPL Environment is not stored"
diff --git a/env/Makefile b/env/Makefile
index 90144d6caf..0983712f09 100644
--- a/env/Makefile
+++ b/env/Makefile
@@ -5,10 +5,11 @@
 
 obj-y += common.o env.o
 
+obj-$(CONFIG_ENV_FULL_SUPPORT) += attr.o
+obj-$(CONFIG_ENV_FULL_SUPPORT) += flags.o
+obj-$(CONFIG_ENV_FULL_SUPPORT) += callback.o
+
 ifndef CONFIG_SPL_BUILD
-obj-y += attr.o
-obj-y += callback.o
-obj-y += flags.o
 obj-$(CONFIG_ENV_IS_IN_EEPROM) += eeprom.o
 extra-$(CONFIG_ENV_IS_EMBEDDED) += embedded.o
 obj-$(CONFIG_ENV_IS_IN_EEPROM) += embedded.o
@@ -19,10 +20,6 @@ obj-$(CONFIG_ENV_IS_IN_ONENAND) += onenand.o
 obj-$(CONFIG_ENV_IS_IN_SATA) += sata.o
 obj-$(CONFIG_ENV_IS_IN_REMOTE) += remote.o
 obj-$(CONFIG_ENV_IS_IN_UBI) += ubi.o
-else
-obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += attr.o
-obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += flags.o
-obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += callback.o
 endif
 
 obj-$(CONFIG_$(SPL_TPL_)ENV_IS_NOWHERE) += nowhere.o
diff --git a/env/common.c b/env/common.c
index f677b5b0da..564e7e2e0b 100644
--- a/env/common.c
+++ b/env/common.c
@@ -24,10 +24,8 @@ DECLARE_GLOBAL_DATA_PTR;
 #include <env_default.h>
 
 struct hsearch_data env_htab = {
-#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
-	/* defined in flags.c, only compiled in U-Boot or
-	 * with $(SPL_TPL_)ENV_SUPPORT
-	 */
+#ifdef CONFIG_ENV_FULL_SUPPORT
+	/* defined in flags.c, only compile with ENV_FULL_SUPPORT */
 	.change_ok = env_flags_validate,
 #endif
 };
diff --git a/include/configs/ls1021aiot.h b/include/configs/ls1021aiot.h
index ee570bc1a9..1d5d934aea 100644
--- a/include/configs/ls1021aiot.h
+++ b/include/configs/ls1021aiot.h
@@ -62,7 +62,6 @@
 	board/freescale/ls1021aiot/ls102xa_rcw_sd.cfg
 #define CONFIG_SPL_LIBCOMMON_SUPPORT
 #define CONFIG_SPL_LIBGENERIC_SUPPORT
-#define CONFIG_SPL_ENV_SUPPORT
 #define CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT
 #define CONFIG_SPL_I2C_SUPPORT
 #define CONFIG_SPL_WATCHDOG_SUPPORT
diff --git a/include/configs/ls1046a_common.h b/include/configs/ls1046a_common.h
index 59c43f1ae1..dd29bfde2b 100644
--- a/include/configs/ls1046a_common.h
+++ b/include/configs/ls1046a_common.h
@@ -106,7 +106,6 @@
 #define CONFIG_SPL_PBL_PAD
 #define CONFIG_SPL_LIBCOMMON_SUPPORT
 #define CONFIG_SPL_LIBGENERIC_SUPPORT
-#define CONFIG_SPL_ENV_SUPPORT
 #define CONFIG_SPL_WATCHDOG_SUPPORT
 #define CONFIG_SPL_I2C_SUPPORT
 #define CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT
diff --git a/include/configs/xilinx_zynqmp.h b/include/configs/xilinx_zynqmp.h
index a1c55a8306..021f810046 100644
--- a/include/configs/xilinx_zynqmp.h
+++ b/include/configs/xilinx_zynqmp.h
@@ -240,7 +240,6 @@
 
 #if defined(CONFIG_SPL_BUILD) && defined(CONFIG_SPL_DFU)
 # undef CONFIG_CMD_BOOTD
-# define CONFIG_SPL_ENV_SUPPORT
 # define CONFIG_SPL_HASH_SUPPORT
 # define CONFIG_ENV_MAX_ENTRIES	10
 #endif
diff --git a/include/env_callback.h b/include/env_callback.h
index 74da20eec3..93833e86f0 100644
--- a/include/env_callback.h
+++ b/include/env_callback.h
@@ -72,6 +72,10 @@
 	"serial#:serialno," \
 	CONFIG_ENV_CALLBACK_LIST_STATIC
 
+#ifdef CONFIG_ENV_FULL_SUPPORT
 void env_callback_init(struct env_entry *var_entry);
+#else
+static inline void env_callback_init(struct env_entry *var_entry) { }
+#endif
 
 #endif /* __ENV_CALLBACK_H__ */
diff --git a/include/env_default.h b/include/env_default.h
index 56a8bae39a..9a95513a22 100644
--- a/include/env_default.h
+++ b/include/env_default.h
@@ -21,13 +21,16 @@ static char default_environment[] = {
 #else
 const uchar default_environment[] = {
 #endif
+#if CONFIG_IS_ENABLED(ENV_DEFAULT)
 #ifndef CONFIG_USE_DEFAULT_ENV_FILE
+#if CONFIG_IS_ENABLED(ENV_FULL_SUPPORT)
 #ifdef	CONFIG_ENV_CALLBACK_LIST_DEFAULT
 	ENV_CALLBACK_VAR "=" CONFIG_ENV_CALLBACK_LIST_DEFAULT "\0"
 #endif
 #ifdef	CONFIG_ENV_FLAGS_LIST_DEFAULT
 	ENV_FLAGS_VAR "=" CONFIG_ENV_FLAGS_LIST_DEFAULT "\0"
 #endif
+#endif /* ENV_FULL_SUPPORT */
 #ifdef	CONFIG_USE_BOOTARGS
 	"bootargs="	CONFIG_BOOTARGS			"\0"
 #endif
@@ -114,6 +117,7 @@ const uchar default_environment[] = {
 #else /* CONFIG_USE_DEFAULT_ENV_FILE */
 #include "generated/defaultenv_autogenerated.h"
 #endif
+#endif /* ENV_DEFAULT */
 #ifdef DEFAULT_ENV_INSTANCE_EMBEDDED
 	}
 #endif
diff --git a/include/env_flags.h b/include/env_flags.h
index 725841a891..9a2a2d3a53 100644
--- a/include/env_flags.h
+++ b/include/env_flags.h
@@ -153,7 +153,11 @@ int env_flags_validate_env_set_params(char *name, char *const val[], int count);
  * When adding a variable to the environment, initialize the flags for that
  * variable.
  */
+#ifdef CONFIG_ENV_FULL_SUPPORT
 void env_flags_init(struct env_entry *var_entry);
+#else
+static inline void env_flags_init(struct env_entry *var_entry) { }
+#endif
 
 /*
  * Validate the newval for to conform with the requirements defined by its flags
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
