Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8040DC20
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 16:01:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64A62C5A4F5;
	Thu, 16 Sep 2021 14:01:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70F57C5A4F3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 14:01:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GCbn9p026449; 
 Thu, 16 Sep 2021 16:01:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=fdSdujY3tsQUNY0EU4vJHbLkNNeYJxZoUzyWWBWpH/M=;
 b=rkgdING8rC6cYbUzQ9C/H587IEH+aIHap72x/lidALd94/tnUz8wk+2dN6AGv7Jpt5i7
 xygxouuP+HjguUGBhrb2zNVVAr4qfnl4eZUUxdd+de65+y+CggfL+XKSjd/oln2lCCPh
 L9y7TitNBc5DKcQ7w5MXy/dqvoZRwGnNwNlmB/8IkJMjlfKw+Cwp/M9OnxCONfPPVI1K
 jY4v9aC3HmCflh5y832Nu6Apq65tSuXrrsVSrELy12RjXG08nFrOoQfRtMGarut+298O
 9gj8GYUBuYvjwjRaCytpv+jIkzpk39ZLbuSMQMmhnT0XtTjLIp9ySqFLl7j2CSVEqvQp jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b463n8ekc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 16:01:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C570910002A;
 Thu, 16 Sep 2021 16:01:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB2DE20FA59;
 Thu, 16 Sep 2021 16:01:22 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Sep 2021 16:01:22
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Sep 2021 16:01:18 +0200
Message-ID: <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_04,2021-09-16_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v3 2/2] mtd: spi: nor: force mtd name to
	"nor%d"
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

Force the mtd name of spi-nor to "nor" + the driver sequence number:
"nor0", "nor1"... beginning after the existing nor devices.

This patch is coherent with existing "nand" and "spi-nand"
mtd device names.

When CFI MTD NOR device are supported, the spi-nor index is chosen after
the last CFI device defined by CONFIG_SYS_MAX_FLASH_BANKS.

When CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated, this config
is replaced by to cfi_flash_num_flash_banks in the include file
mtd/cfi_flash.h.

This generic name "nor%d" can be use to identify the mtd spi-nor device
without knowing the real device name or the DT path of the device,
used with API get_mtd_device_nm() and is used in mtdparts command.

This patch also avoids issue when the same NOR device is present 2 times,
for example on STM32MP15F-EV1:

STM32MP> mtd list
SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, \
total 64 MiB

List of MTD devices:
* nand0
  - type: NAND flash
  - block size: 0x40000 bytes
  - min I/O: 0x1000 bytes
  - OOB size: 224 bytes
  - OOB available: 118 bytes
  - ECC strength: 8 bits
  - ECC step size: 512 bytes
  - bitflip threshold: 6 bits
  - 0x000000000000-0x000040000000 : "nand0"
* mx66l51235l
  - device: mx66l51235l@0
  - parent: spi@58003000
  - driver: jedec_spi_nor
  - path: /soc/spi@58003000/mx66l51235l@0
  - type: NOR flash
  - block size: 0x10000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "mx66l51235l"
* mx66l51235l
  - device: mx66l51235l@1
  - parent: spi@58003000
  - driver: jedec_spi_nor
  - path: /soc/spi@58003000/mx66l51235l@1
  - type: NOR flash
  - block size: 0x10000 bytes
  - min I/O: 0x1 bytes
  - 0x000000000000-0x000004000000 : "mx66l51235l"

The same mtd name "mx66l51235l" identify the 2 instances
mx66l51235l@0 and mx66l51235l@1.

This patch fixes a ST32CubeProgrammer / stm32prog command issue
with nor0 target on STM32MP157C-EV1 board introduced by
commit b7f060565e31 ("mtd: spi-nor: allow registering multiple MTDs when
DM is enabled").

Fixes: b7f060565e31 ("mtd: spi-nor: allow registering multiple MTDs when DM is enabled")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
For other device, the mtd name are hardcoded in each MTD driver:

drivers/mtd/nand/spi/core.c:1169:
        sprintf(mtd->name, "spi-nand%d", spi_nand_idx++);
drivers/mtd/nand/raw/nand.c:59:
        sprintf(dev_name[devnum], "nand%d", devnum);

And the nor device name "nor%d" is also used for CFI in
./drivers/mtd/cfi_mtd.c with i=0 to CONFIG_SYS_MAX_FLASH_BANKS - 1

        sprintf(cfi_mtd_names[i], "nor%d", i);
        mtd->name               = cfi_mtd_names[i];

Today the number of CFI device is hardcoded by this config.


Changes in v3:
- start index after the last CFI device, use CONFIG_SYS_MAX_FLASH_BANKS

Changes in v2:
- correct commit message

 drivers/mtd/spi/spi-nor-core.c | 15 ++++++++++++---
 include/linux/mtd/spi-nor.h    |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index d5d905fa5a..7da5ca6285 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <flash.h>
 #include <log.h>
 #include <watchdog.h>
 #include <dm.h>
@@ -26,6 +27,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
+#include <mtd/cfi_flash.h>
 #include <spi-mem.h>
 #include <spi.h>
 
@@ -3664,6 +3666,11 @@ int spi_nor_scan(struct spi_nor *nor)
 	struct mtd_info *mtd = &nor->mtd;
 	struct spi_slave *spi = nor->spi;
 	int ret;
+	int cfi_mtd_nb = 0;
+
+#ifdef CONFIG_SYS_MAX_FLASH_BANKS
+	cfi_mtd_nb = CONFIG_SYS_MAX_FLASH_BANKS;
+#endif
 
 	/* Reset SPI protocol for all commands. */
 	nor->reg_proto = SNOR_PROTO_1_1_1;
@@ -3715,8 +3722,10 @@ int spi_nor_scan(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (!mtd->name)
-		mtd->name = info->name;
+	if (!mtd->name) {
+		sprintf(nor->mtd_name, "nor%d",  cfi_mtd_nb + dev_seq(nor->dev));
+		mtd->name = nor->mtd_name;
+	}
 	mtd->dev = nor->dev;
 	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
@@ -3821,7 +3830,7 @@ int spi_nor_scan(struct spi_nor *nor)
 
 	nor->rdsr_dummy = params.rdsr_dummy;
 	nor->rdsr_addr_nbytes = params.rdsr_addr_nbytes;
-	nor->name = mtd->name;
+	nor->name = info->name;
 	nor->size = mtd->size;
 	nor->erase_size = mtd->erasesize;
 	nor->sector_size = mtd->erasesize;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7ddc4ba2bf..8c3d5032e3 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -561,6 +561,7 @@ struct spi_nor {
 	int (*ready)(struct spi_nor *nor);
 
 	void *priv;
+	char mtd_name[10];
 /* Compatibility for spi_flash, remove once sf layer is merged with mtd */
 	const char *name;
 	u32 size;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
