Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 522CE1896CD
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E749DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6093C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IHB4021541; Wed, 18 Mar 2020 09:23:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hoB3dQbbCMEjsjrTzLVwTCeigmRyZFkfQB+RdNPwuFA=;
 b=K1oHwxzu3ywDSWLVZ9kYgguLgg65dCo/GWqnWjLqwHVLwXR0ZshJ4TT9go2xTA6nx0UB
 7oqBopi600ksU11/cFOkZX+2QBBwT3fLNaL+8Pvz2iOTf+0gm3uJE57oal3EjjfN/Q8W
 ltvm4R/FY2VN2HccabjnMvxB9V1IR9OCvH94M1WxB8ABlENHVSpu8jEUT6AfLxfSe6Xy
 FrClD8mfI55br4niMyDWFP92vsre1m6GEkJhZ7TfF5qh774kgyTyJQrrV2m+Ny48JdlK
 Qa55GuiyjKgJbu1u+QxgcN+zxmE2F/3NofVYxgycZfhaCagcCnO2c0/pnYjsIEPi9vVo bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uj2vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49F0F100038;
 Wed, 18 Mar 2020 09:23:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E8F521CA90;
 Wed, 18 Mar 2020 09:23:06 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:23:05 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:52 +0100
Message-ID: <20200318092245.9.I3043020b8fdd70bdd9df04665efc5d87c37168b4@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: support boot from
	spi-nand
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

Manage BOOT_FLASH_SPINAND, with boot_device="spi-nand"
and treat this value in bootcmd_stm32mp.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c                | 4 ++++
 arch/arm/mach-stm32mp/include/mach/stm32.h | 3 +++
 arch/arm/mach-stm32mp/spl.c                | 2 ++
 board/st/stm32mp1/stm32mp1.c               | 2 ++
 include/configs/stm32mp1.h                 | 5 +++--
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 9aa5794334..e14e3e47f2 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -435,6 +435,10 @@ static void setup_boot_mode(void)
 		env_set("boot_device", "nand");
 		env_set("boot_instance", "0");
 		break;
+	case BOOT_FLASH_SPINAND:
+		env_set("boot_device", "spi-nand");
+		env_set("boot_instance", "0");
+		break;
 	case BOOT_FLASH_NOR:
 		env_set("boot_device", "nor");
 		env_set("boot_instance", "0");
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 6daf9f7121..a9bd5bdc1b 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -79,6 +79,9 @@ enum boot_device {
 
 	BOOT_SERIAL_USB = 0x60,
 	BOOT_SERIAL_USB_OTG = 0x62,
+
+	BOOT_FLASH_SPINAND = 0x70,
+	BOOT_FLASH_SPINAND_1 = 0x71,
 };
 
 /* TAMP registers */
diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index ca4231cd0d..9cd7b418a4 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -39,6 +39,8 @@ u32 spl_boot_device(void)
 		return BOOT_DEVICE_NAND;
 	case BOOT_FLASH_NOR_QSPI:
 		return BOOT_DEVICE_SPI;
+	case BOOT_FLASH_SPINAND_1:
+		return BOOT_DEVICE_NONE; /* SPINAND not supported in SPL */
 	}
 
 	return BOOT_DEVICE_MMC1;
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 14c56a0f24..423be23555 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -789,6 +789,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
 #endif
 #ifdef CONFIG_ENV_IS_IN_UBI
 	case BOOT_FLASH_NAND:
+	case BOOT_FLASH_SPINAND:
 		return ENVL_UBI;
 #endif
 #ifdef CONFIG_ENV_IS_IN_SPI_FLASH
@@ -829,6 +830,7 @@ int ft_board_setup(void *blob, bd_t *bd)
 #ifdef CONFIG_FDT_FIXUP_PARTITIONS
 	struct node_info nodes[] = {
 		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
+		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
 		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
 	};
 	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index c5b09f1a2a..c34a720e0c 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -127,7 +127,7 @@
  * bootcmd for stm32mp1:
  * for serial/usb: execute the stm32prog command
  * for mmc boot (eMMC, SD card), boot only on the same device
- * for nand boot, boot with on ubifs partition on nand
+ * for nand or spi-nand boot, boot with on ubifs partition on UBI partition
  * for nor boot, use the default order
  */
 #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
@@ -138,7 +138,8 @@
 		"run env_check;" \
 		"if test ${boot_device} = mmc;" \
 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
-		"if test ${boot_device} = nand;" \
+		"if test ${boot_device} = nand ||" \
+		  " test ${boot_device} = spi-nand ;" \
 		"then env set boot_targets ubifs0; fi;" \
 		"run distro_bootcmd;" \
 	"fi;\0"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
