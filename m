Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA5C98F9
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2019 09:25:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F30D0C36B0E
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Oct 2019 07:25:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 480B5C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 07:25:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x937Li21012463; Thu, 3 Oct 2019 09:24:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=i937itx7uT9d+lTucvaqmRyZFCOpCRbf3ba1dg9ABGA=;
 b=xewtxJQTMpkfmE/p5JGVaCtnsu8hUIJUd+6oUuv5n25Ej5dctc/fgxFBBZ34U1BuiFPl
 9l+rmo06NNzhTM95bWthSpoy+WYjJtMW6ZsZyLJcSIYn9rJegRfIjPZt3MC0+6Ltz+nc
 +U71wd/o0HrwpcHfM5DkrPBMBgl/0Z7nQ3OOQiydoG4B/sgVoId9dz6/Q68350U1Sq0A
 bJXPuK2C5VFE3+hkhVRtWyr1kQv4fgfWP/rLEP/GULqqUb1CD1b3Z3f7nrslYEawxZTY
 sx8ki3zAaa9w8rTN9h5r4VWG0J6gKvATh1FtB5Ghcu9DKD5eUuxSiqYxeakfBNfM/QQb 8w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vcem37xns-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 09:24:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF7EE24;
 Thu,  3 Oct 2019 07:24:45 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9966D2A9702;
 Thu,  3 Oct 2019 09:24:44 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 3 Oct 2019
 09:24:44 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 3 Oct 2019 09:24:38
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Oct 2019 09:24:25 +0200
Message-ID: <20191003072428.19197-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_03:2019-10-01,2019-10-03 signatures=0
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
Subject: [Uboot-stm32] [PATCH v4 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
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


Hi,

This patchset follow
  http://patchwork.ozlabs.org/project/uboot/list/?series=131268&state=*

It follow the first proposal
  http://patchwork.ozlabs.org/project/uboot/list/?series=129339
  "env: Add CONFIG_ENV_SUPPORT"

The first patch of the serie only solves the regression introduced by
commit 7d4776545b0f ("env: solve compilation error
in SPL"); change_ok was always NULL in U-Boot.
See "U-Boot: Environment flags broken for U-Boot" mail
http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-for-U-Boot-tt382673.html

This first patch can be integrated in master branch
for v2019.10 as requested Tom Rimi.

The next patches of the serie is a proposal after Wolfgang Denk
review on the first proposal: I make the env support coherent
between U-Boot, SPL and TPL.

I need to change many defconfig (to add CONFIG_(SPL/TPL)_ENV_IS_NOWHERE)
because I modify the dependency between the CONFIG used by SPL.

Moreover the size of SPL increase this last patch.

So to avoid to increase the SPL and TPL size, I also allow to
have empty default environment with the new options
CONFIG_$(SPL_TPL_)ENV_DEFAULT

Today the last buildman result is :

02: env: Add CONFIG_ENV_FULL_SUPPORT
       arm:  +   smartweb
+/local/home/frq07632/.buildman-toolchains/gcc-7.3.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-ld.bfd: u-boot-spl section `.u_boot_list' will not fit in region `.sram'
+/local/home/frq07632/.buildman-toolchains/gcc-7.3.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-ld.bfd: SPL image too big
+/local/home/frq07632/.buildman-toolchains/gcc-7.3.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-ld.bfd: region `.sram' overflowed by 56 bytes
+make[2]: *** [spl/u-boot-spl] Error 1
+make[1]: *** [spl/u-boot-spl] Error 2
       x86: (for 26/26 boards) all -23.5 bss -7.4 spl/u-boot-spl:all -226.7 spl/u-boot-spl:data +0.9 spl/u-boot-spl:rodata -228.6 spl/u-boot-spl:text +1.0 text -16.1
   aarch64: (for 225/225 boards) all +0.1 rodata +0.1 spl/u-boot-spl:all -33.3 spl/u-boot-spl:bss -0.1 spl/u-boot-spl:data +18.0 spl/u-boot-spl:rodata -64.3 spl/u-boot-spl:text +13.2
   powerpc: (for 309/309 boards) spl/u-boot-spl:all -338.8 spl/u-boot-spl:data -338.8
   sandbox: (for 6/6 boards) all -46.7 rodata +16.0 spl/u-boot-spl:all -496.0 spl/u-boot-spl:rodata -496.0 text -62.7
microblaze: (for 1/1 boards) all +4.0 bss +100.0 data -4.0 rodata -8.0 spl/u-boot-spl:all +1136.0 spl/u-boot-spl:bss -8.0 spl/u-boot-spl:data +24.0 spl/u-boot-spl:rodata +1092.0 spl/u-boot-spl:text +28.0 text -84.0
       arm: (for 689/689 boards) all -0.1 bss +0.1 rodata +0.1 spl/u-boot-spl:all -131.3 spl/u-boot-spl:data +12.9 spl/u-boot-spl:rodata -154.7 spl/u-boot-spl:text +10.5 text -0.3

With this patch I gain on the rodata size in spl for many targets.

But I need to be sure that have a empty default environment in SPL/TPL
by default is normal for all architecture/boards.

Do you think I need to reactivate it by default the CONFIG for SPL
and deactivated only on some target.

Any remarks are welcome.

Best regards.

Patrick Delaunay.


Changes in v4:
- Add CONFIG_$(SPL_TPL_)ENV_DEFAULT: empty default environment
  when not activated

Changes in v3:
- It is a version 3 of
  http://patchwork.ozlabs.org/project/uboot/list/?series=129339
  "env: Add CONFIG_ENV_SUPPORT"
  after Tom Rimi and Wolfgang Denk remarks

Changes in v2:
- Add comment for ENV_IS_IN_SOMEWHERE
- Update commit message after Lukasz Majewki review

Patrick Delaunay (3):
  env: correct the check of env_flags_validate presence
  env: introduce macro ENV_IS_IN_SOMEWHERE
  env: Add CONFIG_ENV_FULL_SUPPORT

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
 cmd/nvedit.c                                  | 27 +++------------
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
 env/common.c                                  |  4 +--
 include/configs/ls1021aiot.h                  |  1 -
 include/configs/ls1046a_common.h              |  1 -
 include/configs/xilinx_zynqmp.h               |  1 -
 include/env.h                                 | 23 +++++++++++++
 include/env_callback.h                        |  4 +++
 include/env_default.h                         |  4 +++
 include/env_flags.h                           |  4 +++
 586 files changed, 557 insertions(+), 207 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
