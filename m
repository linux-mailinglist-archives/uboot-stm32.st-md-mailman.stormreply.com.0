Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF0678A27
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Jan 2023 23:03:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD35C65E72;
	Mon, 23 Jan 2023 22:03:28 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8BFEC01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 22:03:26 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id i17so6677151ila.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ptCNbkui8bIcx0JX5+TPaA5fylilkp9vK8qCe8gPdw=;
 b=Qggvt6ClaItvS233jb/oh5EykUtM++Kj/US6ATjsm5c6BjohOadJahvt7UMRKoLcfg
 KamE+kOQ/rHuVVv7QnCjGb/rtf6K+sW9OKvkZKvyCdSinqtc6+F8xPfbip3gICjs+GYs
 r5Zm9ZlyX1IEPkOaE/JMquRNp22d6dYvESB7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ptCNbkui8bIcx0JX5+TPaA5fylilkp9vK8qCe8gPdw=;
 b=3mfxcg2CZxPxIMxypEdTUGBPd4ouQgHhCGSpJ+v/ZMgdZxXQpSPjPhehe/UpuyhcDB
 eM1mC846tnq7SEKWkprxFEaChkjFDPS77/4xjCXAD9lfgF6fjA4UBIVE0h+/O/6P8AzS
 MxdF6vJtYATvIsCObEzWxFJBzGkOSjl9MwjHu0FX/pszGqqPry7AJ7GOi+2Jdj6nbxqp
 aPjZGVgVjACoJPuaVwQTRqh+HwzxjJ7vafeSfzLJJcZHL+h74cqB9XMibEgc5xVAeZ3g
 7r9dMwBGAYVZ2T13QPxkZzueo5aAE8fGj9i47vkiVpI4cOq+jFGH4ap84AGq5sQPufDD
 lIZg==
X-Gm-Message-State: AO0yUKW4lPtImP0ETNRJVZkU5C5d/juTQg+AzAZtX8eMUAk+Egw8UQYZ
 NYoisl95UUCIDt8zXe5RVJuQmw==
X-Google-Smtp-Source: AK7set9HAtIx/EOjB8uMkitbhq+V+NHPpIKL08TL7ntznkeBVouUKXSFZ9D9oHbXSC7wIc4Lx5JUWw==
X-Received: by 2002:a05:6e02:1aae:b0:310:8c3e:e50b with SMTP id
 l14-20020a056e021aae00b003108c3ee50bmr217180ilv.4.1674511405562; 
 Mon, 23 Jan 2023 14:03:25 -0800 (PST)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:b357:a759:c191:fe47])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a02a688000000b003a0e665ad11sm110915jam.13.2023.01.23.14.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 14:03:25 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: u-boot@lists.denx.de
Date: Mon, 23 Jan 2023 15:00:12 -0700
Message-Id: <20230123220031.3540724-70-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230123220031.3540724-1-sjg@chromium.org>
References: <20230123220031.3540724-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Fabio Estevam <festevam@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 William Zhang <william.zhang@broadcom.com>,
 Samuel Holland <samuel@sholland.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH 69/88] arm: Rename STM32MP15x
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

CONFIG options must not use lower-case letter. Convert this and related
ones to upper case.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/dts/Makefile                          |  2 +-
 arch/arm/dts/stm32mp15-u-boot.dtsi             |  2 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi       |  4 ++--
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi       |  4 ++--
 arch/arm/mach-stm32mp/Kconfig                  |  6 +++---
 arch/arm/mach-stm32mp/Kconfig.15x              |  6 +++---
 arch/arm/mach-stm32mp/Makefile                 |  2 +-
 arch/arm/mach-stm32mp/cmd_stm32key.c           | 10 +++++-----
 .../mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c |  2 +-
 .../arm/mach-stm32mp/cmd_stm32prog/stm32prog.c |  4 ++--
 .../arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  6 +++---
 arch/arm/mach-stm32mp/fdt.c                    |  8 ++++----
 arch/arm/mach-stm32mp/include/mach/stm32.h     | 10 +++++-----
 arch/arm/mach-stm32mp/include/mach/stm32prog.h |  2 +-
 board/st/common/Kconfig                        | 14 +++++++-------
 board/st/common/stm32mp_mtdparts.c             | 18 +++++++++---------
 board/st/stm32mp1/Kconfig                      |  2 +-
 board/st/stm32mp1/stm32mp1.c                   |  6 +++---
 configs/stm32mp15_basic_defconfig              |  2 +-
 configs/stm32mp15_defconfig                    |  2 +-
 configs/stm32mp15_trusted_defconfig            |  4 ++--
 drivers/clk/stm32/Kconfig                      |  2 +-
 22 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index dc8dcdff218..3c3efa6d6a3 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1218,7 +1218,7 @@ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 dtb-$(CONFIG_STM32MP13X) += \
 	stm32mp135f-dk.dtb
 
-dtb-$(CONFIG_STM32MP15x) += \
+dtb-$(CONFIG_STM32MP15X) += \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-dk1-scmi.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index d5c87d29d88..955598b1c0b 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -206,7 +206,7 @@
 	resets = <&rcc UART8_R>;
 };
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE)
 &binman {
 	u-boot-stm32 {
 		filename = "u-boot.stm32";
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 15a04ae927e..11062951923 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -21,13 +21,13 @@
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
 #endif
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 408abaf52fa..cea661bce68 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -20,13 +20,13 @@
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
 #endif
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index cf3196b3b3a..f88b7dbffbd 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -35,7 +35,7 @@ config ENV_SIZE
 
 choice
 	prompt "Select STMicroelectronics STM32MPxxx Soc"
-	default STM32MP15x
+	default STM32MP15X
 
 config STM32MP13X
 	bool "Support STMicroelectronics STM32MP13x Soc"
@@ -55,7 +55,7 @@ config STM32MP13X
 		support of STMicroelectronics SOC STM32MP13x family
 		STMicroelectronics MPU with core ARMv7
 
-config STM32MP15x
+config STM32MP15X
 	bool "Support STMicroelectronics STM32MP15x Soc"
 	select ARCH_SUPPORT_PSCI
 	select BINMAN
@@ -103,7 +103,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
 
 config STM32_ETZPC
 	bool "STM32 Extended TrustZone Protection"
-	depends on STM32MP15x || STM32MP13X
+	depends on STM32MP15X || STM32MP13X
 	default y
 	imply BOOTP_SERVERIP
 	help
diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
index 1d32f8bf339..71c14eb4955 100644
--- a/arch/arm/mach-stm32mp/Kconfig.15x
+++ b/arch/arm/mach-stm32mp/Kconfig.15x
@@ -1,6 +1,6 @@
-if STM32MP15x
+if STM32MP15X
 
-config STM32MP15x_STM32IMAGE
+config STM32MP15X_STM32IMAGE
 	bool "Support STM32 image for generated U-Boot image"
 	depends on TFABOOT
 	help
@@ -11,7 +11,7 @@ choice
 	prompt "STM32MP15x board select"
 	optional
 
-config TARGET_ST_STM32MP15x
+config TARGET_ST_STM32MP15X
 	bool "STMicroelectronics STM32MP15x boards"
 	imply BOOTSTAGE
 	imply CMD_BOOTSTAGE
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index 90c7c121ec4..a40f8dc25a8 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -9,7 +9,7 @@ obj-y += syscon.o
 obj-y += bsec.o
 
 obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
-obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
+obj-$(CONFIG_STM32MP15X) += stm32mp15x.o
 
 obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
 ifdef CONFIG_SPL_BUILD
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 96407cd9b18..b2e6421e9a2 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -19,7 +19,7 @@
  */
 #define STM32_OTP_CLOSE_ID		0
 #define STM32_OTP_STM32MP13X_CLOSE_MASK	0x3F
-#define STM32_OTP_STM32MP15x_CLOSE_MASK	BIT(6)
+#define STM32_OTP_STM32MP15X_CLOSE_MASK	BIT(6)
 
 /* PKH is the first element of the key list */
 #define STM32KEY_PKH 0
@@ -63,7 +63,7 @@ static u8 get_key_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return ARRAY_SIZE(stm32mp13_list);
 
-	if (IS_ENABLED(CONFIG_STM32MP15x))
+	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_list);
 }
 
@@ -72,7 +72,7 @@ static const struct stm32key *get_key(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return &stm32mp13_list[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP15x))
+	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_list[index];
 }
 
@@ -81,8 +81,8 @@ static u32 get_otp_close_mask(void)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return STM32_OTP_STM32MP13X_CLOSE_MASK;
 
-	if (IS_ENABLED(CONFIG_STM32MP15x))
-		return STM32_OTP_STM32MP15x_CLOSE_MASK;
+	if (IS_ENABLED(CONFIG_STM32MP15X))
+		return STM32_OTP_STM32MP15X_CLOSE_MASK;
 }
 
 static int get_misc_dev(struct udevice **dev)
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index a8372356b0e..c9f99259054 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -180,7 +180,7 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
 	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
 );
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 bool stm32prog_get_tee_partitions(void)
 {
 	if (stm32prog_data)
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 89552d2ad10..4b75397b1cc 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -999,7 +999,7 @@ static int treat_partition_list(struct stm32prog_data *data)
 		INIT_LIST_HEAD(&data->dev[j].part_list);
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	data->tee_detected = false;
 #endif
 	data->fsbl_nor_detected = false;
@@ -1055,7 +1055,7 @@ static int treat_partition_list(struct stm32prog_data *data)
 			/* fallthrough */
 		case STM32PROG_NAND:
 		case STM32PROG_SPI_NAND:
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 			if (!data->tee_detected &&
 			    !strncmp(part->name, "tee", 3))
 				data->tee_detected = true;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 58f4b96fa75..bcbbc2d5a35 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -20,8 +20,8 @@
 #define DEFAULT_ADDRESS		0xFFFFFFFF
 
 #define CMD_SIZE		512
-/* SMC is only supported in SPMIN for STM32MP15x */
-#ifdef CONFIG_STM32MP15x
+/* SMC is only supported in SPMIN for STM32MP15X */
+#ifdef CONFIG_STM32MP15X
 #define OTP_SIZE_SMC		1024
 #else
 #define OTP_SIZE_SMC		0
@@ -149,7 +149,7 @@ struct stm32prog_data {
 	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
 	int			part_nb;	/* nb of partition */
 	struct stm32prog_part_t	*part_array;	/* array of partition */
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	bool			tee_detected;
 #endif
 	bool			fsbl_nor_detected;
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 6b69542ecfc..218d9ef282a 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -275,7 +275,7 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 		array_size = ARRAY_SIZE(stm32mp13_ip_addr);
 	}
 
-	if (IS_ENABLED(CONFIG_STM32MP15x)) {
+	if (IS_ENABLED(CONFIG_STM32MP15X)) {
 		array = stm32mp15_ip_addr;
 		array_size = ARRAY_SIZE(stm32mp15_ip_addr);
 	}
@@ -494,7 +494,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		stm32mp13_fdt_fixup(blob, soc, cpu, name);
 
-	if (IS_ENABLED(CONFIG_STM32MP15x)) {
+	if (IS_ENABLED(CONFIG_STM32MP15X)) {
 		stm32mp15_fdt_fixup(blob, soc, cpu, name);
 
 		/*
@@ -502,10 +502,10 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 		 *       copied from U-Boot device tree by optee_copy_fdt_nodes
 		 *       when OP-TEE is not detected (probe failed)
 		 * these OP-TEE nodes are present in <board>-u-boot.dtsi
-		 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
+		 * under CONFIG_STM32MP15X_STM32IMAGE only for compatibility
 		 * when FIP is not used by TF-A
 		 */
-		if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
+		if (CONFIG_IS_ENABLED(STM32MP15X_STM32IMAGE) &&
 		    !tee_find_device(NULL, NULL, NULL, NULL))
 			stm32_fdt_disable_optee(blob);
 	}
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 1e1f694cb62..8f54b8ca94f 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -17,7 +17,7 @@
 #define STM32_RCC_BASE			0x50000000
 #define STM32_PWR_BASE			0x50001000
 #define STM32_SYSCFG_BASE		0x50020000
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define STM32_DBGMCU_BASE		0x50081000
 #endif
 #define STM32_FMC2_BASE			0x58002000
@@ -28,7 +28,7 @@
 #define STM32_STGEN_BASE		0x5C008000
 #define STM32_TAMP_BASE			0x5C00A000
 
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define STM32_USART1_BASE		0x5C000000
 #define STM32_USART2_BASE		0x4000E000
 #endif
@@ -47,7 +47,7 @@
 #define STM32_SDMMC2_BASE		0x58007000
 #define STM32_SDMMC3_BASE		0x48004000
 
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define STM32_SYSRAM_BASE		0x2FFC0000
 #define STM32_SYSRAM_SIZE		SZ_256K
 #endif
@@ -109,7 +109,7 @@ enum boot_device {
 /* TAMP registers */
 #define TAMP_BACKUP_REGISTER(x)		(STM32_TAMP_BASE + 0x100 + 4 * x)
 
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define TAMP_BACKUP_MAGIC_NUMBER	TAMP_BACKUP_REGISTER(4)
 #define TAMP_BACKUP_BRANCH_ADDRESS	TAMP_BACKUP_REGISTER(5)
 #define TAMP_FWU_BOOT_INFO_REG		TAMP_BACKUP_REGISTER(10)
@@ -160,7 +160,7 @@ enum forced_boot_mode {
 #define STM32_BSEC_LOCK(id)		(STM32_BSEC_LOCK_OFFSET + (id) * 4)
 
 /* BSEC OTP index */
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define BSEC_OTP_RPN	1
 #define BSEC_OTP_SERIAL	13
 #define BSEC_OTP_PKG	16
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
index 99be4e1d656..573dffe6dd6 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
@@ -11,7 +11,7 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 			       void *buf, long *len);
 int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 bool stm32prog_get_tee_partitions(void);
 #endif
 
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index ba17d3158d1..20e28f9af82 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -1,14 +1,14 @@
 config CMD_STBOARD
 	bool "stboard - command for OTP board information"
 	depends on ARCH_STM32MP
-	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13X
+	default y if TARGET_ST_STM32MP15X || TARGET_ST_STM32MP13X
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
 
 config MTDPARTS_NAND0_BOOT
 	string "mtd boot partitions for nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || \
+	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15X_STM32IMAGE || \
 						  !TFABOOT
 	default "2m(fsbl),4m(fip1),4m(fip2)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
@@ -23,7 +23,7 @@ config MTDPARTS_NAND0_BOOT
 config MTDPARTS_NAND0_TEE
 	string "mtd tee partitions for nand0"
 	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15X_STM32IMAGE
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from nand0.
@@ -32,7 +32,7 @@ config MTDPARTS_NAND0_TEE
 
 config MTDPARTS_NOR0_BOOT
 	string "mtd boot partitions for nor0"
-	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)" if STM32MP15x_STM32IMAGE || \
+	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)" if STM32MP15X_STM32IMAGE || \
 								       !TFABOOT
 	default "256k(fsbl1),256k(fsbl2),4m(fip),512k(u-boot-env)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
@@ -46,14 +46,14 @@ config MTDPARTS_NOR0_BOOT
 config MTDPARTS_NOR0_TEE
 	string "mtd tee partitions for nor0"
 	default "256k(teeh),512k(teed),256k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15X_STM32IMAGE
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from nor0.
 
 config MTDPARTS_SPINAND0_BOOT
 	string "mtd boot partitions for spi-nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || !TFABOOT
+	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15X_STM32IMAGE || !TFABOOT
 	default "2m(fsbl),4m(fip1),4m(fip2)"
 	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
 	help
@@ -66,7 +66,7 @@ config MTDPARTS_SPINAND0_BOOT
 config MTDPARTS_SPINAND0_TEE
 	string "mtd tee partitions for spi-nand0"
 	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
+	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15X_STM32IMAGE
 	help
 	  This define the tee partitions added in mtparts dynamically
 	  when tee is supported with boot from spi-nand0,
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 18878424c7a..bc2ce600287 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -11,7 +11,7 @@
 #include <log.h>
 #include <mtd.h>
 #include <mtd_node.h>
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 #include <tee.h>
 #endif
 #include <asm/arch/stm32prog.h>
@@ -33,7 +33,7 @@ static void board_set_mtdparts(const char *dev,
 			       char *mtdids,
 			       char *mtdparts,
 			       const char *boot,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 			       const char *tee,
 #endif
 			       const char *user)
@@ -59,7 +59,7 @@ static void board_set_mtdparts(const char *dev,
 		strncat(mtdparts, ",", MTDPARTS_LEN);
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	if (tee) {
 		strncat(mtdparts, tee, MTDPARTS_LEN);
 		strncat(mtdparts, ",", MTDPARTS_LEN);
@@ -77,7 +77,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
 	bool nor, nand, spinand, serial;
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	bool tee = false;
 #endif
 
@@ -97,7 +97,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	case BOOT_SERIAL_USB:
 		serial = true;
 		if (CONFIG_IS_ENABLED(CMD_STM32PROG)) {
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 			tee = stm32prog_get_tee_partitions();
 #endif
 			nor = stm32prog_get_fsbl_nor();
@@ -118,7 +118,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		break;
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	if (!serial && tee_find_device(NULL, NULL, NULL, NULL))
 		tee = true;
 #endif
@@ -138,7 +138,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		if (!IS_ERR_OR_NULL(mtd)) {
 			board_set_mtdparts("nand0", ids, parts,
 					   CONFIG_MTDPARTS_NAND0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 					   !nor && tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
 #endif
 					   "-(UBI)");
@@ -151,7 +151,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		if (!IS_ERR_OR_NULL(mtd)) {
 			board_set_mtdparts("spi-nand0", ids, parts,
 					   CONFIG_MTDPARTS_SPINAND0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 					   !nor && tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
 #endif
 					   "-(UBI)");
@@ -163,7 +163,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
 			board_set_mtdparts("nor0", ids, parts,
 					   CONFIG_MTDPARTS_NOR0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 					   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
 #endif
 					   "-(nor_user)");
diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 7d0d41bfea0..96de41546f1 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -1,4 +1,4 @@
-if TARGET_ST_STM32MP15x
+if TARGET_ST_STM32MP15X
 
 config SYS_BOARD
 	default "stm32mp1"
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 47b3d1bf4c5..4536c1c673c 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -114,7 +114,7 @@ int checkboard(void)
 	int fdt_compat_len;
 
 	if (IS_ENABLED(CONFIG_TFABOOT)) {
-		if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE))
+		if (IS_ENABLED(CONFIG_STM32MP15X_STM32IMAGE))
 			mode = "trusted - stm32image";
 		else
 			mode = "trusted";
@@ -616,7 +616,7 @@ error:
 
 static bool board_is_stm32mp15x_dk2(void)
 {
-	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
+	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15X) &&
 	    of_machine_is_compatible("st,stm32mp157c-dk2"))
 		return true;
 
@@ -625,7 +625,7 @@ static bool board_is_stm32mp15x_dk2(void)
 
 static bool board_is_stm32mp15x_ev1(void)
 {
-	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
+	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15X) &&
 	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
 	     of_machine_is_compatible("st,stm32mp157c-ev1") ||
 	     of_machine_is_compatible("st,stm32mp157d-ev1") ||
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 87e3b496048..ea03751c781 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -11,7 +11,7 @@ CONFIG_SPL_MMC=y
 CONFIG_SPL=y
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
-CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TARGET_ST_STM32MP15X=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_CMD_STM32PROG=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 5dc00213a8f..54b80688c66 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -9,7 +9,7 @@ CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
-CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TARGET_ST_STM32MP15X=y
 CONFIG_ENV_OFFSET_REDUND=0x4C0000
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index c1ad4dd5213..3d80f410507 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -9,8 +9,8 @@ CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
-CONFIG_STM32MP15x_STM32IMAGE=y
-CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_STM32MP15X_STM32IMAGE=y
+CONFIG_TARGET_ST_STM32MP15X=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 7dbddd032b8..c05015efe8b 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -23,7 +23,7 @@ config CLK_STM32_CORE
 config CLK_STM32MP1
 	bool "Enable RCC clock driver for STM32MP15"
 	depends on ARCH_STM32MP && CLK
-	default y if STM32MP15x
+	default y if STM32MP15X
 	help
 	  Enable the STM32 clock (RCC) driver. Enable support for
 	  manipulating STM32MP15's on-SoC clocks.
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
