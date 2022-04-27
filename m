Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD051166E
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Apr 2022 13:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE729C6047D;
	Wed, 27 Apr 2022 11:54:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83E1EC5F1FB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Apr 2022 11:54:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RACiSs005824;
 Wed, 27 Apr 2022 13:54:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=i+MuB6fiZJj916QM0lBk5kIiLcLtEEErZ0M9SQXF0p4=;
 b=XI/lkuNPG94QITcQo6Nv+vUJlfjlvTR1YBtenF0VTCHvM93KK4LHwqDZ/oyRviFNDpBZ
 XEqeWLjM9LRcnAdGH+JSnTnLoVJ60cTPwGxdKghJn+COxJRFusDDu0s0w5NcTLcYC15p
 6hgk9lHdH8wuvVQif8MlnjmHKSlz+yhSk2ZNOeuB4DTa7PSUT55jGTuqiZ3brPkM/Uth
 1wcuoQwm+cd/yj+QBtLGs16Hy4azuBSFX19PcLXT8wXoffJY8MgG/FBpG28zO75WEFLA
 LDb/tH+nJ5R7uqSGjbs3V9/f8SD9pqahhx1SvJM/djx4NgWVVH2stoxmeKDRyvRUDhc9 AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fprt4ujgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 13:54:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F905100034;
 Wed, 27 Apr 2022 13:54:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 197A321E69F;
 Wed, 27 Apr 2022 13:54:05 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 27 Apr
 2022 13:54:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Apr 2022 13:53:52 +0200
Message-ID: <20220427115401.155400-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427115401.155400-1-patrice.chotard@foss.st.com>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 03/12] configs: stm32f746-disco: Add
	stm32f746-disco_defconfig
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

Add stm32f746-disco_defconfig for stm32f746 discovery board to
build U-Boot proper.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 configs/stm32f746-disco_defconfig | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 configs/stm32f746-disco_defconfig

diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
new file mode 100644
index 0000000000..2c70bac9cd
--- /dev/null
+++ b/configs/stm32f746-disco_defconfig
@@ -0,0 +1,64 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32=y
+CONFIG_SYS_TEXT_BASE=0x08000000
+CONFIG_SYS_MALLOC_LEN=0x100000
+CONFIG_SYS_MALLOC_F_LEN=0xE00
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
+CONFIG_STM32F7=y
+CONFIG_TARGET_STM32F746_DISCO=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_SYS_LOAD_ADDR=0x8008000
+CONFIG_BOOTDELAY=3
+CONFIG_AUTOBOOT_KEYED=y
+CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
+CONFIG_AUTOBOOT_STOP_STR=" "
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+# CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_BOARD_LATE_INIT=y
+CONFIG_SYS_PROMPT="U-Boot > "
+CONFIG_CMD_GPT=y
+# CONFIG_RANDOM_UUID is not set
+CONFIG_CMD_MMC=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_SNTP=y
+CONFIG_CMD_DNS=y
+CONFIG_CMD_LINK_LOCAL=y
+CONFIG_CMD_BMP=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIMER=y
+# CONFIG_ISO_PARTITION is not set
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_NETCONSOLE=y
+CONFIG_ARM_PL180_MMCI=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_MTD_NOR_FLASH=y
+CONFIG_STM32_FLASH=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_PHY_SMSC=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_MII=y
+# CONFIG_PINCTRL_FULL is not set
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
+CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_MAX_XRES=480
+CONFIG_VIDEO_STM32_MAX_YRES=640
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_OF_LIBFDT_OVERLAY=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
