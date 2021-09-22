Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8B414468
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 11:02:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B5CCC5A4CC;
	Wed, 22 Sep 2021 09:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 414F3C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 09:02:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M6pm1x002897; 
 Wed, 22 Sep 2021 11:02:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=o/lm/Ovm3QGz9a4QzovlljJRdVxdBIUX06TTq4n+WVE=;
 b=z42CXH/8SA/gQrK0S+5hDA1Pe3YpObDc32qOO7zNdWdasoVrxy0Gl9gByx5/VOGslrGv
 xTimjqsfkcdFBMGgAQfxvXjmxvfQSOjkskAQyrrBLi/eAm8zxtLtSZucKEkuLn9XzVvG
 KZbJ8R50fcRVt6hH5UllXBdhFS8UhCwzJcnFB63xJYza4aeLV0/1wcSLhrayEBsFUtWi
 Tc4Rve9SWHuf4ILtXuCOj+WOeYd3Ri3pZRqcALqzbTTWQ29BP/+hGvtUGpDIog3Ax/xy
 0NREKSNsTarCbjsFfjTaOAIctFTnjyrVDwbqUyTnjLkiPP74gdHpiJr7zL3BZga5oWv8 Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7q3w2vdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 11:02:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7435E10003A;
 Wed, 22 Sep 2021 11:02:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C614226FAE;
 Wed, 22 Sep 2021 11:02:29 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 22 Sep 2021 11:02:28
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Sep 2021 11:02:26 +0200
Message-ID: <20210922110223.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_03,2021-09-20_01,2020-04-07_01
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH] mtd: remove SPEAr flash driver st_smi
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

Remove the driver st_smic.c used in SPEAr products and the associated
config CONFIG_ST_SMI; this driver is no more used in U-Boot after the
commit 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr
support").

Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Even if CONFIG_ST_SMI was activated in 2 board, the compiled driver was
empty because CONFIG_MTD_NOR_FLASH wasn't activated in:
- bcm7260_defconfig
- bcm7445_defconfig

The U-Boot size don't change for these 2 defconfig (tested with buildman).

This patch replace the previous "configs: Migrate CONFIG_ST_SMI to Kconfig".
http://patchwork.ozlabs.org/project/uboot/list/?series=263365&state=*


 drivers/mtd/Makefile         |   1 -
 drivers/mtd/st_smi.c         | 565 -----------------------------------
 include/configs/bcmstb.h     |   1 -
 include/linux/mtd/st_smi.h   | 100 -------
 scripts/config_whitelist.txt |   1 -
 5 files changed, 668 deletions(-)
 delete mode 100644 drivers/mtd/st_smi.c
 delete mode 100644 include/linux/mtd/st_smi.h

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 6d77ebfaa5..ce0451108e 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -12,7 +12,6 @@ mtd-$(CONFIG_FLASH_CFI_DRIVER) += cfi_flash.o
 mtd-$(CONFIG_FLASH_CFI_MTD) += cfi_mtd.o
 mtd-$(CONFIG_FLASH_CFI_LEGACY) += jedec_flash.o
 mtd-$(CONFIG_FLASH_PIC32) += pic32_flash.o
-mtd-$(CONFIG_ST_SMI) += st_smi.o
 mtd-$(CONFIG_STM32_FLASH) += stm32_flash.o
 mtd-$(CONFIG_RENESAS_RPC_HF) += renesas_rpc_hf.o
 mtd-$(CONFIG_HBMC_AM654) += hbmc-am654.o
diff --git a/drivers/mtd/st_smi.c b/drivers/mtd/st_smi.c
deleted file mode 100644
index 7c652e6c53..0000000000
--- a/drivers/mtd/st_smi.c
+++ /dev/null
@@ -1,565 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * (C) Copyright 2009
- * Vipin Kumar, ST Microelectronics, vipin.kumar@st.com.
- */
-
-#include <common.h>
-#include <flash.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/mtd/st_smi.h>
-
-#include <asm/io.h>
-#include <asm/arch/hardware.h>
-
-#if defined(CONFIG_MTD_NOR_FLASH)
-
-static struct smi_regs *const smicntl =
-    (struct smi_regs * const)CONFIG_SYS_SMI_BASE;
-static ulong bank_base[CONFIG_SYS_MAX_FLASH_BANKS] =
-    CONFIG_SYS_FLASH_ADDR_BASE;
-flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];
-
-/* data structure to maintain flash ids from different vendors */
-struct flash_device {
-	char *name;
-	u8 erase_cmd;
-	u32 device_id;
-	u32 pagesize;
-	unsigned long sectorsize;
-	unsigned long size_in_bytes;
-};
-
-#define FLASH_ID(n, es, id, psize, ssize, size)	\
-{				\
-	.name = n,		\
-	.erase_cmd = es,	\
-	.device_id = id,	\
-	.pagesize = psize,	\
-	.sectorsize = ssize,	\
-	.size_in_bytes = size	\
-}
-
-/*
- * List of supported flash devices.
- * Currently the erase_cmd field is not used in this driver.
- */
-static struct flash_device flash_devices[] = {
-	FLASH_ID("st m25p16"     , 0xd8, 0x00152020, 0x100, 0x10000, 0x200000),
-	FLASH_ID("st m25p32"     , 0xd8, 0x00162020, 0x100, 0x10000, 0x400000),
-	FLASH_ID("st m25p64"     , 0xd8, 0x00172020, 0x100, 0x10000, 0x800000),
-	FLASH_ID("st m25p128"    , 0xd8, 0x00182020, 0x100, 0x40000, 0x1000000),
-	FLASH_ID("st m25p05"     , 0xd8, 0x00102020, 0x80 , 0x8000 , 0x10000),
-	FLASH_ID("st m25p10"     , 0xd8, 0x00112020, 0x80 , 0x8000 , 0x20000),
-	FLASH_ID("st m25p20"     , 0xd8, 0x00122020, 0x100, 0x10000, 0x40000),
-	FLASH_ID("st m25p40"     , 0xd8, 0x00132020, 0x100, 0x10000, 0x80000),
-	FLASH_ID("st m25p80"     , 0xd8, 0x00142020, 0x100, 0x10000, 0x100000),
-	FLASH_ID("st m45pe10"    , 0xd8, 0x00114020, 0x100, 0x10000, 0x20000),
-	FLASH_ID("st m45pe20"    , 0xd8, 0x00124020, 0x100, 0x10000, 0x40000),
-	FLASH_ID("st m45pe40"    , 0xd8, 0x00134020, 0x100, 0x10000, 0x80000),
-	FLASH_ID("st m45pe80"    , 0xd8, 0x00144020, 0x100, 0x10000, 0x100000),
-	FLASH_ID("sp s25fl004"   , 0xd8, 0x00120201, 0x100, 0x10000, 0x80000),
-	FLASH_ID("sp s25fl008"   , 0xd8, 0x00130201, 0x100, 0x10000, 0x100000),
-	FLASH_ID("sp s25fl016"   , 0xd8, 0x00140201, 0x100, 0x10000, 0x200000),
-	FLASH_ID("sp s25fl032"   , 0xd8, 0x00150201, 0x100, 0x10000, 0x400000),
-	FLASH_ID("sp s25fl064"   , 0xd8, 0x00160201, 0x100, 0x10000, 0x800000),
-	FLASH_ID("mac 25l512"    , 0xd8, 0x001020C2, 0x010, 0x10000, 0x10000),
-	FLASH_ID("mac 25l1005"   , 0xd8, 0x001120C2, 0x010, 0x10000, 0x20000),
-	FLASH_ID("mac 25l2005"   , 0xd8, 0x001220C2, 0x010, 0x10000, 0x40000),
-	FLASH_ID("mac 25l4005"   , 0xd8, 0x001320C2, 0x010, 0x10000, 0x80000),
-	FLASH_ID("mac 25l4005a"  , 0xd8, 0x001320C2, 0x010, 0x10000, 0x80000),
-	FLASH_ID("mac 25l8005"   , 0xd8, 0x001420C2, 0x010, 0x10000, 0x100000),
-	FLASH_ID("mac 25l1605"   , 0xd8, 0x001520C2, 0x100, 0x10000, 0x200000),
-	FLASH_ID("mac 25l1605a"  , 0xd8, 0x001520C2, 0x010, 0x10000, 0x200000),
-	FLASH_ID("mac 25l3205"   , 0xd8, 0x001620C2, 0x100, 0x10000, 0x400000),
-	FLASH_ID("mac 25l3205a"  , 0xd8, 0x001620C2, 0x100, 0x10000, 0x400000),
-	FLASH_ID("mac 25l6405"   , 0xd8, 0x001720C2, 0x100, 0x10000, 0x800000),
-	FLASH_ID("wbd w25q128" , 0xd8, 0x001840EF, 0x100, 0x10000, 0x1000000),
-};
-
-/*
- * smi_wait_xfer_finish - Wait until TFF is set in status register
- * @timeout:	 timeout in milliseconds
- *
- * Wait until TFF is set in status register
- */
-static int smi_wait_xfer_finish(int timeout)
-{
-	ulong start = get_timer(0);
-
-	while (get_timer(start) < timeout) {
-		if (readl(&smicntl->smi_sr) & TFF)
-			return 0;
-
-		/* Try after 10 ms */
-		udelay(10);
-	};
-
-	return -1;
-}
-
-/*
- * smi_read_id - Read flash id
- * @info:	 flash_info structure pointer
- * @banknum:	 bank number
- *
- * Read the flash id present at bank #banknum
- */
-static unsigned int smi_read_id(flash_info_t *info, int banknum)
-{
-	unsigned int value;
-
-	writel(readl(&smicntl->smi_cr1) | SW_MODE, &smicntl->smi_cr1);
-	writel(READ_ID, &smicntl->smi_tr);
-	writel((banknum << BANKSEL_SHIFT) | SEND | TX_LEN_1 | RX_LEN_3,
-	       &smicntl->smi_cr2);
-
-	if (smi_wait_xfer_finish(XFER_FINISH_TOUT))
-		return -EIO;
-
-	value = (readl(&smicntl->smi_rr) & 0x00FFFFFF);
-
-	writel(readl(&smicntl->smi_sr) & ~TFF, &smicntl->smi_sr);
-	writel(readl(&smicntl->smi_cr1) & ~SW_MODE, &smicntl->smi_cr1);
-
-	return value;
-}
-
-/*
- * flash_get_size - Detect the SMI flash by reading the ID.
- * @base:	 Base address of the flash area bank #banknum
- * @banknum:	 Bank number
- *
- * Detect the SMI flash by reading the ID. Initializes the flash_info structure
- * with size, sector count etc.
- */
-static ulong flash_get_size(ulong base, int banknum)
-{
-	flash_info_t *info = &flash_info[banknum];
-	int value;
-	int i;
-
-	value = smi_read_id(info, banknum);
-
-	if (value < 0) {
-		printf("Flash id could not be read\n");
-		return 0;
-	}
-
-	/* Matches chip-id to entire list of 'serial-nor flash' ids */
-	for (i = 0; i < ARRAY_SIZE(flash_devices); i++) {
-		if (flash_devices[i].device_id == value) {
-			info->size = flash_devices[i].size_in_bytes;
-			info->flash_id = value;
-			info->start[0] = base;
-			info->sector_count =
-					info->size/flash_devices[i].sectorsize;
-
-			return info->size;
-		}
-	}
-
-	return 0;
-}
-
-/*
- * smi_read_sr - Read status register of SMI
- * @bank:	 bank number
- *
- * This routine will get the status register of the flash chip present at the
- * given bank
- */
-static int smi_read_sr(int bank)
-{
-	u32 ctrlreg1, val;
-
-	/* store the CTRL REG1 state */
-	ctrlreg1 = readl(&smicntl->smi_cr1);
-
-	/* Program SMI in HW Mode */
-	writel(readl(&smicntl->smi_cr1) & ~(SW_MODE | WB_MODE),
-	       &smicntl->smi_cr1);
-
-	/* Performing a RSR instruction in HW mode */
-	writel((bank << BANKSEL_SHIFT) | RD_STATUS_REG, &smicntl->smi_cr2);
-
-	if (smi_wait_xfer_finish(XFER_FINISH_TOUT))
-		return -1;
-
-	val = readl(&smicntl->smi_sr);
-
-	/* Restore the CTRL REG1 state */
-	writel(ctrlreg1, &smicntl->smi_cr1);
-
-	return val;
-}
-
-/*
- * smi_wait_till_ready - Wait till last operation is over.
- * @bank:	 bank number shifted.
- * @timeout:	 timeout in milliseconds.
- *
- * This routine checks for WIP(write in progress)bit in Status register(SMSR-b0)
- * The routine checks for #timeout loops, each at interval of 1 milli-second.
- * If successful the routine returns 0.
- */
-static int smi_wait_till_ready(int bank, int timeout)
-{
-	int sr;
-	ulong start = get_timer(0);
-
-	/* One chip guarantees max 5 msec wait here after page writes,
-	   but potentially three seconds (!) after page erase. */
-	while (get_timer(start) < timeout) {
-		sr = smi_read_sr(bank);
-		if ((sr >= 0) && (!(sr & WIP_BIT)))
-			return 0;
-
-		/* Try again after 10 usec */
-		udelay(10);
-	} while (timeout--);
-
-	printf("SMI controller is still in wait, timeout=%d\n", timeout);
-	return -EIO;
-}
-
-/*
- * smi_write_enable - Enable the flash to do write operation
- * @bank:	 bank number
- *
- * Set write enable latch with Write Enable command.
- * Returns negative if error occurred.
- */
-static int smi_write_enable(int bank)
-{
-	u32 ctrlreg1;
-	u32 start;
-	int timeout = WMODE_TOUT;
-	int sr;
-
-	/* Store the CTRL REG1 state */
-	ctrlreg1 = readl(&smicntl->smi_cr1);
-
-	/* Program SMI in H/W Mode */
-	writel(readl(&smicntl->smi_cr1) & ~SW_MODE, &smicntl->smi_cr1);
-
-	/* Give the Flash, Write Enable command */
-	writel((bank << BANKSEL_SHIFT) | WE, &smicntl->smi_cr2);
-
-	if (smi_wait_xfer_finish(XFER_FINISH_TOUT))
-		return -1;
-
-	/* Restore the CTRL REG1 state */
-	writel(ctrlreg1, &smicntl->smi_cr1);
-
-	start = get_timer(0);
-	while (get_timer(start) < timeout) {
-		sr = smi_read_sr(bank);
-		if ((sr >= 0) && (sr & (1 << (bank + WM_SHIFT))))
-			return 0;
-
-		/* Try again after 10 usec */
-		udelay(10);
-	};
-
-	return -1;
-}
-
-/*
- * smi_init - SMI initialization routine
- *
- * SMI initialization routine. Sets SMI control register1.
- */
-void smi_init(void)
-{
-	/* Setting the fast mode values. SMI working at 166/4 = 41.5 MHz */
-	writel(HOLD1 | FAST_MODE | BANK_EN | DSEL_TIME | PRESCAL4,
-	       &smicntl->smi_cr1);
-}
-
-/*
- * smi_sector_erase - Erase flash sector
- * @info:	 flash_info structure pointer
- * @sector:	 sector number
- *
- * Set write enable latch with Write Enable command.
- * Returns negative if error occurred.
- */
-static int smi_sector_erase(flash_info_t *info, unsigned int sector)
-{
-	int bank;
-	unsigned int sect_add;
-	unsigned int instruction;
-
-	switch (info->start[0]) {
-	case SMIBANK0_BASE:
-		bank = BANK0;
-		break;
-	case SMIBANK1_BASE:
-		bank = BANK1;
-		break;
-	case SMIBANK2_BASE:
-		bank = BANK2;
-		break;
-	case SMIBANK3_BASE:
-		bank = BANK3;
-		break;
-	default:
-		return -1;
-	}
-
-	sect_add = sector * (info->size / info->sector_count);
-	instruction = ((sect_add >> 8) & 0x0000FF00) | SECTOR_ERASE;
-
-	writel(readl(&smicntl->smi_sr) & ~(ERF1 | ERF2), &smicntl->smi_sr);
-
-	/* Wait until finished previous write command. */
-	if (smi_wait_till_ready(bank, CONFIG_SYS_FLASH_ERASE_TOUT))
-		return -EBUSY;
-
-	/* Send write enable, before erase commands. */
-	if (smi_write_enable(bank))
-		return -EIO;
-
-	/* Put SMI in SW mode */
-	writel(readl(&smicntl->smi_cr1) | SW_MODE, &smicntl->smi_cr1);
-
-	/* Send Sector Erase command in SW Mode */
-	writel(instruction, &smicntl->smi_tr);
-	writel((bank << BANKSEL_SHIFT) | SEND | TX_LEN_4,
-		       &smicntl->smi_cr2);
-	if (smi_wait_xfer_finish(XFER_FINISH_TOUT))
-		return -EIO;
-
-	if (smi_wait_till_ready(bank, CONFIG_SYS_FLASH_ERASE_TOUT))
-		return -EBUSY;
-
-	/* Put SMI in HW mode */
-	writel(readl(&smicntl->smi_cr1) & ~SW_MODE,
-		       &smicntl->smi_cr1);
-
-	return 0;
-}
-
-/*
- * smi_write - Write to SMI flash
- * @src_addr:	 source buffer
- * @dst_addr:	 destination buffer
- * @length:	 length to write in bytes
- * @bank:	 bank base address
- *
- * Write to SMI flash
- */
-static int smi_write(unsigned int *src_addr, unsigned int *dst_addr,
-		     unsigned int length, ulong bank_addr)
-{
-	u8 *src_addr8 = (u8 *)src_addr;
-	u8 *dst_addr8 = (u8 *)dst_addr;
-	int banknum;
-	int i;
-
-	switch (bank_addr) {
-	case SMIBANK0_BASE:
-		banknum = BANK0;
-		break;
-	case SMIBANK1_BASE:
-		banknum = BANK1;
-		break;
-	case SMIBANK2_BASE:
-		banknum = BANK2;
-		break;
-	case SMIBANK3_BASE:
-		banknum = BANK3;
-		break;
-	default:
-		return -1;
-	}
-
-	if (smi_wait_till_ready(banknum, CONFIG_SYS_FLASH_WRITE_TOUT))
-		return -EBUSY;
-
-	/* Set SMI in Hardware Mode */
-	writel(readl(&smicntl->smi_cr1) & ~SW_MODE, &smicntl->smi_cr1);
-
-	if (smi_write_enable(banknum))
-		return -EIO;
-
-	/* Perform the write command */
-	for (i = 0; i < length; i += 4) {
-		if (((ulong) (dst_addr) % SFLASH_PAGE_SIZE) == 0) {
-			if (smi_wait_till_ready(banknum,
-						CONFIG_SYS_FLASH_WRITE_TOUT))
-				return -EBUSY;
-
-			if (smi_write_enable(banknum))
-				return -EIO;
-		}
-
-		if (length < 4) {
-			int k;
-
-			/*
-			 * Handle special case, where length < 4 (redundant env)
-			 */
-			for (k = 0; k < length; k++)
-				*dst_addr8++ = *src_addr8++;
-		} else {
-			/* Normal 32bit write */
-			*dst_addr++ = *src_addr++;
-		}
-
-		if ((readl(&smicntl->smi_sr) & (ERF1 | ERF2)))
-			return -EIO;
-	}
-
-	if (smi_wait_till_ready(banknum, CONFIG_SYS_FLASH_WRITE_TOUT))
-		return -EBUSY;
-
-	writel(readl(&smicntl->smi_sr) & ~(WCF), &smicntl->smi_sr);
-
-	return 0;
-}
-
-/*
- * write_buff - Write to SMI flash
- * @info:	 flash info structure
- * @src:	 source buffer
- * @dest_addr:	 destination buffer
- * @length:	 length to write in words
- *
- * Write to SMI flash
- */
-int write_buff(flash_info_t *info, uchar *src, ulong dest_addr, ulong length)
-{
-	return smi_write((unsigned int *)src, (unsigned int *)dest_addr,
-			 length, info->start[0]);
-}
-
-/*
- * flash_init - SMI flash initialization
- *
- * SMI flash initialization
- */
-unsigned long flash_init(void)
-{
-	unsigned long size = 0;
-	int i, j;
-
-	smi_init();
-
-	for (i = 0; i < CONFIG_SYS_MAX_FLASH_BANKS; i++) {
-		flash_info[i].flash_id = FLASH_UNKNOWN;
-		size += flash_info[i].size = flash_get_size(bank_base[i], i);
-	}
-
-	for (j = 0; j < CONFIG_SYS_MAX_FLASH_BANKS; j++) {
-		for (i = 1; i < flash_info[j].sector_count; i++)
-			flash_info[j].start[i] =
-			    flash_info[j].start[i - 1] +
-			    flash_info->size / flash_info->sector_count;
-
-	}
-
-	return size;
-}
-
-/*
- * flash_print_info - Print SMI flash information
- *
- * Print SMI flash information
- */
-void flash_print_info(flash_info_t *info)
-{
-	int i;
-	if (info->flash_id == FLASH_UNKNOWN) {
-		puts("missing or unknown FLASH type\n");
-		return;
-	}
-
-	if (info->size >= 0x100000)
-		printf("  Size: %ld MB in %d Sectors\n",
-		       info->size >> 20, info->sector_count);
-	else
-		printf("  Size: %ld KB in %d Sectors\n",
-		       info->size >> 10, info->sector_count);
-
-	puts("  Sector Start Addresses:");
-	for (i = 0; i < info->sector_count; ++i) {
-#ifdef CONFIG_SYS_FLASH_EMPTY_INFO
-		int size;
-		int erased;
-		u32 *flash;
-
-		/*
-		 * Check if whole sector is erased
-		 */
-		size = (info->size) / (info->sector_count);
-		flash = (u32 *) info->start[i];
-		size = size / sizeof(int);
-
-		while ((size--) && (*flash++ == ~0))
-			;
-
-		size++;
-		if (size)
-			erased = 0;
-		else
-			erased = 1;
-
-		if ((i % 5) == 0)
-			printf("\n");
-
-		printf(" %08lX%s%s",
-		       info->start[i],
-		       erased ? " E" : "  ", info->protect[i] ? "RO " : "   ");
-#else
-		if ((i % 5) == 0)
-			printf("\n   ");
-		printf(" %08lX%s",
-		       info->start[i], info->protect[i] ? " (RO)  " : "     ");
-#endif
-	}
-	putc('\n');
-	return;
-}
-
-/*
- * flash_erase - Erase SMI flash
- *
- * Erase SMI flash
- */
-int flash_erase(flash_info_t *info, int s_first, int s_last)
-{
-	int rcode = 0;
-	int prot = 0;
-	flash_sect_t sect;
-
-	if ((s_first < 0) || (s_first > s_last)) {
-		puts("- no sectors to erase\n");
-		return 1;
-	}
-
-	for (sect = s_first; sect <= s_last; ++sect) {
-		if (info->protect[sect])
-			prot++;
-	}
-	if (prot) {
-		printf("- Warning: %d protected sectors will not be erased!\n",
-		       prot);
-	} else {
-		putc('\n');
-	}
-
-	for (sect = s_first; sect <= s_last; sect++) {
-		if (info->protect[sect] == 0) {
-			if (smi_sector_erase(info, sect))
-				rcode = 1;
-			else
-				putc('.');
-		}
-	}
-	puts(" done\n");
-	return rcode;
-}
-#endif
diff --git a/include/configs/bcmstb.h b/include/configs/bcmstb.h
index 7f1c298cdc..54e5655af6 100644
--- a/include/configs/bcmstb.h
+++ b/include/configs/bcmstb.h
@@ -127,7 +127,6 @@ extern phys_addr_t prior_stage_fdt_address;
 /*
  * Flash configuration.
  */
-#define CONFIG_ST_SMI
 #define CONFIG_SPI_FLASH_STMICRO
 #define CONFIG_SPI_FLASH_MACRONIX
 
diff --git a/include/linux/mtd/st_smi.h b/include/linux/mtd/st_smi.h
deleted file mode 100644
index 6058969787..0000000000
--- a/include/linux/mtd/st_smi.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * (C) Copyright 2009
- * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
- */
-
-#ifndef ST_SMI_H
-#define ST_SMI_H
-
-/* 0xF800.0000 . 0xFBFF.FFFF	64MB	SMI (Serial Flash Mem) */
-/* 0xFC00.0000 . 0xFC1F.FFFF	2MB	SMI (Serial Flash Reg.) */
-
-#define FLASH_START_ADDRESS	CONFIG_SYS_FLASH_BASE
-#define FLASH_BANK_SIZE		CONFIG_SYS_FLASH_BANK_SIZE
-
-#define SMIBANK0_BASE		(FLASH_START_ADDRESS)
-#define SMIBANK1_BASE		(SMIBANK0_BASE + FLASH_BANK_SIZE)
-#define SMIBANK2_BASE		(SMIBANK1_BASE + FLASH_BANK_SIZE)
-#define SMIBANK3_BASE		(SMIBANK2_BASE + FLASH_BANK_SIZE)
-
-#define BANK0			0
-#define BANK1			1
-#define BANK2			2
-#define BANK3			3
-
-struct smi_regs {
-	u32 smi_cr1;
-	u32 smi_cr2;
-	u32 smi_sr;
-	u32 smi_tr;
-	u32 smi_rr;
-};
-
-/* CONTROL REG 1 */
-#define BANK_EN			0x0000000F	/* enables all banks */
-#define DSEL_TIME		0x00000060	/* Deselect time */
-#define PRESCAL5		0x00000500	/* AHB_CK prescaling value */
-#define PRESCALA		0x00000A00	/* AHB_CK prescaling value */
-#define PRESCAL3		0x00000300	/* AHB_CK prescaling value */
-#define PRESCAL4		0x00000400	/* AHB_CK prescaling value */
-#define SW_MODE			0x10000000	/* enables SW Mode */
-#define WB_MODE			0x20000000	/* Write Burst Mode */
-#define FAST_MODE		0x00008000	/* Fast Mode */
-#define HOLD1			0x00010000
-
-/* CONTROL REG 2 */
-#define RD_STATUS_REG		0x00000400	/* reads status reg */
-#define WE			0x00000800	/* Write Enable */
-#define BANK0_SEL		0x00000000	/* Select Banck0 */
-#define BANK1_SEL		0x00001000	/* Select Banck1 */
-#define BANK2_SEL		0x00002000	/* Select Banck2 */
-#define BANK3_SEL		0x00003000	/* Select Banck3 */
-#define BANKSEL_SHIFT		12
-#define SEND			0x00000080	/* Send data */
-#define TX_LEN_1		0x00000001	/* data length = 1 byte */
-#define TX_LEN_2		0x00000002	/* data length = 2 byte */
-#define TX_LEN_3		0x00000003	/* data length = 3 byte */
-#define TX_LEN_4		0x00000004	/* data length = 4 byte */
-#define RX_LEN_1		0x00000010	/* data length = 1 byte */
-#define RX_LEN_2		0x00000020	/* data length = 2 byte */
-#define RX_LEN_3		0x00000030	/* data length = 3 byte */
-#define RX_LEN_4		0x00000040	/* data length = 4 byte */
-#define TFIE			0x00000100	/* Tx Flag Interrupt Enable */
-#define WCIE			0x00000200	/* WCF Interrupt Enable */
-
-/* STATUS_REG */
-#define INT_WCF_CLR		0xFFFFFDFF	/* clear: WCF clear */
-#define INT_TFF_CLR		0xFFFFFEFF	/* clear: TFF clear */
-#define WIP_BIT			0x00000001	/* WIP Bit of SPI SR */
-#define WEL_BIT			0x00000002	/* WEL Bit of SPI SR */
-#define RSR			0x00000005	/* Read Status regiser */
-#define TFF			0x00000100	/* Transfer Finished FLag */
-#define WCF			0x00000200	/* Transfer Finished FLag */
-#define ERF1			0x00000400	/* Error Flag 1 */
-#define ERF2			0x00000800	/* Error Flag 2 */
-#define WM0			0x00001000	/* WM Bank 0 */
-#define WM1			0x00002000	/* WM Bank 1 */
-#define WM2			0x00004000	/* WM Bank 2 */
-#define WM3			0x00008000	/* WM Bank 3 */
-#define WM_SHIFT		12
-
-/* TR REG */
-#define READ_ID			0x0000009F	/* Read Identification */
-#define BULK_ERASE		0x000000C7	/* BULK erase */
-#define SECTOR_ERASE		0x000000D8	/* SECTOR erase */
-#define WRITE_ENABLE		0x00000006	/* Wenable command to FLASH */
-
-struct flash_dev {
-	u32 density;
-	ulong size;
-	ushort sector_count;
-};
-
-#define SFLASH_PAGE_SIZE	0x100	/* flash page size */
-#define XFER_FINISH_TOUT	15	/* xfer finish timeout(in ms) */
-#define WMODE_TOUT		15	/* write enable timeout(in ms) */
-
-extern void smi_init(void);
-
-#endif
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 36b8cc1db0..6c8277cba9 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1308,7 +1308,6 @@ CONFIG_STM32_FLASH
 CONFIG_STV0991
 CONFIG_STV0991_HZ
 CONFIG_STV0991_HZ_CLOCK
-CONFIG_ST_SMI
 CONFIG_SXNI855T
 CONFIG_SYSFS
 CONFIG_SYSMGR_ISWGRP_HANDOFF
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
