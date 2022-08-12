Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1345909EE
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Aug 2022 03:35:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA9FCC5E2C6;
	Fri, 12 Aug 2022 01:35:51 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73EDEC5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 01:35:50 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-116c7286aaaso7667484fac.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 18:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KsbGH2dw0I0D5IgeI/HkyBjd4fweMb6i3YxADS8d3No=;
 b=FXE1uJhcGjpXu0PP/iQ2q3JFQsC1HV3ehpwWgLwCXzgYmb5l81E9QxI7uzJ+K+I0Fp
 1xUIDLTnZD9Xs7tZb3oYlxbr9YMt9Vppsr5LCx7FU9h4ethTEtPffHKxYADTZXBB/IcJ
 Csy1nC9XS2C+MVEFgXW53hUUJNuSDSVBI8zkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KsbGH2dw0I0D5IgeI/HkyBjd4fweMb6i3YxADS8d3No=;
 b=jyoKv22eGL5I4BaJbBDMkP1LBKLH1sFkFP6l20m9w01ko76nTPXmjM06OVVewYFhqb
 7XwNtZcK+zvwIg3LtE4UuYSbuz+wBDDr6kI5j1lK8kwE8G1/vgyXvNFQraAm+6kKsLLp
 yCf5+m4hx4LjBS3xrdzxC7sDnkxXG59OJoQt8x4vJDBaodNQ23O0P1x7O/DsUagQRnfJ
 /zGPLovXHiNX62rqd+07EnolixyTzM/Q6A8ubGsECUWseg5UnvMZsuMN6BsXu9duldW9
 AS7T0B1Z10vBzab57EPsPE0uum6Dio7hohDtSXkfzR3jU3ngj8CphNNpBXYCecFsjg1X
 3w3A==
X-Gm-Message-State: ACgBeo3kG+knMvB2u4+chS4DmOFn2bdu6kkFnfWCQcxvQE8RUhCAV1Qr
 qAtBa3Y93kH/QGtKMB0gcRn4Sw==
X-Google-Smtp-Source: AA6agR5kw353N/CXwfq67oZol9I9ArJcaY30ZfeFJjIho4n/y2U9mdpJnlLZAwoWogxmDmaCoazCbg==
X-Received: by 2002:a05:6870:4205:b0:113:a1aa:60e7 with SMTP id
 u5-20020a056870420500b00113a1aa60e7mr4938135oac.241.1660268149098; 
 Thu, 11 Aug 2022 18:35:49 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056870b41500b0010c5005d427sm158518oap.33.2022.08.11.18.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 18:35:48 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 11 Aug 2022 19:34:59 -0600
Message-Id: <20220812013503.1724919-21-sjg@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
In-Reply-To: <20220812013503.1724919-1-sjg@chromium.org>
References: <20220812013503.1724919-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Denys Drozdov <denys.drozdov@toradex.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Tony Dinh <mibodhi@gmail.com>,
 Marek Vasut <marex@denx.de>, Judy Wang <wangjudy@microsoft.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andrew Scull <ascull@google.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, schspa <schspa@gmail.com>,
 Gary Bisson <gary.bisson@boundarydevices.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Max Merchel <Max.Merchel@tq-group.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 20/24] blk: Switch over to using uclass IDs
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

We currently have an if_type (interface type) and a uclass id. These are
closely related and we don't need to have both.

Drop the if_type values and use the uclass ones instead.

Maintain the existing, subtle, one-way conversion between UCLASS_USB and
UCLASS_MASS_STORAGE for now, and add a comment.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  4 +-
 board/toradex/common/tdx-cfg-block.c          |  4 +-
 cmd/bcb.c                                     |  4 +-
 cmd/ide.c                                     |  2 +-
 cmd/mmc.c                                     |  8 +--
 cmd/mvebu/bubt.c                              |  2 +-
 cmd/nvme.c                                    |  4 +-
 cmd/pvblock.c                                 |  2 +-
 cmd/sata.c                                    |  4 +-
 cmd/scsi.c                                    |  2 +-
 cmd/usb.c                                     |  2 +-
 cmd/virtio.c                                  |  2 +-
 common/spl/spl_sata.c                         |  2 +-
 common/spl/spl_usb.c                          |  2 +-
 common/usb_storage.c                          |  8 +--
 disk/part.c                                   | 52 +++++++--------
 doc/develop/uefi/uefi.rst                     |  2 +-
 drivers/ata/dwc_ahsata.c                      |  2 +-
 drivers/ata/fsl_sata.c                        |  2 +-
 drivers/ata/sata.c                            |  2 +-
 drivers/ata/sata_mv.c                         |  2 +-
 drivers/ata/sata_sil.c                        |  2 +-
 drivers/block/blk-uclass.c                    | 64 ++++++++++---------
 drivers/block/efi_blk.c                       |  2 +-
 drivers/block/ide.c                           |  8 +--
 drivers/block/sandbox.c                       | 12 ++--
 drivers/dfu/dfu_mmc.c                         |  6 +-
 drivers/mmc/mmc-uclass.c                      | 10 +--
 drivers/mmc/mmc_legacy.c                      |  6 +-
 drivers/mmc/mmc_write.c                       |  4 +-
 drivers/nvme/nvme.c                           |  2 +-
 drivers/scsi/scsi.c                           | 10 +--
 drivers/tee/optee/rpmb.c                      |  4 +-
 drivers/virtio/virtio_blk.c                   |  4 +-
 drivers/xen/pvblock.c                         |  6 +-
 env/mmc.c                                     |  4 +-
 include/blk.h                                 | 18 +-----
 include/mmc.h                                 |  2 +-
 lib/efi_driver/efi_block_device.c             |  4 +-
 lib/efi_loader/efi_disk.c                     |  4 +-
 test/dm/blk.c                                 | 24 +++----
 41 files changed, 151 insertions(+), 159 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index c391b6c7abb..a720d0ba717 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1823,7 +1823,7 @@ static int part_delete(struct stm32prog_data *data,
 		 * need to switch to associated hwpart 1 or 2
 		 */
 		if (part->part_id < 0)
-			if (blk_select_hwpart_devnum(IF_TYPE_MMC,
+			if (blk_select_hwpart_devnum(UCLASS_MMC,
 						     part->dev->dev_id,
 						     -part->part_id))
 				return -1;
@@ -1832,7 +1832,7 @@ static int part_delete(struct stm32prog_data *data,
 
 		/* return to user partition */
 		if (part->part_id < 0)
-			blk_select_hwpart_devnum(IF_TYPE_MMC,
+			blk_select_hwpart_devnum(UCLASS_MMC,
 						 part->dev->dev_id, 0);
 		if (blks != blks_size) {
 			ret = -1;
diff --git a/board/toradex/common/tdx-cfg-block.c b/board/toradex/common/tdx-cfg-block.c
index 22c67c6e388..11f4d5e14a8 100644
--- a/board/toradex/common/tdx-cfg-block.c
+++ b/board/toradex/common/tdx-cfg-block.c
@@ -211,7 +211,7 @@ static int tdx_cfg_block_mmc_storage(u8 *config_block, int write)
 		return -EINVAL;
 	}
 	if (part != mmc_get_blk_desc(mmc)->hwpart) {
-		if (blk_select_hwpart_devnum(IF_TYPE_MMC, dev, part)) {
+		if (blk_select_hwpart_devnum(UCLASS_MMC, dev, part)) {
 			puts("MMC partition switch failed\n");
 			ret = -ENODEV;
 			goto out;
@@ -239,7 +239,7 @@ static int tdx_cfg_block_mmc_storage(u8 *config_block, int write)
 
 out:
 	/* Switch back to regular eMMC user partition */
-	blk_select_hwpart_devnum(IF_TYPE_MMC, 0, 0);
+	blk_select_hwpart_devnum(UCLASS_MMC, 0, 0);
 
 	return ret;
 }
diff --git a/cmd/bcb.c b/cmd/bcb.c
index 1bbd1fae998..8b87aa062fe 100644
--- a/cmd/bcb.c
+++ b/cmd/bcb.c
@@ -122,7 +122,7 @@ static int __bcb_load(int devnum, const char *partp)
 	char *endp;
 	int part, ret;
 
-	desc = blk_get_devnum_by_type(IF_TYPE_MMC, devnum);
+	desc = blk_get_devnum_by_type(UCLASS_MMC, devnum);
 	if (!desc) {
 		ret = -ENODEV;
 		goto err_read_fail;
@@ -287,7 +287,7 @@ static int __bcb_store(void)
 	u64 cnt;
 	int ret;
 
-	desc = blk_get_devnum_by_type(IF_TYPE_MMC, bcb_dev);
+	desc = blk_get_devnum_by_type(UCLASS_MMC, bcb_dev);
 	if (!desc) {
 		ret = -ENODEV;
 		goto err;
diff --git a/cmd/ide.c b/cmd/ide.c
index b78c38e1590..6739f0b12d1 100644
--- a/cmd/ide.c
+++ b/cmd/ide.c
@@ -37,7 +37,7 @@ int do_ide(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 		}
 	}
 
-	return blk_common_cmd(argc, argv, IF_TYPE_IDE, &curr_device);
+	return blk_common_cmd(argc, argv, UCLASS_IDE, &curr_device);
 }
 
 int do_diskboot(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
diff --git a/cmd/mmc.c b/cmd/mmc.c
index 7bd4cd9e016..0f1f4e0a71d 100644
--- a/cmd/mmc.c
+++ b/cmd/mmc.c
@@ -331,13 +331,13 @@ static int do_mmcrpmb(struct cmd_tbl *cmdtp, int flag,
 #else
 	original_part = mmc_get_blk_desc(mmc)->hwpart;
 #endif
-	if (blk_select_hwpart_devnum(IF_TYPE_MMC, curr_device, MMC_PART_RPMB) !=
+	if (blk_select_hwpart_devnum(UCLASS_MMC, curr_device, MMC_PART_RPMB) !=
 	    0)
 		return CMD_RET_FAILURE;
 	ret = cp->cmd(cmdtp, flag, argc, argv);
 
 	/* Return to original partition */
-	if (blk_select_hwpart_devnum(IF_TYPE_MMC, curr_device, original_part) !=
+	if (blk_select_hwpart_devnum(UCLASS_MMC, curr_device, original_part) !=
 	    0)
 		return CMD_RET_FAILURE;
 	return ret;
@@ -530,7 +530,7 @@ static int do_mmc_part(struct cmd_tbl *cmdtp, int flag,
 	if (!mmc)
 		return CMD_RET_FAILURE;
 
-	mmc_dev = blk_get_devnum_by_type(IF_TYPE_MMC, curr_device);
+	mmc_dev = blk_get_devnum_by_type(UCLASS_MMC, curr_device);
 	if (mmc_dev != NULL && mmc_dev->type != DEV_TYPE_UNKNOWN) {
 		part_print(mmc_dev);
 		return CMD_RET_SUCCESS;
@@ -580,7 +580,7 @@ static int do_mmc_dev(struct cmd_tbl *cmdtp, int flag,
 	if (!mmc)
 		return CMD_RET_FAILURE;
 
-	ret = blk_select_hwpart_devnum(IF_TYPE_MMC, dev, part);
+	ret = blk_select_hwpart_devnum(UCLASS_MMC, dev, part);
 	printf("switch to partitions #%d, %s\n",
 	       part, (!ret) ? "OK" : "ERROR");
 	if (ret)
diff --git a/cmd/mvebu/bubt.c b/cmd/mvebu/bubt.c
index 2136af64163..825d4beb899 100644
--- a/cmd/mvebu/bubt.c
+++ b/cmd/mvebu/bubt.c
@@ -412,7 +412,7 @@ static size_t usb_read_file(const char *file_name)
 	}
 
 	/* Try to recognize storage devices immediately */
-	blk_first_device(IF_TYPE_USB, &dev);
+	blk_first_device(UCLASS_USB, &dev);
 	if (!dev) {
 		printf("Error: USB storage device not found\n");
 		return 0;
diff --git a/cmd/nvme.c b/cmd/nvme.c
index e715c570a38..09d5f438fb1 100644
--- a/cmd/nvme.c
+++ b/cmd/nvme.c
@@ -28,7 +28,7 @@ static int do_nvme(struct cmd_tbl *cmdtp, int flag, int argc,
 		if (strncmp(argv[1], "deta", 4) == 0) {
 			struct udevice *udev;
 
-			ret = blk_get_device(IF_TYPE_NVME, nvme_curr_dev,
+			ret = blk_get_device(UCLASS_NVME, nvme_curr_dev,
 					     &udev);
 			if (ret < 0)
 				return CMD_RET_FAILURE;
@@ -39,7 +39,7 @@ static int do_nvme(struct cmd_tbl *cmdtp, int flag, int argc,
 		}
 	}
 
-	return blk_common_cmd(argc, argv, IF_TYPE_NVME, &nvme_curr_dev);
+	return blk_common_cmd(argc, argv, UCLASS_NVME, &nvme_curr_dev);
 }
 
 U_BOOT_CMD(
diff --git a/cmd/pvblock.c b/cmd/pvblock.c
index 56ce8b18d51..1b604c37373 100644
--- a/cmd/pvblock.c
+++ b/cmd/pvblock.c
@@ -14,7 +14,7 @@ static int pvblock_curr_device;
 
 int do_pvblock(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 {
-	return blk_common_cmd(argc, argv, IF_TYPE_PVBLOCK,
+	return blk_common_cmd(argc, argv, UCLASS_PVBLOCK,
 			      &pvblock_curr_device);
 }
 
diff --git a/cmd/sata.c b/cmd/sata.c
index 76da1906b7f..9c9fe111d12 100644
--- a/cmd/sata.c
+++ b/cmd/sata.c
@@ -27,7 +27,7 @@ int sata_remove(int devnum)
 	struct udevice *dev;
 	int rc;
 
-	blk_unbind_all(IF_TYPE_SATA);
+	blk_unbind_all(UCLASS_AHCI);
 
 	rc = uclass_find_device(UCLASS_AHCI, devnum, &dev);
 	if (!rc && !dev)
@@ -111,7 +111,7 @@ static int do_sata(struct cmd_tbl *cmdtp, int flag, int argc,
 		sata_curr_device = 0;
 	}
 
-	return blk_common_cmd(argc, argv, IF_TYPE_SATA, &sata_curr_device);
+	return blk_common_cmd(argc, argv, UCLASS_AHCI, &sata_curr_device);
 }
 
 U_BOOT_CMD(
diff --git a/cmd/scsi.c b/cmd/scsi.c
index 5f710d28957..4549995ba73 100644
--- a/cmd/scsi.c
+++ b/cmd/scsi.c
@@ -50,7 +50,7 @@ static int do_scsi(struct cmd_tbl *cmdtp, int flag, int argc,
 		}
 	}
 
-	return blk_common_cmd(argc, argv, IF_TYPE_SCSI, &scsi_curr_dev);
+	return blk_common_cmd(argc, argv, UCLASS_SCSI, &scsi_curr_dev);
 }
 
 U_BOOT_CMD(
diff --git a/cmd/usb.c b/cmd/usb.c
index 3d873765250..2ba056982c3 100644
--- a/cmd/usb.c
+++ b/cmd/usb.c
@@ -719,7 +719,7 @@ static int do_usb(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 	if (strncmp(argv[1], "stor", 4) == 0)
 		return usb_stor_info();
 
-	return blk_common_cmd(argc, argv, IF_TYPE_USB, &usb_stor_curr_dev);
+	return blk_common_cmd(argc, argv, UCLASS_USB, &usb_stor_curr_dev);
 #else
 	return CMD_RET_USAGE;
 #endif /* CONFIG_USB_STORAGE */
diff --git a/cmd/virtio.c b/cmd/virtio.c
index ea3ed2e631e..ec87d4f02c9 100644
--- a/cmd/virtio.c
+++ b/cmd/virtio.c
@@ -40,7 +40,7 @@ static int do_virtio(struct cmd_tbl *cmdtp, int flag, int argc,
 		return CMD_RET_SUCCESS;
 	}
 
-	return blk_common_cmd(argc, argv, IF_TYPE_VIRTIO, &virtio_curr_dev);
+	return blk_common_cmd(argc, argv, UCLASS_VIRTIO, &virtio_curr_dev);
 }
 
 U_BOOT_CMD(
diff --git a/common/spl/spl_sata.c b/common/spl/spl_sata.c
index 1351d78612a..ea9f1756c0a 100644
--- a/common/spl/spl_sata.c
+++ b/common/spl/spl_sata.c
@@ -71,7 +71,7 @@ static int spl_sata_load_image(struct spl_image_info *spl_image,
 
 	/* try to recognize storage devices immediately */
 	scsi_scan(false);
-	stor_dev = blk_get_devnum_by_type(IF_TYPE_SCSI, 0);
+	stor_dev = blk_get_devnum_by_type(UCLASS_SCSI, 0);
 	if (!stor_dev)
 		return -ENODEV;
 
diff --git a/common/spl/spl_usb.c b/common/spl/spl_usb.c
index ccf01c8276b..63c00f872b6 100644
--- a/common/spl/spl_usb.c
+++ b/common/spl/spl_usb.c
@@ -41,7 +41,7 @@ int spl_usb_load(struct spl_image_info *spl_image,
 
 	/* try to recognize storage devices immediately */
 	usb_stor_curr_dev = usb_stor_scan(1);
-	stor_dev = blk_get_devnum_by_type(IF_TYPE_USB, usb_stor_curr_dev);
+	stor_dev = blk_get_devnum_by_type(UCLASS_USB, usb_stor_curr_dev);
 	if (!stor_dev)
 		return -ENODEV;
 
diff --git a/common/usb_storage.c b/common/usb_storage.c
index eaa31374ef7..7d420160cd5 100644
--- a/common/usb_storage.c
+++ b/common/usb_storage.c
@@ -144,7 +144,7 @@ int usb_stor_info(void)
 #if CONFIG_IS_ENABLED(BLK)
 	struct udevice *dev;
 
-	for (blk_first_device(IF_TYPE_USB, &dev);
+	for (blk_first_device(UCLASS_USB, &dev);
 	     dev;
 	     blk_next_device(&dev)) {
 		struct blk_desc *desc = dev_get_uclass_plat(dev);
@@ -219,7 +219,7 @@ static int usb_stor_probe_device(struct usb_device *udev)
 
 		snprintf(str, sizeof(str), "lun%d", lun);
 		ret = blk_create_devicef(udev->dev, "usb_storage_blk", str,
-					 IF_TYPE_USB, usb_max_devs, 512, 0,
+					 UCLASS_USB, usb_max_devs, 512, 0,
 					 &dev);
 		if (ret) {
 			debug("Cannot bind driver\n");
@@ -279,7 +279,7 @@ static int usb_stor_probe_device(struct usb_device *udev)
 
 		blkdev = &usb_dev_desc[usb_max_devs];
 		memset(blkdev, '\0', sizeof(struct blk_desc));
-		blkdev->if_type = IF_TYPE_USB;
+		blkdev->if_type = UCLASS_USB;
 		blkdev->devnum = usb_max_devs;
 		blkdev->part_type = PART_TYPE_UNKNOWN;
 		blkdev->target = 0xff;
@@ -1578,7 +1578,7 @@ U_BOOT_DRIVER(usb_storage_blk) = {
 #else
 U_BOOT_LEGACY_BLK(usb) = {
 	.if_typename	= "usb",
-	.if_type	= IF_TYPE_USB,
+	.if_type	= UCLASS_USB,
 	.max_devs	= USB_MAX_STOR_DEV,
 	.desc		= usb_dev_desc,
 };
diff --git a/disk/part.c b/disk/part.c
index 2bcc6f4f403..75aff7eba5a 100644
--- a/disk/part.c
+++ b/disk/part.c
@@ -121,34 +121,34 @@ void dev_print (struct blk_desc *dev_desc)
 	}
 
 	switch (dev_desc->if_type) {
-	case IF_TYPE_SCSI:
+	case UCLASS_SCSI:
 		printf ("(%d:%d) Vendor: %s Prod.: %s Rev: %s\n",
 			dev_desc->target,dev_desc->lun,
 			dev_desc->vendor,
 			dev_desc->product,
 			dev_desc->revision);
 		break;
-	case IF_TYPE_IDE:
-	case IF_TYPE_SATA:
+	case UCLASS_IDE:
+	case UCLASS_AHCI:
 		printf ("Model: %s Firm: %s Ser#: %s\n",
 			dev_desc->vendor,
 			dev_desc->revision,
 			dev_desc->product);
 		break;
-	case IF_TYPE_MMC:
-	case IF_TYPE_USB:
-	case IF_TYPE_NVME:
-	case IF_TYPE_PVBLOCK:
-	case IF_TYPE_HOST:
+	case UCLASS_MMC:
+	case UCLASS_USB:
+	case UCLASS_NVME:
+	case UCLASS_PVBLOCK:
+	case UCLASS_ROOT:
 		printf ("Vendor: %s Rev: %s Prod: %s\n",
 			dev_desc->vendor,
 			dev_desc->revision,
 			dev_desc->product);
 		break;
-	case IF_TYPE_VIRTIO:
+	case UCLASS_VIRTIO:
 		printf("%s VirtIO Block Device\n", dev_desc->vendor);
 		break;
-	case IF_TYPE_UNKNOWN:
+	case UCLASS_INVALID:
 		puts("device type unknown\n");
 		return;
 	default:
@@ -246,34 +246,34 @@ static void print_part_header(const char *type, struct blk_desc *dev_desc)
 	CONFIG_IS_ENABLED(EFI_PARTITION)
 	puts ("\nPartition Map for ");
 	switch (dev_desc->if_type) {
-	case IF_TYPE_IDE:
+	case UCLASS_IDE:
 		puts ("IDE");
 		break;
-	case IF_TYPE_SATA:
+	case UCLASS_AHCI:
 		puts ("SATA");
 		break;
-	case IF_TYPE_SCSI:
+	case UCLASS_SCSI:
 		puts ("SCSI");
 		break;
-	case IF_TYPE_USB:
+	case UCLASS_USB:
 		puts ("USB");
 		break;
-	case IF_TYPE_MMC:
+	case UCLASS_MMC:
 		puts ("MMC");
 		break;
-	case IF_TYPE_HOST:
+	case UCLASS_ROOT:
 		puts ("HOST");
 		break;
-	case IF_TYPE_NVME:
+	case UCLASS_NVME:
 		puts ("NVMe");
 		break;
-	case IF_TYPE_PVBLOCK:
+	case UCLASS_PVBLOCK:
 		puts("PV BLOCK");
 		break;
-	case IF_TYPE_VIRTIO:
+	case UCLASS_VIRTIO:
 		puts("VirtIO");
 		break;
-	case IF_TYPE_EFI_MEDIA:
+	case UCLASS_EFI_MEDIA:
 		puts("EFI");
 		break;
 	default:
@@ -405,7 +405,7 @@ int blk_get_device_by_str(const char *ifname, const char *dev_hwpart_str,
 		 * Always should be done, otherwise hw partition 0 will return
 		 * stale data after displaying a non-zero hw partition.
 		 */
-		if ((*dev_desc)->if_type == IF_TYPE_MMC)
+		if ((*dev_desc)->if_type == UCLASS_MMC)
 			part_init(*dev_desc);
 	}
 
@@ -760,17 +760,17 @@ void part_set_generic_name(const struct blk_desc *dev_desc,
 	char *devtype;
 
 	switch (dev_desc->if_type) {
-	case IF_TYPE_IDE:
-	case IF_TYPE_SATA:
+	case UCLASS_IDE:
+	case UCLASS_AHCI:
 		devtype = "hd";
 		break;
-	case IF_TYPE_SCSI:
+	case UCLASS_SCSI:
 		devtype = "sd";
 		break;
-	case IF_TYPE_USB:
+	case UCLASS_USB:
 		devtype = "usbd";
 		break;
-	case IF_TYPE_MMC:
+	case UCLASS_MMC:
 		devtype = "mmcsd";
 		break;
 	default:
diff --git a/doc/develop/uefi/uefi.rst b/doc/develop/uefi/uefi.rst
index 941e427093f..cd847069530 100644
--- a/doc/develop/uefi/uefi.rst
+++ b/doc/develop/uefi/uefi.rst
@@ -748,7 +748,7 @@ UEFI block IO driver
 The UEFI block IO driver supports devices exposing the EFI_BLOCK_IO_PROTOCOL.
 
 When connected it creates a new U-Boot block IO device with interface type
-IF_TYPE_EFI_LOADER, adds child controllers mapping the partitions, and installs
+UCLASS_EFI_LOADER, adds child controllers mapping the partitions, and installs
 the EFI_SIMPLE_FILE_SYSTEM_PROTOCOL on these. This can be used together with the
 software iPXE to boot from iSCSI network drives [4].
 
diff --git a/drivers/ata/dwc_ahsata.c b/drivers/ata/dwc_ahsata.c
index 1a2c3c2fe70..167b5a395f5 100644
--- a/drivers/ata/dwc_ahsata.c
+++ b/drivers/ata/dwc_ahsata.c
@@ -880,7 +880,7 @@ int dwc_ahsata_scan(struct udevice *dev)
 	device_find_first_child(dev, &blk);
 	if (!blk) {
 		ret = blk_create_devicef(dev, "dwc_ahsata_blk", "blk",
-					 IF_TYPE_SATA, -1, 512, 0, &blk);
+					 UCLASS_AHCI, -1, 512, 0, &blk);
 		if (ret) {
 			debug("Can't create device\n");
 			return ret;
diff --git a/drivers/ata/fsl_sata.c b/drivers/ata/fsl_sata.c
index 6db4247368e..972101b29ce 100644
--- a/drivers/ata/fsl_sata.c
+++ b/drivers/ata/fsl_sata.c
@@ -888,7 +888,7 @@ static int fsl_ata_probe(struct udevice *dev)
 	for (i = 0; i < nr_ports; i++) {
 		snprintf(sata_name, sizeof(sata_name), "fsl_sata%d", i);
 		ret = blk_create_devicef(dev, "sata_fsl_blk", sata_name,
-					 IF_TYPE_SATA, -1, 512, 0, &blk);
+					 UCLASS_AHCI, -1, 512, 0, &blk);
 		if (ret) {
 			debug("Can't create device\n");
 			return ret;
diff --git a/drivers/ata/sata.c b/drivers/ata/sata.c
index 0e6c8cdd422..604c721cfdc 100644
--- a/drivers/ata/sata.c
+++ b/drivers/ata/sata.c
@@ -79,7 +79,7 @@ int __sata_initialize(void)
 
 	for (i = 0; i < CONFIG_SYS_SATA_MAX_DEVICE; i++) {
 		memset(&sata_dev_desc[i], 0, sizeof(struct blk_desc));
-		sata_dev_desc[i].if_type = IF_TYPE_SATA;
+		sata_dev_desc[i].if_type = UCLASS_AHCI;
 		sata_dev_desc[i].devnum = i;
 		sata_dev_desc[i].part_type = PART_TYPE_UNKNOWN;
 		sata_dev_desc[i].type = DEV_TYPE_HARDDISK;
diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index a187796dfcd..18c7a66db1b 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -1076,7 +1076,7 @@ static int sata_mv_probe(struct udevice *dev)
 
 	for (i = 0; i < nr_ports; i++) {
 		ret = blk_create_devicef(dev, "sata_mv_blk", "blk",
-					 IF_TYPE_SATA, -1, 512, 0, &blk);
+					 UCLASS_AHCI, -1, 512, 0, &blk);
 		if (ret) {
 			debug("Can't create device\n");
 			continue;
diff --git a/drivers/ata/sata_sil.c b/drivers/ata/sata_sil.c
index 70651545722..b5e150d568b 100644
--- a/drivers/ata/sata_sil.c
+++ b/drivers/ata/sata_sil.c
@@ -730,7 +730,7 @@ static int sil_pci_probe(struct udevice *dev)
 	for (i = sata_info.portbase; i < sata_info.maxport; i++) {
 		snprintf(sata_name, sizeof(sata_name), "sil_sata%d", i);
 		ret = blk_create_devicef(dev, "sata_sil_blk", sata_name,
-					 IF_TYPE_SATA, -1, 512, 0, &blk);
+					 UCLASS_AHCI, -1, 512, 0, &blk);
 		if (ret) {
 			debug("Can't create device\n");
 			return ret;
diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
index a68158c3f25..436af764f91 100644
--- a/drivers/block/blk-uclass.c
+++ b/drivers/block/blk-uclass.c
@@ -21,31 +21,17 @@ static struct {
 	enum uclass_id id;
 	const char *name;
 } if_typename_str[] = {
-	{ IF_TYPE_IDE, "ide" },
-	{ IF_TYPE_SCSI, "scsi" },
-	{ IF_TYPE_USB, "usb" },
-	{ IF_TYPE_MMC,  "mmc" },
-	{ IF_TYPE_SCSI, "sata" },
-	{ IF_TYPE_HOST, "host" },
-	{ IF_TYPE_NVME, "nvme" },
-	{ IF_TYPE_EFI_MEDIA, "efi" },
-	{ IF_TYPE_EFI_LOADER, "efiloader" },
-	{ IF_TYPE_VIRTIO, "virtio" },
-	{ IF_TYPE_PVBLOCK, "pvblock" },
-};
-
-static enum uclass_id if_type_uclass_id[IF_TYPE_COUNT] = {
-	[IF_TYPE_IDE]		= UCLASS_IDE,
-	[IF_TYPE_SCSI]		= UCLASS_SCSI,
-	[IF_TYPE_USB]		= UCLASS_MASS_STORAGE,
-	[IF_TYPE_MMC]		= UCLASS_MMC,
-	[IF_TYPE_SATA]		= UCLASS_AHCI,
-	[IF_TYPE_HOST]		= UCLASS_ROOT,
-	[IF_TYPE_NVME]		= UCLASS_NVME,
-	[IF_TYPE_EFI_MEDIA]	= UCLASS_EFI_MEDIA,
-	[IF_TYPE_EFI_LOADER]	= UCLASS_EFI_LOADER,
-	[IF_TYPE_VIRTIO]	= UCLASS_VIRTIO,
-	[IF_TYPE_PVBLOCK]	= UCLASS_PVBLOCK,
+	{ UCLASS_IDE, "ide" },
+	{ UCLASS_SCSI, "scsi" },
+	{ UCLASS_USB, "usb" },
+	{ UCLASS_MMC,  "mmc" },
+	{ UCLASS_AHCI, "sata" },
+	{ UCLASS_ROOT, "host" },
+	{ UCLASS_NVME, "nvme" },
+	{ UCLASS_EFI_MEDIA, "efi" },
+	{ UCLASS_EFI_LOADER, "efiloader" },
+	{ UCLASS_VIRTIO, "virtio" },
+	{ UCLASS_PVBLOCK, "pvblock" },
 };
 
 static enum if_type if_typename_to_iftype(const char *if_typename)
@@ -57,12 +43,32 @@ static enum if_type if_typename_to_iftype(const char *if_typename)
 			return if_typename_str[i].id;
 	}
 
-	return IF_TYPE_UNKNOWN;
+	return UCLASS_INVALID;
 }
 
 static enum uclass_id if_type_to_uclass_id(enum if_type if_type)
 {
-	return if_type_uclass_id[if_type];
+	/*
+	 * This strange adjustment is used because we use UCLASS_MASS_STORAGE
+	 * for USB storage devices, so need to return this as the uclass to
+	 * use for USB. In fact USB_UCLASS is for USB controllers, not
+	 * peripherals.
+	 *
+	 * The name of the UCLASS_MASS_STORAGE uclass driver is
+	 * "usb_mass_storage", but we want to use "usb" in things like the
+	 * 'part list' command and when showing interfaces.
+	 *
+	 * So for now we have this one-way conversion.
+	 *
+	 * The fix for this is possibly to:
+	 *    - rename UCLASS_MASS_STORAGE name to "usb"
+	 *    - rename UCLASS_USB name to "usb_ctlr"
+	 *    - use UCLASS_MASS_STORAGE instead of UCLASS_USB in if_typename_str
+	 */
+	if (if_type == UCLASS_USB)
+		return UCLASS_MASS_STORAGE;
+
+	return if_type;
 }
 
 const char *blk_get_if_type_name(enum if_type if_type)
@@ -70,7 +76,7 @@ const char *blk_get_if_type_name(enum if_type if_type)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(if_typename_str); i++) {
-		if ((int)if_typename_str[i].id == if_type)
+		if (if_typename_str[i].id == if_type)
 			return if_typename_str[i].name;
 	}
 
@@ -105,7 +111,7 @@ struct blk_desc *blk_get_devnum_by_typename(const char *if_typename, int devnum)
 	int ret;
 
 	type = if_typename_to_iftype(if_typename);
-	if (type == IF_TYPE_UNKNOWN) {
+	if (type == UCLASS_INVALID) {
 		debug("%s: Unknown interface type '%s'\n", __func__,
 		      if_typename);
 		return NULL;
diff --git a/drivers/block/efi_blk.c b/drivers/block/efi_blk.c
index 9d25ecbf37f..917a19f6025 100644
--- a/drivers/block/efi_blk.c
+++ b/drivers/block/efi_blk.c
@@ -94,7 +94,7 @@ static int efi_media_bind(struct udevice *dev)
 	struct udevice *blk;
 	int ret;
 
-	ret = blk_create_devicef(dev, "efi_block", "blk", IF_TYPE_EFI_MEDIA,
+	ret = blk_create_devicef(dev, "efi_block", "blk", UCLASS_EFI_MEDIA,
 				 dev_seq(dev), plat->blkio->media->block_size,
 				 plat->blkio->media->last_block, &blk);
 	if (ret) {
diff --git a/drivers/block/ide.c b/drivers/block/ide.c
index 6bc48e3402e..73da29ad552 100644
--- a/drivers/block/ide.c
+++ b/drivers/block/ide.c
@@ -537,7 +537,7 @@ static void ide_ident(struct blk_desc *dev_desc)
 	/* Select device
 	 */
 	ide_outb(device, ATA_DEV_HD, ATA_LBA | ATA_DEVICE(device));
-	dev_desc->if_type = IF_TYPE_IDE;
+	dev_desc->if_type = UCLASS_IDE;
 #ifdef CONFIG_ATAPI
 
 	retries = 0;
@@ -752,7 +752,7 @@ void ide_init(void)
 
 	for (i = 0; i < CONFIG_SYS_IDE_MAXDEVICE; ++i) {
 		ide_dev_desc[i].type = DEV_TYPE_UNKNOWN;
-		ide_dev_desc[i].if_type = IF_TYPE_IDE;
+		ide_dev_desc[i].if_type = UCLASS_IDE;
 		ide_dev_desc[i].devnum = i;
 		ide_dev_desc[i].part_type = PART_TYPE_UNKNOWN;
 		ide_dev_desc[i].blksz = 0;
@@ -1110,7 +1110,7 @@ static int ide_probe(struct udevice *udev)
 			if (!blksz)
 				continue;
 			ret = blk_create_devicef(udev, "ide_blk", name,
-						 IF_TYPE_IDE, i,
+						 UCLASS_IDE, i,
 						 blksz, size, &blk_dev);
 			if (ret)
 				return ret;
@@ -1144,7 +1144,7 @@ UCLASS_DRIVER(ide) = {
 #else
 U_BOOT_LEGACY_BLK(ide) = {
 	.if_typename	= "ide",
-	.if_type	= IF_TYPE_IDE,
+	.if_type	= UCLASS_IDE,
 	.max_devs	= CONFIG_SYS_IDE_MAXDEVICE,
 	.desc		= ide_dev_desc,
 };
diff --git a/drivers/block/sandbox.c b/drivers/block/sandbox.c
index 1388498a1d3..2de12e0a93e 100644
--- a/drivers/block/sandbox.c
+++ b/drivers/block/sandbox.c
@@ -98,7 +98,7 @@ int host_dev_bind(int devnum, char *filename, bool removable)
 	int ret, fd;
 
 	/* Remove and unbind the old device, if any */
-	ret = blk_get_device(IF_TYPE_HOST, devnum, &dev);
+	ret = blk_get_device(UCLASS_ROOT, devnum, &dev);
 	if (ret == 0) {
 		ret = device_remove(dev, DM_REMOVE_NORMAL);
 		if (ret)
@@ -135,7 +135,7 @@ int host_dev_bind(int devnum, char *filename, bool removable)
 		}
 	}
 	ret = blk_create_device(gd->dm_root, "sandbox_host_blk", str,
-				IF_TYPE_HOST, devnum, 512,
+				UCLASS_ROOT, devnum, 512,
 				os_lseek(fd, 0, OS_SEEK_END) / 512, &dev);
 	if (ret)
 		goto err_file;
@@ -150,7 +150,7 @@ int host_dev_bind(int devnum, char *filename, bool removable)
 		goto err_file;
 	}
 
-	desc = blk_get_devnum_by_type(IF_TYPE_HOST, devnum);
+	desc = blk_get_devnum_by_type(UCLASS_ROOT, devnum);
 	desc->removable = removable;
 	snprintf(desc->vendor, BLK_VEN_SIZE, "U-Boot");
 	snprintf(desc->product, BLK_PRD_SIZE, "hostfile");
@@ -192,7 +192,7 @@ int host_dev_bind(int dev, char *filename, bool removable)
 	}
 
 	struct blk_desc *blk_dev = &host_dev->blk_dev;
-	blk_dev->if_type = IF_TYPE_HOST;
+	blk_dev->if_type = UCLASS_ROOT;
 	blk_dev->priv = host_dev;
 	blk_dev->blksz = 512;
 	blk_dev->lba = os_lseek(host_dev->fd, 0, OS_SEEK_END) / blk_dev->blksz;
@@ -216,7 +216,7 @@ int host_get_dev_err(int devnum, struct blk_desc **blk_devp)
 	struct udevice *dev;
 	int ret;
 
-	ret = blk_get_device(IF_TYPE_HOST, devnum, &dev);
+	ret = blk_get_device(UCLASS_ROOT, devnum, &dev);
 	if (ret)
 		return ret;
 	*blk_devp = dev_get_uclass_plat(dev);
@@ -263,7 +263,7 @@ U_BOOT_DRIVER(sandbox_host_blk) = {
 #else
 U_BOOT_LEGACY_BLK(sandbox_host) = {
 	.if_typename	= "host",
-	.if_type	= IF_TYPE_HOST,
+	.if_type	= UCLASS_ROOT,
 	.max_devs	= SANDBOX_HOST_MAX_DEVICES,
 	.get_dev	= host_get_dev_err,
 };
diff --git a/drivers/dfu/dfu_mmc.c b/drivers/dfu/dfu_mmc.c
index a91da972d46..f5832083ba1 100644
--- a/drivers/dfu/dfu_mmc.c
+++ b/drivers/dfu/dfu_mmc.c
@@ -52,7 +52,7 @@ static int mmc_block_op(enum dfu_op op, struct dfu_entity *dfu,
 
 	if (dfu->data.mmc.hw_partition >= 0) {
 		part_num_bkp = mmc_get_blk_desc(mmc)->hwpart;
-		ret = blk_select_hwpart_devnum(IF_TYPE_MMC,
+		ret = blk_select_hwpart_devnum(UCLASS_MMC,
 					       dfu->data.mmc.dev_num,
 					       dfu->data.mmc.hw_partition);
 		if (ret)
@@ -77,14 +77,14 @@ static int mmc_block_op(enum dfu_op op, struct dfu_entity *dfu,
 	if (n != blk_count) {
 		pr_err("MMC operation failed");
 		if (dfu->data.mmc.hw_partition >= 0)
-			blk_select_hwpart_devnum(IF_TYPE_MMC,
+			blk_select_hwpart_devnum(UCLASS_MMC,
 						 dfu->data.mmc.dev_num,
 						 part_num_bkp);
 		return -EIO;
 	}
 
 	if (dfu->data.mmc.hw_partition >= 0) {
-		ret = blk_select_hwpart_devnum(IF_TYPE_MMC,
+		ret = blk_select_hwpart_devnum(UCLASS_MMC,
 					       dfu->data.mmc.dev_num,
 					       part_num_bkp);
 		if (ret)
diff --git a/drivers/mmc/mmc-uclass.c b/drivers/mmc/mmc-uclass.c
index 688bdc06d42..b1bd4ae1bc8 100644
--- a/drivers/mmc/mmc-uclass.c
+++ b/drivers/mmc/mmc-uclass.c
@@ -290,7 +290,7 @@ struct mmc *find_mmc_device(int dev_num)
 	struct udevice *dev, *mmc_dev;
 	int ret;
 
-	ret = blk_find_device(IF_TYPE_MMC, dev_num, &dev);
+	ret = blk_find_device(UCLASS_MMC, dev_num, &dev);
 
 	if (ret) {
 #if !defined(CONFIG_SPL_BUILD) || defined(CONFIG_SPL_LIBCOMMON_SUPPORT)
@@ -308,12 +308,12 @@ struct mmc *find_mmc_device(int dev_num)
 
 int get_mmc_num(void)
 {
-	return max((blk_find_max_devnum(IF_TYPE_MMC) + 1), 0);
+	return max((blk_find_max_devnum(UCLASS_MMC) + 1), 0);
 }
 
 int mmc_get_next_devnum(void)
 {
-	return blk_find_max_devnum(IF_TYPE_MMC);
+	return blk_find_max_devnum(UCLASS_MMC);
 }
 
 int mmc_get_blk(struct udevice *dev, struct udevice **blkp)
@@ -411,8 +411,8 @@ int mmc_bind(struct udevice *dev, struct mmc *mmc, const struct mmc_config *cfg)
 	/* Use the fixed index with aliases node's index */
 	debug("%s: alias devnum=%d\n", __func__, dev_seq(dev));
 
-	ret = blk_create_devicef(dev, "mmc_blk", "blk", IF_TYPE_MMC,
-			dev_seq(dev), 512, 0, &bdev);
+	ret = blk_create_devicef(dev, "mmc_blk", "blk", UCLASS_MMC,
+				 dev_seq(dev), 512, 0, &bdev);
 	if (ret) {
 		debug("Cannot create block device\n");
 		return ret;
diff --git a/drivers/mmc/mmc_legacy.c b/drivers/mmc/mmc_legacy.c
index a05da6c2e88..4e0891e5dfe 100644
--- a/drivers/mmc/mmc_legacy.c
+++ b/drivers/mmc/mmc_legacy.c
@@ -132,7 +132,7 @@ static struct mmc mmc_static = {
 	.dsr_imp		= 0,
 	.dsr			= 0xffffffff,
 	.block_dev = {
-		.if_type	= IF_TYPE_MMC,
+		.if_type	= UCLASS_MMC,
 		.removable	= 1,
 		.devnum		= 0,
 		.block_read	= mmc_bread,
@@ -194,7 +194,7 @@ struct mmc *mmc_create(const struct mmc_config *cfg, void *priv)
 	mmc->dsr = 0xffffffff;
 	/* Setup the universal parts of the block interface just once */
 	bdesc = mmc_get_blk_desc(mmc);
-	bdesc->if_type = IF_TYPE_MMC;
+	bdesc->if_type = UCLASS_MMC;
 	bdesc->removable = 1;
 	bdesc->devnum = mmc_get_next_devnum();
 	bdesc->block_read = mmc_bread;
@@ -254,7 +254,7 @@ static int mmc_get_dev(int dev, struct blk_desc **descp)
 
 U_BOOT_LEGACY_BLK(mmc) = {
 	.if_typename	= "mmc",
-	.if_type	= IF_TYPE_MMC,
+	.if_type	= UCLASS_MMC,
 	.max_devs	= -1,
 	.get_dev	= mmc_get_dev,
 	.select_hwpart	= mmc_select_hwpartp,
diff --git a/drivers/mmc/mmc_write.c b/drivers/mmc/mmc_write.c
index eab94c7b607..5b7aeeb0121 100644
--- a/drivers/mmc/mmc_write.c
+++ b/drivers/mmc/mmc_write.c
@@ -85,7 +85,7 @@ ulong mmc_berase(struct blk_desc *block_dev, lbaint_t start, lbaint_t blkcnt)
 	if (!mmc)
 		return -1;
 
-	err = blk_select_hwpart_devnum(IF_TYPE_MMC, dev_num,
+	err = blk_select_hwpart_devnum(UCLASS_MMC, dev_num,
 				       block_dev->hwpart);
 	if (err < 0)
 		return -1;
@@ -203,7 +203,7 @@ ulong mmc_bwrite(struct blk_desc *block_dev, lbaint_t start, lbaint_t blkcnt,
 	if (!mmc)
 		return 0;
 
-	err = blk_select_hwpart_devnum(IF_TYPE_MMC, dev_num, block_dev->hwpart);
+	err = blk_select_hwpart_devnum(UCLASS_MMC, dev_num, block_dev->hwpart);
 	if (err < 0)
 		return 0;
 
diff --git a/drivers/nvme/nvme.c b/drivers/nvme/nvme.c
index a305305885e..f92509deb92 100644
--- a/drivers/nvme/nvme.c
+++ b/drivers/nvme/nvme.c
@@ -880,7 +880,7 @@ int nvme_init(struct udevice *udev)
 		sprintf(name, "blk#%d", i);
 
 		/* The real blksz and size will be set by nvme_blk_probe() */
-		ret = blk_create_devicef(udev, "nvme-blk", name, IF_TYPE_NVME,
+		ret = blk_create_devicef(udev, "nvme-blk", name, UCLASS_NVME,
 					 -1, 512, 0, &ns_udev);
 		if (ret)
 			goto free_id;
diff --git a/drivers/scsi/scsi.c b/drivers/scsi/scsi.c
index 78d729d809d..99be5aef877 100644
--- a/drivers/scsi/scsi.c
+++ b/drivers/scsi/scsi.c
@@ -456,7 +456,7 @@ static void scsi_init_dev_desc(struct blk_desc *dev_desc, int devnum)
 {
 	dev_desc->lba = 0;
 	dev_desc->blksz = 0;
-	dev_desc->if_type = IF_TYPE_SCSI;
+	dev_desc->if_type = UCLASS_SCSI;
 	dev_desc->devnum = devnum;
 	dev_desc->part_type = PART_TYPE_UNKNOWN;
 
@@ -574,8 +574,8 @@ static int do_scsi_scan_one(struct udevice *dev, int id, int lun, bool verbose)
 	* block devices created
 	*/
 	snprintf(str, sizeof(str), "id%dlun%d", id, lun);
-	ret = blk_create_devicef(dev, "scsi_blk", str, IF_TYPE_SCSI, -1,
-			bd.blksz, bd.lba, &bdev);
+	ret = blk_create_devicef(dev, "scsi_blk", str, UCLASS_SCSI, -1,
+				 bd.blksz, bd.lba, &bdev);
 	if (ret) {
 		debug("Can't create device\n");
 		return ret;
@@ -638,7 +638,7 @@ int scsi_scan(bool verbose)
 	if (verbose)
 		printf("scanning bus for devices...\n");
 
-	blk_unbind_all(IF_TYPE_SCSI);
+	blk_unbind_all(UCLASS_SCSI);
 
 	ret = uclass_get(UCLASS_SCSI, &uc);
 	if (ret)
@@ -707,7 +707,7 @@ U_BOOT_DRIVER(scsi_blk) = {
 #else
 U_BOOT_LEGACY_BLK(scsi) = {
 	.if_typename	= "scsi",
-	.if_type	= IF_TYPE_SCSI,
+	.if_type	= UCLASS_SCSI,
 	.max_devs	= SCSI_MAX_DEVICE,
 	.desc		= scsi_dev_desc,
 };
diff --git a/drivers/tee/optee/rpmb.c b/drivers/tee/optee/rpmb.c
index cf5e0a08e61..5bc13757ea8 100644
--- a/drivers/tee/optee/rpmb.c
+++ b/drivers/tee/optee/rpmb.c
@@ -48,7 +48,7 @@ static void release_mmc(struct optee_private *priv)
 	if (!priv->rpmb_mmc)
 		return;
 
-	rc = blk_select_hwpart_devnum(IF_TYPE_MMC, priv->rpmb_dev_id,
+	rc = blk_select_hwpart_devnum(UCLASS_MMC, priv->rpmb_dev_id,
 				      priv->rpmb_original_part);
 	if (rc)
 		debug("%s: blk_select_hwpart_devnum() failed: %d\n",
@@ -88,7 +88,7 @@ static struct mmc *get_mmc(struct optee_private *priv, int dev_id)
 
 	priv->rpmb_original_part = mmc_get_blk_desc(mmc)->hwpart;
 
-	rc = blk_select_hwpart_devnum(IF_TYPE_MMC, dev_id, MMC_PART_RPMB);
+	rc = blk_select_hwpart_devnum(UCLASS_MMC, dev_id, MMC_PART_RPMB);
 	if (rc) {
 		debug("Device id %d: cannot select RPMB partition: %d\n",
 		      dev_id, rc);
diff --git a/drivers/virtio/virtio_blk.c b/drivers/virtio/virtio_blk.c
index 3ff74f4a975..9710b79117c 100644
--- a/drivers/virtio/virtio_blk.c
+++ b/drivers/virtio/virtio_blk.c
@@ -75,14 +75,14 @@ static int virtio_blk_bind(struct udevice *dev)
 	struct blk_desc *desc = dev_get_uclass_plat(dev);
 	int devnum;
 
-	desc->if_type = IF_TYPE_VIRTIO;
+	desc->if_type = UCLASS_VIRTIO;
 	/*
 	 * Initialize the devnum to -ENODEV. This is to make sure that
 	 * blk_next_free_devnum() works as expected, since the default
 	 * value 0 is a valid devnum.
 	 */
 	desc->devnum = -ENODEV;
-	devnum = blk_next_free_devnum(IF_TYPE_VIRTIO);
+	devnum = blk_next_free_devnum(UCLASS_VIRTIO);
 	if (devnum < 0)
 		return devnum;
 	desc->devnum = devnum;
diff --git a/drivers/xen/pvblock.c b/drivers/xen/pvblock.c
index c25c3ea4fff..1090e528d02 100644
--- a/drivers/xen/pvblock.c
+++ b/drivers/xen/pvblock.c
@@ -665,14 +665,14 @@ static int pvblock_blk_bind(struct udevice *udev)
 	struct blk_desc *desc = dev_get_uclass_plat(udev);
 	int devnum;
 
-	desc->if_type = IF_TYPE_PVBLOCK;
+	desc->if_type = UCLASS_PVBLOCK;
 	/*
 	 * Initialize the devnum to -ENODEV. This is to make sure that
 	 * blk_next_free_devnum() works as expected, since the default
 	 * value 0 is a valid devnum.
 	 */
 	desc->devnum = -ENODEV;
-	devnum = blk_next_free_devnum(IF_TYPE_PVBLOCK);
+	devnum = blk_next_free_devnum(UCLASS_PVBLOCK);
 	if (devnum < 0)
 		return devnum;
 	desc->devnum = devnum;
@@ -804,7 +804,7 @@ static void print_pvblock_devices(void)
 	const char *class_name;
 
 	class_name = uclass_get_name(UCLASS_PVBLOCK);
-	for (blk_first_device(IF_TYPE_PVBLOCK, &udev); udev;
+	for (blk_first_device(UCLASS_PVBLOCK, &udev); udev;
 	     blk_next_device(&udev), first = false) {
 		struct blk_desc *desc = dev_get_uclass_plat(udev);
 
diff --git a/env/mmc.c b/env/mmc.c
index 0c498d9a46b..c28f4c6c6dc 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -143,7 +143,7 @@ static int mmc_set_env_part(struct mmc *mmc, uint part)
 	int dev = mmc_get_env_dev();
 	int ret = 0;
 
-	ret = blk_select_hwpart_devnum(IF_TYPE_MMC, dev, part);
+	ret = blk_select_hwpart_devnum(UCLASS_MMC, dev, part);
 	if (ret)
 		puts("MMC partition switch failed\n");
 
@@ -179,7 +179,7 @@ static void fini_mmc_for_env(struct mmc *mmc)
 #ifdef CONFIG_SYS_MMC_ENV_PART
 	int dev = mmc_get_env_dev();
 
-	blk_select_hwpart_devnum(IF_TYPE_MMC, dev, env_mmc_orig_hwpart);
+	blk_select_hwpart_devnum(UCLASS_MMC, dev, env_mmc_orig_hwpart);
 #endif
 }
 
diff --git a/include/blk.h b/include/blk.h
index cc30e3861fa..548cd09d6bb 100644
--- a/include/blk.h
+++ b/include/blk.h
@@ -7,6 +7,7 @@
 #ifndef BLK_H
 #define BLK_H
 
+#include <dm/uclass-id.h>
 #include <efi.h>
 
 #ifdef CONFIG_SYS_64BIT_LBA
@@ -27,22 +28,7 @@ static inline bool blk_enabled(void)
 }
 
 /* Interface types: */
-enum if_type {
-	IF_TYPE_UNKNOWN = 0,
-	IF_TYPE_IDE,
-	IF_TYPE_SCSI,
-	IF_TYPE_USB,
-	IF_TYPE_MMC,
-	IF_TYPE_SATA,
-	IF_TYPE_HOST,
-	IF_TYPE_NVME,
-	IF_TYPE_EFI_LOADER,
-	IF_TYPE_PVBLOCK,
-	IF_TYPE_VIRTIO,
-	IF_TYPE_EFI_MEDIA,
-
-	IF_TYPE_COUNT,			/* Number of interface types */
-};
+#define if_type uclass_id
 
 #define BLK_VEN_SIZE		40
 #define BLK_PRD_SIZE		20
diff --git a/include/mmc.h b/include/mmc.h
index f519d869725..027e8bcc73a 100644
--- a/include/mmc.h
+++ b/include/mmc.h
@@ -767,7 +767,7 @@ struct mmc *mmc_create(const struct mmc_config *cfg, void *priv);
 /**
  * mmc_bind() - Set up a new MMC device ready for probing
  *
- * A child block device is bound with the IF_TYPE_MMC interface type. This
+ * A child block device is bound with the UCLASS_MMC interface type. This
  * allows the device to be used with CONFIG_BLK
  *
  * @dev:	MMC device to set up
diff --git a/lib/efi_driver/efi_block_device.c b/lib/efi_driver/efi_block_device.c
index 5baa6f87a37..6737350b02e 100644
--- a/lib/efi_driver/efi_block_device.c
+++ b/lib/efi_driver/efi_block_device.c
@@ -128,7 +128,7 @@ static int efi_bl_bind(efi_handle_t handle, void *interface)
 	if (!obj)
 		return -ENOENT;
 
-	devnum = blk_find_max_devnum(IF_TYPE_EFI_LOADER);
+	devnum = blk_find_max_devnum(UCLASS_EFI_LOADER);
 	if (devnum == -ENODEV)
 		devnum = 0;
 	else if (devnum < 0)
@@ -140,7 +140,7 @@ static int efi_bl_bind(efi_handle_t handle, void *interface)
 	sprintf(name, "efiblk#%d", devnum);
 
 	/* Create driver model udevice for the EFI block io device */
-	ret = blk_create_device(parent, "efi_blk", name, IF_TYPE_EFI_LOADER,
+	ret = blk_create_device(parent, "efi_blk", name, UCLASS_EFI_LOADER,
 				devnum, io->media->block_size,
 				(lbaint_t)io->media->last_block, &bdev);
 	if (ret)
diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
index 1d700b2a6be..2e905f61840 100644
--- a/lib/efi_loader/efi_disk.c
+++ b/lib/efi_loader/efi_disk.c
@@ -652,7 +652,7 @@ static int efi_disk_probe(void *ctx, struct event *event)
 	 * has already created an efi_disk at this moment.
 	 */
 	desc = dev_get_uclass_plat(dev);
-	if (desc->if_type != IF_TYPE_EFI_LOADER) {
+	if (desc->if_type != UCLASS_EFI_LOADER) {
 		ret = efi_disk_create_raw(dev);
 		if (ret)
 			return -1;
@@ -687,7 +687,7 @@ static int efi_disk_delete_raw(struct udevice *dev)
 		return -1;
 
 	desc = dev_get_uclass_plat(dev);
-	if (desc->if_type != IF_TYPE_EFI_LOADER) {
+	if (desc->if_type != UCLASS_EFI_LOADER) {
 		diskobj = container_of(handle, struct efi_disk_obj, header);
 		efi_free_pool(diskobj->dp);
 	}
diff --git a/test/dm/blk.c b/test/dm/blk.c
index 85c3a3bd45c..35bd5318f0b 100644
--- a/test/dm/blk.c
+++ b/test/dm/blk.c
@@ -25,19 +25,19 @@ static int dm_test_blk_base(struct unit_test_state *uts)
 
 	/* Create two, one the parent of the other */
 	ut_assertok(blk_create_device(gd->dm_root, "sandbox_host_blk", "test",
-				      IF_TYPE_HOST, 1, 512, 2, &blk1));
+				      UCLASS_ROOT, 1, 512, 2, &blk1));
 	ut_assertok(blk_create_device(blk1, "sandbox_host_blk", "test",
-				      IF_TYPE_HOST, 3, 512, 2, &blk3));
+				      UCLASS_ROOT, 3, 512, 2, &blk3));
 
 	/* Check we can find them */
-	ut_asserteq(-ENODEV, blk_get_device(IF_TYPE_HOST, 0, &dev));
-	ut_assertok(blk_get_device(IF_TYPE_HOST, 1, &dev));
+	ut_asserteq(-ENODEV, blk_get_device(UCLASS_ROOT, 0, &dev));
+	ut_assertok(blk_get_device(UCLASS_ROOT, 1, &dev));
 	ut_asserteq_ptr(blk1, dev);
-	ut_assertok(blk_get_device(IF_TYPE_HOST, 3, &dev));
+	ut_assertok(blk_get_device(UCLASS_ROOT, 3, &dev));
 	ut_asserteq_ptr(blk3, dev);
 
 	/* Check we can iterate */
-	ut_assertok(blk_first_device(IF_TYPE_HOST, &dev));
+	ut_assertok(blk_first_device(UCLASS_ROOT, &dev));
 	ut_asserteq_ptr(blk1, dev);
 	ut_assertok(blk_next_device(&dev));
 	ut_asserteq_ptr(blk3, dev);
@@ -79,7 +79,7 @@ static int dm_test_blk_usb(struct unit_test_state *uts)
 	ut_assertok(blk_get_device_by_str("usb", "0", &dev_desc));
 
 	/* The parent should be a block device */
-	ut_assertok(blk_get_device(IF_TYPE_USB, 0, &dev));
+	ut_assertok(blk_get_device(UCLASS_USB, 0, &dev));
 	ut_asserteq_ptr(usb_dev, dev_get_parent(dev));
 
 	/* Check we have one block device for each mass storage device */
@@ -101,14 +101,14 @@ static int dm_test_blk_find(struct unit_test_state *uts)
 	struct udevice *blk, *dev;
 
 	ut_assertok(blk_create_device(gd->dm_root, "sandbox_host_blk", "test",
-				      IF_TYPE_HOST, 1, 512, 2, &blk));
-	ut_asserteq(-ENODEV, blk_find_device(IF_TYPE_HOST, 0, &dev));
-	ut_assertok(blk_find_device(IF_TYPE_HOST, 1, &dev));
+				      UCLASS_ROOT, 1, 512, 2, &blk));
+	ut_asserteq(-ENODEV, blk_find_device(UCLASS_ROOT, 0, &dev));
+	ut_assertok(blk_find_device(UCLASS_ROOT, 1, &dev));
 	ut_asserteq_ptr(blk, dev);
 	ut_asserteq(false, device_active(dev));
 
 	/* Now activate it */
-	ut_assertok(blk_get_device(IF_TYPE_HOST, 1, &dev));
+	ut_assertok(blk_get_device(UCLASS_ROOT, 1, &dev));
 	ut_asserteq_ptr(blk, dev);
 	ut_asserteq(true, device_active(dev));
 
@@ -134,7 +134,7 @@ static int dm_test_blk_devnum(struct unit_test_state *uts)
 
 		/* Check that the bblock device is attached */
 		ut_assertok(uclass_get_device_by_seq(UCLASS_MMC, i, &mmc_dev));
-		ut_assertok(blk_find_device(IF_TYPE_MMC, i, &dev));
+		ut_assertok(blk_find_device(UCLASS_MMC, i, &dev));
 		parent = dev_get_parent(dev);
 		ut_asserteq_ptr(parent, mmc_dev);
 		ut_asserteq(trailing_strtol(mmc_dev->name), i);
-- 
2.37.1.595.g718a3a8f04-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
