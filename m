Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FEB5BB8E6
	for <lists+uboot-stm32@lfdr.de>; Sat, 17 Sep 2022 17:00:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F632C03FC6;
	Sat, 17 Sep 2022 15:00:21 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B329FC035A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Sep 2022 15:00:19 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 w10-20020a056830410a00b00655d70a1aeaso4468280ott.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Sep 2022 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TkJMafC+eRhU0ELE658SOvoTOkJ8WSNKQqSs5Y7JUBA=;
 b=D7gDFKeJrRh+13kgMLRAU1RJa4zMNcMOoQ5TJLKk9zWP8GuZ1ZJWGmUy9KAxWKOBet
 Aa2sRWZCvrGTKv08Gz9oco9GSZAiSQCZ1a1pDiILzZ4hNvnftVJ7pq8A8iodydzq35R8
 AbPRo157GcTYJBBWCRE+Ki+lMTwYo+fAxFb1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TkJMafC+eRhU0ELE658SOvoTOkJ8WSNKQqSs5Y7JUBA=;
 b=aXLg41f21gZDgWtU3FOfoyzEHFJF1GN+kbQH/M7wrvDNBYAPqfjiDWCY4LnuZT2wm0
 T3tz4mWlxoBKLr8UlghBxDrudNDpS6KNoj1KVKIuQIgIfB4hMkH2QE2qcPf4qAQBCrlD
 dKWPvn70+LKs/pbdu9HpH5uuAWcdp5UBrKiBiClPgZqGNd0i5WTH86/Yi0C4pswPdCJ3
 H9awCY3ReV0/bm+MdiZZC6+iS3UHbTXEOeVUO98iOysmdQLQJ0GQGIYn152TKkIohK46
 dbujf5wrRVTVilc8z/zNwiKBHE+H9omro1qM4y54V2iZ8dXeLOpMQJ+uzsYQ6j46RZST
 wIiw==
X-Gm-Message-State: ACrzQf0vbRpMBZwnidVGpF1yjA9jRekYotdCMveSGUKOixvayOiYrpsJ
 qkQG0UFZJIKG+uVTVTNjaMr0IA==
X-Google-Smtp-Source: AMsMyM7/111y5g092FoSNPndUEz5r7uCJzdzAEtPi4U831/12p1B8ixQNuZX5fWLXUGVd6V3Cz/LWw==
X-Received: by 2002:a9d:4e88:0:b0:654:1012:85bd with SMTP id
 v8-20020a9d4e88000000b00654101285bdmr4461942otk.136.1663426818209; 
 Sat, 17 Sep 2022 08:00:18 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 t190-20020acaaac7000000b003458d346a60sm10462845oie.25.2022.09.17.08.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 08:00:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 17 Sep 2022 09:00:09 -0600
Message-Id: <20220917150009.91460-2-sjg@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220917150009.91460-1-sjg@chromium.org>
References: <20220917150009.91460-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 Marek Vasut <marex@denx.de>, schspa <schspa@gmail.com>,
 Max Merchel <Max.Merchel@tq-group.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH v4 1/1] blk: Rename if_type to uclass_id
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

Use the word 'uclass' instead of 'if_type' to complete the conversion.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Fix comments from Takahiro Akashi missed on the previous revision

Changes in v3:
- Drop previously applied patches
- Rebase on -next after EFI changes

Changes in v2:
- Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()

 board/st/common/stm32mp_dfu.c |   2 +-
 cmd/bcb.c                     |   4 +-
 cmd/blk_common.c              |  18 ++---
 cmd/lsblk.c                   |   2 +-
 cmd/mmc.c                     |   4 +-
 common/spl/spl_sata.c         |   2 +-
 common/spl/spl_usb.c          |   2 +-
 common/usb_storage.c          |   6 +-
 disk/disk-uclass.c            |   8 +-
 disk/part.c                   |  14 ++--
 doc/usage/partitions.rst      |   2 +-
 drivers/ata/sata.c            |   2 +-
 drivers/block/blk-uclass.c    | 145 +++++++++++++++++-----------------
 drivers/block/blk_legacy.c    |  58 +++++++-------
 drivers/block/ide.c           |   8 +-
 drivers/block/sandbox.c       |   8 +-
 drivers/mmc/mmc-uclass.c      |   2 +-
 drivers/mmc/mmc_legacy.c      |   8 +-
 drivers/net/fsl_enetc.c       |  12 +--
 drivers/net/fsl_enetc.h       |   2 +-
 drivers/scsi/scsi.c           |   6 +-
 drivers/virtio/virtio_blk.c   |   2 +-
 drivers/xen/pvblock.c         |   2 +-
 fs/fat/fat.c                  |   2 +-
 include/blk.h                 | 122 ++++++++++++++--------------
 include/efi_loader.h          |   4 +-
 lib/efi_loader/efi_disk.c     |  12 +--
 lib/efi_loader/efi_var_file.c |   4 +-
 28 files changed, 231 insertions(+), 232 deletions(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index fa48b2a35ee..0096f71dfc1 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -37,7 +37,7 @@ static void board_get_alt_info_mmc(struct udevice *dev, char *buf)
 	if (!desc)
 		return;
 
-	name = blk_get_if_type_name(desc->if_type);
+	name = blk_get_uclass_name(desc->uclass_id);
 	devnum = desc->devnum;
 	len = strlen(buf);
 
diff --git a/cmd/bcb.c b/cmd/bcb.c
index 8b87aa062fe..1622a90c97f 100644
--- a/cmd/bcb.c
+++ b/cmd/bcb.c
@@ -122,7 +122,7 @@ static int __bcb_load(int devnum, const char *partp)
 	char *endp;
 	int part, ret;
 
-	desc = blk_get_devnum_by_type(UCLASS_MMC, devnum);
+	desc = blk_get_devnum_by_uclass_id(UCLASS_MMC, devnum);
 	if (!desc) {
 		ret = -ENODEV;
 		goto err_read_fail;
@@ -287,7 +287,7 @@ static int __bcb_store(void)
 	u64 cnt;
 	int ret;
 
-	desc = blk_get_devnum_by_type(UCLASS_MMC, bcb_dev);
+	desc = blk_get_devnum_by_uclass_id(UCLASS_MMC, bcb_dev);
 	if (!desc) {
 		ret = -ENODEV;
 		goto err;
diff --git a/cmd/blk_common.c b/cmd/blk_common.c
index 369c5ae4bbe..75a072caf51 100644
--- a/cmd/blk_common.c
+++ b/cmd/blk_common.c
@@ -12,10 +12,10 @@
 #include <blk.h>
 #include <command.h>
 
-int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
+int blk_common_cmd(int argc, char *const argv[], enum uclass_id uclass_id,
 		   int *cur_devnump)
 {
-	const char *if_name = blk_get_if_type_name(if_type);
+	const char *if_name = blk_get_uclass_name(uclass_id);
 
 	switch (argc) {
 	case 0:
@@ -23,16 +23,16 @@ int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
 		return CMD_RET_USAGE;
 	case 2:
 		if (strncmp(argv[1], "inf", 3) == 0) {
-			blk_list_devices(if_type);
+			blk_list_devices(uclass_id);
 			return 0;
 		} else if (strncmp(argv[1], "dev", 3) == 0) {
-			if (blk_print_device_num(if_type, *cur_devnump)) {
+			if (blk_print_device_num(uclass_id, *cur_devnump)) {
 				printf("\nno %s devices available\n", if_name);
 				return CMD_RET_FAILURE;
 			}
 			return 0;
 		} else if (strncmp(argv[1], "part", 4) == 0) {
-			if (blk_list_part(if_type))
+			if (blk_list_part(uclass_id))
 				printf("\nno %s partition table available\n",
 				       if_name);
 			return 0;
@@ -42,7 +42,7 @@ int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
 		if (strncmp(argv[1], "dev", 3) == 0) {
 			int dev = (int)dectoul(argv[2], NULL);
 
-			if (!blk_show_device(if_type, dev)) {
+			if (!blk_show_device(uclass_id, dev)) {
 				*cur_devnump = dev;
 				printf("... is now current device\n");
 			} else {
@@ -52,7 +52,7 @@ int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
 		} else if (strncmp(argv[1], "part", 4) == 0) {
 			int dev = (int)dectoul(argv[2], NULL);
 
-			if (blk_print_part_devnum(if_type, dev)) {
+			if (blk_print_part_devnum(uclass_id, dev)) {
 				printf("\n%s device %d not available\n",
 				       if_name, dev);
 				return CMD_RET_FAILURE;
@@ -71,7 +71,7 @@ int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
 			printf("\n%s read: device %d block # "LBAFU", count %lu ... ",
 			       if_name, *cur_devnump, blk, cnt);
 
-			n = blk_read_devnum(if_type, *cur_devnump, blk, cnt,
+			n = blk_read_devnum(uclass_id, *cur_devnump, blk, cnt,
 					    (ulong *)addr);
 
 			printf("%ld blocks read: %s\n", n,
@@ -86,7 +86,7 @@ int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
 			printf("\n%s write: device %d block # "LBAFU", count %lu ... ",
 			       if_name, *cur_devnump, blk, cnt);
 
-			n = blk_write_devnum(if_type, *cur_devnump, blk, cnt,
+			n = blk_write_devnum(uclass_id, *cur_devnump, blk, cnt,
 					     (ulong *)addr);
 
 			printf("%ld blocks written: %s\n", n,
diff --git a/cmd/lsblk.c b/cmd/lsblk.c
index 6a1c8f5ef40..d214dafc3be 100644
--- a/cmd/lsblk.c
+++ b/cmd/lsblk.c
@@ -36,7 +36,7 @@ static int do_lsblk(struct cmd_tbl *cmdtp, int flag, int argc, char * const argv
 				continue;
 			desc = dev_get_uclass_plat(udev);
 			printf("%c %s %u", i ? ',' : ':',
-			       blk_get_if_type_name(desc->if_type),
+			       blk_get_uclass_name(desc->uclass_id),
 			       desc->devnum);
 			i++;
 		}
diff --git a/cmd/mmc.c b/cmd/mmc.c
index 0f1f4e0a71d..c79d9407986 100644
--- a/cmd/mmc.c
+++ b/cmd/mmc.c
@@ -154,7 +154,7 @@ static struct mmc *__init_mmc_device(int dev, bool force_init,
 
 #ifdef CONFIG_BLOCK_CACHE
 	struct blk_desc *bd = mmc_get_blk_desc(mmc);
-	blkcache_invalidate(bd->if_type, bd->devnum);
+	blkcache_invalidate(bd->uclass_id, bd->devnum);
 #endif
 
 	return mmc;
@@ -530,7 +530,7 @@ static int do_mmc_part(struct cmd_tbl *cmdtp, int flag,
 	if (!mmc)
 		return CMD_RET_FAILURE;
 
-	mmc_dev = blk_get_devnum_by_type(UCLASS_MMC, curr_device);
+	mmc_dev = blk_get_devnum_by_uclass_id(UCLASS_MMC, curr_device);
 	if (mmc_dev != NULL && mmc_dev->type != DEV_TYPE_UNKNOWN) {
 		part_print(mmc_dev);
 		return CMD_RET_SUCCESS;
diff --git a/common/spl/spl_sata.c b/common/spl/spl_sata.c
index ea9f1756c0a..6c36f2ca66f 100644
--- a/common/spl/spl_sata.c
+++ b/common/spl/spl_sata.c
@@ -71,7 +71,7 @@ static int spl_sata_load_image(struct spl_image_info *spl_image,
 
 	/* try to recognize storage devices immediately */
 	scsi_scan(false);
-	stor_dev = blk_get_devnum_by_type(UCLASS_SCSI, 0);
+	stor_dev = blk_get_devnum_by_uclass_id(UCLASS_SCSI, 0);
 	if (!stor_dev)
 		return -ENODEV;
 
diff --git a/common/spl/spl_usb.c b/common/spl/spl_usb.c
index 63c00f872b6..479e2dc1826 100644
--- a/common/spl/spl_usb.c
+++ b/common/spl/spl_usb.c
@@ -41,7 +41,7 @@ int spl_usb_load(struct spl_image_info *spl_image,
 
 	/* try to recognize storage devices immediately */
 	usb_stor_curr_dev = usb_stor_scan(1);
-	stor_dev = blk_get_devnum_by_type(UCLASS_USB, usb_stor_curr_dev);
+	stor_dev = blk_get_devnum_by_uclass_id(UCLASS_USB, usb_stor_curr_dev);
 	if (!stor_dev)
 		return -ENODEV;
 
diff --git a/common/usb_storage.c b/common/usb_storage.c
index 7d420160cd5..e59c819bac5 100644
--- a/common/usb_storage.c
+++ b/common/usb_storage.c
@@ -279,7 +279,7 @@ static int usb_stor_probe_device(struct usb_device *udev)
 
 		blkdev = &usb_dev_desc[usb_max_devs];
 		memset(blkdev, '\0', sizeof(struct blk_desc));
-		blkdev->if_type = UCLASS_USB;
+		blkdev->uclass_id = UCLASS_USB;
 		blkdev->devnum = usb_max_devs;
 		blkdev->part_type = PART_TYPE_UNKNOWN;
 		blkdev->target = 0xff;
@@ -1577,8 +1577,8 @@ U_BOOT_DRIVER(usb_storage_blk) = {
 };
 #else
 U_BOOT_LEGACY_BLK(usb) = {
-	.if_typename	= "usb",
-	.if_type	= UCLASS_USB,
+	.uclass_idname	= "usb",
+	.uclass_id	= UCLASS_USB,
 	.max_devs	= USB_MAX_STOR_DEV,
 	.desc		= usb_dev_desc,
 };
diff --git a/disk/disk-uclass.c b/disk/disk-uclass.c
index 9351a5cfa68..551f8b1dca4 100644
--- a/disk/disk-uclass.c
+++ b/disk/disk-uclass.c
@@ -191,12 +191,12 @@ unsigned long dev_read(struct udevice *dev, lbaint_t start,
 		start_in_disk += part->gpt_part_info.start;
 	}
 
-	if (blkcache_read(block_dev->if_type, block_dev->devnum,
+	if (blkcache_read(block_dev->uclass_id, block_dev->devnum,
 			  start_in_disk, blkcnt, block_dev->blksz, buffer))
 		return blkcnt;
 	blks_read = ops->read(dev, start, blkcnt, buffer);
 	if (blks_read == blkcnt)
-		blkcache_fill(block_dev->if_type, block_dev->devnum,
+		blkcache_fill(block_dev->uclass_id, block_dev->devnum,
 			      start_in_disk, blkcnt, block_dev->blksz, buffer);
 
 	return blks_read;
@@ -216,7 +216,7 @@ unsigned long dev_write(struct udevice *dev, lbaint_t start,
 	if (!ops->write)
 		return -ENOSYS;
 
-	blkcache_invalidate(block_dev->if_type, block_dev->devnum);
+	blkcache_invalidate(block_dev->uclass_id, block_dev->devnum);
 
 	return ops->write(dev, start, blkcnt, buffer);
 }
@@ -235,7 +235,7 @@ unsigned long dev_erase(struct udevice *dev, lbaint_t start,
 	if (!ops->erase)
 		return -ENOSYS;
 
-	blkcache_invalidate(block_dev->if_type, block_dev->devnum);
+	blkcache_invalidate(block_dev->uclass_id, block_dev->devnum);
 
 	return ops->erase(dev, start, blkcnt);
 }
diff --git a/disk/part.c b/disk/part.c
index 5705c229d59..74606eb3289 100644
--- a/disk/part.c
+++ b/disk/part.c
@@ -61,7 +61,7 @@ static struct blk_desc *get_dev_hwpart(const char *ifname, int dev, int hwpart)
 
 	if (!blk_enabled())
 		return NULL;
-	dev_desc = blk_get_devnum_by_typename(ifname, dev);
+	dev_desc = blk_get_devnum_by_uclass_idname(ifname, dev);
 	if (!dev_desc) {
 		debug("%s: No device for iface '%s', dev %d\n", __func__,
 		      ifname, dev);
@@ -120,7 +120,7 @@ void dev_print(struct blk_desc *dev_desc)
 		return;
 	}
 
-	switch (dev_desc->if_type) {
+	switch (dev_desc->uclass_id) {
 	case UCLASS_SCSI:
 		printf ("(%d:%d) Vendor: %s Prod.: %s Rev: %s\n",
 			dev_desc->target,dev_desc->lun,
@@ -155,7 +155,7 @@ void dev_print(struct blk_desc *dev_desc)
 		puts("device type unknown\n");
 		return;
 	default:
-		printf("Unhandled device type: %i\n", dev_desc->if_type);
+		printf("Unhandled device type: %i\n", dev_desc->uclass_id);
 		return;
 	}
 	puts ("            Type: ");
@@ -225,7 +225,7 @@ void part_init(struct blk_desc *dev_desc)
 	const int n_ents = ll_entry_count(struct part_driver, part_driver);
 	struct part_driver *entry;
 
-	blkcache_invalidate(dev_desc->if_type, dev_desc->devnum);
+	blkcache_invalidate(dev_desc->uclass_id, dev_desc->devnum);
 
 	dev_desc->part_type = PART_TYPE_UNKNOWN;
 	for (entry = drv; entry != drv + n_ents; entry++) {
@@ -248,7 +248,7 @@ static void print_part_header(const char *type, struct blk_desc *dev_desc)
 	CONFIG_IS_ENABLED(AMIGA_PARTITION) || \
 	CONFIG_IS_ENABLED(EFI_PARTITION)
 	puts ("\nPartition Map for ");
-	switch (dev_desc->if_type) {
+	switch (dev_desc->uclass_id) {
 	case UCLASS_IDE:
 		puts ("IDE");
 		break;
@@ -408,7 +408,7 @@ int blk_get_device_by_str(const char *ifname, const char *dev_hwpart_str,
 		 * Always should be done, otherwise hw partition 0 will return
 		 * stale data after displaying a non-zero hw partition.
 		 */
-		if ((*dev_desc)->if_type == UCLASS_MMC)
+		if ((*dev_desc)->uclass_id == UCLASS_MMC)
 			part_init(*dev_desc);
 	}
 
@@ -762,7 +762,7 @@ void part_set_generic_name(const struct blk_desc *dev_desc,
 {
 	char *devtype;
 
-	switch (dev_desc->if_type) {
+	switch (dev_desc->uclass_id) {
 	case UCLASS_IDE:
 	case UCLASS_AHCI:
 		devtype = "hd";
diff --git a/doc/usage/partitions.rst b/doc/usage/partitions.rst
index 2c1a12b6bf5..628469bbec9 100644
--- a/doc/usage/partitions.rst
+++ b/doc/usage/partitions.rst
@@ -20,7 +20,7 @@ generic syntax.
 interface
         The interface used to access the partition's device, like ``mmc`` or
         ``scsi``. For a full list of supported interfaces, consult the
-        ``if_typename_str`` array in ``drivers/block/blk-uclass.c``
+        ``uclass_idname_str`` array in ``drivers/block/blk-uclass.c``
 
 devnum
         The device number. This defaults to 0.
diff --git a/drivers/ata/sata.c b/drivers/ata/sata.c
index 604c721cfdc..ce3e9b5a400 100644
--- a/drivers/ata/sata.c
+++ b/drivers/ata/sata.c
@@ -79,7 +79,7 @@ int __sata_initialize(void)
 
 	for (i = 0; i < CONFIG_SYS_SATA_MAX_DEVICE; i++) {
 		memset(&sata_dev_desc[i], 0, sizeof(struct blk_desc));
-		sata_dev_desc[i].if_type = UCLASS_AHCI;
+		sata_dev_desc[i].uclass_id = UCLASS_AHCI;
 		sata_dev_desc[i].devnum = i;
 		sata_dev_desc[i].part_type = PART_TYPE_UNKNOWN;
 		sata_dev_desc[i].type = DEV_TYPE_HARDDISK;
diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
index a9a85aa37f3..7d12d5413f1 100644
--- a/drivers/block/blk-uclass.c
+++ b/drivers/block/blk-uclass.c
@@ -20,7 +20,7 @@
 static struct {
 	enum uclass_id id;
 	const char *name;
-} if_typename_str[] = {
+} uclass_idname_str[] = {
 	{ UCLASS_IDE, "ide" },
 	{ UCLASS_SCSI, "scsi" },
 	{ UCLASS_USB, "usb" },
@@ -34,19 +34,19 @@ static struct {
 	{ UCLASS_PVBLOCK, "pvblock" },
 };
 
-static enum uclass_id if_typename_to_iftype(const char *if_typename)
+static enum uclass_id uclass_name_to_iftype(const char *uclass_idname)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(if_typename_str); i++) {
-		if (!strcmp(if_typename, if_typename_str[i].name))
-			return if_typename_str[i].id;
+	for (i = 0; i < ARRAY_SIZE(uclass_idname_str); i++) {
+		if (!strcmp(uclass_idname, uclass_idname_str[i].name))
+			return uclass_idname_str[i].id;
 	}
 
 	return UCLASS_INVALID;
 }
 
-static enum uclass_id if_type_to_uclass_id(enum uclass_id if_type)
+static enum uclass_id conv_uclass_id(enum uclass_id uclass_id)
 {
 	/*
 	 * This strange adjustment is used because we use UCLASS_MASS_STORAGE
@@ -65,31 +65,30 @@ static enum uclass_id if_type_to_uclass_id(enum uclass_id if_type)
 	 *    - rename UCLASS_USB name to "usb_ctlr"
 	 *    - use UCLASS_MASS_STORAGE instead of UCLASS_USB in if_typename_str
 	 */
-	if (if_type == UCLASS_USB)
+	if (uclass_id == UCLASS_USB)
 		return UCLASS_MASS_STORAGE;
-
-	return if_type;
+	return uclass_id;
 }
 
-const char *blk_get_if_type_name(enum uclass_id if_type)
+const char *blk_get_uclass_name(enum uclass_id uclass_id)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(if_typename_str); i++) {
-		if (if_typename_str[i].id == if_type)
-			return if_typename_str[i].name;
+	for (i = 0; i < ARRAY_SIZE(uclass_idname_str); i++) {
+		if (uclass_idname_str[i].id == uclass_id)
+			return uclass_idname_str[i].name;
 	}
 
 	return "(none)";
 }
 
-struct blk_desc *blk_get_devnum_by_type(enum uclass_id if_type, int devnum)
+struct blk_desc *blk_get_devnum_by_uclass_id(enum uclass_id uclass_id, int devnum)
 {
 	struct blk_desc *desc;
 	struct udevice *dev;
 	int ret;
 
-	ret = blk_get_device(if_type, devnum, &dev);
+	ret = blk_get_device(uclass_id, devnum, &dev);
 	if (ret)
 		return NULL;
 	desc = dev_get_uclass_plat(dev);
@@ -102,7 +101,7 @@ struct blk_desc *blk_get_devnum_by_type(enum uclass_id if_type, int devnum)
  * name in a local table. This gives us an interface type which we can match
  * against the uclass of the block device's parent.
  */
-struct blk_desc *blk_get_devnum_by_typename(const char *if_typename, int devnum)
+struct blk_desc *blk_get_devnum_by_uclass_idname(const char *uclass_idname, int devnum)
 {
 	enum uclass_id uclass_id;
 	enum uclass_id type;
@@ -110,16 +109,16 @@ struct blk_desc *blk_get_devnum_by_typename(const char *if_typename, int devnum)
 	struct uclass *uc;
 	int ret;
 
-	type = if_typename_to_iftype(if_typename);
+	type = uclass_name_to_iftype(uclass_idname);
 	if (type == UCLASS_INVALID) {
 		debug("%s: Unknown interface type '%s'\n", __func__,
-		      if_typename);
+		      uclass_idname);
 		return NULL;
 	}
-	uclass_id = if_type_to_uclass_id(type);
+	uclass_id = conv_uclass_id(type);
 	if (uclass_id == UCLASS_INVALID) {
 		debug("%s: Unknown uclass for interface type'\n",
-		      blk_get_if_type_name(type));
+		      blk_get_uclass_name(type));
 		return NULL;
 	}
 
@@ -129,8 +128,8 @@ struct blk_desc *blk_get_devnum_by_typename(const char *if_typename, int devnum)
 	uclass_foreach_dev(dev, uc) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
 
-		debug("%s: if_type=%d, devnum=%d: %s, %d, %d\n", __func__,
-		      type, devnum, dev->name, desc->if_type, desc->devnum);
+		debug("%s: uclass_id=%d, devnum=%d: %s, %d, %d\n", __func__,
+		      type, devnum, dev->name, desc->uclass_id, desc->devnum);
 		if (desc->devnum != devnum)
 			continue;
 
@@ -178,14 +177,14 @@ struct blk_desc *blk_get_by_device(struct udevice *dev)
 /**
  * get_desc() - Get the block device descriptor for the given device number
  *
- * @if_type:	Interface type
+ * @uclass_id:	Interface type
  * @devnum:	Device number (0 = first)
  * @descp:	Returns block device descriptor on success
  * Return: 0 on success, -ENODEV if there is no such device and no device
  * with a higher device number, -ENOENT if there is no such device but there
  * is one with a higher number, or other -ve on other error.
  */
-static int get_desc(enum uclass_id if_type, int devnum, struct blk_desc **descp)
+static int get_desc(enum uclass_id uclass_id, int devnum, struct blk_desc **descp)
 {
 	bool found_more = false;
 	struct udevice *dev;
@@ -199,9 +198,9 @@ static int get_desc(enum uclass_id if_type, int devnum, struct blk_desc **descp)
 	uclass_foreach_dev(dev, uc) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
 
-		debug("%s: if_type=%d, devnum=%d: %s, %d, %d\n", __func__,
-		      if_type, devnum, dev->name, desc->if_type, desc->devnum);
-		if (desc->if_type == if_type) {
+		debug("%s: uclass_id=%d, devnum=%d: %s, %d, %d\n", __func__,
+		      uclass_id, devnum, dev->name, desc->uclass_id, desc->devnum);
+		if (desc->uclass_id == uclass_id) {
 			if (desc->devnum == devnum) {
 				ret = device_probe(dev);
 				if (ret)
@@ -218,26 +217,26 @@ static int get_desc(enum uclass_id if_type, int devnum, struct blk_desc **descp)
 	return found_more ? -ENOENT : -ENODEV;
 }
 
-int blk_select_hwpart_devnum(enum uclass_id if_type, int devnum, int hwpart)
+int blk_select_hwpart_devnum(enum uclass_id uclass_id, int devnum, int hwpart)
 {
 	struct udevice *dev;
 	int ret;
 
-	ret = blk_get_device(if_type, devnum, &dev);
+	ret = blk_get_device(uclass_id, devnum, &dev);
 	if (ret)
 		return ret;
 
 	return blk_select_hwpart(dev, hwpart);
 }
 
-int blk_list_part(enum uclass_id if_type)
+int blk_list_part(enum uclass_id uclass_id)
 {
 	struct blk_desc *desc;
 	int devnum, ok;
 	int ret;
 
 	for (ok = 0, devnum = 0;; ++devnum) {
-		ret = get_desc(if_type, devnum, &desc);
+		ret = get_desc(uclass_id, devnum, &desc);
 		if (ret == -ENODEV)
 			break;
 		else if (ret)
@@ -255,12 +254,12 @@ int blk_list_part(enum uclass_id if_type)
 	return 0;
 }
 
-int blk_print_part_devnum(enum uclass_id if_type, int devnum)
+int blk_print_part_devnum(enum uclass_id uclass_id, int devnum)
 {
 	struct blk_desc *desc;
 	int ret;
 
-	ret = get_desc(if_type, devnum, &desc);
+	ret = get_desc(uclass_id, devnum, &desc);
 	if (ret)
 		return ret;
 	if (desc->type == DEV_TYPE_UNKNOWN)
@@ -270,14 +269,14 @@ int blk_print_part_devnum(enum uclass_id if_type, int devnum)
 	return 0;
 }
 
-void blk_list_devices(enum uclass_id if_type)
+void blk_list_devices(enum uclass_id uclass_id)
 {
 	struct blk_desc *desc;
 	int ret;
 	int i;
 
 	for (i = 0;; ++i) {
-		ret = get_desc(if_type, i, &desc);
+		ret = get_desc(uclass_id, i, &desc);
 		if (ret == -ENODEV)
 			break;
 		else if (ret)
@@ -289,12 +288,12 @@ void blk_list_devices(enum uclass_id if_type)
 	}
 }
 
-int blk_print_device_num(enum uclass_id if_type, int devnum)
+int blk_print_device_num(enum uclass_id uclass_id, int devnum)
 {
 	struct blk_desc *desc;
 	int ret;
 
-	ret = get_desc(if_type, devnum, &desc);
+	ret = get_desc(uclass_id, devnum, &desc);
 	if (ret)
 		return ret;
 	printf("\nIDE device %d: ", devnum);
@@ -303,13 +302,13 @@ int blk_print_device_num(enum uclass_id if_type, int devnum)
 	return 0;
 }
 
-int blk_show_device(enum uclass_id if_type, int devnum)
+int blk_show_device(enum uclass_id uclass_id, int devnum)
 {
 	struct blk_desc *desc;
 	int ret;
 
 	printf("\nDevice %d: ", devnum);
-	ret = get_desc(if_type, devnum, &desc);
+	ret = get_desc(uclass_id, devnum, &desc);
 	if (ret == -ENODEV || ret == -ENOENT) {
 		printf("unknown device\n");
 		return -ENODEV;
@@ -324,14 +323,14 @@ int blk_show_device(enum uclass_id if_type, int devnum)
 	return 0;
 }
 
-ulong blk_read_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
+ulong blk_read_devnum(enum uclass_id uclass_id, int devnum, lbaint_t start,
 		      lbaint_t blkcnt, void *buffer)
 {
 	struct blk_desc *desc;
 	ulong n;
 	int ret;
 
-	ret = get_desc(if_type, devnum, &desc);
+	ret = get_desc(uclass_id, devnum, &desc);
 	if (ret)
 		return ret;
 	n = blk_dread(desc, start, blkcnt, buffer);
@@ -341,13 +340,13 @@ ulong blk_read_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
 	return n;
 }
 
-ulong blk_write_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
+ulong blk_write_devnum(enum uclass_id uclass_id, int devnum, lbaint_t start,
 		       lbaint_t blkcnt, const void *buffer)
 {
 	struct blk_desc *desc;
 	int ret;
 
-	ret = get_desc(if_type, devnum, &desc);
+	ret = get_desc(uclass_id, devnum, &desc);
 	if (ret)
 		return ret;
 	return blk_dwrite(desc, start, blkcnt, buffer);
@@ -370,7 +369,7 @@ int blk_dselect_hwpart(struct blk_desc *desc, int hwpart)
 	return blk_select_hwpart(desc->bdev, hwpart);
 }
 
-int blk_first_device(int if_type, struct udevice **devp)
+int blk_first_device(int uclass_id, struct udevice **devp)
 {
 	struct blk_desc *desc;
 	int ret;
@@ -382,7 +381,7 @@ int blk_first_device(int if_type, struct udevice **devp)
 		return -ENODEV;
 	do {
 		desc = dev_get_uclass_plat(*devp);
-		if (desc->if_type == if_type)
+		if (desc->uclass_id == uclass_id)
 			return 0;
 		ret = uclass_find_next_device(devp);
 		if (ret)
@@ -395,10 +394,10 @@ int blk_first_device(int if_type, struct udevice **devp)
 int blk_next_device(struct udevice **devp)
 {
 	struct blk_desc *desc;
-	int ret, if_type;
+	int ret, uclass_id;
 
 	desc = dev_get_uclass_plat(*devp);
-	if_type = desc->if_type;
+	uclass_id = desc->uclass_id;
 	do {
 		ret = uclass_find_next_device(devp);
 		if (ret)
@@ -406,12 +405,12 @@ int blk_next_device(struct udevice **devp)
 		if (!*devp)
 			return -ENODEV;
 		desc = dev_get_uclass_plat(*devp);
-		if (desc->if_type == if_type)
+		if (desc->uclass_id == uclass_id)
 			return 0;
 	} while (1);
 }
 
-int blk_find_device(int if_type, int devnum, struct udevice **devp)
+int blk_find_device(int uclass_id, int devnum, struct udevice **devp)
 {
 	struct uclass *uc;
 	struct udevice *dev;
@@ -423,9 +422,9 @@ int blk_find_device(int if_type, int devnum, struct udevice **devp)
 	uclass_foreach_dev(dev, uc) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
 
-		debug("%s: if_type=%d, devnum=%d: %s, %d, %d\n", __func__,
-		      if_type, devnum, dev->name, desc->if_type, desc->devnum);
-		if (desc->if_type == if_type && desc->devnum == devnum) {
+		debug("%s: uclass_id=%d, devnum=%d: %s, %d, %d\n", __func__,
+		      uclass_id, devnum, dev->name, desc->uclass_id, desc->devnum);
+		if (desc->uclass_id == uclass_id && desc->devnum == devnum) {
 			*devp = dev;
 			return 0;
 		}
@@ -434,11 +433,11 @@ int blk_find_device(int if_type, int devnum, struct udevice **devp)
 	return -ENODEV;
 }
 
-int blk_get_device(int if_type, int devnum, struct udevice **devp)
+int blk_get_device(int uclass_id, int devnum, struct udevice **devp)
 {
 	int ret;
 
-	ret = blk_find_device(if_type, devnum, devp);
+	ret = blk_find_device(uclass_id, devnum, devp);
 	if (ret)
 		return ret;
 
@@ -455,12 +454,12 @@ unsigned long blk_dread(struct blk_desc *block_dev, lbaint_t start,
 	if (!ops->read)
 		return -ENOSYS;
 
-	if (blkcache_read(block_dev->if_type, block_dev->devnum,
+	if (blkcache_read(block_dev->uclass_id, block_dev->devnum,
 			  start, blkcnt, block_dev->blksz, buffer))
 		return blkcnt;
 	blks_read = ops->read(dev, start, blkcnt, buffer);
 	if (blks_read == blkcnt)
-		blkcache_fill(block_dev->if_type, block_dev->devnum,
+		blkcache_fill(block_dev->uclass_id, block_dev->devnum,
 			      start, blkcnt, block_dev->blksz, buffer);
 
 	return blks_read;
@@ -475,7 +474,7 @@ unsigned long blk_dwrite(struct blk_desc *block_dev, lbaint_t start,
 	if (!ops->write)
 		return -ENOSYS;
 
-	blkcache_invalidate(block_dev->if_type, block_dev->devnum);
+	blkcache_invalidate(block_dev->uclass_id, block_dev->devnum);
 	return ops->write(dev, start, blkcnt, buffer);
 }
 
@@ -488,7 +487,7 @@ unsigned long blk_derase(struct blk_desc *block_dev, lbaint_t start,
 	if (!ops->erase)
 		return -ENOSYS;
 
-	blkcache_invalidate(block_dev->if_type, block_dev->devnum);
+	blkcache_invalidate(block_dev->uclass_id, block_dev->devnum);
 	return ops->erase(dev, start, blkcnt);
 }
 
@@ -525,7 +524,7 @@ const char *blk_get_devtype(struct udevice *dev)
 	return uclass_get_name(device_get_uclass_id(parent));
 };
 
-int blk_find_max_devnum(enum uclass_id if_type)
+int blk_find_max_devnum(enum uclass_id uclass_id)
 {
 	struct udevice *dev;
 	int max_devnum = -ENODEV;
@@ -538,18 +537,18 @@ int blk_find_max_devnum(enum uclass_id if_type)
 	uclass_foreach_dev(dev, uc) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
 
-		if (desc->if_type == if_type && desc->devnum > max_devnum)
+		if (desc->uclass_id == uclass_id && desc->devnum > max_devnum)
 			max_devnum = desc->devnum;
 	}
 
 	return max_devnum;
 }
 
-int blk_next_free_devnum(enum uclass_id if_type)
+int blk_next_free_devnum(enum uclass_id uclass_id)
 {
 	int ret;
 
-	ret = blk_find_max_devnum(if_type);
+	ret = blk_find_max_devnum(uclass_id);
 	if (ret == -ENODEV)
 		return 0;
 	if (ret < 0)
@@ -631,7 +630,7 @@ int blk_count_devices(enum blk_flag_t flag)
 	return count;
 }
 
-static int blk_claim_devnum(enum uclass_id if_type, int devnum)
+static int blk_claim_devnum(enum uclass_id uclass_id, int devnum)
 {
 	struct udevice *dev;
 	struct uclass *uc;
@@ -643,8 +642,8 @@ static int blk_claim_devnum(enum uclass_id if_type, int devnum)
 	uclass_foreach_dev(dev, uc) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
 
-		if (desc->if_type == if_type && desc->devnum == devnum) {
-			int next = blk_next_free_devnum(if_type);
+		if (desc->uclass_id == uclass_id && desc->devnum == devnum) {
+			int next = blk_next_free_devnum(uclass_id);
 
 			if (next < 0)
 				return next;
@@ -657,7 +656,7 @@ static int blk_claim_devnum(enum uclass_id if_type, int devnum)
 }
 
 int blk_create_device(struct udevice *parent, const char *drv_name,
-		      const char *name, int if_type, int devnum, int blksz,
+		      const char *name, int uclass_id, int devnum, int blksz,
 		      lbaint_t lba, struct udevice **devp)
 {
 	struct blk_desc *desc;
@@ -665,9 +664,9 @@ int blk_create_device(struct udevice *parent, const char *drv_name,
 	int ret;
 
 	if (devnum == -1) {
-		devnum = blk_next_free_devnum(if_type);
+		devnum = blk_next_free_devnum(uclass_id);
 	} else {
-		ret = blk_claim_devnum(if_type, devnum);
+		ret = blk_claim_devnum(uclass_id, devnum);
 		if (ret < 0 && ret != -ENOENT)
 			return ret;
 	}
@@ -677,7 +676,7 @@ int blk_create_device(struct udevice *parent, const char *drv_name,
 	if (ret)
 		return ret;
 	desc = dev_get_uclass_plat(dev);
-	desc->if_type = if_type;
+	desc->uclass_id = uclass_id;
 	desc->blksz = blksz;
 	desc->log2blksz = LOG2(desc->blksz);
 	desc->lba = lba;
@@ -690,7 +689,7 @@ int blk_create_device(struct udevice *parent, const char *drv_name,
 }
 
 int blk_create_devicef(struct udevice *parent, const char *drv_name,
-		       const char *name, int if_type, int devnum, int blksz,
+		       const char *name, int uclass_id, int devnum, int blksz,
 		       lbaint_t lba, struct udevice **devp)
 {
 	char dev_name[30], *str;
@@ -701,7 +700,7 @@ int blk_create_devicef(struct udevice *parent, const char *drv_name,
 	if (!str)
 		return -ENOMEM;
 
-	ret = blk_create_device(parent, drv_name, str, if_type, devnum,
+	ret = blk_create_device(parent, drv_name, str, uclass_id, devnum,
 				blksz, lba, devp);
 	if (ret) {
 		free(str);
@@ -725,7 +724,7 @@ int blk_probe_or_unbind(struct udevice *dev)
 	return ret;
 }
 
-int blk_unbind_all(int if_type)
+int blk_unbind_all(int uclass_id)
 {
 	struct uclass *uc;
 	struct udevice *dev, *next;
@@ -737,7 +736,7 @@ int blk_unbind_all(int if_type)
 	uclass_foreach_dev_safe(dev, next, uc) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
 
-		if (desc->if_type == if_type) {
+		if (desc->uclass_id == uclass_id) {
 			ret = device_remove(dev, DM_REMOVE_NORMAL);
 			if (ret)
 				return ret;
diff --git a/drivers/block/blk_legacy.c b/drivers/block/blk_legacy.c
index 8c6f9cb208e..5bf1d047152 100644
--- a/drivers/block/blk_legacy.c
+++ b/drivers/block/blk_legacy.c
@@ -9,14 +9,14 @@
 #include <part.h>
 #include <linux/err.h>
 
-struct blk_driver *blk_driver_lookup_type(int if_type)
+struct blk_driver *blk_driver_lookup_type(int uclass_id)
 {
 	struct blk_driver *drv = ll_entry_start(struct blk_driver, blk_driver);
 	const int n_ents = ll_entry_count(struct blk_driver, blk_driver);
 	struct blk_driver *entry;
 
 	for (entry = drv; entry != drv + n_ents; entry++) {
-		if (if_type == entry->if_type)
+		if (uclass_id == entry->uclass_id)
 			return entry;
 	}
 
@@ -24,14 +24,14 @@ struct blk_driver *blk_driver_lookup_type(int if_type)
 	return NULL;
 }
 
-static struct blk_driver *blk_driver_lookup_typename(const char *if_typename)
+static struct blk_driver *blk_driver_lookup_typename(const char *uclass_idname)
 {
 	struct blk_driver *drv = ll_entry_start(struct blk_driver, blk_driver);
 	const int n_ents = ll_entry_count(struct blk_driver, blk_driver);
 	struct blk_driver *entry;
 
 	for (entry = drv; entry != drv + n_ents; entry++) {
-		if (!strcmp(if_typename, entry->if_typename))
+		if (!strcmp(uclass_idname, entry->uclass_idname))
 			return entry;
 	}
 
@@ -39,11 +39,11 @@ static struct blk_driver *blk_driver_lookup_typename(const char *if_typename)
 	return NULL;
 }
 
-const char *blk_get_if_type_name(enum uclass_id if_type)
+const char *blk_get_uclass_name(enum uclass_id uclass_id)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 
-	return drv ? drv->if_typename : NULL;
+	return drv ? drv->uclass_idname : NULL;
 }
 
 /**
@@ -70,14 +70,14 @@ static int get_desc(struct blk_driver *drv, int devnum, struct blk_desc **descp)
 	return drv->get_dev(devnum, descp);
 }
 
-int blk_list_part(enum uclass_id if_type)
+int blk_list_part(enum uclass_id uclass_id)
 {
 	struct blk_driver *drv;
 	struct blk_desc *desc;
 	int devnum, ok;
 	bool first = true;
 
-	drv = blk_driver_lookup_type(if_type);
+	drv = blk_driver_lookup_type(uclass_id);
 	if (!drv)
 		return -ENOSYS;
 	for (ok = 0, devnum = 0; devnum < drv->max_devs; ++devnum) {
@@ -97,9 +97,9 @@ int blk_list_part(enum uclass_id if_type)
 	return 0;
 }
 
-int blk_print_part_devnum(enum uclass_id if_type, int devnum)
+int blk_print_part_devnum(enum uclass_id uclass_id, int devnum)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	int ret;
 
@@ -115,9 +115,9 @@ int blk_print_part_devnum(enum uclass_id if_type, int devnum)
 	return 0;
 }
 
-void blk_list_devices(enum uclass_id if_type)
+void blk_list_devices(enum uclass_id uclass_id)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	int i;
 
@@ -133,9 +133,9 @@ void blk_list_devices(enum uclass_id if_type)
 	}
 }
 
-int blk_print_device_num(enum uclass_id if_type, int devnum)
+int blk_print_device_num(enum uclass_id uclass_id, int devnum)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	int ret;
 
@@ -144,15 +144,15 @@ int blk_print_device_num(enum uclass_id if_type, int devnum)
 	ret = get_desc(drv, devnum, &desc);
 	if (ret)
 		return ret;
-	printf("\n%s device %d: ", drv->if_typename, devnum);
+	printf("\n%s device %d: ", drv->uclass_idname, devnum);
 	dev_print(desc);
 
 	return 0;
 }
 
-int blk_show_device(enum uclass_id if_type, int devnum)
+int blk_show_device(enum uclass_id uclass_id, int devnum)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	int ret;
 
@@ -174,9 +174,9 @@ int blk_show_device(enum uclass_id if_type, int devnum)
 	return 0;
 }
 
-struct blk_desc *blk_get_devnum_by_type(enum uclass_id if_type, int devnum)
+struct blk_desc *blk_get_devnum_by_uclass_id(enum uclass_id uclass_id, int devnum)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 
 	if (!drv)
@@ -190,7 +190,7 @@ struct blk_desc *blk_get_devnum_by_type(enum uclass_id if_type, int devnum)
 
 int blk_dselect_hwpart(struct blk_desc *desc, int hwpart)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(desc->if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(desc->uclass_id);
 
 	if (!drv)
 		return -ENOSYS;
@@ -200,9 +200,9 @@ int blk_dselect_hwpart(struct blk_desc *desc, int hwpart)
 	return 0;
 }
 
-struct blk_desc *blk_get_devnum_by_typename(const char *if_typename, int devnum)
+struct blk_desc *blk_get_devnum_by_uclass_idname(const char *uclass_idname, int devnum)
 {
-	struct blk_driver *drv = blk_driver_lookup_typename(if_typename);
+	struct blk_driver *drv = blk_driver_lookup_typename(uclass_idname);
 	struct blk_desc *desc;
 
 	if (!drv)
@@ -214,10 +214,10 @@ struct blk_desc *blk_get_devnum_by_typename(const char *if_typename, int devnum)
 	return desc;
 }
 
-ulong blk_read_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
+ulong blk_read_devnum(enum uclass_id uclass_id, int devnum, lbaint_t start,
 		      lbaint_t blkcnt, void *buffer)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	ulong n;
 	int ret;
@@ -234,10 +234,10 @@ ulong blk_read_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
 	return n;
 }
 
-ulong blk_write_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
+ulong blk_write_devnum(enum uclass_id uclass_id, int devnum, lbaint_t start,
 		       lbaint_t blkcnt, const void *buffer)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	int ret;
 
@@ -249,9 +249,9 @@ ulong blk_write_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
 	return desc->block_write(desc, start, blkcnt, buffer);
 }
 
-int blk_select_hwpart_devnum(enum uclass_id if_type, int devnum, int hwpart)
+int blk_select_hwpart_devnum(enum uclass_id uclass_id, int devnum, int hwpart)
 {
-	struct blk_driver *drv = blk_driver_lookup_type(if_type);
+	struct blk_driver *drv = blk_driver_lookup_type(uclass_id);
 	struct blk_desc *desc;
 	int ret;
 
diff --git a/drivers/block/ide.c b/drivers/block/ide.c
index 73da29ad552..ef5644d0b90 100644
--- a/drivers/block/ide.c
+++ b/drivers/block/ide.c
@@ -537,7 +537,7 @@ static void ide_ident(struct blk_desc *dev_desc)
 	/* Select device
 	 */
 	ide_outb(device, ATA_DEV_HD, ATA_LBA | ATA_DEVICE(device));
-	dev_desc->if_type = UCLASS_IDE;
+	dev_desc->uclass_id = UCLASS_IDE;
 #ifdef CONFIG_ATAPI
 
 	retries = 0;
@@ -752,7 +752,7 @@ void ide_init(void)
 
 	for (i = 0; i < CONFIG_SYS_IDE_MAXDEVICE; ++i) {
 		ide_dev_desc[i].type = DEV_TYPE_UNKNOWN;
-		ide_dev_desc[i].if_type = UCLASS_IDE;
+		ide_dev_desc[i].uclass_id = UCLASS_IDE;
 		ide_dev_desc[i].devnum = i;
 		ide_dev_desc[i].part_type = PART_TYPE_UNKNOWN;
 		ide_dev_desc[i].blksz = 0;
@@ -1143,8 +1143,8 @@ UCLASS_DRIVER(ide) = {
 };
 #else
 U_BOOT_LEGACY_BLK(ide) = {
-	.if_typename	= "ide",
-	.if_type	= UCLASS_IDE,
+	.uclass_idname	= "ide",
+	.uclass_id	= UCLASS_IDE,
 	.max_devs	= CONFIG_SYS_IDE_MAXDEVICE,
 	.desc		= ide_dev_desc,
 };
diff --git a/drivers/block/sandbox.c b/drivers/block/sandbox.c
index 2de12e0a93e..f2aae89716b 100644
--- a/drivers/block/sandbox.c
+++ b/drivers/block/sandbox.c
@@ -150,7 +150,7 @@ int host_dev_bind(int devnum, char *filename, bool removable)
 		goto err_file;
 	}
 
-	desc = blk_get_devnum_by_type(UCLASS_ROOT, devnum);
+	desc = blk_get_devnum_by_uclass_id(UCLASS_ROOT, devnum);
 	desc->removable = removable;
 	snprintf(desc->vendor, BLK_VEN_SIZE, "U-Boot");
 	snprintf(desc->product, BLK_PRD_SIZE, "hostfile");
@@ -192,7 +192,7 @@ int host_dev_bind(int dev, char *filename, bool removable)
 	}
 
 	struct blk_desc *blk_dev = &host_dev->blk_dev;
-	blk_dev->if_type = UCLASS_ROOT;
+	blk_dev->uclass_id = UCLASS_ROOT;
 	blk_dev->priv = host_dev;
 	blk_dev->blksz = 512;
 	blk_dev->lba = os_lseek(host_dev->fd, 0, OS_SEEK_END) / blk_dev->blksz;
@@ -262,8 +262,8 @@ U_BOOT_DRIVER(sandbox_host_blk) = {
 };
 #else
 U_BOOT_LEGACY_BLK(sandbox_host) = {
-	.if_typename	= "host",
-	.if_type	= UCLASS_ROOT,
+	.uclass_idname	= "host",
+	.uclass_id	= UCLASS_ROOT,
 	.max_devs	= SANDBOX_HOST_MAX_DEVICES,
 	.get_dev	= host_get_dev_err,
 };
diff --git a/drivers/mmc/mmc-uclass.c b/drivers/mmc/mmc-uclass.c
index b1bd4ae1bc8..759a6b728c8 100644
--- a/drivers/mmc/mmc-uclass.c
+++ b/drivers/mmc/mmc-uclass.c
@@ -472,7 +472,7 @@ static int mmc_select_hwpart(struct udevice *bdev, int hwpart)
 
 	ret = mmc_switch_part(mmc, hwpart);
 	if (!ret)
-		blkcache_invalidate(desc->if_type, desc->devnum);
+		blkcache_invalidate(desc->uclass_id, desc->devnum);
 
 	return ret;
 }
diff --git a/drivers/mmc/mmc_legacy.c b/drivers/mmc/mmc_legacy.c
index 4e0891e5dfe..a101ee43fde 100644
--- a/drivers/mmc/mmc_legacy.c
+++ b/drivers/mmc/mmc_legacy.c
@@ -132,7 +132,7 @@ static struct mmc mmc_static = {
 	.dsr_imp		= 0,
 	.dsr			= 0xffffffff,
 	.block_dev = {
-		.if_type	= UCLASS_MMC,
+		.uclass_id	= UCLASS_MMC,
 		.removable	= 1,
 		.devnum		= 0,
 		.block_read	= mmc_bread,
@@ -194,7 +194,7 @@ struct mmc *mmc_create(const struct mmc_config *cfg, void *priv)
 	mmc->dsr = 0xffffffff;
 	/* Setup the universal parts of the block interface just once */
 	bdesc = mmc_get_blk_desc(mmc);
-	bdesc->if_type = UCLASS_MMC;
+	bdesc->uclass_id = UCLASS_MMC;
 	bdesc->removable = 1;
 	bdesc->devnum = mmc_get_next_devnum();
 	bdesc->block_read = mmc_bread;
@@ -253,8 +253,8 @@ static int mmc_get_dev(int dev, struct blk_desc **descp)
 }
 
 U_BOOT_LEGACY_BLK(mmc) = {
-	.if_typename	= "mmc",
-	.if_type	= UCLASS_MMC,
+	.uclass_idname	= "mmc",
+	.uclass_id	= UCLASS_MMC,
 	.max_devs	= -1,
 	.get_dev	= mmc_get_dev,
 	.select_hwpart	= mmc_select_hwpartp,
diff --git a/drivers/net/fsl_enetc.c b/drivers/net/fsl_enetc.c
index cd4c2c29a65..f1682864611 100644
--- a/drivers/net/fsl_enetc.c
+++ b/drivers/net/fsl_enetc.c
@@ -144,7 +144,7 @@ static int enetc_init_sgmii(struct udevice *dev)
 	if (!enetc_has_imdio(dev))
 		return 0;
 
-	if (priv->if_type == PHY_INTERFACE_MODE_2500BASEX)
+	if (priv->uclass_id == PHY_INTERFACE_MODE_2500BASEX)
 		is2500 = true;
 
 	/*
@@ -219,7 +219,7 @@ static void enetc_setup_mac_iface(struct udevice *dev,
 	struct enetc_priv *priv = dev_get_priv(dev);
 	u32 if_mode;
 
-	switch (priv->if_type) {
+	switch (priv->uclass_id) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
@@ -276,14 +276,14 @@ static void enetc_start_pcs(struct udevice *dev)
 		return;
 	}
 
-	priv->if_type = dev_read_phy_mode(dev);
-	if (priv->if_type == PHY_INTERFACE_MODE_NA) {
+	priv->uclass_id = dev_read_phy_mode(dev);
+	if (priv->uclass_id == PHY_INTERFACE_MODE_NA) {
 		enetc_dbg(dev,
 			  "phy-mode property not found, defaulting to SGMII\n");
-		priv->if_type = PHY_INTERFACE_MODE_SGMII;
+		priv->uclass_id = PHY_INTERFACE_MODE_SGMII;
 	}
 
-	switch (priv->if_type) {
+	switch (priv->uclass_id) {
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_2500BASEX:
 		enetc_init_sgmii(dev);
diff --git a/drivers/net/fsl_enetc.h b/drivers/net/fsl_enetc.h
index 69f2f4aaff1..f2acf367aa3 100644
--- a/drivers/net/fsl_enetc.h
+++ b/drivers/net/fsl_enetc.h
@@ -158,7 +158,7 @@ struct enetc_priv {
 	struct bd_ring tx_bdr;
 	struct bd_ring rx_bdr;
 
-	int if_type;
+	int uclass_id;
 	struct mii_dev imdio;
 	struct phy_device *phy;
 };
diff --git a/drivers/scsi/scsi.c b/drivers/scsi/scsi.c
index 99be5aef877..3e769b0843f 100644
--- a/drivers/scsi/scsi.c
+++ b/drivers/scsi/scsi.c
@@ -456,7 +456,7 @@ static void scsi_init_dev_desc(struct blk_desc *dev_desc, int devnum)
 {
 	dev_desc->lba = 0;
 	dev_desc->blksz = 0;
-	dev_desc->if_type = UCLASS_SCSI;
+	dev_desc->uclass_id = UCLASS_SCSI;
 	dev_desc->devnum = devnum;
 	dev_desc->part_type = PART_TYPE_UNKNOWN;
 
@@ -706,8 +706,8 @@ U_BOOT_DRIVER(scsi_blk) = {
 };
 #else
 U_BOOT_LEGACY_BLK(scsi) = {
-	.if_typename	= "scsi",
-	.if_type	= UCLASS_SCSI,
+	.uclass_idname	= "scsi",
+	.uclass_id	= UCLASS_SCSI,
 	.max_devs	= SCSI_MAX_DEVICE,
 	.desc		= scsi_dev_desc,
 };
diff --git a/drivers/virtio/virtio_blk.c b/drivers/virtio/virtio_blk.c
index 9710b79117c..30cfc56725c 100644
--- a/drivers/virtio/virtio_blk.c
+++ b/drivers/virtio/virtio_blk.c
@@ -75,7 +75,7 @@ static int virtio_blk_bind(struct udevice *dev)
 	struct blk_desc *desc = dev_get_uclass_plat(dev);
 	int devnum;
 
-	desc->if_type = UCLASS_VIRTIO;
+	desc->uclass_id = UCLASS_VIRTIO;
 	/*
 	 * Initialize the devnum to -ENODEV. This is to make sure that
 	 * blk_next_free_devnum() works as expected, since the default
diff --git a/drivers/xen/pvblock.c b/drivers/xen/pvblock.c
index 1090e528d02..970182cd904 100644
--- a/drivers/xen/pvblock.c
+++ b/drivers/xen/pvblock.c
@@ -665,7 +665,7 @@ static int pvblock_blk_bind(struct udevice *udev)
 	struct blk_desc *desc = dev_get_uclass_plat(udev);
 	int devnum;
 
-	desc->if_type = UCLASS_PVBLOCK;
+	desc->uclass_id = UCLASS_PVBLOCK;
 	/*
 	 * Initialize the devnum to -ENODEV. This is to make sure that
 	 * blk_next_free_devnum() works as expected, since the default
diff --git a/fs/fat/fat.c b/fs/fat/fat.c
index c64e253abd4..a945904785f 100644
--- a/fs/fat/fat.c
+++ b/fs/fat/fat.c
@@ -1145,7 +1145,7 @@ int file_fat_detectfs(void)
 	}
 
 	if (blk_enabled()) {
-		printf("Interface:  %s\n", blk_get_if_type_name(cur_dev->if_type));
+		printf("Interface:  %s\n", blk_get_uclass_name(cur_dev->uclass_id));
 		printf("  Device %d: ", cur_dev->devnum);
 		dev_print(cur_dev);
 	}
diff --git a/include/blk.h b/include/blk.h
index 279f9ea4a9d..8806c382d4e 100644
--- a/include/blk.h
+++ b/include/blk.h
@@ -54,7 +54,7 @@ struct blk_desc {
 	 * TODO: With driver model we should be able to use the parent
 	 * device's uclass instead.
 	 */
-	enum uclass_id	if_type;	/* type of the interface */
+	enum uclass_id	uclass_id;	/* type of the interface */
 	int		devnum;		/* device number */
 	unsigned char	part_type;	/* partition type */
 	unsigned char	target;		/* target SCSI ID */
@@ -114,7 +114,7 @@ int blkcache_init(void);
 /**
  * blkcache_read() - attempt to read a set of blocks from cache
  *
- * @param iftype - IF_TYPE_x for type of device
+ * @param iftype - uclass_id_x for type of device
  * @param dev - device index of particular type
  * @param start - starting block number
  * @param blkcnt - number of blocks to read
@@ -131,7 +131,7 @@ int blkcache_read(int iftype, int dev,
  * blkcache_fill() - make data read from a block device available
  * to the block cache
  *
- * @param iftype - IF_TYPE_x for type of device
+ * @param iftype - uclass_id_x for type of device
  * @param dev - device index of particular type
  * @param start - starting block number
  * @param blkcnt - number of blocks available
@@ -147,7 +147,7 @@ void blkcache_fill(int iftype, int dev,
  * blkcache_invalidate() - discard the cache for a set of blocks
  * because of a write or device (re)initialization.
  *
- * @param iftype - IF_TYPE_x for type of device
+ * @param iftype - uclass_id_x for type of device
  * @param dev - device index of particular type
  */
 void blkcache_invalidate(int iftype, int dev);
@@ -279,22 +279,22 @@ unsigned long blk_derase(struct blk_desc *block_dev, lbaint_t start,
  * This function does not activate the device. The device will be returned
  * whether or not it is activated.
  *
- * @if_type:	Interface type (enum uclass_id_t)
+ * @uclass_id:	Interface type (enum uclass_id_t)
  * @devnum:	Device number (specific to each interface type)
  * @devp:	the device, if found
  * Return: 0 if found, -ENODEV if no device found, or other -ve error value
  */
-int blk_find_device(int if_type, int devnum, struct udevice **devp);
+int blk_find_device(int uclass_id, int devnum, struct udevice **devp);
 
 /**
  * blk_get_device() - Find and probe a block device ready for use
  *
- * @if_type:	Interface type (enum uclass_id_t)
+ * @uclass_id:	Interface type (enum uclass_id_t)
  * @devnum:	Device number (specific to each interface type)
  * @devp:	the device, if found
  * Return: 0 if found, -ENODEV if no device found, or other -ve error value
  */
-int blk_get_device(int if_type, int devnum, struct udevice **devp);
+int blk_get_device(int uclass_id, int devnum, struct udevice **devp);
 
 /**
  * blk_first_device() - Find the first device for a given interface
@@ -305,7 +305,7 @@ int blk_get_device(int if_type, int devnum, struct udevice **devp);
  * @devp:	the device, if found
  * Return: 0 if found, -ENODEV if no device, or other -ve error value
  */
-int blk_first_device(int if_type, struct udevice **devp);
+int blk_first_device(int uclass_id, struct udevice **devp);
 
 /**
  * blk_next_device() - Find the next device for a given interface
@@ -327,7 +327,7 @@ int blk_next_device(struct udevice **devp);
  * @parent:	Parent of the new device
  * @drv_name:	Driver name to use for the block device
  * @name:	Name for the device
- * @if_type:	Interface type (enum uclass_id_t)
+ * @uclass_id:	Interface type (enum uclass_id_t)
  * @devnum:	Device number, specific to the interface type, or -1 to
  *		allocate the next available number
  * @blksz:	Block size of the device in bytes (typically 512)
@@ -335,7 +335,7 @@ int blk_next_device(struct udevice **devp);
  * @devp:	the new device (which has not been probed)
  */
 int blk_create_device(struct udevice *parent, const char *drv_name,
-		      const char *name, int if_type, int devnum, int blksz,
+		      const char *name, int uclass_id, int devnum, int blksz,
 		      lbaint_t lba, struct udevice **devp);
 
 /**
@@ -344,7 +344,7 @@ int blk_create_device(struct udevice *parent, const char *drv_name,
  * @parent:	Parent of the new device
  * @drv_name:	Driver name to use for the block device
  * @name:	Name for the device (parent name is prepended)
- * @if_type:	Interface type (enum uclass_id_t)
+ * @uclass_id:	Interface type (enum uclass_id_t)
  * @devnum:	Device number, specific to the interface type, or -1 to
  *		allocate the next available number
  * @blksz:	Block size of the device in bytes (typically 512)
@@ -352,7 +352,7 @@ int blk_create_device(struct udevice *parent, const char *drv_name,
  * @devp:	the new device (which has not been probed)
  */
 int blk_create_devicef(struct udevice *parent, const char *drv_name,
-		       const char *name, int if_type, int devnum, int blksz,
+		       const char *name, int uclass_id, int devnum, int blksz,
 		       lbaint_t lba, struct udevice **devp);
 
 /**
@@ -372,33 +372,33 @@ int blk_probe_or_unbind(struct udevice *dev);
  *
  * The devices are removed and then unbound.
  *
- * @if_type:	Interface type to unbind
+ * @uclass_id:	Interface type to unbind
  * Return: 0 if OK, -ve on error
  */
-int blk_unbind_all(int if_type);
+int blk_unbind_all(int uclass_id);
 
 /**
  * blk_find_max_devnum() - find the maximum device number for an interface type
  *
- * Finds the last allocated device number for an interface type @if_type. The
+ * Finds the last allocated device number for an interface type @uclass_id. The
  * next number is safe to use for a newly allocated device.
  *
- * @if_type:	Interface type to scan
+ * @uclass_id:	Interface type to scan
  * Return: maximum device number found, or -ENODEV if none, or other -ve on
  * error
  */
-int blk_find_max_devnum(enum uclass_id if_type);
+int blk_find_max_devnum(enum uclass_id uclass_id);
 
 /**
  * blk_next_free_devnum() - get the next device number for an interface type
  *
  * Finds the next number that is safe to use for a newly allocated device for
- * an interface type @if_type.
+ * an interface type @uclass_id.
  *
- * @if_type:	Interface type to scan
+ * @uclass_id:	Interface type to scan
  * Return: next device number safe to use, or -ve on error
  */
-int blk_next_free_devnum(enum uclass_id if_type);
+int blk_next_free_devnum(enum uclass_id uclass_id);
 
 /**
  * blk_select_hwpart() - select a hardware partition
@@ -447,7 +447,7 @@ static inline ulong blk_dread(struct blk_desc *block_dev, lbaint_t start,
 			      lbaint_t blkcnt, void *buffer)
 {
 	ulong blks_read;
-	if (blkcache_read(block_dev->if_type, block_dev->devnum,
+	if (blkcache_read(block_dev->uclass_id, block_dev->devnum,
 			  start, blkcnt, block_dev->blksz, buffer))
 		return blkcnt;
 
@@ -458,7 +458,7 @@ static inline ulong blk_dread(struct blk_desc *block_dev, lbaint_t start,
 	 */
 	blks_read = block_dev->block_read(block_dev, start, blkcnt, buffer);
 	if (blks_read == blkcnt)
-		blkcache_fill(block_dev->if_type, block_dev->devnum,
+		blkcache_fill(block_dev->uclass_id, block_dev->devnum,
 			      start, blkcnt, block_dev->blksz, buffer);
 
 	return blks_read;
@@ -467,14 +467,14 @@ static inline ulong blk_dread(struct blk_desc *block_dev, lbaint_t start,
 static inline ulong blk_dwrite(struct blk_desc *block_dev, lbaint_t start,
 			       lbaint_t blkcnt, const void *buffer)
 {
-	blkcache_invalidate(block_dev->if_type, block_dev->devnum);
+	blkcache_invalidate(block_dev->uclass_id, block_dev->devnum);
 	return block_dev->block_write(block_dev, start, blkcnt, buffer);
 }
 
 static inline ulong blk_derase(struct blk_desc *block_dev, lbaint_t start,
 			       lbaint_t blkcnt)
 {
-	blkcache_invalidate(block_dev->if_type, block_dev->devnum);
+	blkcache_invalidate(block_dev->uclass_id, block_dev->devnum);
 	return block_dev->block_erase(block_dev, start, blkcnt);
 }
 
@@ -485,15 +485,15 @@ static inline ulong blk_derase(struct blk_desc *block_dev, lbaint_t start,
  * driver should be provided using U_BOOT_LEGACY_BLK() for each interface
  * type that is to be supported.
  *
- * @if_typename:	Interface type name
- * @if_type:		Interface type
+ * @uclass_idname:	Interface type name
+ * @uclass_id:		Interface type
  * @max_devs:		Maximum number of devices supported
  * @desc:		Pointer to list of devices for this interface type,
  *			or NULL to use @get_dev() instead
  */
 struct blk_driver {
-	const char *if_typename;
-	enum uclass_id if_type;
+	const char *uclass_idname;
+	enum uclass_id uclass_id;
 	int max_devs;
 	struct blk_desc *desc;
 	/**
@@ -540,33 +540,33 @@ struct blk_driver {
 #define U_BOOT_LEGACY_BLK(__name)					\
 	ll_entry_declare(struct blk_driver, __name, blk_driver)
 
-struct blk_driver *blk_driver_lookup_type(int if_type);
+struct blk_driver *blk_driver_lookup_type(int uclass_id);
 
 #endif /* !CONFIG_BLK */
 
 /**
- * blk_get_devnum_by_typename() - Get a block device by type and number
+ * blk_get_devnum_by_uclass_idname() - Get a block device by type and number
  *
  * This looks through the available block devices of the given type, returning
  * the one with the given @devnum.
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * Return: point to block device descriptor, or NULL if not found
  */
-struct blk_desc *blk_get_devnum_by_type(enum uclass_id if_type, int devnum);
+struct blk_desc *blk_get_devnum_by_uclass_id(enum uclass_id uclass_id, int devnum);
 
 /**
- * blk_get_devnum_by_type() - Get a block device by type name, and number
+ * blk_get_devnum_by_uclass_id() - Get a block device by type name, and number
  *
- * This looks up the block device type based on @if_typename, then calls
- * blk_get_devnum_by_type().
+ * This looks up the block device type based on @uclass_idname, then calls
+ * blk_get_devnum_by_uclass_id().
  *
- * @if_typename:	Block device type name
+ * @uclass_idname:	Block device type name
  * @devnum:		Device number
  * Return: point to block device descriptor, or NULL if not found
  */
-struct blk_desc *blk_get_devnum_by_typename(const char *if_typename,
+struct blk_desc *blk_get_devnum_by_uclass_idname(const char *uclass_idname,
 					    int devnum);
 
 /**
@@ -585,34 +585,34 @@ int blk_dselect_hwpart(struct blk_desc *desc, int hwpart);
 /**
  * blk_list_part() - list the partitions for block devices of a given type
  *
- * This looks up the partition type for each block device of type @if_type,
+ * This looks up the partition type for each block device of type @uclass_id,
  * then displays a list of partitions.
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * Return: 0 if OK, -ENODEV if there is none of that type
  */
-int blk_list_part(enum uclass_id if_type);
+int blk_list_part(enum uclass_id uclass_id);
 
 /**
  * blk_list_devices() - list the block devices of a given type
  *
- * This lists each block device of the type @if_type, showing the capacity
+ * This lists each block device of the type @uclass_id, showing the capacity
  * as well as type-specific information.
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  */
-void blk_list_devices(enum uclass_id if_type);
+void blk_list_devices(enum uclass_id uclass_id);
 
 /**
  * blk_show_device() - show information about a given block device
  *
  * This shows the block device capacity as well as type-specific information.
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * Return: 0 if OK, -ENODEV for invalid device number
  */
-int blk_show_device(enum uclass_id if_type, int devnum);
+int blk_show_device(enum uclass_id uclass_id, int devnum);
 
 /**
  * blk_print_device_num() - show information about a given block device
@@ -620,45 +620,45 @@ int blk_show_device(enum uclass_id if_type, int devnum);
  * This is similar to blk_show_device() but returns an error if the block
  * device type is unknown.
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * Return: 0 if OK, -ENODEV for invalid device number, -ENOENT if the block
  * device is not connected
  */
-int blk_print_device_num(enum uclass_id if_type, int devnum);
+int blk_print_device_num(enum uclass_id uclass_id, int devnum);
 
 /**
  * blk_print_part_devnum() - print the partition information for a device
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * Return: 0 if OK, -ENOENT if the block device is not connected, -ENOSYS if
  * the interface type is not supported, other -ve on other error
  */
-int blk_print_part_devnum(enum uclass_id if_type, int devnum);
+int blk_print_part_devnum(enum uclass_id uclass_id, int devnum);
 
 /**
  * blk_read_devnum() - read blocks from a device
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * @blkcnt:	Number of blocks to read
  * @buffer:	Address to write data to
  * Return: number of blocks read, or -ve error number on error
  */
-ulong blk_read_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
+ulong blk_read_devnum(enum uclass_id uclass_id, int devnum, lbaint_t start,
 		      lbaint_t blkcnt, void *buffer);
 
 /**
  * blk_write_devnum() - write blocks to a device
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * @blkcnt:	Number of blocks to write
  * @buffer:	Address to read data from
  * Return: number of blocks written, or -ve error number on error
  */
-ulong blk_write_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
+ulong blk_write_devnum(enum uclass_id uclass_id, int devnum, lbaint_t start,
 		       lbaint_t blkcnt, const void *buffer);
 
 /**
@@ -667,31 +667,31 @@ ulong blk_write_devnum(enum uclass_id if_type, int devnum, lbaint_t start,
  * This is similar to blk_dselect_hwpart() but it looks up the interface and
  * device number.
  *
- * @if_type:	Block device type
+ * @uclass_id:	Block device type
  * @devnum:	Device number
  * @hwpart:	Partition number to select
  * Return: 0 if OK, -ve on error
  */
-int blk_select_hwpart_devnum(enum uclass_id if_type, int devnum, int hwpart);
+int blk_select_hwpart_devnum(enum uclass_id uclass_id, int devnum, int hwpart);
 
 /**
- * blk_get_if_type_name() - Get the name of an interface type
+ * blk_get_uclass_name() - Get the name of an interface type
  *
- * @if_type: Interface type to check
+ * @uclass_id: Interface type to check
  * Return: name of interface, or NULL if none
  */
-const char *blk_get_if_type_name(enum uclass_id if_type);
+const char *blk_get_uclass_name(enum uclass_id uclass_id);
 
 /**
  * blk_common_cmd() - handle common commands with block devices
  *
  * @args: Number of arguments to the command (argv[0] is the command itself)
  * @argv: Command arguments
- * @if_type: Interface type
+ * @uclass_id: Interface type
  * @cur_devnump: Current device number for this interface type
  * Return: 0 if OK, CMD_RET_ERROR on error
  */
-int blk_common_cmd(int argc, char *const argv[], enum uclass_id if_type,
+int blk_common_cmd(int argc, char *const argv[], enum uclass_id uclass_id,
 		   int *cur_devnump);
 
 enum blk_flag_t {
diff --git a/include/efi_loader.h b/include/efi_loader.h
index fb35087ddb0..f528fdd1837 100644
--- a/include/efi_loader.h
+++ b/include/efi_loader.h
@@ -161,7 +161,7 @@ extern bool efi_st_keep_devices;
 
 /* EFI system partition */
 extern struct efi_system_partition {
-	enum uclass_id if_type;
+	enum uclass_id uclass_id;
 	int devnum;
 	u8 part;
 } efi_system_partition;
@@ -560,7 +560,7 @@ efi_status_t tcg2_measure_pe_image(void *efi, u64 efi_size,
 				   struct efi_loaded_image *loaded_image_info);
 /* Create handles and protocols for the partitions of a block device */
 int efi_disk_create_partitions(efi_handle_t parent, struct blk_desc *desc,
-			       const char *if_typename, int diskid,
+			       const char *uclass_idname, int diskid,
 			       const char *pdevname);
 /* Called by bootefi to make GOP (graphical) interface available */
 efi_status_t efi_gop_register(void);
diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
index 819dcb4f131..022ca8fef8b 100644
--- a/lib/efi_loader/efi_disk.c
+++ b/lib/efi_loader/efi_disk.c
@@ -498,13 +498,13 @@ static efi_status_t efi_disk_add_dev(
 		  diskobj->media.last_block);
 
 	/* Store first EFI system partition */
-	if (part && !efi_system_partition.if_type) {
+	if (part && !efi_system_partition.uclass_id) {
 		if (part_info->bootable & PART_EFI_SYSTEM_PARTITION) {
-			efi_system_partition.if_type = desc->if_type;
+			efi_system_partition.uclass_id = desc->uclass_id;
 			efi_system_partition.devnum = desc->devnum;
 			efi_system_partition.part = part;
 			EFI_PRINT("EFI system partition: %s %x:%x\n",
-				  blk_get_if_type_name(desc->if_type),
+				  blk_get_uclass_name(desc->uclass_id),
 				  desc->devnum, part);
 		}
 	}
@@ -640,7 +640,7 @@ static int efi_disk_probe(void *ctx, struct event *event)
 	 * has already created an efi_disk at this moment.
 	 */
 	desc = dev_get_uclass_plat(dev);
-	if (desc->if_type != UCLASS_EFI_LOADER) {
+	if (desc->uclass_id != UCLASS_EFI_LOADER) {
 		ret = efi_disk_create_raw(dev);
 		if (ret)
 			return -1;
@@ -675,7 +675,7 @@ static int efi_disk_delete_raw(struct udevice *dev)
 		return -1;
 
 	desc = dev_get_uclass_plat(dev);
-	if (desc->if_type != UCLASS_EFI_LOADER) {
+	if (desc->uclass_id != UCLASS_EFI_LOADER) {
 		diskobj = container_of(handle, struct efi_disk_obj, header);
 		efi_free_pool(diskobj->dp);
 	}
@@ -794,7 +794,7 @@ efi_status_t efi_disk_get_device_name(const efi_handle_t handle, char *buf, int
 	} else {
 		return EFI_INVALID_PARAMETER;
 	}
-	if_typename = blk_get_if_type_name(desc->if_type);
+	if_typename = blk_get_uclass_name(desc->uclass_id);
 	diskid = desc->devnum;
 
 	if (is_partition) {
diff --git a/lib/efi_loader/efi_var_file.c b/lib/efi_loader/efi_var_file.c
index 994e66392fb..3d58caa13da 100644
--- a/lib/efi_loader/efi_var_file.c
+++ b/lib/efi_loader/efi_var_file.c
@@ -38,13 +38,13 @@ static efi_status_t __maybe_unused efi_set_blk_dev_to_system_partition(void)
 	char part_str[PART_STR_LEN];
 	int r;
 
-	if (efi_system_partition.if_type == UCLASS_INVALID) {
+	if (efi_system_partition.uclass_id == UCLASS_INVALID) {
 		log_err("No EFI system partition\n");
 		return EFI_DEVICE_ERROR;
 	}
 	snprintf(part_str, PART_STR_LEN, "%x:%x",
 		 efi_system_partition.devnum, efi_system_partition.part);
-	r = fs_set_blk_dev(blk_get_if_type_name(efi_system_partition.if_type),
+	r = fs_set_blk_dev(blk_get_uclass_name(efi_system_partition.uclass_id),
 			   part_str, FS_TYPE_ANY);
 	if (r) {
 		log_err("Cannot read EFI system partition\n");
-- 
2.37.3.968.ga6b4b080e4-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
