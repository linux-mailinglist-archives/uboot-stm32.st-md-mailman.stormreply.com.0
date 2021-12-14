Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDF4748A4
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Dec 2021 17:57:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13306C5E2C5;
	Tue, 14 Dec 2021 16:57:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39E28C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 16:57:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEFVlw7018573;
 Tue, 14 Dec 2021 17:57:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=VejU2s/Y6BvWThuBlJCALHgVNOCxbVOuiRiK51tT8QA=;
 b=OFO3Q9KuCxcRrzXEoMyS6Ql34qZqKVQI1zhN3ht+0E6YOasn4aWZn5wHq3X7Ru5WdQdT
 ObcZIGeEGztptdb5E54LKDFKeeArM80OLxte01OBxUtohnYPGdk8fm6jZts59fHzLkVE
 dhD9Nfn8/mlyr2kzUcOtTB5lmRR2xUZd6/qydGPxiqbeMtaGThn12VesMvD+a+iQ+j0x
 O1nJqEZ4z8c2VZZWuiauxtRUP0xwZ5O0BIRPDriu05bOz95bzzsN4+L/u6tc9VNpkmoP
 En+9iqLpxxZu3x1IaxZQ3g+Xw3B1lB5YOP5jUawqXtsXpwxkRcKaagbAMD8Y+i2YedP1 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxk4hnbng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 17:57:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B68B510002A;
 Tue, 14 Dec 2021 17:57:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A21E620A088;
 Tue, 14 Dec 2021 17:57:06 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 17:57:06
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Dec 2021 17:56:59 +0100
Message-ID: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
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
Subject: [Uboot-stm32] [RFC PATCH 0/5] configs: Migrate
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


Proposal after Marek comment in [1], move CONFIG_SYS_MAX_FLASH_BANKS
and CONFIG_SYS_MAX_FLASH_BANKS_DETECT in Kconfig.

Only RFC because I am not sure if I choose the correct solution
when I introduced the CFI_FLASH_BANKS to simplify the
support of all the options in include/mtd/cfi_flash.h

no compilation issue before rebase =
https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/10084

but not tested

[1] [v3,1/2] mtd: cfi_flash: use cfi_flash_num_flash_banks only when supported
http: //patchwork.ozlabs.org/project/uboot/patch/20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid/#2754501


Patrick Delaunay (5):
  cmd: Fix up warnings in flash.c
  mtd: cfi: introduce CFI_FLASH_BANKS
  mtd: cfi: change CONFIG_SYS_MAX_FLASH_BANKS_DETECT as boolean
  configs: Migrate CONFIG_SYS_MAX_FLASH_BANKS to Kconfig
  Convert CONFIG_AT91_EFLASH to Kconfig

 README                                       |   3 -
 arch/arm/mach-at91/Kconfig                   |   8 +
 cmd/bootm.c                                  |   2 +-
 cmd/flash.c                                  | 247 +++++++++----------
 common/flash.c                               |   2 +-
 common/update.c                              |   4 +-
 configs/3c120_defconfig                      |   1 +
 configs/M5253DEMO_defconfig                  |   1 +
 configs/MPC8548CDS_36BIT_defconfig           |   1 +
 configs/MPC8548CDS_defconfig                 |   1 +
 configs/MPC8548CDS_legacy_defconfig          |   1 +
 configs/P3041DS_NAND_defconfig               |   1 +
 configs/P3041DS_SDCARD_defconfig             |   1 +
 configs/P3041DS_SPIFLASH_defconfig           |   1 +
 configs/P3041DS_defconfig                    |   1 +
 configs/P4080DS_SDCARD_defconfig             |   1 +
 configs/P4080DS_SPIFLASH_defconfig           |   1 +
 configs/P4080DS_defconfig                    |   1 +
 configs/P5040DS_NAND_defconfig               |   1 +
 configs/P5040DS_SDCARD_defconfig             |   1 +
 configs/P5040DS_SPIFLASH_defconfig           |   1 +
 configs/P5040DS_defconfig                    |   1 +
 configs/T1042D4RDB_NAND_defconfig            |   1 +
 configs/T1042D4RDB_SDCARD_defconfig          |   1 +
 configs/T1042D4RDB_SPIFLASH_defconfig        |   1 +
 configs/T1042D4RDB_defconfig                 |   1 +
 configs/T2080QDS_NAND_defconfig              |   1 +
 configs/T2080QDS_SDCARD_defconfig            |   1 +
 configs/T2080QDS_SECURE_BOOT_defconfig       |   1 +
 configs/T2080QDS_SPIFLASH_defconfig          |   1 +
 configs/T2080QDS_defconfig                   |   1 +
 configs/T4240RDB_SDCARD_defconfig            |   1 +
 configs/T4240RDB_defconfig                   |   1 +
 configs/boston32r2_defconfig                 |   1 +
 configs/boston32r2el_defconfig               |   1 +
 configs/boston32r6_defconfig                 |   1 +
 configs/boston32r6el_defconfig               |   1 +
 configs/boston64r2_defconfig                 |   1 +
 configs/boston64r2el_defconfig               |   1 +
 configs/boston64r6_defconfig                 |   1 +
 configs/boston64r6el_defconfig               |   1 +
 configs/cobra5272_defconfig                  |   1 +
 configs/comtrend_ct5361_ram_defconfig        |   1 +
 configs/comtrend_wap5813n_ram_defconfig      |   1 +
 configs/ethernut5_defconfig                  |   1 +
 configs/huawei_hg556a_ram_defconfig          |   1 +
 configs/j7200_evm_a72_defconfig              |   1 +
 configs/j7200_evm_r5_defconfig               |   1 +
 configs/j721e_evm_a72_defconfig              |   1 +
 configs/j721e_hs_evm_a72_defconfig           |   1 +
 configs/ls1021aqds_ddr4_nor_defconfig        |   1 +
 configs/ls1021aqds_ddr4_nor_lpuart_defconfig |   1 +
 configs/ls1021aqds_nand_defconfig            |   1 +
 configs/ls1021aqds_nor_SECURE_BOOT_defconfig |   1 +
 configs/ls1021aqds_nor_defconfig             |   1 +
 configs/ls1021aqds_nor_lpuart_defconfig      |   1 +
 configs/ls1021aqds_sdcard_ifc_defconfig      |   1 +
 configs/ls1046aqds_SECURE_BOOT_defconfig     |   1 +
 configs/ls1046aqds_defconfig                 |   1 +
 configs/ls1046aqds_lpuart_defconfig          |   1 +
 configs/ls1046aqds_nand_defconfig            |   1 +
 configs/ls1046aqds_sdcard_ifc_defconfig      |   1 +
 configs/ls1046aqds_tfa_SECURE_BOOT_defconfig |   1 +
 configs/ls1046aqds_tfa_defconfig             |   1 +
 configs/ls1088aqds_defconfig                 |   1 +
 configs/ls1088aqds_sdcard_ifc_defconfig      |   1 +
 configs/ls1088aqds_tfa_defconfig             |   1 +
 configs/ls2080aqds_SECURE_BOOT_defconfig     |   1 +
 configs/ls2080aqds_defconfig                 |   1 +
 configs/ls2088aqds_tfa_defconfig             |   1 +
 configs/qemu_arm64_defconfig                 |   2 +
 configs/qemu_arm_defconfig                   |   2 +
 configs/r8a77990_ebisu_defconfig             |   1 +
 configs/r8a77995_draak_defconfig             |   1 +
 configs/rcar3_salvator-x_defconfig           |   1 +
 configs/rcar3_ulcb_defconfig                 |   1 +
 configs/sfr_nb4-ser_ram_defconfig            |   1 +
 configs/socrates_defconfig                   |   1 +
 drivers/mtd/Kconfig                          |  27 ++
 drivers/mtd/cfi_flash.c                      |   6 +-
 drivers/mtd/cfi_mtd.c                        |   4 +-
 include/configs/10m50_devboard.h             |   1 -
 include/configs/3c120_devboard.h             |   1 -
 include/configs/M5208EVBE.h                  |   1 -
 include/configs/M5235EVB.h                   |   1 -
 include/configs/M5249EVB.h                   |   1 -
 include/configs/M5253DEMO.h                  |   1 -
 include/configs/M5272C3.h                    |   1 -
 include/configs/M5275EVB.h                   |   1 -
 include/configs/M5282EVB.h                   |   1 -
 include/configs/M53017EVB.h                  |   1 -
 include/configs/M5329EVB.h                   |   1 -
 include/configs/M5373EVB.h                   |   1 -
 include/configs/MCR3000.h                    |   1 -
 include/configs/MPC837XERDB.h                |   1 -
 include/configs/MPC8540ADS.h                 |   1 -
 include/configs/MPC8548CDS.h                 |   1 -
 include/configs/MPC8560ADS.h                 |   1 -
 include/configs/P1010RDB.h                   |   1 -
 include/configs/P2041RDB.h                   |   1 -
 include/configs/T102xRDB.h                   |   1 -
 include/configs/T104xRDB.h                   |   1 -
 include/configs/T208xQDS.h                   |   1 -
 include/configs/T208xRDB.h                   |   1 -
 include/configs/T4240RDB.h                   |   1 -
 include/configs/adp-ae3xx.h                  |   6 -
 include/configs/adp-ag101p.h                 |   3 -
 include/configs/am335x_evm.h                 |   1 -
 include/configs/am3517_evm.h                 |   1 -
 include/configs/amcore.h                     |   1 -
 include/configs/armadillo-800eva.h           |   1 -
 include/configs/astro_mcf5373l.h             |   1 -
 include/configs/at91sam9263ek.h              |   1 -
 include/configs/ax25-ae350.h                 |   6 -
 include/configs/bcm7445.h                    |   2 -
 include/configs/blanche.h                    |   1 -
 include/configs/bmips_bcm6338.h              |   1 -
 include/configs/bmips_bcm6348.h              |   1 -
 include/configs/bmips_bcm6358.h              |   1 -
 include/configs/bmips_bcm6368.h              |   1 -
 include/configs/boston.h                     |   2 +-
 include/configs/cobra5272.h                  |   1 -
 include/configs/colibri_pxa270.h             |   1 -
 include/configs/corenet_ds.h                 |   1 -
 include/configs/da850evm.h                   |   1 -
 include/configs/devkit3250.h                 |   1 -
 include/configs/dra7xx_evm.h                 |   1 -
 include/configs/draak.h                      |   1 -
 include/configs/eb_cpu5282.h                 |   1 -
 include/configs/ebisu.h                      |   1 -
 include/configs/edminiv2.h                   |   1 -
 include/configs/ethernut5.h                  |   2 -
 include/configs/gazerbeam.h                  |   1 -
 include/configs/ids8313.h                    |   1 -
 include/configs/imx27lite-common.h           |   1 -
 include/configs/integrator-common.h          |   1 -
 include/configs/j721e_evm.h                  |   1 -
 include/configs/km/km-mpc83xx.h              |   1 -
 include/configs/km/pg-wcom-ls102xa.h         |   1 -
 include/configs/kmcent2.h                    |   1 -
 include/configs/kzm9g.h                      |   1 -
 include/configs/ls1021aqds.h                 |   1 -
 include/configs/ls1021atwr.h                 |   1 -
 include/configs/ls1043aqds.h                 |   1 -
 include/configs/ls1043ardb.h                 |   1 -
 include/configs/ls1046aqds.h                 |   1 -
 include/configs/ls1088aqds.h                 |   1 -
 include/configs/ls1088ardb.h                 |   1 -
 include/configs/ls2080aqds.h                 |   1 -
 include/configs/ls2080ardb.h                 |   1 -
 include/configs/lsxl.h                       |   1 -
 include/configs/malta.h                      |   1 -
 include/configs/mccmon6.h                    |   1 -
 include/configs/microblaze-generic.h         |   1 -
 include/configs/mx6sabreauto.h               |   1 -
 include/configs/octeon_ebb7304.h             |   1 -
 include/configs/omap3_logic.h                |   1 -
 include/configs/p1_p2_rdb_pc.h               |   2 -
 include/configs/pm9261.h                     |   1 -
 include/configs/pm9263.h                     |   1 -
 include/configs/qemu-arm.h                   |   1 -
 include/configs/qemu-riscv.h                 |   2 -
 include/configs/r2dplus.h                    |   1 -
 include/configs/salvator-x.h                 |   1 -
 include/configs/sama5d3xek.h                 |   1 -
 include/configs/socfpga_arria10_socdk.h      |   1 -
 include/configs/socfpga_soc64_common.h       |   1 -
 include/configs/socrates.h                   |   1 -
 include/configs/stih410-b2260.h              |   2 -
 include/configs/stm32f429-discovery.h        |   1 -
 include/configs/stm32f429-evaluation.h       |   1 -
 include/configs/stm32f469-discovery.h        |   1 -
 include/configs/stm32f746-disco.h            |   1 -
 include/configs/synquacer.h                  |   1 -
 include/configs/total_compute.h              |   1 -
 include/configs/ulcb.h                       |   1 -
 include/configs/vexpress_aemv8a.h            |   1 -
 include/configs/vexpress_common.h            |   1 -
 include/configs/xtfpga.h                     |   1 -
 include/configs/zynq-common.h                |   1 -
 include/mtd/cfi_flash.h                      |  15 +-
 scripts/config_whitelist.txt                 |   3 -
 182 files changed, 249 insertions(+), 263 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
