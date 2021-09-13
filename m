Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E87408581
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Sep 2021 09:41:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66BDEC597BC;
	Mon, 13 Sep 2021 07:41:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CC74C597AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Sep 2021 07:41:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D4Fbj8012309; 
 Mon, 13 Sep 2021 09:41:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=cZs4BksYI6XRQlrjZoUHyyEpHgH7MLPPQ7qH6tVrtWo=;
 b=ce5RWpsJs3QqF/+gXtIDpOkndtu3FKP//vkHdtCb/7uOiw7WNaN+9UGyi2DP+qyaRPps
 607l9IDyuI1shhYYuqCgnjo+DSfmb23rCx/VGI60QXk9TJrzLwMO7NKYB6qIma662tPX
 2jjxOkDm3P3VyDL1A1JkpsIGj4VI52e67oqZtTBXzqR6bfmMKoK6mMqblhpumJxQGBG9
 FxjHEyj9OtfVvH2MFsoZhD1FKK+1FUVEs/K3lFQHVaqDx4PyxyKBSRsIkewNeC6VhQwp
 IqgfiSGGQ/KJ8iVFiTlWG7QsMnwKAfKCviwYmi7u0ns64ertArb1QNpJ7kZBefXqwfDa Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b1yey8wyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 09:41:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5940510002A;
 Mon, 13 Sep 2021 09:41:06 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag2node5.st.com [10.75.127.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BA57215122;
 Mon, 13 Sep 2021 09:41:06 +0200 (CEST)
Received: from localhost (10.75.127.44) by GPXDAG2NODE5.st.com (10.75.127.69)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 13 Sep 2021 09:41:05 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Sep 2021 09:40:50 +0200
Message-ID: <20210913094034.1.I73dae4b93f0587dc130e512e95a1f4794e0b0233@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To GPXDAG2NODE5.st.com
 (10.75.127.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_03,2021-09-09_01,2020-04-07_01
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH] mtd: spi: nor: force mtd name to "nor%d"
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
"nor0", "nor1"...

This patch is coherent with existing "nand" and "spi-nand"
mtd device names.

I keep the existing "nor" name to don't disturb the existing users of mtd
functions.
The mtd name 'nor' was configured previously by the function
drivers/mtd/spi/sf_mtd.c:spi_flash_mtd_register() =
  "nor%d" + spi_flash_mtd_number()

The 'nor' name is also coherent with get_mtd_info() and the macro
MTD_DEV_TYPE(): MTD_DEV_TYPE_NOR is associated with "nor" name.

This generic name can be use to identify the mtd spi-nor device
without knowing the real device name or the DT path of the device,
used with API get_mtd_device_nm().

And also avoid issue when the same NOR device is present 2 times,
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

The same mtd name "mx66l51235l" identify the 2 instance
mx66l51235l@0 and mx66l51235l@1.

This patch solves a ST32CubeProgrammer / stm32prog command issue
with nor0 target on STM32MP157C-EV1 board.

Series-Cc: Priyanka Jain <priyanka.jain@nxp.com>
Series-Cc: Heiko Schocher <hs@denx.de>
Fixes: b7f060565e31 ("mtd: spi-nor: allow registering multiple MTDs when DM is enabled")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
For other device, the mtd name are hardcoded in each MTD driver:

drivers/mtd/nand/spi/core.c:1169:
        sprintf(mtd->name, "spi-nand%d", spi_nand_idx++);
drivers/mtd/nand/raw/nand.c:59:
        sprintf(dev_name[devnum], "nand%d", devnum);

The existing user with "nor..."

arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c:625:
  mtd = get_mtd_device_nm(mtd_id);
board/emulation/common/qemu_mtdparts.c:63:
  mtd = get_mtd_device_nm("nor0");
board/emulation/common/qemu_mtdparts.c:70:
  mtd = get_mtd_device_nm("nor1");
board/emulation/common/qemu_dfu.c:61:
  mtd = get_mtd_device_nm("nor0");
board/st/common/stm32mp_dfu.c:132:
  mtd = get_mtd_device_nm("nor0");
drivers/dfu/dfu_mtd.c:259:
  mtd = get_mtd_device_nm(devstr);
 => see "dfu mtd" support in doc/usage/dfu.rst


 drivers/mtd/spi/spi-nor-core.c | 8 +++++---
 include/linux/mtd/spi-nor.h    | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index d5d905fa5a..3eb7dcfddb 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -3715,8 +3715,10 @@ int spi_nor_scan(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (!mtd->name)
-		mtd->name = info->name;
+	if (!mtd->name) {
+		sprintf(nor->mtd_name, "nor%d",  dev_seq(nor->dev));
+		mtd->name = nor->mtd_name;
+	}
 	mtd->dev = nor->dev;
 	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
@@ -3821,7 +3823,7 @@ int spi_nor_scan(struct spi_nor *nor)
 
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
