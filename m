Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A5E4059C9
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Sep 2021 16:55:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284B9C5A4D5;
	Thu,  9 Sep 2021 14:55:51 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A455BC5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 14:55:47 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso2798038otv.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Sep 2021 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byxR7yQpuhUnR+PTf8sEyBSnoJVOmZkiWq57frR1+iM=;
 b=nAdwaeJ3iPQ5T+WhONJ5k325jMntFR8d5UmEBw5iiOmJw5x+BCq1jUxqrqxZY/zvLd
 ZeJxpSwXH/puqb0kZpB/41HiLhDugGGojWoZ5gw1tPLNia5uWEa7RPwcA5x0yDZ/iyf4
 r7OdX7akiqtesl/dbJT8aUlWAwMmXWkc8MUzderKeW2UHBSgD2qwh8n87W1tkToCzJc+
 2f5N+tXIV9+ib0ConiGeVGOddp/j+ERSrs5t99s1WFDOEXpbk30jJm0AHpyfZ/I58MP4
 qEPtfeG1ZtRPm8bW41R2o3RyE6cQW9WIhCUdyOAiuUE4m+LBDBUCJZlrqrpIDNMPFbfq
 g7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byxR7yQpuhUnR+PTf8sEyBSnoJVOmZkiWq57frR1+iM=;
 b=ZTqXj6En8UAhmcQZ31nbl8yodbWFG0ggkb9TmCWYz59Rt8RA9XaxAYJOwzdMIabDN4
 pWZnu0WsHv0cSLiOHf6hffdxY6TpC0UKLsw3UHQ0FJ/9F6dn9rWVuc4TDEHOauGdol+u
 DE0Q2tp/aadlcHAW0U3CrF3xkT+rVGv+8CuH7M9cGvybKgEblSDV+WgNaOS4R4W1LzR5
 27jkAv/7qGV3OdGSu1zIiK1DX5+K8Ns3mCHA9ldJPP4TLt9R8CYV1gyW98X3Xh5DDXdE
 1rST4UhCu3DfuV9adV9bX6+er1fyblnrUm43d2UPMhSuSaJDjVbk20FBS7mPnRnn1kfB
 2Zhw==
X-Gm-Message-State: AOAM533py/V4swD/f+KBaOqlIrt2KEf4xfBG7VlxSJlZLHdFK9KDwUk0
 Ss78AODxSj3CjDvxC0anha4=
X-Google-Smtp-Source: ABdhPJwZ/bpn0IsnOIWDBnnOtqImk+rr1/rrQ32fZgxIyUWN/voyy8TvOpCJecTo2oKXx+LqM7sRjQ==
X-Received: by 2002:a05:6830:12d7:: with SMTP id
 a23mr251719otq.102.1631199346536; 
 Thu, 09 Sep 2021 07:55:46 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id l21sm447898oop.22.2021.09.09.07.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 07:55:46 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de,
	patrick.delaunay@foss.st.com
Date: Thu,  9 Sep 2021 09:55:36 -0500
Message-Id: <20210909145536.2979951-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
References: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/3] stm32mp1: Replace STM32MP15x_STM32IMAGE
	with TFABOOT_FIP_CONTAINER
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

Recently, mach-stm32mp gained the ability to boot from a TF-A FIP
container, bringing the following boot flows:

    "basic"	SPL -> u-boot
    "falcon"    SPL -> OP-TEE -> u-boot or kernel
    "trusted"   TF-A -> OP-TEE -> u-boot
    "fip"       TF-A -> FIP container

However, the implementation of the new "fip" flow brought changes
which break the "falcon" flow.

1) Removal of  #ifdefs

One issue with the STM32MP15x_STM32IMAGE config is the introduction of
an inordinate amount of #ifdefs. This is contrary to u-boot's coding
practices, which prefer the linker and IS_ENABLED(). We can achieve
the same results by setting the CONFIG_MTDPARTS_* Kconfig strings
appropriately for the "fip" flow. The #ifdefs superfluous.

One justification for the #ifdefs is that they make it easier to
remove the soon to be obsoleted STM32IMAGE support. This argument is
unconvincing. There is no technical cost to removing code which is
not #ifdef'd versus code that is.

2) optee nodes in u-boot devicetree

The removal of the "optee" nodes from the u-boot devicetree is
problematic for the "falcon" flow. Only remove them for "fip".

3) Makefile logic for .stm32 images

Because we've removed CONFIG_STM32MP15x_STM32IMAGE, we can't use it in
mach-stm32mp/config.mk to control the creation of u-boot.stm32 images.
Instead of complicating the makefile logic, we revert to always
creating u-boot.stm32. Creation of this image is inconsequential to
how u-boot behaves at runtime.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  9 ++++----
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |  9 ++++----
 arch/arm/mach-stm32mp/Kconfig                 |  7 ------
 .../cmd_stm32prog/cmd_stm32prog.c             |  5 ++--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  4 ----
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  2 --
 arch/arm/mach-stm32mp/config.mk               |  2 +-
 arch/arm/mach-stm32mp/fdt.c                   |  4 +---
 .../arm/mach-stm32mp/include/mach/stm32prog.h |  2 --
 board/st/common/Kconfig                       | 23 ++++++++++---------
 board/st/common/stm32mp_mtdparts.c            | 20 +---------------
 board/st/stm32mp1/stm32mp1.c                  |  6 ++---
 configs/stm32mp15_tfaboot_fip_defconfig       |  1 +
 configs/stm32mp15_trusted_defconfig           |  1 -
 14 files changed, 30 insertions(+), 65 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 0101962ea5..b1e1efdc9c 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -15,18 +15,18 @@
 	config {
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
-		u-boot,mmc-env-partition = "fip";
+		u-boot,mmc-env-partition = "ssbl";
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_TFABOOT_FIP_CONTAINER
 	config {
-		u-boot,mmc-env-partition = "ssbl";
+		u-boot,mmc-env-partition = "fip";
 	};
+#endif
 
-	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -43,7 +43,6 @@
 			u-boot,dm-spl;
 		};
 	};
-#endif
 
 	led {
 		red {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 32777384c6..184774df58 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -15,17 +15,17 @@
 	config {
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
-		u-boot,mmc-env-partition = "fip";
+		u-boot,mmc-env-partition = "ssbl";
 		st,fastboot-gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_TFABOOT_FIP_CONTAINER
 	config {
-		u-boot,mmc-env-partition = "ssbl";
+		u-boot,mmc-env-partition = "fip";
 	};
+#endif
 
-	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -39,7 +39,6 @@
 			no-map;
 		};
 	};
-#endif
 
 	led {
 		red {
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 5d7eca649a..4c1eeef165 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -56,13 +56,6 @@ config STM32MP15x
 		dual core A7 for STM32MP157/3, monocore for STM32MP151
 		target all the STMicroelectronics board with SOC STM32MP1 family
 
-config STM32MP15x_STM32IMAGE
-	bool "Support STM32 image for generated U-Boot image"
-	depends on STM32MP15x && TFABOOT
-	help
-		Support of STM32 image generation for SOC STM32MP15x
-		for TF-A boot when FIP container is not used
-
 choice
 	prompt "STM32MP15x board select"
 	optional
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 41452b5a29..ce83d4aa72 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -185,15 +185,16 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
 	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
 );
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 bool stm32prog_get_tee_partitions(void)
 {
+	if (CONFIG_IS_ENABLED(TFABOOT_FIP_CONTAINER))
+		return false;
+
 	if (stm32prog_data)
 		return stm32prog_data->tee_detected;
 
 	return false;
 }
-#endif
 
 bool stm32prog_get_fsbl_nor(void)
 {
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 3b6ca4e773..26fe8b654a 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -824,9 +824,7 @@ static int treat_partition_list(struct stm32prog_data *data)
 		INIT_LIST_HEAD(&data->dev[j].part_list);
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	data->tee_detected = false;
-#endif
 	data->fsbl_nor_detected = false;
 	for (i = 0; i < data->part_nb; i++) {
 		part = &data->part_array[i];
@@ -880,12 +878,10 @@ static int treat_partition_list(struct stm32prog_data *data)
 			/* fallthrough */
 		case STM32PROG_NAND:
 		case STM32PROG_SPI_NAND:
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 			if (!data->tee_detected &&
 			    !strncmp(part->name, "tee", 3))
 				data->tee_detected = true;
 			break;
-#endif
 		default:
 			break;
 		}
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 240c5c44bc..9d58cf0e2d 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -122,9 +122,7 @@ struct stm32prog_data {
 	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
 	int			part_nb;	/* nb of partition */
 	struct stm32prog_part_t	*part_array;	/* array of partition */
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	bool			tee_detected;
-#endif
 	bool			fsbl_nor_detected;
 
 	/* command internal information */
diff --git a/arch/arm/mach-stm32mp/config.mk b/arch/arm/mach-stm32mp/config.mk
index f7f5b77c41..c30bf482f7 100644
--- a/arch/arm/mach-stm32mp/config.mk
+++ b/arch/arm/mach-stm32mp/config.mk
@@ -4,7 +4,7 @@
 #
 
 ifndef CONFIG_SPL
-INPUTS-$(CONFIG_STM32MP15x_STM32IMAGE) += u-boot.stm32
+INPUTS-y += u-boot.stm32
 else
 ifdef CONFIG_SPL_BUILD
 INPUTS-y += u-boot-spl.stm32
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index a19e954cf7..abd5e01d9c 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -337,10 +337,8 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	 *       copied from U-Boot device tree by optee_copy_fdt_nodes
 	 *       when OP-TEE is not detected (probe failed)
 	 * these OP-TEE nodes are present in <board>-u-boot.dtsi
-	 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
-	 * when FIP is not used by TF-A
 	 */
-	if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
+	if (!CONFIG_IS_ENABLED(TFABOOT_FIP_CONTAINER) &&
 	    CONFIG_IS_ENABLED(OPTEE) &&
 	    !tee_find_device(NULL, NULL, NULL, NULL))
 		stm32_fdt_disable_optee(blob);
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
index 99be4e1d65..c080b9cc42 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
@@ -11,8 +11,6 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 			       void *buf, long *len);
 int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 bool stm32prog_get_tee_partitions(void);
-#endif
 
 bool stm32prog_get_fsbl_nor(void);
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index 2f57118bb2..6477930d16 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -8,9 +8,8 @@ config CMD_STBOARD
 
 config MTDPARTS_NAND0_BOOT
 	string "mtd boot partitions for nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || \
-						  !TFABOOT
-	default "2m(fsbl),4m(fip1),4m(fip2)"
+	default "2m(fsbl),2m(ssbl1),2m(ssbl2)"
+	default "2m(fsbl),4m(fip1),4m(fip2)" if TFABOOT_FIP_CONTAINER
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the partitions of nand0 used to build mtparts dynamically
@@ -23,7 +22,8 @@ config MTDPARTS_NAND0_BOOT
 config MTDPARTS_NAND0_TEE
 	string "mtd tee partitions for nand0"
 	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
+	default "" if TFABOOT_FIP_CONTAINER
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from nand0.
@@ -32,9 +32,8 @@ config MTDPARTS_NAND0_TEE
 
 config MTDPARTS_NOR0_BOOT
 	string "mtd boot partitions for nor0"
-	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)" if STM32MP15x_STM32IMAGE || \
-								       !TFABOOT
-	default "256k(fsbl1),256k(fsbl2),4m(fip),512k(u-boot-env)"
+	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)"
+	default "256k(fsbl1),256k(fsbl2),4m(fip),512k(u-boot-env)" if TFABOOT_FIP_CONTAINER
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the partitions of nand0 used to build mtparts dynamically
@@ -46,15 +45,16 @@ config MTDPARTS_NOR0_BOOT
 config MTDPARTS_NOR0_TEE
 	string "mtd tee partitions for nor0"
 	default "256k(teeh),512k(teed),256k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
+	default "" if TFABOOT_FIP_CONTAINER
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from nor0.
 
 config MTDPARTS_SPINAND0_BOOT
 	string "mtd boot partitions for spi-nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || !TFABOOT
-	default "2m(fsbl),4m(fip1),4m(fip2)"
+	default "2m(fsbl),2m(ssbl1),2m(ssbl2)"
+	default "2m(fsbl),4m(fip1),4m(fip2)" if TFABOOT_FIP_CONTAINER
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the partitions of nand0 used to build mtparts dynamically
@@ -66,7 +66,8 @@ config MTDPARTS_SPINAND0_BOOT
 config MTDPARTS_SPINAND0_TEE
 	string "mtd tee partitions for spi-nand0"
 	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
+	default "" if TFABOOT_FIP_CONTAINER
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from spi-nand0,
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 8b636d62fa..347f62851d 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -11,9 +11,7 @@
 #include <log.h>
 #include <mtd.h>
 #include <mtd_node.h>
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 #include <tee.h>
-#endif
 #include <asm/arch/stm32prog.h>
 #include <asm/arch/sys_proto.h>
 #include <asm/global_data.h>
@@ -33,9 +31,7 @@ static void board_set_mtdparts(const char *dev,
 			       char *mtdids,
 			       char *mtdparts,
 			       const char *boot,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 			       const char *tee,
-#endif
 			       const char *user)
 {
 	/* mtdids: "<dev>=<dev>, ...." */
@@ -59,12 +55,10 @@ static void board_set_mtdparts(const char *dev,
 		strncat(mtdparts, ",", MTDPARTS_LEN);
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	if (tee) {
+	if (tee && strlen(tee)) {
 		strncat(mtdparts, tee, MTDPARTS_LEN);
 		strncat(mtdparts, ",", MTDPARTS_LEN);
 	}
-#endif
 
 	strncat(mtdparts, user, MTDPARTS_LEN);
 }
@@ -77,9 +71,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
 	bool nor, nand, spinand, serial;
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	bool tee = false;
-#endif
 
 	if (mtd_initialized) {
 		*mtdids = ids;
@@ -97,9 +89,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	case BOOT_SERIAL_USB:
 		serial = true;
 		if (CONFIG_IS_ENABLED(CMD_STM32PROG)) {
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 			tee = stm32prog_get_tee_partitions();
-#endif
 			nor = stm32prog_get_fsbl_nor();
 		}
 		nand = true;
@@ -118,11 +108,9 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		break;
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	if (!serial && CONFIG_IS_ENABLED(OPTEE) &&
 	    tee_find_device(NULL, NULL, NULL, NULL))
 		tee = true;
-#endif
 
 	memset(parts, 0, sizeof(parts));
 	memset(ids, 0, sizeof(ids));
@@ -139,9 +127,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		if (!IS_ERR_OR_NULL(mtd)) {
 			board_set_mtdparts("nand0", ids, parts,
 					   CONFIG_MTDPARTS_NAND0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 					   !nor && tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
-#endif
 					   "-(UBI)");
 			put_mtd_device(mtd);
 		}
@@ -152,9 +138,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		if (!IS_ERR_OR_NULL(mtd)) {
 			board_set_mtdparts("spi-nand0", ids, parts,
 					   CONFIG_MTDPARTS_SPINAND0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 					   !nor && tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
-#endif
 					   "-(UBI)");
 			put_mtd_device(mtd);
 		}
@@ -164,9 +148,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
 			board_set_mtdparts("nor0", ids, parts,
 					   CONFIG_MTDPARTS_NOR0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
 					   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
-#endif
 					   "-(nor_user)");
 		}
 	}
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 032f08d795..583f923d29 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -106,10 +106,10 @@ int checkboard(void)
 	int fdt_compat_len;
 
 	if (IS_ENABLED(CONFIG_TFABOOT)) {
-		if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE))
-			mode = "trusted - stm32image";
-		else
+		if (IS_ENABLED(CONFIG_TFABOOT_FIP_CONTAINER))
 			mode = "trusted";
+		else
+			mode = "trusted - stm32image";
 	} else {
 		mode = "basic";
 	}
diff --git a/configs/stm32mp15_tfaboot_fip_defconfig b/configs/stm32mp15_tfaboot_fip_defconfig
index e725b916b9..f7ef511e9c 100644
--- a/configs/stm32mp15_tfaboot_fip_defconfig
+++ b/configs/stm32mp15_tfaboot_fip_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_TFABOOT=y
+CONFIG_TFABOOT_FIP_CONTAINER=y
 CONFIG_SYS_MALLOC_F_LEN=0x3000
 CONFIG_SYS_MEMTEST_START=0xc0000000
 CONFIG_SYS_MEMTEST_END=0xc4000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 2e2f0c76ca..1671cb24f5 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -7,7 +7,6 @@ CONFIG_SYS_MEMTEST_END=0xc4000000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
-CONFIG_STM32MP15x_STM32IMAGE=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
