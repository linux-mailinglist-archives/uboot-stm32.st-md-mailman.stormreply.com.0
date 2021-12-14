Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD8476E31
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Dec 2021 10:50:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6808DC5E2C3;
	Thu, 16 Dec 2021 09:50:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BD26C5E2C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 16:57:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEB604w011275;
 Tue, 14 Dec 2021 17:57:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=/d+OrQXFBj/Lba0f1bJm/U8JH5gUy5ZKVXbdyKHG1/I=;
 b=pBObL+hgjwkzo7xKyxqxivebTtJf7zHqWMKXMlxkRokpadKfJ3fbt4YYYyAlnEGlsabb
 SuNO6HJZEyssjnc76+HUP6MU2MQQLQA5TRG45IkIPv5VL8RacGMkztgQ0aX2jsBDBhVd
 chGqC4+mIyyBQrtPwTezVh36mR9t7vickASSP2eEvCTG+ek6n7UWTXnvBWTNkzJWm39A
 +lh0v5AIZKK1Oc1+3HQUGW28S3gzvXiQNW7W57/MF4/xuD1wMwaRDFWKJwW0+jXN+tqg
 4QIvmn5XhF+q+ZSEEeXKoJJaghWs3DuYqcmD3ixkKjb9KE3VGYyCaoeq5ECE0Fv5LlYw AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxnqb4g5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 17:57:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6ED7100038;
 Tue, 14 Dec 2021 17:57:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CE8920A08A;
 Tue, 14 Dec 2021 17:57:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 17:57:09
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Dec 2021 17:57:03 +0100
Message-ID: <20211214175652.RFC.4.I0d0c7b01c8aefb9ef4b2d5f78feda422bc59593e@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
X-Mailman-Approved-At: Thu, 16 Dec 2021 09:50:08 +0000
Cc: David Feng <fenghua@phytium.com.cn>,
 =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Peng Fan <peng.fan@nxp.com>,
 Chin-Liang See <clsee@altera.com>, Sean Anderson <seanga2@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachienergy.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wegner <w.wegner@astro-kom.de>, Kamil Lulko <kamil.lulko@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Dalon Westergreen <dalon.westergreen@intel.com>,
 Aleksandar Gerasimovski <aleksandar.gerasimovski@hitachienergy.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefan Roese <sr@denx.de>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Stelian Pop <stelian@popies.net>, Niel Fourie <lusus@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Kristian Amlie <kristian.amlie@northern.tech>,
 egnite GmbH <info@egnite.de>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Shengzhou Liu <Shengzhou.Liu@nxp.com>, Dirk Eibach <dirk.eibach@gdsys.cc>,
 Heiko Schocher <hs@denx.de>, Qiang Zhao <qiang.zhao@nxp.com>,
 Ilko Iliev <iliev@ronetix.at>, Thomas Chou <thomas@wytron.com.tw>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>, Sinan Akman <sinan@writeme.com>, Vikas
 Manocha <vikas.manocha@st.com>, Wolfgang
 Denk <wd@denx.de>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Ashish Kumar <Ashish.Kumar@nxp.com>, Rick Chen <rick@andestech.com>, Jassi
 Brar <jaswinder.singh@linaro.org>, Usama Arif <usama.arif@arm.com>, Tuomas
 Tynkkynen <tuomas.tynkkynen@iki.fi>, Chee Hong Ang <chee.hong.ang@intel.com>,
 Jens Scharsig <esw@bus-elektronik.de>, Vladimir Zapolskiy <vz@mleia.com>, Adam
 Ford <aford173@gmail.com>, Mingkai Hu <Mingkai.Hu@nxp.com>,
 Simon Guinot <simon.guinot@sequanux.org>, Christophe
 Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>, Masakazu
 Mochizuki <masakazu.mochizuki.wd@hitachi.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Igor
 Opaniuk <igor.opaniuk@foundries.io>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "Andrew F. Davis" <afd@ti.com>,
 Aaron Williams <awilliams@marvell.com>, Dinh
 Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>, Paul
 Burton <paul.burton@mips.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Eugen
 Hristev <eugen.hristev@microchip.com>, TsiChung Liew <Tsi-Chung.Liew@nxp.com>,
 Bin Meng <bmeng.cn@gmail.com>, Andes <uboot@andestech.com>
Subject: [Uboot-stm32] [RFC PATCH 4/5] configs: Migrate
	CONFIG_SYS_MAX_FLASH_BANKS to Kconfig
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

Use moveconfig.py script to convert define CONFIG_SYS_MAX_FLASH_BANKS
and CONFIG_SYS_MAX_FLASH_BANKS_DETECT to Kconfig and move these entries
to defconfigs.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 README                                       |  3 ---
 configs/3c120_defconfig                      |  1 +
 configs/M5253DEMO_defconfig                  |  1 +
 configs/MPC8548CDS_36BIT_defconfig           |  1 +
 configs/MPC8548CDS_defconfig                 |  1 +
 configs/MPC8548CDS_legacy_defconfig          |  1 +
 configs/P3041DS_NAND_defconfig               |  1 +
 configs/P3041DS_SDCARD_defconfig             |  1 +
 configs/P3041DS_SPIFLASH_defconfig           |  1 +
 configs/P3041DS_defconfig                    |  1 +
 configs/P4080DS_SDCARD_defconfig             |  1 +
 configs/P4080DS_SPIFLASH_defconfig           |  1 +
 configs/P4080DS_defconfig                    |  1 +
 configs/P5040DS_NAND_defconfig               |  1 +
 configs/P5040DS_SDCARD_defconfig             |  1 +
 configs/P5040DS_SPIFLASH_defconfig           |  1 +
 configs/P5040DS_defconfig                    |  1 +
 configs/T1042D4RDB_NAND_defconfig            |  1 +
 configs/T1042D4RDB_SDCARD_defconfig          |  1 +
 configs/T1042D4RDB_SPIFLASH_defconfig        |  1 +
 configs/T1042D4RDB_defconfig                 |  1 +
 configs/T2080QDS_NAND_defconfig              |  1 +
 configs/T2080QDS_SDCARD_defconfig            |  1 +
 configs/T2080QDS_SECURE_BOOT_defconfig       |  1 +
 configs/T2080QDS_SPIFLASH_defconfig          |  1 +
 configs/T2080QDS_defconfig                   |  1 +
 configs/T4240RDB_SDCARD_defconfig            |  1 +
 configs/T4240RDB_defconfig                   |  1 +
 configs/boston32r2_defconfig                 |  1 +
 configs/boston32r2el_defconfig               |  1 +
 configs/boston32r6_defconfig                 |  1 +
 configs/boston32r6el_defconfig               |  1 +
 configs/boston64r2_defconfig                 |  1 +
 configs/boston64r2el_defconfig               |  1 +
 configs/boston64r6_defconfig                 |  1 +
 configs/boston64r6el_defconfig               |  1 +
 configs/cobra5272_defconfig                  |  1 +
 configs/comtrend_ct5361_ram_defconfig        |  1 +
 configs/comtrend_wap5813n_ram_defconfig      |  1 +
 configs/ethernut5_defconfig                  |  1 +
 configs/huawei_hg556a_ram_defconfig          |  1 +
 configs/j7200_evm_a72_defconfig              |  1 +
 configs/j7200_evm_r5_defconfig               |  1 +
 configs/j721e_evm_a72_defconfig              |  1 +
 configs/j721e_hs_evm_a72_defconfig           |  1 +
 configs/ls1021aqds_ddr4_nor_defconfig        |  1 +
 configs/ls1021aqds_ddr4_nor_lpuart_defconfig |  1 +
 configs/ls1021aqds_nand_defconfig            |  1 +
 configs/ls1021aqds_nor_SECURE_BOOT_defconfig |  1 +
 configs/ls1021aqds_nor_defconfig             |  1 +
 configs/ls1021aqds_nor_lpuart_defconfig      |  1 +
 configs/ls1021aqds_sdcard_ifc_defconfig      |  1 +
 configs/ls1046aqds_SECURE_BOOT_defconfig     |  1 +
 configs/ls1046aqds_defconfig                 |  1 +
 configs/ls1046aqds_lpuart_defconfig          |  1 +
 configs/ls1046aqds_nand_defconfig            |  1 +
 configs/ls1046aqds_sdcard_ifc_defconfig      |  1 +
 configs/ls1046aqds_tfa_SECURE_BOOT_defconfig |  1 +
 configs/ls1046aqds_tfa_defconfig             |  1 +
 configs/ls1088aqds_defconfig                 |  1 +
 configs/ls1088aqds_sdcard_ifc_defconfig      |  1 +
 configs/ls1088aqds_tfa_defconfig             |  1 +
 configs/ls2080aqds_SECURE_BOOT_defconfig     |  1 +
 configs/ls2080aqds_defconfig                 |  1 +
 configs/ls2088aqds_tfa_defconfig             |  1 +
 configs/qemu_arm64_defconfig                 |  2 ++
 configs/qemu_arm_defconfig                   |  2 ++
 configs/r8a77990_ebisu_defconfig             |  1 +
 configs/r8a77995_draak_defconfig             |  1 +
 configs/rcar3_salvator-x_defconfig           |  1 +
 configs/rcar3_ulcb_defconfig                 |  1 +
 configs/sfr_nb4-ser_ram_defconfig            |  1 +
 configs/socrates_defconfig                   |  1 +
 drivers/mtd/Kconfig                          | 27 ++++++++++++++++++++
 include/configs/10m50_devboard.h             |  1 -
 include/configs/3c120_devboard.h             |  2 --
 include/configs/M5208EVBE.h                  |  1 -
 include/configs/M5235EVB.h                   |  1 -
 include/configs/M5249EVB.h                   |  1 -
 include/configs/M5253DEMO.h                  |  1 -
 include/configs/M5272C3.h                    |  1 -
 include/configs/M5275EVB.h                   |  1 -
 include/configs/M5282EVB.h                   |  1 -
 include/configs/M53017EVB.h                  |  1 -
 include/configs/M5329EVB.h                   |  1 -
 include/configs/M5373EVB.h                   |  1 -
 include/configs/MCR3000.h                    |  1 -
 include/configs/MPC837XERDB.h                |  1 -
 include/configs/MPC8540ADS.h                 |  1 -
 include/configs/MPC8548CDS.h                 |  1 -
 include/configs/MPC8560ADS.h                 |  1 -
 include/configs/P1010RDB.h                   |  1 -
 include/configs/P2041RDB.h                   |  1 -
 include/configs/T102xRDB.h                   |  1 -
 include/configs/T104xRDB.h                   |  1 -
 include/configs/T208xQDS.h                   |  1 -
 include/configs/T208xRDB.h                   |  1 -
 include/configs/T4240RDB.h                   |  1 -
 include/configs/adp-ae3xx.h                  |  4 ---
 include/configs/adp-ag101p.h                 |  1 -
 include/configs/am335x_evm.h                 |  1 -
 include/configs/am3517_evm.h                 |  1 -
 include/configs/amcore.h                     |  1 -
 include/configs/armadillo-800eva.h           |  1 -
 include/configs/astro_mcf5373l.h             |  1 -
 include/configs/at91sam9263ek.h              |  1 -
 include/configs/ax25-ae350.h                 |  4 ---
 include/configs/bcm7445.h                    |  2 --
 include/configs/blanche.h                    |  1 -
 include/configs/bmips_bcm6338.h              |  2 --
 include/configs/bmips_bcm6348.h              |  2 --
 include/configs/bmips_bcm6358.h              |  2 --
 include/configs/bmips_bcm6368.h              |  2 --
 include/configs/boston.h                     |  2 --
 include/configs/cobra5272.h                  |  1 -
 include/configs/colibri_pxa270.h             |  1 -
 include/configs/corenet_ds.h                 |  1 -
 include/configs/da850evm.h                   |  1 -
 include/configs/devkit3250.h                 |  1 -
 include/configs/dra7xx_evm.h                 |  1 -
 include/configs/draak.h                      |  2 --
 include/configs/eb_cpu5282.h                 |  1 -
 include/configs/ebisu.h                      |  2 --
 include/configs/edminiv2.h                   |  1 -
 include/configs/ethernut5.h                  |  1 -
 include/configs/gazerbeam.h                  |  1 -
 include/configs/ids8313.h                    |  1 -
 include/configs/imx27lite-common.h           |  1 -
 include/configs/integrator-common.h          |  1 -
 include/configs/j721e_evm.h                  |  2 --
 include/configs/km/km-mpc83xx.h              |  1 -
 include/configs/km/pg-wcom-ls102xa.h         |  1 -
 include/configs/kmcent2.h                    |  1 -
 include/configs/kzm9g.h                      |  1 -
 include/configs/ls1021aqds.h                 |  1 -
 include/configs/ls1021atwr.h                 |  1 -
 include/configs/ls1043aqds.h                 |  1 -
 include/configs/ls1043ardb.h                 |  1 -
 include/configs/ls1046aqds.h                 |  1 -
 include/configs/ls1088aqds.h                 |  1 -
 include/configs/ls1088ardb.h                 |  1 -
 include/configs/ls2080aqds.h                 |  1 -
 include/configs/ls2080ardb.h                 |  1 -
 include/configs/lsxl.h                       |  1 -
 include/configs/malta.h                      |  1 -
 include/configs/mccmon6.h                    |  2 --
 include/configs/microblaze-generic.h         |  1 -
 include/configs/mx6sabreauto.h               |  1 -
 include/configs/octeon_ebb7304.h             |  1 -
 include/configs/omap3_logic.h                |  1 -
 include/configs/p1_p2_rdb_pc.h               |  2 --
 include/configs/pm9261.h                     |  1 -
 include/configs/pm9263.h                     |  1 -
 include/configs/qemu-arm.h                   |  2 --
 include/configs/qemu-riscv.h                 |  2 --
 include/configs/r2dplus.h                    |  1 -
 include/configs/salvator-x.h                 |  2 --
 include/configs/sama5d3xek.h                 |  1 -
 include/configs/socfpga_arria10_socdk.h      |  1 -
 include/configs/socfpga_soc64_common.h       |  1 -
 include/configs/socrates.h                   |  1 -
 include/configs/stih410-b2260.h              |  2 --
 include/configs/stm32f429-discovery.h        |  1 -
 include/configs/stm32f429-evaluation.h       |  1 -
 include/configs/stm32f469-discovery.h        |  1 -
 include/configs/stm32f746-disco.h            |  1 -
 include/configs/synquacer.h                  |  1 -
 include/configs/total_compute.h              |  1 -
 include/configs/ulcb.h                       |  2 --
 include/configs/vexpress_aemv8a.h            |  1 -
 include/configs/vexpress_common.h            |  1 -
 include/configs/xtfpga.h                     |  1 -
 include/configs/zynq-common.h                |  1 -
 scripts/config_whitelist.txt                 |  2 --
 174 files changed, 101 insertions(+), 127 deletions(-)

diff --git a/README b/README
index 9606a8b3ac..afae63f080 100644
--- a/README
+++ b/README
@@ -2265,9 +2265,6 @@ Configuration Settings:
 		Enables allocating and saving a kernel copy of the bd_info in
 		space between "bootm_low" and "bootm_low" + BOOTMAPSZ.
 
-- CONFIG_SYS_MAX_FLASH_BANKS:
-		Max number of Flash memory banks
-
 - CONFIG_SYS_MAX_FLASH_SECT:
 		Max number of sectors on a Flash chip
 
diff --git a/configs/3c120_defconfig b/configs/3c120_defconfig
index 1b7c795570..e7911f0a15 100644
--- a/configs/3c120_defconfig
+++ b/configs/3c120_defconfig
@@ -35,6 +35,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_PHY_MARVELL=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
diff --git a/configs/M5253DEMO_defconfig b/configs/M5253DEMO_defconfig
index 423e2f75ac..67f9875829 100644
--- a/configs/M5253DEMO_defconfig
+++ b/configs/M5253DEMO_defconfig
@@ -26,4 +26,5 @@ CONFIG_SYS_FSL_I2C_OFFSET=0x280
 CONFIG_SYS_I2C_SLAVE=0x7F
 CONFIG_SYS_I2C_SPEED=80000
 CONFIG_MTD_NOR_FLASH=y
+CONFIG_USE_SYS_MAX_FLASH_BANKS=y
 CONFIG_MCFUART=y
diff --git a/configs/MPC8548CDS_36BIT_defconfig b/configs/MPC8548CDS_36BIT_defconfig
index 3b43775263..01806c2c1f 100644
--- a/configs/MPC8548CDS_36BIT_defconfig
+++ b/configs/MPC8548CDS_36BIT_defconfig
@@ -37,6 +37,7 @@ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_DAVICOM=y
diff --git a/configs/MPC8548CDS_defconfig b/configs/MPC8548CDS_defconfig
index 551630b34b..16489cf3b3 100644
--- a/configs/MPC8548CDS_defconfig
+++ b/configs/MPC8548CDS_defconfig
@@ -36,6 +36,7 @@ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_DAVICOM=y
diff --git a/configs/MPC8548CDS_legacy_defconfig b/configs/MPC8548CDS_legacy_defconfig
index 6584f67d0b..76915b3d7a 100644
--- a/configs/MPC8548CDS_legacy_defconfig
+++ b/configs/MPC8548CDS_legacy_defconfig
@@ -36,6 +36,7 @@ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_DAVICOM=y
diff --git a/configs/P3041DS_NAND_defconfig b/configs/P3041DS_NAND_defconfig
index 96a6161f16..f30a281b83 100644
--- a/configs/P3041DS_NAND_defconfig
+++ b/configs/P3041DS_NAND_defconfig
@@ -48,6 +48,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_ELBC=y
 CONFIG_DM_SPI_FLASH=y
diff --git a/configs/P3041DS_SDCARD_defconfig b/configs/P3041DS_SDCARD_defconfig
index 49a30ddca1..6c028a2714 100644
--- a/configs/P3041DS_SDCARD_defconfig
+++ b/configs/P3041DS_SDCARD_defconfig
@@ -49,6 +49,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P3041DS_SPIFLASH_defconfig b/configs/P3041DS_SPIFLASH_defconfig
index 047d65b331..4896e87fa6 100644
--- a/configs/P3041DS_SPIFLASH_defconfig
+++ b/configs/P3041DS_SPIFLASH_defconfig
@@ -50,6 +50,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P3041DS_defconfig b/configs/P3041DS_defconfig
index 821a7c3bc1..f8ad1ea08e 100644
--- a/configs/P3041DS_defconfig
+++ b/configs/P3041DS_defconfig
@@ -45,6 +45,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P4080DS_SDCARD_defconfig b/configs/P4080DS_SDCARD_defconfig
index 9186ed1a5e..36c0ef6db9 100644
--- a/configs/P4080DS_SDCARD_defconfig
+++ b/configs/P4080DS_SDCARD_defconfig
@@ -48,6 +48,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P4080DS_SPIFLASH_defconfig b/configs/P4080DS_SPIFLASH_defconfig
index 2a4dc5db7d..32a1aa32a0 100644
--- a/configs/P4080DS_SPIFLASH_defconfig
+++ b/configs/P4080DS_SPIFLASH_defconfig
@@ -49,6 +49,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P4080DS_defconfig b/configs/P4080DS_defconfig
index 564f28caba..0869734425 100644
--- a/configs/P4080DS_defconfig
+++ b/configs/P4080DS_defconfig
@@ -44,6 +44,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P5040DS_NAND_defconfig b/configs/P5040DS_NAND_defconfig
index 370eb23e05..c444aa0074 100644
--- a/configs/P5040DS_NAND_defconfig
+++ b/configs/P5040DS_NAND_defconfig
@@ -49,6 +49,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_ELBC=y
 CONFIG_DM_SPI_FLASH=y
diff --git a/configs/P5040DS_SDCARD_defconfig b/configs/P5040DS_SDCARD_defconfig
index 8e0d33212c..f37b7e78a9 100644
--- a/configs/P5040DS_SDCARD_defconfig
+++ b/configs/P5040DS_SDCARD_defconfig
@@ -49,6 +49,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P5040DS_SPIFLASH_defconfig b/configs/P5040DS_SPIFLASH_defconfig
index 172f5ed250..823c92d0c2 100644
--- a/configs/P5040DS_SPIFLASH_defconfig
+++ b/configs/P5040DS_SPIFLASH_defconfig
@@ -50,6 +50,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P5040DS_defconfig b/configs/P5040DS_defconfig
index 79c6e466c7..7e653bd43a 100644
--- a/configs/P5040DS_defconfig
+++ b/configs/P5040DS_defconfig
@@ -45,6 +45,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/T1042D4RDB_NAND_defconfig b/configs/T1042D4RDB_NAND_defconfig
index c447fef5b5..d5866f3a49 100644
--- a/configs/T1042D4RDB_NAND_defconfig
+++ b/configs/T1042D4RDB_NAND_defconfig
@@ -73,6 +73,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/T1042D4RDB_SDCARD_defconfig b/configs/T1042D4RDB_SDCARD_defconfig
index 92037c544f..c52a7b901e 100644
--- a/configs/T1042D4RDB_SDCARD_defconfig
+++ b/configs/T1042D4RDB_SDCARD_defconfig
@@ -72,6 +72,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/T1042D4RDB_SPIFLASH_defconfig b/configs/T1042D4RDB_SPIFLASH_defconfig
index 37b5fae0ae..2f2e3e504b 100644
--- a/configs/T1042D4RDB_SPIFLASH_defconfig
+++ b/configs/T1042D4RDB_SPIFLASH_defconfig
@@ -74,6 +74,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/T1042D4RDB_defconfig b/configs/T1042D4RDB_defconfig
index f1ec400636..0d19746b10 100644
--- a/configs/T1042D4RDB_defconfig
+++ b/configs/T1042D4RDB_defconfig
@@ -57,6 +57,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/T2080QDS_NAND_defconfig b/configs/T2080QDS_NAND_defconfig
index c39329b751..9a3ce9ecb7 100644
--- a/configs/T2080QDS_NAND_defconfig
+++ b/configs/T2080QDS_NAND_defconfig
@@ -71,6 +71,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/T2080QDS_SDCARD_defconfig b/configs/T2080QDS_SDCARD_defconfig
index 1075acf561..dda7b485fd 100644
--- a/configs/T2080QDS_SDCARD_defconfig
+++ b/configs/T2080QDS_SDCARD_defconfig
@@ -70,6 +70,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T2080QDS_SECURE_BOOT_defconfig b/configs/T2080QDS_SECURE_BOOT_defconfig
index b761a1f850..b22c589c13 100644
--- a/configs/T2080QDS_SECURE_BOOT_defconfig
+++ b/configs/T2080QDS_SECURE_BOOT_defconfig
@@ -54,6 +54,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T2080QDS_SPIFLASH_defconfig b/configs/T2080QDS_SPIFLASH_defconfig
index 11a0ed4555..26c7c6562d 100644
--- a/configs/T2080QDS_SPIFLASH_defconfig
+++ b/configs/T2080QDS_SPIFLASH_defconfig
@@ -72,6 +72,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T2080QDS_defconfig b/configs/T2080QDS_defconfig
index d76547ab63..4e48392826 100644
--- a/configs/T2080QDS_defconfig
+++ b/configs/T2080QDS_defconfig
@@ -55,6 +55,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T4240RDB_SDCARD_defconfig b/configs/T4240RDB_SDCARD_defconfig
index bfd913a4e5..639cf50195 100644
--- a/configs/T4240RDB_SDCARD_defconfig
+++ b/configs/T4240RDB_SDCARD_defconfig
@@ -62,6 +62,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SST=y
diff --git a/configs/T4240RDB_defconfig b/configs/T4240RDB_defconfig
index c66b152d20..67435f4c00 100644
--- a/configs/T4240RDB_defconfig
+++ b/configs/T4240RDB_defconfig
@@ -47,6 +47,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SST=y
diff --git a/configs/boston32r2_defconfig b/configs/boston32r2_defconfig
index af99eecbae..459455733d 100644
--- a/configs/boston32r2_defconfig
+++ b/configs/boston32r2_defconfig
@@ -41,6 +41,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston32r2el_defconfig b/configs/boston32r2el_defconfig
index 380e3ddc49..20ba015cf5 100644
--- a/configs/boston32r2el_defconfig
+++ b/configs/boston32r2el_defconfig
@@ -42,6 +42,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston32r6_defconfig b/configs/boston32r6_defconfig
index 29ba6813eb..f2fe854d07 100644
--- a/configs/boston32r6_defconfig
+++ b/configs/boston32r6_defconfig
@@ -42,6 +42,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston32r6el_defconfig b/configs/boston32r6el_defconfig
index e78bb119d4..9118596d6b 100644
--- a/configs/boston32r6el_defconfig
+++ b/configs/boston32r6el_defconfig
@@ -43,6 +43,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston64r2_defconfig b/configs/boston64r2_defconfig
index b8724e9577..6794eb85c7 100644
--- a/configs/boston64r2_defconfig
+++ b/configs/boston64r2_defconfig
@@ -42,6 +42,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston64r2el_defconfig b/configs/boston64r2el_defconfig
index e055a30b95..78048843c6 100644
--- a/configs/boston64r2el_defconfig
+++ b/configs/boston64r2el_defconfig
@@ -43,6 +43,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston64r6_defconfig b/configs/boston64r6_defconfig
index 118a0f8b7c..35d0440f8d 100644
--- a/configs/boston64r6_defconfig
+++ b/configs/boston64r6_defconfig
@@ -42,6 +42,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/boston64r6el_defconfig b/configs/boston64r6el_defconfig
index e8d2c15b55..99004d8fea 100644
--- a/configs/boston64r6el_defconfig
+++ b/configs/boston64r6el_defconfig
@@ -43,6 +43,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PCH_GBE=y
 CONFIG_PCI=y
diff --git a/configs/cobra5272_defconfig b/configs/cobra5272_defconfig
index 7ae7ff3432..071b5f6b27 100644
--- a/configs/cobra5272_defconfig
+++ b/configs/cobra5272_defconfig
@@ -19,6 +19,7 @@ CONFIG_CMD_PING=y
 CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
+CONFIG_USE_SYS_MAX_FLASH_BANKS=y
 CONFIG_DM_ETH=y
 CONFIG_MCFFEC=y
 CONFIG_MII=y
diff --git a/configs/comtrend_ct5361_ram_defconfig b/configs/comtrend_ct5361_ram_defconfig
index 647031014a..d37f9bde1e 100644
--- a/configs/comtrend_ct5361_ram_defconfig
+++ b/configs/comtrend_ct5361_ram_defconfig
@@ -47,6 +47,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_PHY_FIXED=y
 CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
diff --git a/configs/comtrend_wap5813n_ram_defconfig b/configs/comtrend_wap5813n_ram_defconfig
index 8864a13424..198f13b2f7 100644
--- a/configs/comtrend_wap5813n_ram_defconfig
+++ b/configs/comtrend_wap5813n_ram_defconfig
@@ -47,6 +47,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_BCM6368_ETH=y
diff --git a/configs/ethernut5_defconfig b/configs/ethernut5_defconfig
index 1cf38b8d77..0da0b8b844 100644
--- a/configs/ethernut5_defconfig
+++ b/configs/ethernut5_defconfig
@@ -64,6 +64,7 @@ CONFIG_SYS_I2C_SOFT=y
 CONFIG_SYS_I2C_SOFT_SLAVE=0
 CONFIG_MTD=y
 CONFIG_MTD_NOR_FLASH=y
+CONFIG_USE_SYS_MAX_FLASH_BANKS=y
 CONFIG_MTD_RAW_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
 CONFIG_NAND_ATMEL=y
diff --git a/configs/huawei_hg556a_ram_defconfig b/configs/huawei_hg556a_ram_defconfig
index 81a412bed7..1a0a13a7ea 100644
--- a/configs/huawei_hg556a_ram_defconfig
+++ b/configs/huawei_hg556a_ram_defconfig
@@ -47,6 +47,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_PHY_FIXED=y
 CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
diff --git a/configs/j7200_evm_a72_defconfig b/configs/j7200_evm_a72_defconfig
index f38d77cd6d..eb1d7d46b8 100644
--- a/configs/j7200_evm_a72_defconfig
+++ b/configs/j7200_evm_a72_defconfig
@@ -135,6 +135,7 @@ CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_HBMC_AM654=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
diff --git a/configs/j7200_evm_r5_defconfig b/configs/j7200_evm_r5_defconfig
index aeb76e8023..1ff5cc91ca 100644
--- a/configs/j7200_evm_r5_defconfig
+++ b/configs/j7200_evm_r5_defconfig
@@ -105,6 +105,7 @@ CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_HBMC_AM654=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SFDP_SUPPORT=y
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index 53528dfbc6..2e45273903 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -131,6 +131,7 @@ CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_HBMC_AM654=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
diff --git a/configs/j721e_hs_evm_a72_defconfig b/configs/j721e_hs_evm_a72_defconfig
index ad51c1118b..ae184b0358 100644
--- a/configs/j721e_hs_evm_a72_defconfig
+++ b/configs/j721e_hs_evm_a72_defconfig
@@ -114,6 +114,7 @@ CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_HBMC_AM654=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_STMICRO=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
diff --git a/configs/ls1021aqds_ddr4_nor_defconfig b/configs/ls1021aqds_ddr4_nor_defconfig
index 8571ca392e..3efa2833e1 100644
--- a/configs/ls1021aqds_ddr4_nor_defconfig
+++ b/configs/ls1021aqds_ddr4_nor_defconfig
@@ -64,6 +64,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_ddr4_nor_lpuart_defconfig b/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
index ff27477740..778564f70b 100644
--- a/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
+++ b/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
@@ -65,6 +65,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_nand_defconfig b/configs/ls1021aqds_nand_defconfig
index d6b36e61bc..f0406db8ff 100644
--- a/configs/ls1021aqds_nand_defconfig
+++ b/configs/ls1021aqds_nand_defconfig
@@ -86,6 +86,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
 CONFIG_SYS_NAND_U_BOOT_LOCATIONS=y
diff --git a/configs/ls1021aqds_nor_SECURE_BOOT_defconfig b/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
index 725e2f4412..144b11f4ff 100644
--- a/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
+++ b/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
@@ -63,6 +63,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_nor_defconfig b/configs/ls1021aqds_nor_defconfig
index 3a2fe03139..8e106bd93e 100644
--- a/configs/ls1021aqds_nor_defconfig
+++ b/configs/ls1021aqds_nor_defconfig
@@ -65,6 +65,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_nor_lpuart_defconfig b/configs/ls1021aqds_nor_lpuart_defconfig
index 6a0523b8e0..e5de6bd3bd 100644
--- a/configs/ls1021aqds_nor_lpuart_defconfig
+++ b/configs/ls1021aqds_nor_lpuart_defconfig
@@ -66,6 +66,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_sdcard_ifc_defconfig b/configs/ls1021aqds_sdcard_ifc_defconfig
index e9efcd7fbc..8dfdcdba80 100644
--- a/configs/ls1021aqds_sdcard_ifc_defconfig
+++ b/configs/ls1021aqds_sdcard_ifc_defconfig
@@ -84,6 +84,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_SECURE_BOOT_defconfig b/configs/ls1046aqds_SECURE_BOOT_defconfig
index eb32965146..4c84418a18 100644
--- a/configs/ls1046aqds_SECURE_BOOT_defconfig
+++ b/configs/ls1046aqds_SECURE_BOOT_defconfig
@@ -56,6 +56,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_defconfig b/configs/ls1046aqds_defconfig
index a8d9441df3..b3e309e39d 100644
--- a/configs/ls1046aqds_defconfig
+++ b/configs/ls1046aqds_defconfig
@@ -59,6 +59,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_lpuart_defconfig b/configs/ls1046aqds_lpuart_defconfig
index e41c91619e..e6e91fad6b 100644
--- a/configs/ls1046aqds_lpuart_defconfig
+++ b/configs/ls1046aqds_lpuart_defconfig
@@ -60,6 +60,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_nand_defconfig b/configs/ls1046aqds_nand_defconfig
index 25a178f793..dedc0f3aa4 100644
--- a/configs/ls1046aqds_nand_defconfig
+++ b/configs/ls1046aqds_nand_defconfig
@@ -78,6 +78,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
 CONFIG_SYS_NAND_U_BOOT_LOCATIONS=y
diff --git a/configs/ls1046aqds_sdcard_ifc_defconfig b/configs/ls1046aqds_sdcard_ifc_defconfig
index d9d4bf264a..cb77e98766 100644
--- a/configs/ls1046aqds_sdcard_ifc_defconfig
+++ b/configs/ls1046aqds_sdcard_ifc_defconfig
@@ -79,6 +79,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
index a73ced200c..e5ca91cb81 100644
--- a/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
@@ -59,6 +59,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_tfa_defconfig b/configs/ls1046aqds_tfa_defconfig
index 4bf413c0eb..cd3becaec0 100644
--- a/configs/ls1046aqds_tfa_defconfig
+++ b/configs/ls1046aqds_tfa_defconfig
@@ -69,6 +69,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1088aqds_defconfig b/configs/ls1088aqds_defconfig
index 51e5622226..04878d40eb 100644
--- a/configs/ls1088aqds_defconfig
+++ b/configs/ls1088aqds_defconfig
@@ -57,6 +57,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1088aqds_sdcard_ifc_defconfig b/configs/ls1088aqds_sdcard_ifc_defconfig
index 5a85ac40e4..7b1e1882d8 100644
--- a/configs/ls1088aqds_sdcard_ifc_defconfig
+++ b/configs/ls1088aqds_sdcard_ifc_defconfig
@@ -68,6 +68,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1088aqds_tfa_defconfig b/configs/ls1088aqds_tfa_defconfig
index eeb4313420..ecb7d9de77 100644
--- a/configs/ls1088aqds_tfa_defconfig
+++ b/configs/ls1088aqds_tfa_defconfig
@@ -70,6 +70,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls2080aqds_SECURE_BOOT_defconfig b/configs/ls2080aqds_SECURE_BOOT_defconfig
index d56a6ac1f8..1a2e27cba6 100644
--- a/configs/ls2080aqds_SECURE_BOOT_defconfig
+++ b/configs/ls2080aqds_SECURE_BOOT_defconfig
@@ -50,6 +50,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls2080aqds_defconfig b/configs/ls2080aqds_defconfig
index a8cad445b8..c2434b3fae 100644
--- a/configs/ls2080aqds_defconfig
+++ b/configs/ls2080aqds_defconfig
@@ -53,6 +53,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls2088aqds_tfa_defconfig b/configs/ls2088aqds_tfa_defconfig
index 6821ed1a45..68cca2da26 100644
--- a/configs/ls2088aqds_tfa_defconfig
+++ b/configs/ls2088aqds_tfa_defconfig
@@ -66,6 +66,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
index e8a6f752cd..b7d6fbaf17 100644
--- a/configs/qemu_arm64_defconfig
+++ b/configs/qemu_arm64_defconfig
@@ -41,6 +41,8 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_E1000=y
 CONFIG_NVME=y
diff --git a/configs/qemu_arm_defconfig b/configs/qemu_arm_defconfig
index b459305144..f1792ac745 100644
--- a/configs/qemu_arm_defconfig
+++ b/configs/qemu_arm_defconfig
@@ -43,6 +43,8 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_E1000=y
 CONFIG_NVME=y
diff --git a/configs/r8a77990_ebisu_defconfig b/configs/r8a77990_ebisu_defconfig
index 0c1e5a1592..f04a99f176 100644
--- a/configs/r8a77990_ebisu_defconfig
+++ b/configs/r8a77990_ebisu_defconfig
@@ -68,6 +68,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/r8a77995_draak_defconfig b/configs/r8a77995_draak_defconfig
index fcf4268592..1bd7d296b9 100644
--- a/configs/r8a77995_draak_defconfig
+++ b/configs/r8a77995_draak_defconfig
@@ -62,6 +62,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/rcar3_salvator-x_defconfig b/configs/rcar3_salvator-x_defconfig
index 2b2c273f6a..0a9fd4c3d1 100644
--- a/configs/rcar3_salvator-x_defconfig
+++ b/configs/rcar3_salvator-x_defconfig
@@ -69,6 +69,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/rcar3_ulcb_defconfig b/configs/rcar3_ulcb_defconfig
index 0a9bed36a2..bbcdcec041 100644
--- a/configs/rcar3_ulcb_defconfig
+++ b/configs/rcar3_ulcb_defconfig
@@ -70,6 +70,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/sfr_nb4-ser_ram_defconfig b/configs/sfr_nb4-ser_ram_defconfig
index bbcb944212..4c5bc11783 100644
--- a/configs/sfr_nb4-ser_ram_defconfig
+++ b/configs/sfr_nb4-ser_ram_defconfig
@@ -49,6 +49,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_PHY_FIXED=y
 CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
diff --git a/configs/socrates_defconfig b/configs/socrates_defconfig
index 72c07179db..75691fa7a0 100644
--- a/configs/socrates_defconfig
+++ b/configs/socrates_defconfig
@@ -49,6 +49,7 @@ CONFIG_MTD=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index a9c8c48ae6..bde3004171 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -31,6 +31,7 @@ config SYS_MTDPARTS_RUNTIME
 
 config FLASH_CFI_DRIVER
 	bool "Enable CFI Flash driver"
+	select USE_SYS_MAX_FLASH_BANKS
 	help
 	  The Common Flash Interface specification was developed by Intel,
 	  AMD and other flash manufactures. It provides a universal method
@@ -82,6 +83,7 @@ config SYS_FLASH_CFI
 config ALTERA_QSPI
 	bool "Altera Generic Quad SPI Controller"
 	depends on DM_MTD
+	select USE_SYS_MAX_FLASH_BANKS
 	help
 	  This enables access to Altera EPCQ/EPCS flash chips using the
 	  Altera Generic Quad SPI Controller. The controller converts SPI
@@ -91,6 +93,7 @@ config ALTERA_QSPI
 config FLASH_PIC32
 	bool "Microchip PIC32 Flash driver"
 	depends on MACH_PIC32 && DM_MTD
+	select USE_SYS_MAX_FLASH_BANKS
 	help
 	  This enables access to Microchip PIC32 internal non-CFI flash
 	  chips through PIC32 Non-Volatile-Memory Controller.
@@ -112,10 +115,34 @@ config HBMC_AM654
 config STM32_FLASH
 	bool "STM32 MCU Flash driver"
 	depends on ARCH_STM32
+	select USE_SYS_MAX_FLASH_BANKS
 	help
 	 This is the driver of embedded flash for some STMicroelectronics
 	 STM32 MCU.
 
+config USE_SYS_MAX_FLASH_BANKS
+	bool "Enable Max number of Flash memory banks"
+	help
+	  When this option is enabled, the CONFIG_SYS_MAX_FLASH_BANKS
+	  will be defined.
+
+config SYS_MAX_FLASH_BANKS
+	int "Max number of Flash memory banks"
+	depends on USE_SYS_MAX_FLASH_BANKS
+	default 1
+	help
+	 Max number of Flash memory banks using by the MTD framework, in the
+	 flash CFI driver and in some other driver to define the flash_info
+	 struct declaration.
+
+config SYS_MAX_FLASH_BANKS_DETECT
+	bool "Detection of flash banks number in CFI driver"
+	depends on CFI_FLASH && FLASH_CFI_DRIVER
+	help
+	 This enables detection of number of flash banks in CFI driver,
+	 to reduce the effective number of flash bank, between 0 and
+	 CONFIG_SYS_MAX_FLASH_BANKS
+
 source "drivers/mtd/nand/Kconfig"
 
 config SYS_NAND_MAX_CHIPS
diff --git a/include/configs/10m50_devboard.h b/include/configs/10m50_devboard.h
index 709a449e79..04ce88c9dd 100644
--- a/include/configs/10m50_devboard.h
+++ b/include/configs/10m50_devboard.h
@@ -20,7 +20,6 @@
 /*
  * Flash
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	1024
 
 /*
diff --git a/include/configs/3c120_devboard.h b/include/configs/3c120_devboard.h
index e52fedcf39..e12e54fe4f 100644
--- a/include/configs/3c120_devboard.h
+++ b/include/configs/3c120_devboard.h
@@ -20,8 +20,6 @@
  * CFI Flash
  */
 #define CONFIG_SYS_CFI_FLASH_STATUS_POLL /* fix amd flash issue */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 
 /*
diff --git a/include/configs/M5208EVBE.h b/include/configs/M5208EVBE.h
index 6a69ac45ae..9c1f2e1464 100644
--- a/include/configs/M5208EVBE.h
+++ b/include/configs/M5208EVBE.h
@@ -113,7 +113,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	254	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5235EVB.h b/include/configs/M5235EVB.h
index 7421f3b760..9eeefa05e2 100644
--- a/include/configs/M5235EVB.h
+++ b/include/configs/M5235EVB.h
@@ -128,7 +128,6 @@
 #else
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #endif
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5249EVB.h b/include/configs/M5249EVB.h
index 7ee0ec6a4a..866c968dfa 100644
--- a/include/configs/M5249EVB.h
+++ b/include/configs/M5249EVB.h
@@ -91,7 +91,6 @@
 
 #	define CONFIG_SYS_FLASH_SIZE		0x1000000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #	define CONFIG_SYS_FLASH_CHECKSUM
 #	define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
diff --git a/include/configs/M5253DEMO.h b/include/configs/M5253DEMO.h
index e9a7922921..1ffb32f92e 100644
--- a/include/configs/M5253DEMO.h
+++ b/include/configs/M5253DEMO.h
@@ -128,7 +128,6 @@
 
 /* FLASH organization */
 #define CONFIG_SYS_FLASH_BASE		(CONFIG_SYS_CS0_BASE)
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	2048	/* max number of sectors on one chip */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/M5272C3.h b/include/configs/M5272C3.h
index 1204aa07a9..924d4412f1 100644
--- a/include/configs/M5272C3.h
+++ b/include/configs/M5272C3.h
@@ -124,7 +124,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5275EVB.h b/include/configs/M5275EVB.h
index 8e03fc995f..66ead7d922 100644
--- a/include/configs/M5275EVB.h
+++ b/include/configs/M5275EVB.h
@@ -129,7 +129,6 @@
 /*-----------------------------------------------------------------------
  * FLASH organization
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	11	/* max number of sectors on one chip */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/M5282EVB.h b/include/configs/M5282EVB.h
index 800a731914..df95eead1c 100644
--- a/include/configs/M5282EVB.h
+++ b/include/configs/M5282EVB.h
@@ -129,7 +129,6 @@
 
 #	define CONFIG_SYS_FLASH_SIZE		0x1000000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #	define CONFIG_SYS_FLASH_CHECKSUM
 #	define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
diff --git a/include/configs/M53017EVB.h b/include/configs/M53017EVB.h
index 7b33677c55..208f7166df 100644
--- a/include/configs/M53017EVB.h
+++ b/include/configs/M53017EVB.h
@@ -132,7 +132,6 @@
 #	define CONFIG_FLASH_SPANSION_S29WS_N	1
 #	define CONFIG_SYS_FLASH_SIZE		0x1000000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5329EVB.h b/include/configs/M5329EVB.h
index 19d8cfe321..608f1d880b 100644
--- a/include/configs/M5329EVB.h
+++ b/include/configs/M5329EVB.h
@@ -127,7 +127,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5373EVB.h b/include/configs/M5373EVB.h
index e2ddc4893e..39d6c79723 100644
--- a/include/configs/M5373EVB.h
+++ b/include/configs/M5373EVB.h
@@ -129,7 +129,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/MCR3000.h b/include/configs/MCR3000.h
index bfb092ab17..4a26ae8f7f 100644
--- a/include/configs/MCR3000.h
+++ b/include/configs/MCR3000.h
@@ -69,7 +69,6 @@
 
 /* FLASH organization */
 #define CONFIG_SYS_FLASH_BASE		CONFIG_SYS_TEXT_BASE
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	35
 #define CONFIG_SYS_FLASH_ERASE_TOUT	120000
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500
diff --git a/include/configs/MPC837XERDB.h b/include/configs/MPC837XERDB.h
index 72119a1cf0..e8dc4226e1 100644
--- a/include/configs/MPC837XERDB.h
+++ b/include/configs/MPC837XERDB.h
@@ -155,7 +155,6 @@
 #define CONFIG_SYS_FLASH_EMPTY_INFO		/* display empty sectors */
 
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1 /* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	256 /* max sectors per device */
 
 #undef	CONFIG_SYS_FLASH_CHECKSUM
diff --git a/include/configs/MPC8540ADS.h b/include/configs/MPC8540ADS.h
index fe156e7815..466d4ad034 100644
--- a/include/configs/MPC8540ADS.h
+++ b/include/configs/MPC8540ADS.h
@@ -93,7 +93,6 @@
 #define CONFIG_SYS_BR0_PRELIM		0xff001801	/* port size 32bit */
 
 #define CONFIG_SYS_OR0_PRELIM		0xff006ff7	/* 16MB Flash */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	64		/* sectors per device */
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/MPC8548CDS.h b/include/configs/MPC8548CDS.h
index 5c54bad496..195ee151b0 100644
--- a/include/configs/MPC8548CDS.h
+++ b/include/configs/MPC8548CDS.h
@@ -144,7 +144,6 @@ extern unsigned long get_clock_freq(void);
 
 #define CONFIG_SYS_FLASH_BANKS_LIST \
 	{CONFIG_SYS_FLASH_BASE_PHYS + 0x800000, CONFIG_SYS_FLASH_BASE_PHYS}
-#define CONFIG_SYS_MAX_FLASH_BANKS	2		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	128		/* sectors per device */
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/MPC8560ADS.h b/include/configs/MPC8560ADS.h
index dcd538fdf1..10b543d05b 100644
--- a/include/configs/MPC8560ADS.h
+++ b/include/configs/MPC8560ADS.h
@@ -93,7 +93,6 @@
 #define CONFIG_SYS_BR0_PRELIM		0xff001801	/* port size 32bit */
 
 #define CONFIG_SYS_OR0_PRELIM		0xff006ff7	/* 16MB Flash */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	64		/* sectors per device */
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/P1010RDB.h b/include/configs/P1010RDB.h
index 1841eff69c..bf4aa97f99 100644
--- a/include/configs/P1010RDB.h
+++ b/include/configs/P1010RDB.h
@@ -275,7 +275,6 @@ extern unsigned long get_sdram_size(void);
 #define CONFIG_SYS_FLASH_BANKS_LIST	{CONFIG_SYS_FLASH_BASE_PHYS}
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 
 #undef CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/P2041RDB.h b/include/configs/P2041RDB.h
index bf8a92c69b..ad0873179f 100644
--- a/include/configs/P2041RDB.h
+++ b/include/configs/P2041RDB.h
@@ -148,7 +148,6 @@ unsigned long get_board_sys_clk(unsigned long dummy);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024		/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000		/* Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500		/* Write Timeout (ms) */
diff --git a/include/configs/T102xRDB.h b/include/configs/T102xRDB.h
index 89bbeb7784..820e87cdfb 100644
--- a/include/configs/T102xRDB.h
+++ b/include/configs/T102xRDB.h
@@ -209,7 +209,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T104xRDB.h b/include/configs/T104xRDB.h
index 48fc8a271c..e030111415 100644
--- a/include/configs/T104xRDB.h
+++ b/include/configs/T104xRDB.h
@@ -180,7 +180,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T208xQDS.h b/include/configs/T208xQDS.h
index 78562bc08f..fad4a072e6 100644
--- a/include/configs/T208xQDS.h
+++ b/include/configs/T208xQDS.h
@@ -168,7 +168,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T208xRDB.h b/include/configs/T208xRDB.h
index 471ed94b80..383954f3a1 100644
--- a/include/configs/T208xRDB.h
+++ b/include/configs/T208xRDB.h
@@ -158,7 +158,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T4240RDB.h b/include/configs/T4240RDB.h
index f6ccaf4952..a45305bbc0 100644
--- a/include/configs/T4240RDB.h
+++ b/include/configs/T4240RDB.h
@@ -274,7 +274,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/adp-ae3xx.h b/include/configs/adp-ae3xx.h
index d8fc1758b8..eec3c691b8 100644
--- a/include/configs/adp-ae3xx.h
+++ b/include/configs/adp-ae3xx.h
@@ -158,9 +158,6 @@
 #define CONFIG_SYS_CFI_FLASH_STATUS_POLL
 
 /* support JEDEC */
-#ifdef CONFIG_CFI_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
-#endif
 
 /* Do not use CONFIG_FLASH_CFI_LEGACY to detect on board flash */
 #define PHYS_FLASH_1			0x88000000	/* BANK 0 */
@@ -176,7 +173,6 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/adp-ag101p.h b/include/configs/adp-ag101p.h
index 072cd535c3..a56ae41e28 100644
--- a/include/configs/adp-ag101p.h
+++ b/include/configs/adp-ag101p.h
@@ -289,7 +289,6 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
index 7fb1b3a3e3..4c2f68298f 100644
--- a/include/configs/am335x_evm.h
+++ b/include/configs/am335x_evm.h
@@ -270,7 +270,6 @@
  */
 #if defined(CONFIG_NOR)
 #define CONFIG_SYS_MAX_FLASH_SECT	128
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BASE		(0x08000000)
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #define CONFIG_SYS_FLASH_SIZE		0x01000000
diff --git a/include/configs/am3517_evm.h b/include/configs/am3517_evm.h
index bf01a777cc..6e19e6b08f 100644
--- a/include/configs/am3517_evm.h
+++ b/include/configs/am3517_evm.h
@@ -130,7 +130,6 @@
 /* **** PISMO SUPPORT *** */
 #define CONFIG_SYS_MAX_FLASH_SECT	520	/* max number of sectors */
 						/* on one chip */
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* max number of flash banks */
 #define CONFIG_SYS_MONITOR_LEN		(256 << 10)	/* Reserve 2 sectors */
 
 #if defined(CONFIG_MTD_RAW_NAND)
diff --git a/include/configs/amcore.h b/include/configs/amcore.h
index fd05ea69e3..e29bf7cbe3 100644
--- a/include/configs/amcore.h
+++ b/include/configs/amcore.h
@@ -41,7 +41,6 @@
 #define CONFIG_SYS_SDRAM_BASE		0x00000000
 #define CONFIG_SYS_SDRAM_SIZE		0x1000000
 #define CONFIG_SYS_FLASH_BASE		0xffc00000
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	1024
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/armadillo-800eva.h b/include/configs/armadillo-800eva.h
index 73f63c5a9f..3d02a19d36 100644
--- a/include/configs/armadillo-800eva.h
+++ b/include/configs/armadillo-800eva.h
@@ -53,7 +53,6 @@
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #define CONFIG_SYS_FLASH_BASE		0x00000000
 #define CONFIG_SYS_MAX_FLASH_SECT	512
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ (CONFIG_SYS_FLASH_BASE) }
 
 #define CONFIG_SYS_FLASH_ERASE_TOUT	3000
diff --git a/include/configs/astro_mcf5373l.h b/include/configs/astro_mcf5373l.h
index 36e351f358..c39df86ff0 100644
--- a/include/configs/astro_mcf5373l.h
+++ b/include/configs/astro_mcf5373l.h
@@ -241,7 +241,6 @@
 						(CONFIG_SYS_SDRAM_SIZE << 20))
 
 /* FLASH organization */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	259
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
index e7fca468aa..f94f25f974 100644
--- a/include/configs/at91sam9263ek.h
+++ b/include/configs/at91sam9263ek.h
@@ -58,7 +58,6 @@
 #define PHYS_FLASH_1				0x10000000
 #define CONFIG_SYS_FLASH_BASE			PHYS_FLASH_1
 #define CONFIG_SYS_MAX_FLASH_SECT		256
-#define CONFIG_SYS_MAX_FLASH_BANKS		1
 
 #define CONFIG_SYS_MONITOR_SEC	1:0-3
 #define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
diff --git a/include/configs/ax25-ae350.h b/include/configs/ax25-ae350.h
index 2ad0d1589c..3903dcf3e9 100644
--- a/include/configs/ax25-ae350.h
+++ b/include/configs/ax25-ae350.h
@@ -79,9 +79,6 @@
 #define CONFIG_SYS_CFI_FLASH_STATUS_POLL
 
 /* support JEDEC */
-#ifdef CONFIG_CFI_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
-#endif/* Do not use CONFIG_FLASH_CFI_LEGACY to detect on board flash */
 #define PHYS_FLASH_1			0x88000000	/* BANK 0 */
 #define CONFIG_SYS_FLASH_BASE		PHYS_FLASH_1
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ PHYS_FLASH_1, }
@@ -95,7 +92,6 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
 */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/bcm7445.h b/include/configs/bcm7445.h
index 81c3d02c6b..4b41dc220b 100644
--- a/include/configs/bcm7445.h
+++ b/include/configs/bcm7445.h
@@ -28,6 +28,4 @@
  * Environment configuration for SPI flash.
  */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-
 #endif	/* __CONFIG_H */
diff --git a/include/configs/blanche.h b/include/configs/blanche.h
index f048f158ed..a20b527fbd 100644
--- a/include/configs/blanche.h
+++ b/include/configs/blanche.h
@@ -34,7 +34,6 @@
 #define CONFIG_SYS_FLASH_BASE		0x00000000
 #define CONFIG_SYS_FLASH_SIZE		0x04000000	/* 64 MB */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ (CONFIG_SYS_FLASH_BASE) }
 #define CONFIG_SYS_FLASH_BANKS_SIZES	{ (CONFIG_SYS_FLASH_SIZE) }
 
diff --git a/include/configs/bmips_bcm6338.h b/include/configs/bmips_bcm6338.h
index b7de3f4058..ddaa540513 100644
--- a/include/configs/bmips_bcm6338.h
+++ b/include/configs/bmips_bcm6338.h
@@ -22,7 +22,5 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xbfc00000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS		1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6338_H */
diff --git a/include/configs/bmips_bcm6348.h b/include/configs/bmips_bcm6348.h
index 5ed0eebce4..af1c3673fb 100644
--- a/include/configs/bmips_bcm6348.h
+++ b/include/configs/bmips_bcm6348.h
@@ -29,7 +29,5 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xbfc00000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS		1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6348_H */
diff --git a/include/configs/bmips_bcm6358.h b/include/configs/bmips_bcm6358.h
index 829e9f6b17..6cb09492aa 100644
--- a/include/configs/bmips_bcm6358.h
+++ b/include/configs/bmips_bcm6358.h
@@ -31,7 +31,5 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xbe000000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6358_H */
diff --git a/include/configs/bmips_bcm6368.h b/include/configs/bmips_bcm6368.h
index 0952b98473..8a22dc1a3c 100644
--- a/include/configs/bmips_bcm6368.h
+++ b/include/configs/bmips_bcm6368.h
@@ -31,7 +31,5 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xb8000000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6368_H */
diff --git a/include/configs/boston.h b/include/configs/boston.h
index 7ac044e929..347b178633 100644
--- a/include/configs/boston.h
+++ b/include/configs/boston.h
@@ -41,8 +41,6 @@
  * Flash
  */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT		1024
 
 /*
diff --git a/include/configs/cobra5272.h b/include/configs/cobra5272.h
index dbb47ccb2a..aaf0312e6f 100644
--- a/include/configs/cobra5272.h
+++ b/include/configs/cobra5272.h
@@ -225,7 +225,6 @@ enter a valid image address in flash */
 /*-----------------------------------------------------------------------
  * FLASH organization
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks		*/
 #define CONFIG_SYS_MAX_FLASH_SECT	11	/* max number of sectors on one chip	*/
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000	/* flash timeout */
 
diff --git a/include/configs/colibri_pxa270.h b/include/configs/colibri_pxa270.h
index 08786765d5..b23f4ac53a 100644
--- a/include/configs/colibri_pxa270.h
+++ b/include/configs/colibri_pxa270.h
@@ -93,7 +93,6 @@
 #define	CONFIG_SYS_FLASH_CFI_WIDTH      FLASH_CFI_32BIT
 
 #define	CONFIG_SYS_MAX_FLASH_SECT	(4 + 255)
-#define	CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #define	CONFIG_SYS_FLASH_ERASE_TOUT	(25 * CONFIG_SYS_HZ)
 #define	CONFIG_SYS_FLASH_WRITE_TOUT	(25 * CONFIG_SYS_HZ)
diff --git a/include/configs/corenet_ds.h b/include/configs/corenet_ds.h
index 1e55d5259d..aefcd04ae8 100644
--- a/include/configs/corenet_ds.h
+++ b/include/configs/corenet_ds.h
@@ -150,7 +150,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024		/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000		/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500		/* Flash Write Timeout (ms) */
diff --git a/include/configs/da850evm.h b/include/configs/da850evm.h
index f7c5d400cf..3db901fc53 100644
--- a/include/configs/da850evm.h
+++ b/include/configs/da850evm.h
@@ -150,7 +150,6 @@
 #endif
 
 #ifdef CONFIG_MTD_NOR_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS	1 /* max number of flash banks */
 #define CONFIG_SYS_FLASH_SECT_SZ	(128 << 10) /* 128KB */
 #define CONFIG_SYS_FLASH_BASE		DAVINCI_ASYNC_EMIF_DATA_CE2_BASE
 #define PHYS_FLASH_SIZE			(8 << 20) /* Flash size 8MB */
diff --git a/include/configs/devkit3250.h b/include/configs/devkit3250.h
index 8e8ea56f3c..4f1dffc32f 100644
--- a/include/configs/devkit3250.h
+++ b/include/configs/devkit3250.h
@@ -40,7 +40,6 @@
 /*
  * NOR Flash
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	71
 #define CONFIG_SYS_FLASH_BASE		EMC_CS0_BASE
 #define CONFIG_SYS_FLASH_SIZE		SZ_4M
diff --git a/include/configs/dra7xx_evm.h b/include/configs/dra7xx_evm.h
index 900c5fd233..aec30c461d 100644
--- a/include/configs/dra7xx_evm.h
+++ b/include/configs/dra7xx_evm.h
@@ -103,7 +103,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #define CONFIG_SYS_FLASH_SIZE		(64 * 1024 * 1024) /* 64 MB */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BASE		(0x08000000)
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 /* Reduce SPL size by removing unlikey targets */
diff --git a/include/configs/draak.h b/include/configs/draak.h
index 412c57f150..e3e2b6a0bd 100644
--- a/include/configs/draak.h
+++ b/include/configs/draak.h
@@ -23,8 +23,6 @@
 #define CONFIG_FLASH_SHOW_PROGRESS	45
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/eb_cpu5282.h b/include/configs/eb_cpu5282.h
index 1949c3f558..ddc752fb3f 100644
--- a/include/configs/eb_cpu5282.h
+++ b/include/configs/eb_cpu5282.h
@@ -120,7 +120,6 @@
 #define CONFIG_SYS_INT_FLASH_ENABLE	0x21
 
 #define	CONFIG_SYS_MAX_FLASH_SECT	128
-#define	CONFIG_SYS_MAX_FLASH_BANKS	1
 #define	CONFIG_SYS_FLASH_ERASE_TOUT	10000000
 
 #define CONFIG_SYS_FLASH_SIZE		16*1024*1024
diff --git a/include/configs/ebisu.h b/include/configs/ebisu.h
index eef2b69bbd..94d46ec372 100644
--- a/include/configs/ebisu.h
+++ b/include/configs/ebisu.h
@@ -27,8 +27,6 @@
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/edminiv2.h b/include/configs/edminiv2.h
index 664d6d1f34..c48c9d1b57 100644
--- a/include/configs/edminiv2.h
+++ b/include/configs/edminiv2.h
@@ -88,7 +88,6 @@
  * FLASH configuration
  */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1  /* max num of flash banks       */
 #define CONFIG_SYS_MAX_FLASH_SECT	11 /* max num of sects on one chip */
 #define CONFIG_SYS_FLASH_BASE		0xfff80000
 
diff --git a/include/configs/ethernut5.h b/include/configs/ethernut5.h
index c0bdfd3f8f..91b2599851 100644
--- a/include/configs/ethernut5.h
+++ b/include/configs/ethernut5.h
@@ -32,7 +32,6 @@
 #define CONFIG_SYS_SDRAM_SIZE		(128 << 20)
 
 /* 512kB on-chip NOR flash */
-# define CONFIG_SYS_MAX_FLASH_BANKS	1
 # define CONFIG_SYS_FLASH_BASE		0x00200000 /* AT91SAM9XE_FLASH_BASE */
 # define CONFIG_AT91_EFLASH
 # define CONFIG_SYS_MAX_FLASH_SECT	32
diff --git a/include/configs/gazerbeam.h b/include/configs/gazerbeam.h
index ec5fc15696..ee6dcb03a0 100644
--- a/include/configs/gazerbeam.h
+++ b/include/configs/gazerbeam.h
@@ -43,7 +43,6 @@
 #define CONFIG_SYS_FLASH_BASE		0xFE000000 /* FLASH base address */
 #define CONFIG_SYS_FLASH_SIZE		8 /* FLASH size is up to 8M */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1 /* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	135
 
 #define CONFIG_SYS_BAUDRATE_TABLE  \
diff --git a/include/configs/ids8313.h b/include/configs/ids8313.h
index 370f7ed2bc..57e30570b7 100644
--- a/include/configs/ids8313.h
+++ b/include/configs/ids8313.h
@@ -118,7 +118,6 @@
 #define CONFIG_SYS_FLASH_SIZE		8
 
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	128
 
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000
diff --git a/include/configs/imx27lite-common.h b/include/configs/imx27lite-common.h
index c289d694e9..15b3c3f983 100644
--- a/include/configs/imx27lite-common.h
+++ b/include/configs/imx27lite-common.h
@@ -77,7 +77,6 @@
  */
 /* Use buffered writes (~10x faster) */
 /* Use hardware sector protection */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of flash banks */
 /* CS2 Base address */
 #define PHYS_FLASH_1			0xc0000000
 /* Flash Base for U-Boot */
diff --git a/include/configs/integrator-common.h b/include/configs/integrator-common.h
index b573bdc64f..48d522550e 100644
--- a/include/configs/integrator-common.h
+++ b/include/configs/integrator-common.h
@@ -74,7 +74,6 @@
  * - U-Boot environment
  */
 #define CONFIG_SYS_FLASH_BASE		0x24000000
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 /* Timeout values in ticks */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	(2 * CONFIG_SYS_HZ) /* Erase Timeout */
diff --git a/include/configs/j721e_evm.h b/include/configs/j721e_evm.h
index acac81ad68..abea7517e8 100644
--- a/include/configs/j721e_evm.h
+++ b/include/configs/j721e_evm.h
@@ -60,8 +60,6 @@
 #define CONFIG_CQSPI_REF_CLK		133333333
 
 /* HyperFlash related configuration */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 /* U-Boot general configuration */
 #define EXTRA_ENV_J721E_BOARD_SETTINGS					\
diff --git a/include/configs/km/km-mpc83xx.h b/include/configs/km/km-mpc83xx.h
index 45db5cf873..7c979c5fa9 100644
--- a/include/configs/km/km-mpc83xx.h
+++ b/include/configs/km/km-mpc83xx.h
@@ -56,7 +56,6 @@
  */
 #define CONFIG_SYS_FLASH_SIZE		256 /* max FLASH size is 256M */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1   /* max num of flash banks	*/
 #define CONFIG_SYS_MAX_FLASH_SECT	512 /* max num of sects on one chip */
 #define CONFIG_SYS_FLASH_BANKS_LIST { CONFIG_SYS_FLASH_BASE }
 
diff --git a/include/configs/km/pg-wcom-ls102xa.h b/include/configs/km/pg-wcom-ls102xa.h
index 743d09e9c4..1431c788e9 100644
--- a/include/configs/km/pg-wcom-ls102xa.h
+++ b/include/configs/km/pg-wcom-ls102xa.h
@@ -73,7 +73,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	512	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/kmcent2.h b/include/configs/kmcent2.h
index 4dbd53c387..89fe576ee1 100644
--- a/include/configs/kmcent2.h
+++ b/include/configs/kmcent2.h
@@ -249,7 +249,6 @@
 /* More NOR Flash params */
 #define CONFIG_SYS_FLASH_QUIET_TEST
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	512	/* sectors per device */
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO
diff --git a/include/configs/kzm9g.h b/include/configs/kzm9g.h
index c3f690c7d7..9a7b52a8fc 100644
--- a/include/configs/kzm9g.h
+++ b/include/configs/kzm9g.h
@@ -20,7 +20,6 @@
 #define KZM_FLASH_BASE	(0x00000000)
 #define CONFIG_SYS_FLASH_BASE		(KZM_FLASH_BASE)
 #define CONFIG_SYS_FLASH_CFI_WIDTH	(FLASH_CFI_16BIT)
-#define CONFIG_SYS_MAX_FLASH_BANKS	(1)
 #define CONFIG_SYS_MAX_FLASH_SECT	(512)
 
 /* prompt */
diff --git a/include/configs/ls1021aqds.h b/include/configs/ls1021aqds.h
index 27b97ffd2f..1a462cc166 100644
--- a/include/configs/ls1021aqds.h
+++ b/include/configs/ls1021aqds.h
@@ -112,7 +112,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1021atwr.h b/include/configs/ls1021atwr.h
index c099629607..60165e3c2d 100644
--- a/include/configs/ls1021atwr.h
+++ b/include/configs/ls1021atwr.h
@@ -119,7 +119,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1043aqds.h b/include/configs/ls1043aqds.h
index ee5660571e..ebbc075fdd 100644
--- a/include/configs/ls1043aqds.h
+++ b/include/configs/ls1043aqds.h
@@ -96,7 +96,6 @@ unsigned long get_board_sys_clk(void);
 					FTIM2_NOR_TWP(0x1c))
 #define CONFIG_SYS_NOR_FTIM3		0
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1043ardb.h b/include/configs/ls1043ardb.h
index 0d071c4ab7..2f23d2709e 100644
--- a/include/configs/ls1043ardb.h
+++ b/include/configs/ls1043ardb.h
@@ -58,7 +58,6 @@
 #define CONFIG_SYS_NOR_FTIM3		0
 #define CONFIG_SYS_IFC_CCR		0x01000000
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1046aqds.h b/include/configs/ls1046aqds.h
index 8bc09d0066..99ca8d93cf 100644
--- a/include/configs/ls1046aqds.h
+++ b/include/configs/ls1046aqds.h
@@ -104,7 +104,6 @@ unsigned long get_board_sys_clk(void);
 					FTIM2_NOR_TWP(0x1c))
 #define CONFIG_SYS_NOR_FTIM3		0
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1088aqds.h b/include/configs/ls1088aqds.h
index d001acfd68..41b6743e3d 100644
--- a/include/configs/ls1088aqds.h
+++ b/include/configs/ls1088aqds.h
@@ -80,7 +80,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1088ardb.h b/include/configs/ls1088ardb.h
index 6ad1fea3c8..3c2065667f 100644
--- a/include/configs/ls1088ardb.h
+++ b/include/configs/ls1088ardb.h
@@ -61,7 +61,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls2080aqds.h b/include/configs/ls2080aqds.h
index e67dee0f00..2d3286ec19 100644
--- a/include/configs/ls2080aqds.h
+++ b/include/configs/ls2080aqds.h
@@ -90,7 +90,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls2080ardb.h b/include/configs/ls2080ardb.h
index 54fab54609..0e6596f34a 100644
--- a/include/configs/ls2080ardb.h
+++ b/include/configs/ls2080ardb.h
@@ -98,7 +98,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/lsxl.h b/include/configs/lsxl.h
index 7294a3c20a..5ef7602e66 100644
--- a/include/configs/lsxl.h
+++ b/include/configs/lsxl.h
@@ -34,7 +34,6 @@
  *  Environment variables configurations
  */
 #ifdef CONFIG_SPI_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	8
 #endif
 
diff --git a/include/configs/malta.h b/include/configs/malta.h
index 8ace0ccd7e..61860ee694 100644
--- a/include/configs/malta.h
+++ b/include/configs/malta.h
@@ -54,7 +54,6 @@
 #else
 # define CONFIG_SYS_FLASH_BASE		0xbe000000
 #endif
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	128
 
 /*
diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
index aa95864516..e2f916de31 100644
--- a/include/configs/mccmon6.h
+++ b/include/configs/mccmon6.h
@@ -37,8 +37,6 @@
 #define CONFIG_FLASH_VERIFY
 
 /* NOR Flash MTD */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ (CONFIG_SYS_FLASH_BASE) }
 #define CONFIG_SYS_FLASH_BANKS_SIZES	{ (32 * SZ_1M) }
 
diff --git a/include/configs/microblaze-generic.h b/include/configs/microblaze-generic.h
index e7882fb607..261fda0053 100644
--- a/include/configs/microblaze-generic.h
+++ b/include/configs/microblaze-generic.h
@@ -32,7 +32,6 @@
 /* ?empty sector */
 # define CONFIG_SYS_FLASH_EMPTY_INFO	1
 /* max number of memory banks */
-# define CONFIG_SYS_MAX_FLASH_BANKS	1
 /* max number of sectors on one chip */
 # define CONFIG_SYS_MAX_FLASH_SECT	2048
 #endif
diff --git a/include/configs/mx6sabreauto.h b/include/configs/mx6sabreauto.h
index 5e8446088b..adf0a79f7a 100644
--- a/include/configs/mx6sabreauto.h
+++ b/include/configs/mx6sabreauto.h
@@ -41,7 +41,6 @@
 #ifdef CONFIG_MTD_NOR_FLASH
 #define CONFIG_SYS_FLASH_BASE           WEIM_ARB_BASE_ADDR
 #define CONFIG_SYS_FLASH_SECT_SIZE      (128 * 1024)
-#define CONFIG_SYS_MAX_FLASH_BANKS 1    /* max number of memory banks */
 #define CONFIG_SYS_MAX_FLASH_SECT 256   /* max number of sectors on one chip */
 #define CONFIG_SYS_FLASH_EMPTY_INFO
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
diff --git a/include/configs/octeon_ebb7304.h b/include/configs/octeon_ebb7304.h
index 04fe4dfe22..358db69a05 100644
--- a/include/configs/octeon_ebb7304.h
+++ b/include/configs/octeon_ebb7304.h
@@ -12,7 +12,6 @@
 /*
  * CFI flash
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_8BIT
 #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
diff --git a/include/configs/omap3_logic.h b/include/configs/omap3_logic.h
index e71f7371d8..6898d4fd0c 100644
--- a/include/configs/omap3_logic.h
+++ b/include/configs/omap3_logic.h
@@ -157,7 +157,6 @@
 #endif
 
 #define CONFIG_SYS_MAX_FLASH_SECT	256
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #define CONFIG_SYS_FLASH_SIZE		0x4000000
 
diff --git a/include/configs/p1_p2_rdb_pc.h b/include/configs/p1_p2_rdb_pc.h
index 6b4fc398a8..92141ff2f3 100644
--- a/include/configs/p1_p2_rdb_pc.h
+++ b/include/configs/p1_p2_rdb_pc.h
@@ -264,8 +264,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
-
 #undef CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/pm9261.h b/include/configs/pm9261.h
index d530107116..becd81251b 100644
--- a/include/configs/pm9261.h
+++ b/include/configs/pm9261.h
@@ -161,7 +161,6 @@
 #define PHYS_FLASH_1				0x10000000
 #define CONFIG_SYS_FLASH_BASE			PHYS_FLASH_1
 #define CONFIG_SYS_MAX_FLASH_SECT		256
-#define CONFIG_SYS_MAX_FLASH_BANKS		1
 
 /* USB */
 #define CONFIG_USB_ATMEL
diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
index 80899930b2..ff4393d4d0 100644
--- a/include/configs/pm9263.h
+++ b/include/configs/pm9263.h
@@ -163,7 +163,6 @@
 #define PHYS_FLASH_1			0x10000000
 #define CONFIG_SYS_FLASH_BASE		PHYS_FLASH_1
 #define CONFIG_SYS_MAX_FLASH_SECT	256
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 /* NAND flash */
 #ifdef CONFIG_CMD_NAND
diff --git a/include/configs/qemu-arm.h b/include/configs/qemu-arm.h
index fe958ef3c5..d2963c4631 100644
--- a/include/configs/qemu-arm.h
+++ b/include/configs/qemu-arm.h
@@ -42,8 +42,6 @@
 #define CONFIG_SYS_CBSIZE 512
 
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_TEXT_BASE
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256 /* Sector: 256K, Bank: 64M */
 #define CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS
 
diff --git a/include/configs/qemu-riscv.h b/include/configs/qemu-riscv.h
index ae57f681a5..618c3b63d4 100644
--- a/include/configs/qemu-riscv.h
+++ b/include/configs/qemu-riscv.h
@@ -25,8 +25,6 @@
 
 #define CONFIG_STANDALONE_LOAD_ADDR	0x80200000
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
-
 #define RISCV_MMODE_TIMERBASE		0x2000000
 #define RISCV_MMODE_TIMER_FREQ		1000000
 
diff --git a/include/configs/r2dplus.h b/include/configs/r2dplus.h
index 58ca6c28b5..e292d89b53 100644
--- a/include/configs/r2dplus.h
+++ b/include/configs/r2dplus.h
@@ -22,7 +22,6 @@
  * NOR Flash ( Spantion S29GL256P )
  */
 #define CONFIG_SYS_FLASH_BASE		(0xA0000000)
-#define CONFIG_SYS_MAX_FLASH_BANKS (1)
 #define CONFIG_SYS_MAX_FLASH_SECT  256
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
 
diff --git a/include/configs/salvator-x.h b/include/configs/salvator-x.h
index a866517a75..d797b9e15d 100644
--- a/include/configs/salvator-x.h
+++ b/include/configs/salvator-x.h
@@ -25,8 +25,6 @@
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/sama5d3xek.h b/include/configs/sama5d3xek.h
index 67640f4415..3be2c83fce 100644
--- a/include/configs/sama5d3xek.h
+++ b/include/configs/sama5d3xek.h
@@ -32,7 +32,6 @@
 #ifdef CONFIG_MTD_NOR_FLASH
 #define CONFIG_SYS_FLASH_BASE		0x10000000
 #define CONFIG_SYS_MAX_FLASH_SECT	131
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #endif
 
 /* SDRAM */
diff --git a/include/configs/socfpga_arria10_socdk.h b/include/configs/socfpga_arria10_socdk.h
index ebb3e8c573..c20d54a3c5 100644
--- a/include/configs/socfpga_arria10_socdk.h
+++ b/include/configs/socfpga_arria10_socdk.h
@@ -30,7 +30,6 @@
 /*
  * Flash configurations
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS     1
 
 /* SPL memory allocation configuration, this is for FAT implementation */
 #define CONFIG_SYS_SPL_MALLOC_SIZE	0x00015000
diff --git a/include/configs/socfpga_soc64_common.h b/include/configs/socfpga_soc64_common.h
index 4d7072c4db..66d7adf661 100644
--- a/include/configs/socfpga_soc64_common.h
+++ b/include/configs/socfpga_soc64_common.h
@@ -137,7 +137,6 @@ unsigned int cm_get_qspi_controller_clk_hz(void);
 /*
  * Flash configurations
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 /* Ethernet on SoC (EMAC) */
 #if defined(CONFIG_CMD_NET)
diff --git a/include/configs/socrates.h b/include/configs/socrates.h
index 454dbd30b6..a90d8ee750 100644
--- a/include/configs/socrates.h
+++ b/include/configs/socrates.h
@@ -102,7 +102,6 @@
 #define CONFIG_SYS_BR1_PRELIM		0xfc001001	/* port size 16bit	*/
 #define CONFIG_SYS_OR1_PRELIM		0xfe000030	/* 32MB Flash		*/
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2		/* number of banks	*/
 #define CONFIG_SYS_MAX_FLASH_SECT	256		/* sectors per device	*/
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms)	*/
diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index 2fe0900e9f..4c464cfbe5 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -51,8 +51,6 @@
 /* Monitor Command Prompt */
 #define CONFIG_SYS_CBSIZE		1024	/* Console I/O Buffer Size */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-
 /* USB Configs */
 #define CONFIG_USB_OHCI_NEW
 #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
index 8dddd5449e..c9649a085e 100644
--- a/include/configs/stm32f429-discovery.h
+++ b/include/configs/stm32f429-discovery.h
@@ -16,7 +16,6 @@
  */
 
 #define CONFIG_SYS_MAX_FLASH_SECT	12
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
 
 #define CONFIG_RED_LED			110
 #define CONFIG_GREEN_LED		109
diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
index c490e2d98b..4c421b9596 100644
--- a/include/configs/stm32f429-evaluation.h
+++ b/include/configs/stm32f429-evaluation.h
@@ -21,7 +21,6 @@
  */
 
 #define CONFIG_SYS_MAX_FLASH_SECT	12
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index 246dc1f9c6..e91f8da280 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -21,7 +21,6 @@
  */
 
 #define CONFIG_SYS_MAX_FLASH_SECT	12
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 2f2a349dcd..8ad4bb99c8 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -20,7 +20,6 @@
  */
 
 #define CONFIG_SYS_MAX_FLASH_SECT	8
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #define CONFIG_DW_GMAC_DEFAULT_DMA_PBL	(8)
 #define CONFIG_DW_ALTDESCRIPTOR
diff --git a/include/configs/synquacer.h b/include/configs/synquacer.h
index 3d099b4f11..908c7b82fd 100644
--- a/include/configs/synquacer.h
+++ b/include/configs/synquacer.h
@@ -37,7 +37,6 @@
 #define CONFIG_PL01x_PORTS		{(void *)(0x2a400000)}
 
 /* Support MTD */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BASE		(0x08000000)
 #define CONFIG_SYS_FLASH_BANKS_LIST	{CONFIG_SYS_FLASH_BASE}
 
diff --git a/include/configs/total_compute.h b/include/configs/total_compute.h
index 933a145f99..d89a0a23fa 100644
--- a/include/configs/total_compute.h
+++ b/include/configs/total_compute.h
@@ -78,7 +78,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
 #define FLASH_MAX_SECTOR_SIZE		0x00040000
diff --git a/include/configs/ulcb.h b/include/configs/ulcb.h
index 4be522f866..bc5097e43a 100644
--- a/include/configs/ulcb.h
+++ b/include/configs/ulcb.h
@@ -25,8 +25,6 @@
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
index df22584d9a..972b22cb84 100644
--- a/include/configs/vexpress_aemv8a.h
+++ b/include/configs/vexpress_aemv8a.h
@@ -220,7 +220,6 @@
 #endif
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #ifdef CONFIG_USB_EHCI_HCD
 #define CONFIG_USB_OHCI_NEW
diff --git a/include/configs/vexpress_common.h b/include/configs/vexpress_common.h
index 990f5ed547..5f24333302 100644
--- a/include/configs/vexpress_common.h
+++ b/include/configs/vexpress_common.h
@@ -178,7 +178,6 @@
 /* FLASH and environment organization */
 #define PHYS_FLASH_SIZE			0x04000000	/* 64MB */
 #define CONFIG_SYS_FLASH_SIZE		0x04000000
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
 #define CONFIG_SYS_FLASH_BASE0		V2M_NOR0
 #define CONFIG_SYS_FLASH_BASE1		V2M_NOR1
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE0
diff --git a/include/configs/xtfpga.h b/include/configs/xtfpga.h
index ccc90a66f7..9560b24f0b 100644
--- a/include/configs/xtfpga.h
+++ b/include/configs/xtfpga.h
@@ -184,7 +184,6 @@
 /*=====================*/
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #ifdef CONFIG_XTFPGA_LX60
 # define CONFIG_SYS_FLASH_SIZE		0x0040000	/* 4MB */
 # define CONFIG_SYS_FLASH_SECT_SZ	0x10000		/* block size 64KB */
diff --git a/include/configs/zynq-common.h b/include/configs/zynq-common.h
index 4de2f94b04..bbbc9451d0 100644
--- a/include/configs/zynq-common.h
+++ b/include/configs/zynq-common.h
@@ -41,7 +41,6 @@
 
 /* NOR */
 #ifdef CONFIG_MTD_NOR_FLASH
-# define CONFIG_SYS_MAX_FLASH_BANKS	1
 # define CONFIG_SYS_MAX_FLASH_SECT	512
 # define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 # define CONFIG_SYS_FLASH_WRITE_TOUT	5000
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index b9c1c61e13..c9877b16ca 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -2183,8 +2183,6 @@ CONFIG_SYS_MATRIX_EBI0CSA_VAL
 CONFIG_SYS_MATRIX_EBICSA_VAL
 CONFIG_SYS_MATRIX_MCFG_REMAP
 CONFIG_SYS_MAXARGS
-CONFIG_SYS_MAX_FLASH_BANKS
-CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 CONFIG_SYS_MAX_FLASH_SECT
 CONFIG_SYS_MAX_I2C_BUS
 CONFIG_SYS_MAX_NAND_CHIPS
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
