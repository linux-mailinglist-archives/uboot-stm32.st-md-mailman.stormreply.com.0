Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5176E5F7
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 15:00:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F252AC10C8E
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 13:00:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02A7BC10C82
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:00:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JD06bB021006; Fri, 19 Jul 2019 15:00:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=nZqPY0HFai5lTIpQJYm5UoTq773idat4YCt3vpdif48=;
 b=0pioNeS/LH6El7jlGC7DHWynbAOQXLp+qXBMcFuHviE2T9oCy8srltdyRelfL7CiKS8U
 d6kaAbq8Nsv36swjLNSRK27BAT3j+xhI46aWieF4QVFvPvJucT+w/FIoWwgMYm7/zST2
 JM8LaGnBIukKFvPK8FRtcSzQRfbnURnYESZ1bqU+ED2//5eaoxTUumkpjPoM7ATiwDxq
 9ZIzK4yhmLy4brC85DPQAi1cPAIYPjixefyUqwxm92vZuJJJ4OU7yMi4HqxtTGabyHk4
 Ww7kwdjvd2iFBMlOO63SE1tqEMT2wgaM9yT5r7y6C5suYvijCy/FUxrcoPuIJQrnGvJq Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepv669-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:00:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E470D34;
 Fri, 19 Jul 2019 12:57:42 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CAEEE2D52;
 Fri, 19 Jul 2019 12:57:42 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:42 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:42
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:23 +0200
Message-ID: <1563541046-6432-12-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RFC PATCH 11/14] stm32mp1: activate SET_DFU_ALT_INFO
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

Generate automatically dfu_alt_info for the supported device.
The simple command "dfu 0" allows to start the dfu stack on usb 0
for the supported devices:
- dfu mtd for nand0
- dfu mtd for nor0
- dfu mmc for SDCard
- dfu mmc for eMMC
- dfu ram for images in DDR

The DUF alternate use the "part", "partubi" and "mmcpart" options
to select the correct MTD or GPT partition or the eMMC hw boot partition.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/README     | 111 +++++++++++++++++++++++++++++++++++++++++++
 board/st/stm32mp1/stm32mp1.c |  51 ++++++++++++++++++++
 include/configs/stm32mp1.h   |  32 +++++++++++++
 3 files changed, 194 insertions(+)

diff --git a/board/st/stm32mp1/README b/board/st/stm32mp1/README
index b0c8325..eed3f95 100644
--- a/board/st/stm32mp1/README
+++ b/board/st/stm32mp1/README
@@ -334,3 +334,114 @@ on bank 0 to access to internal OTP:
     4 check env update
        STM32MP> print ethaddr
        ethaddr=12:34:56:78:9a:bc
+
+10. DFU support
+===============
+
+The DFU is supported on ST board.
+The env variable dfu_alt_info is automatically build, and all
+the memory present on the ST boards are exported.
+
+The mode is started by
+
+STM32MP> dfu 0
+
+On EV1 board:
+
+STM32MP> dfu 0 list
+
+DFU alt settings list:
+dev: RAM alt: 0 name: uImage layout: RAM_ADDR
+dev: RAM alt: 1 name: devicetree.dtb layout: RAM_ADDR
+dev: RAM alt: 2 name: uramdisk.image.gz layout: RAM_ADDR
+dev: eMMC alt: 3 name: sdcard_fsbl1 layout: RAW_ADDR
+dev: eMMC alt: 4 name: sdcard_fsbl2 layout: RAW_ADDR
+dev: eMMC alt: 5 name: sdcard_ssbl layout: RAW_ADDR
+dev: eMMC alt: 6 name: sdcard_bootfs layout: RAW_ADDR
+dev: eMMC alt: 7 name: sdcard_vendorfs layout: RAW_ADDR
+dev: eMMC alt: 8 name: sdcard_rootfs layout: RAW_ADDR
+dev: eMMC alt: 9 name: sdcard_userfs layout: RAW_ADDR
+dev: eMMC alt: 10 name: emmc_fsbl1 layout: RAW_ADDR
+dev: eMMC alt: 11 name: emmc_fsbl2 layout: RAW_ADDR
+dev: eMMC alt: 12 name: emmc_ssbl layout: RAW_ADDR
+dev: eMMC alt: 13 name: emmc_bootfs layout: RAW_ADDR
+dev: eMMC alt: 14 name: emmc_vendorfs layout: RAW_ADDR
+dev: eMMC alt: 15 name: emmc_rootfs layout: RAW_ADDR
+dev: eMMC alt: 16 name: emmc_userfs layout: RAW_ADDR
+dev: MTD alt: 17 name: nor_fsbl1 layout: RAW_ADDR
+dev: MTD alt: 18 name: nor_fsbl2 layout: RAW_ADDR
+dev: MTD alt: 19 name: nor_ssbl layout: RAW_ADDR
+dev: MTD alt: 20 name: nor_env layout: RAW_ADDR
+dev: MTD alt: 21 name: nand_fsbl layout: RAW_ADDR
+dev: MTD alt: 22 name: nand_ssbl1 layout: RAW_ADDR
+dev: MTD alt: 23 name: nand_ssbl2 layout: RAW_ADDR
+dev: MTD alt: 24 name: nand_UBI layout: RAW_ADDR
+dev: VIRT alt: 25 name: OTP layout: RAW_ADDR
+dev: VIRT alt: 26 name: PMIC layout: RAW_ADDR
+
+All the supported device are exported for dfu-util tool:
+
+$> dfu-util -l
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=26, name="PMIC", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=25, name="OTP", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=24, name="nand_UBI", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=23, name="nand_ssbl2", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=22, name="nand_ssbl1", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=21, name="nand_fsbl", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="nor_env", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="nor_ssbl", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nor_fsbl2", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor_fsbl1", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="emmc_userfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="emmc_rootfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="emmc_vendorfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="emmc_bootfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="emmc_ssbl", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="emmc_fsbl2", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="emmc_fsbl1", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="sdcard_userfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="sdcard_rootfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="sdcard_vendorfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="sdcard_bootfs", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="sdcard_ssbl", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="sdcard_fsbl2", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="sdcard_fsbl1", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=1, name="devicetree.dtb", serial="002700333338511934383330"
+Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=0, name="uImage", serial="002700333338511934383330"
+
+You can update the boot device:
+
+#SDCARD
+$> dfu-util -d 0483:5720 -a 3 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 4 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 5 -D u-boot-stm32mp157c-ev1-trusted.img
+$> dfu-util -d 0483:5720 -a 6 -D st-image-bootfs-openstlinux-weston-stm32mp1.ext4
+$> dfu-util -d 0483:5720 -a 7 -D st-image-vendorfs-openstlinux-weston-stm32mp1.ext4
+$> dfu-util -d 0483:5720 -a 8 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
+$> dfu-util -d 0483:5720 -a 9 -D st-image-userfs-openstlinux-weston-stm32mp1.ext4
+
+#EMMC
+$> dfu-util -d 0483:5720 -a 10 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 11 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 12 -D u-boot-stm32mp157c-ev1-trusted.img
+$> dfu-util -d 0483:5720 -a 13 -D st-image-bootfs-openstlinux-weston-stm32mp1.ext4
+$> dfu-util -d 0483:5720 -a 14 -D st-image-vendorfs-openstlinux-weston-stm32mp1.ext4
+$> dfu-util -d 0483:5720 -a 15 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
+$> dfu-util -d 0483:5720 -a 16 -D st-image-userfs-openstlinux-weston-stm32mp1.ext4
+
+#NOR
+$> dfu-util -d 0483:5720 -a 17 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 18 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 19 -D u-boot-stm32mp157c-ev1-trusted.img
+
+#NAND (UBI partition used for NAND only boot or NOR + NAND boot)
+$> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1-trusted.stm32
+$> dfu-util -d 0483:5720 -a 22 -D u-boot-stm32mp157c-ev1-trusted.img
+$> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
+$> dfu-util -d 0483:5720 -a 24 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
+
+And you can also dump the OTP and the PMIC NVM with:
+
+$> dfu-util -d 0483:5720 -a 25 -U otp.bin
+$> dfu-util -d 0483:5720 -a 26 -U pmic.bin
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b1e592c..7656c66 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -12,6 +12,7 @@
 #include <generic-phy.h>
 #include <i2c.h>
 #include <led.h>
+#include <memalign.h>
 #include <misc.h>
 #include <phy.h>
 #include <reset.h>
@@ -745,3 +746,53 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
 }
 #endif
+
+#ifdef CONFIG_SET_DFU_ALT_INFO
+#define DFU_ALT_BUF_LEN SZ_1K
+
+static void board_get_alt_info(const char *dev, char *buff)
+{
+	char var_name[32] = "dfu_alt_info_";
+	int ret;
+
+	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
+
+	/* name of env variable to read = dfu_alt_info_<dev> */
+	strcat(var_name, dev);
+	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
+	if (ret) {
+		if (buff[0] != '\0')
+			strcat(buff, "&");
+		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
+	}
+}
+
+void set_dfu_alt_info(char *interface, char *devstr)
+{
+	struct udevice *dev;
+
+	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
+
+	if (env_get("dfu_alt_info"))
+		return;
+
+	memset(buf, 0, sizeof(buf));
+
+	board_get_alt_info("ram", buf);
+
+	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
+		board_get_alt_info("mmc0", buf);
+
+	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
+		board_get_alt_info("mmc1", buf);
+
+	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
+		board_get_alt_info("nor0", buf);
+
+	if (!uclass_get_device(UCLASS_MTD, 0, &dev))
+		board_get_alt_info("nand0", buf);
+
+	env_set("dfu_alt_info", buf);
+	puts("DFU alt info setting: done\n");
+}
+#endif
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 1d385e0..27b2bdb 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -85,6 +85,8 @@
 #define CONFIG_SYS_AUTOLOAD		"no"
 #endif
 
+#define CONFIG_SET_DFU_ALT_INFO
+
 /*****************************************************************************/
 #ifdef CONFIG_DISTRO_DEFAULTS
 /*****************************************************************************/
@@ -129,6 +131,34 @@
 	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
 	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
 
+#define STM32MP_DFU_ALT_RAM \
+	"dfu_alt_info_ram=ram 0=" \
+		"uImage ram ${kernel_addr_r} 0x2000000;" \
+		"devicetree.dtb ram ${fdt_addr_r} 0x100000;" \
+		"uramdisk.image.gz ram ${ramdisk_addr_r} 0x10000000\0"
+
+#ifdef CONFIG_SET_DFU_ALT_INFO
+#define STM32MP_DFU_ALT_INFO \
+	"dfu_alt_info_nor0=mtd nor0=" \
+		"nor_fsbl1 part 1;nor_fsbl2 part 2;" \
+		"nor_ssbl part 3;nor_env part 4\0" \
+	"dfu_alt_info_nand0=mtd nand0="\
+		"nand_fsbl part 1;nand_ssbl1 part 2;" \
+		"nand_ssbl2 part 3;nand_UBI partubi 4\0" \
+	"dfu_alt_info_mmc0=mmc 0=" \
+		"sdcard_fsbl1 part 0 1;sdcard_fsbl2 part 0 2;" \
+		"sdcard_ssbl part 0 3;sdcard_bootfs part 0 4;" \
+		"sdcard_vendorfs part 0 5;sdcard_rootfs part 0 6;" \
+		"sdcard_userfs part 0 7\0" \
+	"dfu_alt_info_mmc1=mmc 1=" \
+		"emmc_fsbl1 raw 0x0 0x200 mmcpart 1;" \
+		"emmc_fsbl2 raw 0x0 0x200 mmcpart 2;emmc_ssbl part 1 1;" \
+		"emmc_bootfs part 1 2;emmc_vendorfs part 1 3;" \
+		"emmc_rootfs part 1 4;emmc_userfs part 1 5\0"
+#else
+#define STM32MP_DFU_ALT_INFO
+#endif
+
 /*
  * memory layout for 32M uncompressed/compressed kernel,
  * 1M fdt, 1M script, 1M pxe and 1M for splashimage
@@ -145,6 +175,8 @@
 	"initrd_high=0xffffffff\0" \
 	STM32MP_BOOTCMD \
 	STM32MP_MTDPARTS \
+	STM32MP_DFU_ALT_RAM \
+	STM32MP_DFU_ALT_INFO \
 	BOOTENV
 
 #endif /* ifndef CONFIG_SPL_BUILD */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
