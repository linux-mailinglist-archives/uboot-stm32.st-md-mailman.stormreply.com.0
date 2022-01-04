Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14094484539
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jan 2022 16:51:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC559C5F1F6;
	Tue,  4 Jan 2022 15:51:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC9B5C5F1F6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 13:24:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2049iwll016903;
 Tue, 4 Jan 2022 14:24:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mXtrA7qEobqcgeD3Ns2mSZ4Ix4orFrswaqWrcqPAIXw=;
 b=uCmHZWGwXMiw/tsQDYO5NB2Fn3YymUgi1CaLYEv8ECXRIAV17wmthROUFIDUTWsd8VgA
 c5+az3+2EuIfpGyyYru7S2Nj+c787Ws/UQZrolgEVOLPoEtoIZTHPnZ4dDFv/USt0QHD
 CVljGUmmErHS/x8lqlFPkYcxRJMQ1fPq6QhnGfTUvf/uxFJzouXRpfk4VxkcUOq/l4Dx
 Ym7ePDscu8awo/FUpah+GdrQSzPNNZZMrDR4aMLNzpmSyhGsInjdvLyDgGTvUofnbi0z
 6CfBa3a/wlnlwenHAv+b/lzfIUJine1yhSJQMQKFbmW0wLEioXlIb7hlDRADXYi43yBO tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dccdntmcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:24:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B6DA10003A;
 Tue,  4 Jan 2022 14:24:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8BCE2A4D60;
 Tue,  4 Jan 2022 14:24:10 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 14:24:10
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 4 Jan 2022 14:24:00 +0100
Message-ID: <20220104142328.v1.4.I0d0c7b01c8aefb9ef4b2d5f78feda422bc59593e@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
X-Mailman-Approved-At: Tue, 04 Jan 2022 15:51:50 +0000
Cc: David Feng <fenghua@phytium.com.cn>,
 =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Peng Fan <peng.fan@nxp.com>,
 Chin-Liang See <clsee@altera.com>, Sean Anderson <seanga2@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachienergy.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Wolfgang
 Wegner <w.wegner@astro-kom.de>, Kamil Lulko <kamil.lulko@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Dalon Westergreen <dalon.westergreen@intel.com>, Aleksandar
 Gerasimovski <aleksandar.gerasimovski@hitachienergy.com>,
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
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>, Sinan Akman <sinan@writeme.com>,
 Vikas Manocha <vikas.manocha@st.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Ashish Kumar <Ashish.Kumar@nxp.com>, Rick Chen <rick@andestech.com>, Jassi
 Brar <jaswinder.singh@linaro.org>, Usama Arif <usama.arif@arm.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Jens Scharsig <esw@bus-elektronik.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <Mingkai.Hu@nxp.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Christophe
 Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>, Masakazu
 Mochizuki <masakazu.mochizuki.wd@hitachi.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Igor
 Opaniuk <igor.opaniuk@foundries.io>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "Andrew F. Davis" <afd@ti.com>,
 Aaron Williams <awilliams@marvell.com>, Dinh
 Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>, Paul
 Burton <paul.burton@mips.com>, Patrick
 Delaunay <patrick.delaunay@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, TsiChung
 Liew <Tsi-Chung.Liew@nxp.com>, Bin Meng <bmeng.cn@gmail.com>,
 Andes <uboot@andestech.com>
Subject: [Uboot-stm32] [PATCH v1 4/5] configs: Migrate
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
Reviewed-by: Simon Glass <sjg@chromium.org>
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
index 77782d0ae7..05249e07cd 100644
--- a/README
+++ b/README
@@ -2157,9 +2157,6 @@ Configuration Settings:
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
index e2afcdee7c..d6351d5b11 100644
--- a/configs/MPC8548CDS_36BIT_defconfig
+++ b/configs/MPC8548CDS_36BIT_defconfig
@@ -52,6 +52,7 @@ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_DAVICOM=y
diff --git a/configs/MPC8548CDS_defconfig b/configs/MPC8548CDS_defconfig
index e8f44cfcd4..da0b80b09d 100644
--- a/configs/MPC8548CDS_defconfig
+++ b/configs/MPC8548CDS_defconfig
@@ -51,6 +51,7 @@ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_DAVICOM=y
diff --git a/configs/MPC8548CDS_legacy_defconfig b/configs/MPC8548CDS_legacy_defconfig
index 577385d60e..87d1fd716c 100644
--- a/configs/MPC8548CDS_legacy_defconfig
+++ b/configs/MPC8548CDS_legacy_defconfig
@@ -51,6 +51,7 @@ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_PHY_ATHEROS=y
 CONFIG_PHY_BROADCOM=y
 CONFIG_PHY_DAVICOM=y
diff --git a/configs/P3041DS_NAND_defconfig b/configs/P3041DS_NAND_defconfig
index 29a968d9a3..fb8d87d654 100644
--- a/configs/P3041DS_NAND_defconfig
+++ b/configs/P3041DS_NAND_defconfig
@@ -63,6 +63,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_ELBC=y
 CONFIG_DM_SPI_FLASH=y
diff --git a/configs/P3041DS_SDCARD_defconfig b/configs/P3041DS_SDCARD_defconfig
index 72c3b7af29..c9bd30c5fa 100644
--- a/configs/P3041DS_SDCARD_defconfig
+++ b/configs/P3041DS_SDCARD_defconfig
@@ -61,6 +61,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P3041DS_SPIFLASH_defconfig b/configs/P3041DS_SPIFLASH_defconfig
index abb9ce611d..7f7e5da20b 100644
--- a/configs/P3041DS_SPIFLASH_defconfig
+++ b/configs/P3041DS_SPIFLASH_defconfig
@@ -62,6 +62,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P3041DS_defconfig b/configs/P3041DS_defconfig
index 39dd70888c..cdb6687737 100644
--- a/configs/P3041DS_defconfig
+++ b/configs/P3041DS_defconfig
@@ -57,6 +57,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P4080DS_SDCARD_defconfig b/configs/P4080DS_SDCARD_defconfig
index bd66e31fe1..09491bae6c 100644
--- a/configs/P4080DS_SDCARD_defconfig
+++ b/configs/P4080DS_SDCARD_defconfig
@@ -60,6 +60,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P4080DS_SPIFLASH_defconfig b/configs/P4080DS_SPIFLASH_defconfig
index 79f51c91d4..e23d10dc96 100644
--- a/configs/P4080DS_SPIFLASH_defconfig
+++ b/configs/P4080DS_SPIFLASH_defconfig
@@ -61,6 +61,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P4080DS_defconfig b/configs/P4080DS_defconfig
index 43f16d45e2..cfda36d2b5 100644
--- a/configs/P4080DS_defconfig
+++ b/configs/P4080DS_defconfig
@@ -56,6 +56,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P5040DS_NAND_defconfig b/configs/P5040DS_NAND_defconfig
index 6f31034573..c6e4485a41 100644
--- a/configs/P5040DS_NAND_defconfig
+++ b/configs/P5040DS_NAND_defconfig
@@ -64,6 +64,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_ELBC=y
 CONFIG_DM_SPI_FLASH=y
diff --git a/configs/P5040DS_SDCARD_defconfig b/configs/P5040DS_SDCARD_defconfig
index 0a881d8417..e92f447704 100644
--- a/configs/P5040DS_SDCARD_defconfig
+++ b/configs/P5040DS_SDCARD_defconfig
@@ -61,6 +61,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P5040DS_SPIFLASH_defconfig b/configs/P5040DS_SPIFLASH_defconfig
index 0e4a5457ef..3f62ebf6eb 100644
--- a/configs/P5040DS_SPIFLASH_defconfig
+++ b/configs/P5040DS_SPIFLASH_defconfig
@@ -62,6 +62,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/P5040DS_defconfig b/configs/P5040DS_defconfig
index d614917385..83fb71ebfc 100644
--- a/configs/P5040DS_defconfig
+++ b/configs/P5040DS_defconfig
@@ -57,6 +57,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SPANSION=y
diff --git a/configs/T1042D4RDB_NAND_defconfig b/configs/T1042D4RDB_NAND_defconfig
index ca22e1e4f2..93a22581db 100644
--- a/configs/T1042D4RDB_NAND_defconfig
+++ b/configs/T1042D4RDB_NAND_defconfig
@@ -75,6 +75,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/T1042D4RDB_SDCARD_defconfig b/configs/T1042D4RDB_SDCARD_defconfig
index b9f7992d35..c287d4e4e4 100644
--- a/configs/T1042D4RDB_SDCARD_defconfig
+++ b/configs/T1042D4RDB_SDCARD_defconfig
@@ -74,6 +74,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/T1042D4RDB_SPIFLASH_defconfig b/configs/T1042D4RDB_SPIFLASH_defconfig
index f8e2b6d2ee..056d0bf12e 100644
--- a/configs/T1042D4RDB_SPIFLASH_defconfig
+++ b/configs/T1042D4RDB_SPIFLASH_defconfig
@@ -76,6 +76,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/T1042D4RDB_defconfig b/configs/T1042D4RDB_defconfig
index 4797f2907f..10e943bf8b 100644
--- a/configs/T1042D4RDB_defconfig
+++ b/configs/T1042D4RDB_defconfig
@@ -59,6 +59,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/T2080QDS_NAND_defconfig b/configs/T2080QDS_NAND_defconfig
index ba07ce8feb..009393b7bc 100644
--- a/configs/T2080QDS_NAND_defconfig
+++ b/configs/T2080QDS_NAND_defconfig
@@ -78,6 +78,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/T2080QDS_SDCARD_defconfig b/configs/T2080QDS_SDCARD_defconfig
index bf5410b344..347fa52c1b 100644
--- a/configs/T2080QDS_SDCARD_defconfig
+++ b/configs/T2080QDS_SDCARD_defconfig
@@ -77,6 +77,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T2080QDS_SECURE_BOOT_defconfig b/configs/T2080QDS_SECURE_BOOT_defconfig
index 3165b9090a..79a3aad527 100644
--- a/configs/T2080QDS_SECURE_BOOT_defconfig
+++ b/configs/T2080QDS_SECURE_BOOT_defconfig
@@ -61,6 +61,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T2080QDS_SPIFLASH_defconfig b/configs/T2080QDS_SPIFLASH_defconfig
index 367416f337..950932cdc0 100644
--- a/configs/T2080QDS_SPIFLASH_defconfig
+++ b/configs/T2080QDS_SPIFLASH_defconfig
@@ -79,6 +79,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T2080QDS_defconfig b/configs/T2080QDS_defconfig
index db9e970e64..16a1783884 100644
--- a/configs/T2080QDS_defconfig
+++ b/configs/T2080QDS_defconfig
@@ -62,6 +62,7 @@ CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_EON=y
diff --git a/configs/T4240RDB_SDCARD_defconfig b/configs/T4240RDB_SDCARD_defconfig
index 526c474955..5518010ca8 100644
--- a/configs/T4240RDB_SDCARD_defconfig
+++ b/configs/T4240RDB_SDCARD_defconfig
@@ -68,6 +68,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SF_DEFAULT_SPEED=10000000
 CONFIG_SPI_FLASH_SST=y
diff --git a/configs/T4240RDB_defconfig b/configs/T4240RDB_defconfig
index bbaab35fd8..bc0e8bd46b 100644
--- a/configs/T4240RDB_defconfig
+++ b/configs/T4240RDB_defconfig
@@ -53,6 +53,7 @@ CONFIG_MTD_NOR_FLASH=y
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
index ff81f76b88..4fc3b0a541 100644
--- a/configs/cobra5272_defconfig
+++ b/configs/cobra5272_defconfig
@@ -43,6 +43,7 @@ CONFIG_SYS_BR7_PRELIM_BOOL=y
 CONFIG_SYS_BR7_PRELIM=0x701
 CONFIG_SYS_OR7_PRELIM=0xFF00007C
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
index 1821b23ed5..5d98318aab 100644
--- a/configs/ethernut5_defconfig
+++ b/configs/ethernut5_defconfig
@@ -66,6 +66,7 @@ CONFIG_SYS_I2C_SOFT_SLAVE=0
 CONFIG_GENERIC_ATMEL_MCI=y
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
index 79ccc41a43..afd93187bc 100644
--- a/configs/ls1021aqds_ddr4_nor_defconfig
+++ b/configs/ls1021aqds_ddr4_nor_defconfig
@@ -66,6 +66,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_ddr4_nor_lpuart_defconfig b/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
index 0a2a076332..b27c67b2a3 100644
--- a/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
+++ b/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
@@ -67,6 +67,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_nand_defconfig b/configs/ls1021aqds_nand_defconfig
index 0b12f100d4..915579a12a 100644
--- a/configs/ls1021aqds_nand_defconfig
+++ b/configs/ls1021aqds_nand_defconfig
@@ -88,6 +88,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
 CONFIG_SYS_NAND_U_BOOT_LOCATIONS=y
diff --git a/configs/ls1021aqds_nor_SECURE_BOOT_defconfig b/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
index 63930e4a13..5ab7d2785f 100644
--- a/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
+++ b/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
@@ -65,6 +65,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_nor_defconfig b/configs/ls1021aqds_nor_defconfig
index f4e2274fb8..934d44fbde 100644
--- a/configs/ls1021aqds_nor_defconfig
+++ b/configs/ls1021aqds_nor_defconfig
@@ -67,6 +67,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_nor_lpuart_defconfig b/configs/ls1021aqds_nor_lpuart_defconfig
index 0eacaa3354..1cf208631c 100644
--- a/configs/ls1021aqds_nor_lpuart_defconfig
+++ b/configs/ls1021aqds_nor_lpuart_defconfig
@@ -68,6 +68,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1021aqds_sdcard_ifc_defconfig b/configs/ls1021aqds_sdcard_ifc_defconfig
index fa190a7502..db8a3ae9ec 100644
--- a/configs/ls1021aqds_sdcard_ifc_defconfig
+++ b/configs/ls1021aqds_sdcard_ifc_defconfig
@@ -85,6 +85,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_SECURE_BOOT_defconfig b/configs/ls1046aqds_SECURE_BOOT_defconfig
index 55426320d8..6a0c951ed0 100644
--- a/configs/ls1046aqds_SECURE_BOOT_defconfig
+++ b/configs/ls1046aqds_SECURE_BOOT_defconfig
@@ -62,6 +62,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_defconfig b/configs/ls1046aqds_defconfig
index f136aeafae..507d24ec8f 100644
--- a/configs/ls1046aqds_defconfig
+++ b/configs/ls1046aqds_defconfig
@@ -65,6 +65,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_lpuart_defconfig b/configs/ls1046aqds_lpuart_defconfig
index 6d448905ef..9e8e37fdb7 100644
--- a/configs/ls1046aqds_lpuart_defconfig
+++ b/configs/ls1046aqds_lpuart_defconfig
@@ -66,6 +66,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_nand_defconfig b/configs/ls1046aqds_nand_defconfig
index e4cd4a2f60..f6c55e638a 100644
--- a/configs/ls1046aqds_nand_defconfig
+++ b/configs/ls1046aqds_nand_defconfig
@@ -84,6 +84,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
 CONFIG_SYS_NAND_U_BOOT_LOCATIONS=y
diff --git a/configs/ls1046aqds_sdcard_ifc_defconfig b/configs/ls1046aqds_sdcard_ifc_defconfig
index fe1fe6f162..78402e7a96 100644
--- a/configs/ls1046aqds_sdcard_ifc_defconfig
+++ b/configs/ls1046aqds_sdcard_ifc_defconfig
@@ -85,6 +85,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
index b84f8772c6..eb44c1828e 100644
--- a/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
@@ -65,6 +65,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1046aqds_tfa_defconfig b/configs/ls1046aqds_tfa_defconfig
index f706dd6179..b68d8507ba 100644
--- a/configs/ls1046aqds_tfa_defconfig
+++ b/configs/ls1046aqds_tfa_defconfig
@@ -74,6 +74,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1088aqds_defconfig b/configs/ls1088aqds_defconfig
index a2b2a34e3f..986a28d547 100644
--- a/configs/ls1088aqds_defconfig
+++ b/configs/ls1088aqds_defconfig
@@ -66,6 +66,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1088aqds_sdcard_ifc_defconfig b/configs/ls1088aqds_sdcard_ifc_defconfig
index e5372317c3..30ffd3c58a 100644
--- a/configs/ls1088aqds_sdcard_ifc_defconfig
+++ b/configs/ls1088aqds_sdcard_ifc_defconfig
@@ -77,6 +77,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls1088aqds_tfa_defconfig b/configs/ls1088aqds_tfa_defconfig
index aac8486bc3..ae00387d3f 100644
--- a/configs/ls1088aqds_tfa_defconfig
+++ b/configs/ls1088aqds_tfa_defconfig
@@ -76,6 +76,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls2080aqds_SECURE_BOOT_defconfig b/configs/ls2080aqds_SECURE_BOOT_defconfig
index 0ad25aca76..b133bb7845 100644
--- a/configs/ls2080aqds_SECURE_BOOT_defconfig
+++ b/configs/ls2080aqds_SECURE_BOOT_defconfig
@@ -51,6 +51,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls2080aqds_defconfig b/configs/ls2080aqds_defconfig
index 30cdad6fbe..63708e9b07 100644
--- a/configs/ls2080aqds_defconfig
+++ b/configs/ls2080aqds_defconfig
@@ -54,6 +54,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/ls2088aqds_tfa_defconfig b/configs/ls2088aqds_tfa_defconfig
index 61e0fdf113..d85c4d8b0b 100644
--- a/configs/ls2088aqds_tfa_defconfig
+++ b/configs/ls2088aqds_tfa_defconfig
@@ -67,6 +67,7 @@ CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
 CONFIG_MTD_RAW_NAND=y
 CONFIG_NAND_FSL_IFC=y
 CONFIG_SYS_NAND_ONFI_DETECTION=y
diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
index 5e41ea980f..8f86f19e89 100644
--- a/configs/qemu_arm64_defconfig
+++ b/configs/qemu_arm64_defconfig
@@ -44,6 +44,8 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_E1000=y
 CONFIG_NVME=y
diff --git a/configs/qemu_arm_defconfig b/configs/qemu_arm_defconfig
index 4197cb0f92..653c76ba61 100644
--- a/configs/qemu_arm_defconfig
+++ b/configs/qemu_arm_defconfig
@@ -46,6 +46,8 @@ CONFIG_CFI_FLASH=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
+CONFIG_SYS_MAX_FLASH_BANKS=2
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_ETH=y
 CONFIG_E1000=y
 CONFIG_NVME=y
diff --git a/configs/r8a77990_ebisu_defconfig b/configs/r8a77990_ebisu_defconfig
index 79ec7009c5..24042daee0 100644
--- a/configs/r8a77990_ebisu_defconfig
+++ b/configs/r8a77990_ebisu_defconfig
@@ -71,6 +71,7 @@ CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/r8a77995_draak_defconfig b/configs/r8a77995_draak_defconfig
index 726609ad62..d5b1b31a14 100644
--- a/configs/r8a77995_draak_defconfig
+++ b/configs/r8a77995_draak_defconfig
@@ -64,6 +64,7 @@ CONFIG_CFI_FLASH=y
 CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/rcar3_salvator-x_defconfig b/configs/rcar3_salvator-x_defconfig
index 57a2c01932..499e56e498 100644
--- a/configs/rcar3_salvator-x_defconfig
+++ b/configs/rcar3_salvator-x_defconfig
@@ -72,6 +72,7 @@ CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
 CONFIG_RENESAS_RPC_HF=y
+CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_BITBANGMII=y
diff --git a/configs/rcar3_ulcb_defconfig b/configs/rcar3_ulcb_defconfig
index b18ef389e4..dfe0d84053 100644
--- a/configs/rcar3_ulcb_defconfig
+++ b/configs/rcar3_ulcb_defconfig
@@ -73,6 +73,7 @@ CONFIG_FLASH_CFI_MTD=y
 CONFIG_SYS_FLASH_PROTECTION=y
 CONFIG_SYS_FLASH_CFI=y
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
index ea0224d650..bad08e79c9 100644
--- a/configs/socrates_defconfig
+++ b/configs/socrates_defconfig
@@ -64,6 +64,7 @@ CONFIG_MTD=y
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
index 5ed624c7b7..df7f378cfd 100644
--- a/include/configs/M5208EVBE.h
+++ b/include/configs/M5208EVBE.h
@@ -111,7 +111,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	254	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5235EVB.h b/include/configs/M5235EVB.h
index 90f1664a5a..9f4c3af4b8 100644
--- a/include/configs/M5235EVB.h
+++ b/include/configs/M5235EVB.h
@@ -126,7 +126,6 @@
 #else
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #endif
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5249EVB.h b/include/configs/M5249EVB.h
index 00892ec44d..32671494d9 100644
--- a/include/configs/M5249EVB.h
+++ b/include/configs/M5249EVB.h
@@ -89,7 +89,6 @@
 
 #	define CONFIG_SYS_FLASH_SIZE		0x1000000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #	define CONFIG_SYS_FLASH_CHECKSUM
 #	define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
diff --git a/include/configs/M5253DEMO.h b/include/configs/M5253DEMO.h
index c5d8aa3eda..6ba5c52543 100644
--- a/include/configs/M5253DEMO.h
+++ b/include/configs/M5253DEMO.h
@@ -125,7 +125,6 @@
 
 /* FLASH organization */
 #define CONFIG_SYS_FLASH_BASE		(CONFIG_SYS_CS0_BASE)
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	2048	/* max number of sectors on one chip */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/M5272C3.h b/include/configs/M5272C3.h
index e814a2924c..df89a0f961 100644
--- a/include/configs/M5272C3.h
+++ b/include/configs/M5272C3.h
@@ -123,7 +123,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5275EVB.h b/include/configs/M5275EVB.h
index b18f0319b0..7926ed44dc 100644
--- a/include/configs/M5275EVB.h
+++ b/include/configs/M5275EVB.h
@@ -126,7 +126,6 @@
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
index 5db189ae2d..c26de6b313 100644
--- a/include/configs/M53017EVB.h
+++ b/include/configs/M53017EVB.h
@@ -130,7 +130,6 @@
 #	define CONFIG_FLASH_SPANSION_S29WS_N	1
 #	define CONFIG_SYS_FLASH_SIZE		0x1000000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5329EVB.h b/include/configs/M5329EVB.h
index f96f54ef65..21137abe08 100644
--- a/include/configs/M5329EVB.h
+++ b/include/configs/M5329EVB.h
@@ -125,7 +125,6 @@
 #ifdef CONFIG_SYS_FLASH_CFI
 #	define CONFIG_SYS_FLASH_SIZE		0x800000	/* Max size that the board might have */
 #	define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#	define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks */
 #	define CONFIG_SYS_MAX_FLASH_SECT	137	/* max number of sectors on one chip */
 #endif
 
diff --git a/include/configs/M5373EVB.h b/include/configs/M5373EVB.h
index b7906013e0..a2cdd8f417 100644
--- a/include/configs/M5373EVB.h
+++ b/include/configs/M5373EVB.h
@@ -127,7 +127,6 @@
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
index 9a34e5444b..977d96a5a7 100644
--- a/include/configs/MPC837XERDB.h
+++ b/include/configs/MPC837XERDB.h
@@ -155,7 +155,6 @@
 #define CONFIG_SYS_FLASH_EMPTY_INFO		/* display empty sectors */
 
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1 /* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	256 /* max sectors per device */
 
 #undef	CONFIG_SYS_FLASH_CHECKSUM
diff --git a/include/configs/MPC8540ADS.h b/include/configs/MPC8540ADS.h
index 84e05eafa6..57097b17eb 100644
--- a/include/configs/MPC8540ADS.h
+++ b/include/configs/MPC8540ADS.h
@@ -85,7 +85,6 @@
 
 #define CONFIG_SYS_FLASH_BASE		0xff000000	/* start of FLASH 16M */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	64		/* sectors per device */
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/MPC8548CDS.h b/include/configs/MPC8548CDS.h
index f583aa8b36..e16d870a5e 100644
--- a/include/configs/MPC8548CDS.h
+++ b/include/configs/MPC8548CDS.h
@@ -133,7 +133,6 @@
 
 #define CONFIG_SYS_FLASH_BANKS_LIST \
 	{CONFIG_SYS_FLASH_BASE_PHYS + 0x800000, CONFIG_SYS_FLASH_BASE_PHYS}
-#define CONFIG_SYS_MAX_FLASH_BANKS	2		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	128		/* sectors per device */
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/MPC8560ADS.h b/include/configs/MPC8560ADS.h
index b8a72d01dd..d23cf0e41a 100644
--- a/include/configs/MPC8560ADS.h
+++ b/include/configs/MPC8560ADS.h
@@ -86,7 +86,6 @@
 
 #define CONFIG_SYS_FLASH_BASE		0xff000000	/* start of FLASH 16M */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	64		/* sectors per device */
 #undef	CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/P1010RDB.h b/include/configs/P1010RDB.h
index 6a9c86c9c4..23b9969f84 100644
--- a/include/configs/P1010RDB.h
+++ b/include/configs/P1010RDB.h
@@ -267,7 +267,6 @@ extern unsigned long get_sdram_size(void);
 #define CONFIG_SYS_FLASH_BANKS_LIST	{CONFIG_SYS_FLASH_BASE_PHYS}
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 
 #undef CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
diff --git a/include/configs/P2041RDB.h b/include/configs/P2041RDB.h
index 8ada25dcc7..ceaed464fe 100644
--- a/include/configs/P2041RDB.h
+++ b/include/configs/P2041RDB.h
@@ -142,7 +142,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024		/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000		/* Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500		/* Write Timeout (ms) */
diff --git a/include/configs/T102xRDB.h b/include/configs/T102xRDB.h
index bf266623c9..d24cfce8b3 100644
--- a/include/configs/T102xRDB.h
+++ b/include/configs/T102xRDB.h
@@ -202,7 +202,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T104xRDB.h b/include/configs/T104xRDB.h
index a1650f5430..f60010f787 100644
--- a/include/configs/T104xRDB.h
+++ b/include/configs/T104xRDB.h
@@ -175,7 +175,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T208xQDS.h b/include/configs/T208xQDS.h
index aaea314e45..f0bdcbae63 100644
--- a/include/configs/T208xQDS.h
+++ b/include/configs/T208xQDS.h
@@ -161,7 +161,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T208xRDB.h b/include/configs/T208xRDB.h
index 467f6344fa..86dc5bfe82 100644
--- a/include/configs/T208xRDB.h
+++ b/include/configs/T208xRDB.h
@@ -151,7 +151,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/T4240RDB.h b/include/configs/T4240RDB.h
index 2d632493c1..6923774a16 100644
--- a/include/configs/T4240RDB.h
+++ b/include/configs/T4240RDB.h
@@ -267,7 +267,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/adp-ae3xx.h b/include/configs/adp-ae3xx.h
index 11eff3852d..f0416d4715 100644
--- a/include/configs/adp-ae3xx.h
+++ b/include/configs/adp-ae3xx.h
@@ -155,9 +155,6 @@
 #define CONFIG_SYS_CFI_FLASH_STATUS_POLL
 
 /* support JEDEC */
-#ifdef CONFIG_CFI_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
-#endif
 
 /* Do not use CONFIG_FLASH_CFI_LEGACY to detect on board flash */
 #define PHYS_FLASH_1			0x88000000	/* BANK 0 */
@@ -173,7 +170,6 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/adp-ag101p.h b/include/configs/adp-ag101p.h
index 31ef30adc6..69fb5d170b 100644
--- a/include/configs/adp-ag101p.h
+++ b/include/configs/adp-ag101p.h
@@ -286,7 +286,6 @@
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
index f5f2b63b74..63805d3321 100644
--- a/include/configs/am3517_evm.h
+++ b/include/configs/am3517_evm.h
@@ -111,7 +111,6 @@
 /* **** PISMO SUPPORT *** */
 #define CONFIG_SYS_MAX_FLASH_SECT	520	/* max number of sectors */
 						/* on one chip */
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* max number of flash banks */
 #define CONFIG_SYS_MONITOR_LEN		(256 << 10)	/* Reserve 2 sectors */
 
 #if defined(CONFIG_MTD_RAW_NAND)
diff --git a/include/configs/amcore.h b/include/configs/amcore.h
index d813af17f7..ae8aa35b6d 100644
--- a/include/configs/amcore.h
+++ b/include/configs/amcore.h
@@ -40,7 +40,6 @@
 #define CONFIG_SYS_SDRAM_BASE		0x00000000
 #define CONFIG_SYS_SDRAM_SIZE		0x1000000
 #define CONFIG_SYS_FLASH_BASE		0xffc00000
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	1024
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/armadillo-800eva.h b/include/configs/armadillo-800eva.h
index 7714da40dc..d24ba2f0d6 100644
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
index d87ca304e2..4f6fb41569 100644
--- a/include/configs/astro_mcf5373l.h
+++ b/include/configs/astro_mcf5373l.h
@@ -227,7 +227,6 @@
 						(CONFIG_SYS_SDRAM_SIZE << 20))
 
 /* FLASH organization */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	259
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 
diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
index 5aa9fee2e1..485211c42f 100644
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
index 882b94f55a..2135ba700e 100644
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
index 3e19e99c24..81315f6ec7 100644
--- a/include/configs/cobra5272.h
+++ b/include/configs/cobra5272.h
@@ -223,7 +223,6 @@ enter a valid image address in flash */
 /*-----------------------------------------------------------------------
  * FLASH organization
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* max number of memory banks		*/
 #define CONFIG_SYS_MAX_FLASH_SECT	11	/* max number of sectors on one chip	*/
 #define CONFIG_SYS_FLASH_ERASE_TOUT	1000	/* flash timeout */
 
diff --git a/include/configs/colibri_pxa270.h b/include/configs/colibri_pxa270.h
index 0be7f5a416..305d25b221 100644
--- a/include/configs/colibri_pxa270.h
+++ b/include/configs/colibri_pxa270.h
@@ -84,7 +84,6 @@
 #define	CONFIG_SYS_FLASH_CFI_WIDTH      FLASH_CFI_32BIT
 
 #define	CONFIG_SYS_MAX_FLASH_SECT	(4 + 255)
-#define	CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #define	CONFIG_SYS_FLASH_ERASE_TOUT	(25 * CONFIG_SYS_HZ)
 #define	CONFIG_SYS_FLASH_WRITE_TOUT	(25 * CONFIG_SYS_HZ)
diff --git a/include/configs/corenet_ds.h b/include/configs/corenet_ds.h
index f6e0b2a7ea..6d272c6d88 100644
--- a/include/configs/corenet_ds.h
+++ b/include/configs/corenet_ds.h
@@ -140,7 +140,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2		/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024		/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000		/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500		/* Flash Write Timeout (ms) */
diff --git a/include/configs/da850evm.h b/include/configs/da850evm.h
index 97c9276e0e..956a965901 100644
--- a/include/configs/da850evm.h
+++ b/include/configs/da850evm.h
@@ -145,7 +145,6 @@
 #endif
 
 #ifdef CONFIG_MTD_NOR_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS	1 /* max number of flash banks */
 #define CONFIG_SYS_FLASH_SECT_SZ	(128 << 10) /* 128KB */
 #define CONFIG_SYS_FLASH_BASE		DAVINCI_ASYNC_EMIF_DATA_CE2_BASE
 #define PHYS_FLASH_SIZE			(8 << 20) /* Flash size 8MB */
diff --git a/include/configs/devkit3250.h b/include/configs/devkit3250.h
index 1e24d05bfb..f30958f0d3 100644
--- a/include/configs/devkit3250.h
+++ b/include/configs/devkit3250.h
@@ -39,7 +39,6 @@
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
index 62b62e07c5..6ad8722d60 100644
--- a/include/configs/eb_cpu5282.h
+++ b/include/configs/eb_cpu5282.h
@@ -116,7 +116,6 @@
 #define CONFIG_SYS_INT_FLASH_ENABLE	0x21
 
 #define	CONFIG_SYS_MAX_FLASH_SECT	128
-#define	CONFIG_SYS_MAX_FLASH_BANKS	1
 #define	CONFIG_SYS_FLASH_ERASE_TOUT	10000000
 
 #define CONFIG_SYS_FLASH_SIZE		16*1024*1024
diff --git a/include/configs/ebisu.h b/include/configs/ebisu.h
index 87053760e2..178b050a12 100644
--- a/include/configs/ebisu.h
+++ b/include/configs/ebisu.h
@@ -26,8 +26,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/edminiv2.h b/include/configs/edminiv2.h
index e20e058e0a..90e387e6c5 100644
--- a/include/configs/edminiv2.h
+++ b/include/configs/edminiv2.h
@@ -85,7 +85,6 @@
  * FLASH configuration
  */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1  /* max num of flash banks       */
 #define CONFIG_SYS_MAX_FLASH_SECT	11 /* max num of sects on one chip */
 #define CONFIG_SYS_FLASH_BASE		0xfff80000
 
diff --git a/include/configs/ethernut5.h b/include/configs/ethernut5.h
index ccf615efa3..d72f704636 100644
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
index c7fdf7c6bb..7e13464b10 100644
--- a/include/configs/gazerbeam.h
+++ b/include/configs/gazerbeam.h
@@ -43,7 +43,6 @@
 #define CONFIG_SYS_FLASH_BASE		0xFE000000 /* FLASH base address */
 #define CONFIG_SYS_FLASH_SIZE		8 /* FLASH size is up to 8M */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1 /* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	135
 
 #define CONFIG_SYS_BAUDRATE_TABLE  \
diff --git a/include/configs/ids8313.h b/include/configs/ids8313.h
index 206a57a653..e35862a6cd 100644
--- a/include/configs/ids8313.h
+++ b/include/configs/ids8313.h
@@ -118,7 +118,6 @@
 #define CONFIG_SYS_FLASH_SIZE		8
 
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	128
 
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000
diff --git a/include/configs/imx27lite-common.h b/include/configs/imx27lite-common.h
index dffe175f50..641e4037d5 100644
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
index ba0e4dd5c6..9d7a9e18d5 100644
--- a/include/configs/km/pg-wcom-ls102xa.h
+++ b/include/configs/km/pg-wcom-ls102xa.h
@@ -68,7 +68,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	512	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/kmcent2.h b/include/configs/kmcent2.h
index 98e572397b..ca0cb31c29 100644
--- a/include/configs/kmcent2.h
+++ b/include/configs/kmcent2.h
@@ -246,7 +246,6 @@
 /* More NOR Flash params */
 #define CONFIG_SYS_FLASH_QUIET_TEST
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	512	/* sectors per device */
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO
diff --git a/include/configs/kzm9g.h b/include/configs/kzm9g.h
index 1eb6dafe20..022858f692 100644
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
index 7edb5c6180..8c4cb7b720 100644
--- a/include/configs/ls1021aqds.h
+++ b/include/configs/ls1021aqds.h
@@ -102,7 +102,6 @@
 #define CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1021atwr.h b/include/configs/ls1021atwr.h
index d4c6f4fcf8..dcee79de88 100644
--- a/include/configs/ls1021atwr.h
+++ b/include/configs/ls1021atwr.h
@@ -114,7 +114,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1043aqds.h b/include/configs/ls1043aqds.h
index 80eff7b1a9..5f9cb97855 100644
--- a/include/configs/ls1043aqds.h
+++ b/include/configs/ls1043aqds.h
@@ -90,7 +90,6 @@
 					FTIM2_NOR_TWP(0x1c))
 #define CONFIG_SYS_NOR_FTIM3		0
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1043ardb.h b/include/configs/ls1043ardb.h
index 7b6d19374e..fa6a8b7777 100644
--- a/include/configs/ls1043ardb.h
+++ b/include/configs/ls1043ardb.h
@@ -56,7 +56,6 @@
 #define CONFIG_SYS_NOR_FTIM3		0
 #define CONFIG_SYS_IFC_CCR		0x01000000
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1046aqds.h b/include/configs/ls1046aqds.h
index 97bf4182be..3d72c67a54 100644
--- a/include/configs/ls1046aqds.h
+++ b/include/configs/ls1046aqds.h
@@ -97,7 +97,6 @@
 					FTIM2_NOR_TWP(0x1c))
 #define CONFIG_SYS_NOR_FTIM3		0
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1088aqds.h b/include/configs/ls1088aqds.h
index 5912fe95cc..2d33ab0794 100644
--- a/include/configs/ls1088aqds.h
+++ b/include/configs/ls1088aqds.h
@@ -72,7 +72,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls1088ardb.h b/include/configs/ls1088ardb.h
index 400b8adb24..4cb5d7517f 100644
--- a/include/configs/ls1088ardb.h
+++ b/include/configs/ls1088ardb.h
@@ -60,7 +60,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls2080aqds.h b/include/configs/ls2080aqds.h
index b0a05dd807..07cf59fcb8 100644
--- a/include/configs/ls2080aqds.h
+++ b/include/configs/ls2080aqds.h
@@ -85,7 +85,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/ls2080ardb.h b/include/configs/ls2080ardb.h
index a54387e16c..6d8effea74 100644
--- a/include/configs/ls2080ardb.h
+++ b/include/configs/ls2080ardb.h
@@ -87,7 +87,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45 /* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
 #define CONFIG_SYS_MAX_FLASH_SECT	1024	/* sectors per device */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/lsxl.h b/include/configs/lsxl.h
index afa0206fb9..e8e02e7f7b 100644
--- a/include/configs/lsxl.h
+++ b/include/configs/lsxl.h
@@ -19,7 +19,6 @@
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
index 211f39a0fa..4719184b5e 100644
--- a/include/configs/omap3_logic.h
+++ b/include/configs/omap3_logic.h
@@ -154,7 +154,6 @@
 #endif
 
 #define CONFIG_SYS_MAX_FLASH_SECT	256
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #define CONFIG_SYS_FLASH_SIZE		0x4000000
 
diff --git a/include/configs/p1_p2_rdb_pc.h b/include/configs/p1_p2_rdb_pc.h
index 2e1331b9b0..b993ec8316 100644
--- a/include/configs/p1_p2_rdb_pc.h
+++ b/include/configs/p1_p2_rdb_pc.h
@@ -254,8 +254,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_FLASH_SHOW_PROGRESS	45	/* count down from 45/5: 9..1 */
 
-#define CONFIG_SYS_MAX_FLASH_BANKS	1	/* number of banks */
-
 #undef CONFIG_SYS_FLASH_CHECKSUM
 #define CONFIG_SYS_FLASH_ERASE_TOUT	60000	/* Flash Erase Timeout (ms) */
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Flash Write Timeout (ms) */
diff --git a/include/configs/pm9261.h b/include/configs/pm9261.h
index be24d82538..f3196ee847 100644
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
index e9eb736ecb..4856f61527 100644
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
index 8e86830e61..e3105fe53c 100644
--- a/include/configs/r2dplus.h
+++ b/include/configs/r2dplus.h
@@ -21,7 +21,6 @@
  * NOR Flash ( Spantion S29GL256P )
  */
 #define CONFIG_SYS_FLASH_BASE		(0xA0000000)
-#define CONFIG_SYS_MAX_FLASH_BANKS (1)
 #define CONFIG_SYS_MAX_FLASH_SECT  256
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
 
diff --git a/include/configs/salvator-x.h b/include/configs/salvator-x.h
index da3e2c8856..9542b0d1b5 100644
--- a/include/configs/salvator-x.h
+++ b/include/configs/salvator-x.h
@@ -24,8 +24,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
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
index 928582ab8c..8646dc2318 100644
--- a/include/configs/socfpga_soc64_common.h
+++ b/include/configs/socfpga_soc64_common.h
@@ -136,7 +136,6 @@ unsigned int cm_get_qspi_controller_clk_hz(void);
 /*
  * Flash configurations
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 /* Ethernet on SoC (EMAC) */
 #if defined(CONFIG_CMD_NET)
diff --git a/include/configs/socrates.h b/include/configs/socrates.h
index 15e93d044e..be59cc2fdc 100644
--- a/include/configs/socrates.h
+++ b/include/configs/socrates.h
@@ -93,7 +93,6 @@
 #define CONFIG_SYS_LBC_FLASH_BASE	CONFIG_SYS_FLASH1	/* Localbus flash start	*/
 #define CONFIG_SYS_FLASH_BASE		CONFIG_SYS_LBC_FLASH_BASE /* start of FLASH	*/
 
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
index 0409589152..8dd092fc59 100644
--- a/include/configs/synquacer.h
+++ b/include/configs/synquacer.h
@@ -37,7 +37,6 @@
 #define CONFIG_PL01x_PORTS		{(void *)(0x2a400000)}
 
 /* Support MTD */
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BASE		(0x08000000)
 #define CONFIG_SYS_FLASH_BANKS_LIST	{CONFIG_SYS_FLASH_BASE}
 
diff --git a/include/configs/total_compute.h b/include/configs/total_compute.h
index c752da374b..9638ab2017 100644
--- a/include/configs/total_compute.h
+++ b/include/configs/total_compute.h
@@ -57,7 +57,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
 #define FLASH_MAX_SECTOR_SIZE		0x00040000
diff --git a/include/configs/ulcb.h b/include/configs/ulcb.h
index c22c30c86f..ca79b0352a 100644
--- a/include/configs/ulcb.h
+++ b/include/configs/ulcb.h
@@ -24,8 +24,6 @@
 #define CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
index 44c746f6f2..c90e0b6c38 100644
--- a/include/configs/vexpress_aemv8a.h
+++ b/include/configs/vexpress_aemv8a.h
@@ -200,7 +200,6 @@
 #endif
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 
 #ifdef CONFIG_USB_EHCI_HCD
 #define CONFIG_USB_OHCI_NEW
diff --git a/include/configs/vexpress_common.h b/include/configs/vexpress_common.h
index 91d50bc4a0..5f119aeb3d 100644
--- a/include/configs/vexpress_common.h
+++ b/include/configs/vexpress_common.h
@@ -176,7 +176,6 @@
 /* FLASH and environment organization */
 #define PHYS_FLASH_SIZE			0x04000000	/* 64MB */
 #define CONFIG_SYS_FLASH_SIZE		0x04000000
-#define CONFIG_SYS_MAX_FLASH_BANKS	2
 #define CONFIG_SYS_FLASH_BASE0		V2M_NOR0
 #define CONFIG_SYS_FLASH_BASE1		V2M_NOR1
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE0
diff --git a/include/configs/xtfpga.h b/include/configs/xtfpga.h
index c8a6e9a61a..8c2cdb5cbd 100644
--- a/include/configs/xtfpga.h
+++ b/include/configs/xtfpga.h
@@ -181,7 +181,6 @@
 /*=====================*/
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS	1
 #ifdef CONFIG_XTFPGA_LX60
 # define CONFIG_SYS_FLASH_SIZE		0x0040000	/* 4MB */
 # define CONFIG_SYS_FLASH_SECT_SZ	0x10000		/* block size 64KB */
diff --git a/include/configs/zynq-common.h b/include/configs/zynq-common.h
index 88c6490d81..da2acb9a75 100644
--- a/include/configs/zynq-common.h
+++ b/include/configs/zynq-common.h
@@ -35,7 +35,6 @@
 
 /* NOR */
 #ifdef CONFIG_MTD_NOR_FLASH
-# define CONFIG_SYS_MAX_FLASH_BANKS	1
 # define CONFIG_SYS_MAX_FLASH_SECT	512
 # define CONFIG_SYS_FLASH_ERASE_TOUT	1000
 # define CONFIG_SYS_FLASH_WRITE_TOUT	5000
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 79f03d1636..7726243f22 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1499,8 +1499,6 @@ CONFIG_SYS_MASTER_CLOCK
 CONFIG_SYS_MATRIX_EBI0CSA_VAL
 CONFIG_SYS_MATRIX_EBICSA_VAL
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
