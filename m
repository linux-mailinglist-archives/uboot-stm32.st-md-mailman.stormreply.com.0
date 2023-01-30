Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37C6813EB
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jan 2023 15:58:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41D2FC6506E;
	Mon, 30 Jan 2023 14:58:19 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC30C640E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 14:58:17 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id d10so5180465ilc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jan 2023 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fjz77eSFo6DN9HfhzWWwoGUO7o4tQg99UIdueL8jAPk=;
 b=FREsZRZOi5NnGuVxfMvTwujz984mMdDLSavsnPrPLTU4rzHNyIYsrVAmg+FMZF+UH5
 lEvVj7BuZPuaSMMYfvnLMjhcZH3Hxkq67RI3vFNL07tf7LaqSRUR7WCgfRIkNJcN439A
 JTDZ3z7tT4z3VIYaVce63qCskOI1bEJ8RyZBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fjz77eSFo6DN9HfhzWWwoGUO7o4tQg99UIdueL8jAPk=;
 b=cCLGr8aBSXUHyNi7yTEHmL2d1HHQO1YJD9DtGMrxaeBM6Kiv+OKiIfUtZIjijRcunA
 B8/MP89C6pQHbHvCaGA8csc7hwSC/usj9gMu9xl1Z/wrrT/vzGMPR5IqaFRU0Eijnova
 0vCrEOcRDCQ5xUzFNoqAh3NVZBN4iTc7aWcGZpkZEZYog/HdZCdJdHZvnZpc7cfm4bvp
 GWZoEwopF6w1RCSJ3223JytD2HZlR+50OZdooAmF3BFWOXN5UIlNNSK9W+jnoj/ESHhQ
 o/bCR/7yJ+obGyUACTVmq+tQy9PoA6qBIcd/1c3IEVSVyRhbyekhjCVspfwnxZ09DA9K
 8ldw==
X-Gm-Message-State: AO0yUKULkIh2DidxtetFw411J/iFwy/NgPZihwdS3mb+3o9nTL5nqeJ6
 oHdj6Wf4yQdDGGdtcpTEIP8jHg==
X-Google-Smtp-Source: AK7set/zhj1bqM5sUrq9B3ItYypEnuvbC/fFBjSFKR3Do04w1qopunvz8mEzhmG+dvznlUG4aPnmCA==
X-Received: by 2002:a05:6e02:1bc8:b0:310:b4f3:ed87 with SMTP id
 x8-20020a056e021bc800b00310b4f3ed87mr12253388ilv.24.1675090696500; 
 Mon, 30 Jan 2023 06:58:16 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a926b12000000b0030bfdb6ef60sm4008830ilc.58.2023.01.30.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:58:16 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 30 Jan 2023 07:41:48 -0700
Message-Id: <20230130144324.206208-76-sjg@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230130144324.206208-1-sjg@chromium.org>
References: <20230130144324.206208-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jaswinder.singh@linaro.org>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH 075/171] Correct SPL uses of
	EFI_HAVE_CAPSULE_SUPPORT
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

This converts 13 usages of this option to the non-SPL form, since there is
no SPL_EFI_HAVE_CAPSULE_SUPPORT defined in Kconfig

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c    | 2 +-
 board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c | 2 +-
 board/emulation/common/qemu_dfu.c                      | 2 +-
 board/emulation/qemu-arm/qemu-arm.c                    | 2 +-
 board/kontron/pitx_imx8m/pitx_imx8m.c                  | 2 +-
 board/kontron/sl-mx8mm/sl-mx8mm.c                      | 2 +-
 board/kontron/sl28/sl28.c                              | 2 +-
 board/rockchip/evb_rk3399/evb-rk3399.c                 | 2 +-
 board/sandbox/sandbox.c                                | 2 +-
 board/socionext/developerbox/developerbox.c            | 2 +-
 board/st/stm32mp1/stm32mp1.c                           | 4 ++--
 board/xilinx/common/board.c                            | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
index aa9687f7a9d..34109c69ddb 100644
--- a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
+++ b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
@@ -35,7 +35,7 @@ static void setup_gpmi_nand(void)
 }
 #endif
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 #if defined(CONFIG_TARGET_IMX8MP_RSB3720A1_4G)
 	{
diff --git a/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c b/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
index 3d7fff34d25..b373e45df95 100644
--- a/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
+++ b/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
@@ -31,7 +31,7 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 #if defined(CONFIG_TARGET_IMX8MM_CL_IOT_GATE)
 	{
diff --git a/board/emulation/common/qemu_dfu.c b/board/emulation/common/qemu_dfu.c
index c1aeaf10d93..332d659c1f7 100644
--- a/board/emulation/common/qemu_dfu.c
+++ b/board/emulation/common/qemu_dfu.c
@@ -44,7 +44,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
 
 	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
 
-	if (!CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT) &&
+	if (!IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT) &&
 	    env_get("dfu_alt_info"))
 		return;
 
diff --git a/board/emulation/qemu-arm/qemu-arm.c b/board/emulation/qemu-arm/qemu-arm.c
index 3df3e41c0b2..ff1755f8cde 100644
--- a/board/emulation/qemu-arm/qemu-arm.c
+++ b/board/emulation/qemu-arm/qemu-arm.c
@@ -19,7 +19,7 @@
 #ifdef CONFIG_ARM64
 #include <asm/armv8/mmu.h>
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 #if defined(CONFIG_TARGET_QEMU_ARM_32BIT)
 	{
diff --git a/board/kontron/pitx_imx8m/pitx_imx8m.c b/board/kontron/pitx_imx8m/pitx_imx8m.c
index d974af8da1a..af1832c4736 100644
--- a/board/kontron/pitx_imx8m/pitx_imx8m.c
+++ b/board/kontron/pitx_imx8m/pitx_imx8m.c
@@ -32,7 +32,7 @@ static iomux_v3_cfg_t const uart_pads[] = {
 	IMX8MQ_PAD_ECSPI1_MISO__UART3_CTS_B | MUX_PAD_CTRL(UART_PAD_CTRL),
 };
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 	{
 		.image_type_id = KONTRON_PITX_IMX8M_FIT_IMAGE_GUID,
diff --git a/board/kontron/sl-mx8mm/sl-mx8mm.c b/board/kontron/sl-mx8mm/sl-mx8mm.c
index 4ac430b29a9..250195694ba 100644
--- a/board/kontron/sl-mx8mm/sl-mx8mm.c
+++ b/board/kontron/sl-mx8mm/sl-mx8mm.c
@@ -18,7 +18,7 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 	{
 		.image_type_id = KONTRON_SL_MX8MM_FIT_IMAGE_GUID,
diff --git a/board/kontron/sl28/sl28.c b/board/kontron/sl28/sl28.c
index 0576b3eae48..4ad6b323476 100644
--- a/board/kontron/sl28/sl28.c
+++ b/board/kontron/sl28/sl28.c
@@ -28,7 +28,7 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 	{
 		.image_type_id = KONTRON_SL28_FIT_IMAGE_GUID,
diff --git a/board/rockchip/evb_rk3399/evb-rk3399.c b/board/rockchip/evb_rk3399/evb-rk3399.c
index f56b379b937..c99ffdd75e8 100644
--- a/board/rockchip/evb_rk3399/evb-rk3399.c
+++ b/board/rockchip/evb_rk3399/evb-rk3399.c
@@ -14,7 +14,7 @@
 
 #define ROCKPI4_UPDATABLE_IMAGES	2
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 static struct efi_fw_image fw_images[ROCKPI4_UPDATABLE_IMAGES] = {0};
 
 struct efi_capsule_update_info update_info = {
diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index 8b953f9b397..2e44bdf0df3 100644
--- a/board/sandbox/sandbox.c
+++ b/board/sandbox/sandbox.c
@@ -29,7 +29,7 @@
  */
 gd_t *gd;
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 /* GUIDs for capsule updatable firmware images */
 #define SANDBOX_UBOOT_IMAGE_GUID \
 	EFI_GUID(0x09d7cf52, 0x0720, 0x4710, 0x91, 0xd1, \
diff --git a/board/socionext/developerbox/developerbox.c b/board/socionext/developerbox/developerbox.c
index 6415c90c1c1..16e14d4f7f5 100644
--- a/board/socionext/developerbox/developerbox.c
+++ b/board/socionext/developerbox/developerbox.c
@@ -18,7 +18,7 @@
 
 #include <linux/kernel.h>
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 	{
 		.image_type_id = DEVELOPERBOX_UBOOT_IMAGE_GUID,
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 914f900ac86..b9fc240d5b6 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -88,7 +88,7 @@
 #define USB_START_LOW_THRESHOLD_UV	1230000
 #define USB_START_HIGH_THRESHOLD_UV	2150000
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[1];
 
 struct efi_capsule_update_info update_info = {
@@ -677,7 +677,7 @@ int board_init(void)
 
 	setup_led(LEDST_ON);
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 	efi_guid_t image_type_guid = STM32MP_FIP_IMAGE_GUID;
 
 	guidcpy(&fw_images[0].image_type_id, &image_type_guid);
diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
index 35a2f310f4f..aa9f3ef071c 100644
--- a/board/xilinx/common/board.c
+++ b/board/xilinx/common/board.c
@@ -33,7 +33,7 @@
 
 #include "fru.h"
 
-#if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
+#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 struct efi_fw_image fw_images[] = {
 #if defined(XILINX_BOOT_IMAGE_GUID)
 	{
-- 
2.39.1.456.gfc5497dd1b-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
