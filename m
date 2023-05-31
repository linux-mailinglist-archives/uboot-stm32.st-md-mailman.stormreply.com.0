Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916271746A
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 May 2023 05:35:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF2B1C6A614;
	Wed, 31 May 2023 03:35:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74CF8C65E5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 03:35:51 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-64fbfe0d037so373341b3a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 20:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685504150; x=1688096150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fEHsJ2BPYepLe9lhrzjjRxecXuGuQemDM5Dv68+Bck=;
 b=v9sg10rXR4mMkBzTT9W2NXdoCjT8ueu9B0ATCsCRKtwS8Qiq/3/USF+9siHHNIqv86
 po+LfDUnxFtoQkITitoyjt93F2GzX9Wk4COgysgmJtzAlwIdj3udjL7lj01iCMHlx3/B
 enuLDg8G4mriRg20dk2Hpcu85BLlV8aIKB53AQgZwvnbOIk9CCnfxUEFVUh3ipDyfnlQ
 NM0pQjhp5GXjLFe/gJX9AQ2PWKyPEaCw95IJf2bUxjujmTy7OhssaZcsDKSFrTYvU70Q
 Eh3BHL5+wSlRTL+E1tt9Nk411HCkwPt4v7akxv79UzM7xF8grYQab+J/Bax4s8nj6RyH
 gcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685504150; x=1688096150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fEHsJ2BPYepLe9lhrzjjRxecXuGuQemDM5Dv68+Bck=;
 b=WpP9gtIA3/ogbSA90KFbOCPHlX3kZI/pRK8BmWBtlPvik+dTTgDeAj4OamMYyaEMiw
 8WwrHJ6RVD01yODhbpYXX/veqVAj/g889X7YG5FrWlFnB92sE+JjrScQ8iqxNLI8ILPc
 MnQFIZp6Gs+vzK5JUSuiiage8b/03ZoJ8NOoL1juBFJWB/jeCVJqc/mG3FymiKWMdMar
 HzAnZPhn2KBMza8wUnMUSnMfWtqtRXaJOY2k3XX2+UVwuBomDt6U88vw/JyhKJ1LZHz7
 kcAo+5SLThzVa00Y6jKhRnwvaR+VlNfxvSrweTqMj/GmyPLhWoPzHzogiU8OxtEO//6c
 S+1A==
X-Gm-Message-State: AC+VfDzAttlAQQD+OoLH7KZSJGgswgiyV4tK6+1+Lz5g9UnxA/+Yx8Ou
 H+BKF46ERDLwKyhBkjVVwkd1BA==
X-Google-Smtp-Source: ACHHUZ6DVyGLKv9ulxFzv0QryOeYDLNgUFRfA56Eh/AK5T8z0fO3WUOeS9Lbka2k/CWxcR6k9OMIpA==
X-Received: by 2002:a17:902:da83:b0:1ad:d95d:ca9c with SMTP id
 j3-20020a170902da8300b001add95dca9cmr5001063plx.15.1685504149896; 
 Tue, 30 May 2023 20:35:49 -0700 (PDT)
Received: from ubuntu-SVE15129CJS.. ([240d:1a:cf7:5800:b037:3ab0:51c1:7dff])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170902d30400b001b0395c3ffasm85709plc.180.2023.05.30.20.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 20:35:49 -0700 (PDT)
From: Masahisa Kojima <masahisa.kojima@linaro.org>
To: u-boot@lists.denx.de
Date: Wed, 31 May 2023 12:35:14 +0900
Message-Id: <20230531033523.1581973-2-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531033523.1581973-1-masahisa.kojima@linaro.org>
References: <20230531033523.1581973-1-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Cc: "moderated list:STM32MP1 BOARD" <uboot-stm32@st-md-mailman.stormreply.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Takahiro Akashi <takahiro.akashi@linaro.org>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Michal Simek <michal.simek@amd.com>, Heiko Thiery <heiko.thiery@gmail.com>
Subject: [Uboot-stm32] [PATCH v7 01/10] efi_loader: add the number of image
	entries in efi_capsule_update_info
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

The number of image array entries global variable is required
to support EFI capsule update. This information is exposed as a
num_image_type_guids variable, but this information
should be included in the efi_capsule_update_info structure.

This commit adds the num_images member in the
efi_capsule_update_info structure. All board files supporting
EFI capsule update are updated.

Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
No update since v6

Newly created in v6

 arch/arm/mach-rockchip/board.c                         | 4 ++--
 board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c    | 2 +-
 board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c | 2 +-
 board/emulation/qemu-arm/qemu-arm.c                    | 2 +-
 board/kontron/pitx_imx8m/pitx_imx8m.c                  | 2 +-
 board/kontron/sl-mx8mm/sl-mx8mm.c                      | 2 +-
 board/kontron/sl28/sl28.c                              | 2 +-
 board/rockchip/evb_rk3399/evb-rk3399.c                 | 2 +-
 board/sandbox/sandbox.c                                | 2 +-
 board/socionext/developerbox/developerbox.c            | 2 +-
 board/st/stm32mp1/stm32mp1.c                           | 2 +-
 board/xilinx/common/board.c                            | 2 +-
 include/efi_loader.h                                   | 3 ++-
 lib/efi_loader/efi_firmware.c                          | 6 +++---
 lib/fwu_updates/fwu.c                                  | 2 +-
 15 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-rockchip/board.c b/arch/arm/mach-rockchip/board.c
index f1f70c81d0..8daa74b3eb 100644
--- a/arch/arm/mach-rockchip/board.c
+++ b/arch/arm/mach-rockchip/board.c
@@ -41,7 +41,7 @@ static bool updatable_image(struct disk_partition *info)
 	uuid_str_to_bin(info->type_guid, image_type_guid.b,
 			UUID_STR_FORMAT_GUID);
 
-	for (i = 0; i < num_image_type_guids; i++) {
+	for (i = 0; i < update_info.num_images; i++) {
 		if (!guidcmp(&fw_images[i].image_type_id, &image_type_guid)) {
 			ret = true;
 			break;
@@ -59,7 +59,7 @@ static void set_image_index(struct disk_partition *info, int index)
 	uuid_str_to_bin(info->type_guid, image_type_guid.b,
 			UUID_STR_FORMAT_GUID);
 
-	for (i = 0; i < num_image_type_guids; i++) {
+	for (i = 0; i < update_info.num_images; i++) {
 		if (!guidcmp(&fw_images[i].image_type_id, &image_type_guid)) {
 			fw_images[i].image_index = index;
 			break;
diff --git a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
index 466174679e..b79a2380aa 100644
--- a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
+++ b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
@@ -54,10 +54,10 @@ struct efi_fw_image fw_images[] = {
 
 struct efi_capsule_update_info update_info = {
 	.dfu_string = "mmc 2=flash-bin raw 0 0x1B00 mmcpart 1",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 
diff --git a/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c b/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
index b373e45df9..af070ec315 100644
--- a/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
+++ b/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
@@ -50,10 +50,10 @@ struct efi_fw_image fw_images[] = {
 
 struct efi_capsule_update_info update_info = {
 	.dfu_string = "mmc 2=flash-bin raw 0x42 0x1D00 mmcpart 1",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 int board_phys_sdram_size(phys_size_t *size)
diff --git a/board/emulation/qemu-arm/qemu-arm.c b/board/emulation/qemu-arm/qemu-arm.c
index 34ed3e8ae6..dfea0d92a3 100644
--- a/board/emulation/qemu-arm/qemu-arm.c
+++ b/board/emulation/qemu-arm/qemu-arm.c
@@ -47,10 +47,10 @@ struct efi_fw_image fw_images[] = {
 };
 
 struct efi_capsule_update_info update_info = {
+	.num_images = ARRAY_SIZE(fw_images)
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 static struct mm_region qemu_arm64_mem_map[] = {
diff --git a/board/kontron/pitx_imx8m/pitx_imx8m.c b/board/kontron/pitx_imx8m/pitx_imx8m.c
index fcda86bc1b..4548e7c1df 100644
--- a/board/kontron/pitx_imx8m/pitx_imx8m.c
+++ b/board/kontron/pitx_imx8m/pitx_imx8m.c
@@ -43,10 +43,10 @@ struct efi_fw_image fw_images[] = {
 
 struct efi_capsule_update_info update_info = {
 	.dfu_string = "mmc 0=flash-bin raw 0x42 0x1000 mmcpart 1",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 int board_early_init_f(void)
diff --git a/board/kontron/sl-mx8mm/sl-mx8mm.c b/board/kontron/sl-mx8mm/sl-mx8mm.c
index 250195694b..ddb509eb66 100644
--- a/board/kontron/sl-mx8mm/sl-mx8mm.c
+++ b/board/kontron/sl-mx8mm/sl-mx8mm.c
@@ -29,10 +29,10 @@ struct efi_fw_image fw_images[] = {
 
 struct efi_capsule_update_info update_info = {
 	.dfu_string = "sf 0:0=flash-bin raw 0x400 0x1f0000",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 int board_phys_sdram_size(phys_size_t *size)
diff --git a/board/kontron/sl28/sl28.c b/board/kontron/sl28/sl28.c
index 89948e087f..4ab221c12b 100644
--- a/board/kontron/sl28/sl28.c
+++ b/board/kontron/sl28/sl28.c
@@ -40,10 +40,10 @@ struct efi_fw_image fw_images[] = {
 struct efi_capsule_update_info update_info = {
 	.dfu_string = "sf 0:0=u-boot-bin raw 0x210000 0x1d0000;"
 			"u-boot-env raw 0x3e0000 0x20000",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 int board_early_init_f(void)
diff --git a/board/rockchip/evb_rk3399/evb-rk3399.c b/board/rockchip/evb_rk3399/evb-rk3399.c
index c99ffdd75e..3c773d0930 100644
--- a/board/rockchip/evb_rk3399/evb-rk3399.c
+++ b/board/rockchip/evb_rk3399/evb-rk3399.c
@@ -18,10 +18,10 @@
 static struct efi_fw_image fw_images[ROCKPI4_UPDATABLE_IMAGES] = {0};
 
 struct efi_capsule_update_info update_info = {
+	.num_images = ROCKPI4_UPDATABLE_IMAGES,
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ROCKPI4_UPDATABLE_IMAGES;
 #endif
 
 #ifndef CONFIG_SPL_BUILD
diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index 2e44bdf0df..c7b6cb78ff 100644
--- a/board/sandbox/sandbox.c
+++ b/board/sandbox/sandbox.c
@@ -67,10 +67,10 @@ struct efi_fw_image fw_images[] = {
 struct efi_capsule_update_info update_info = {
 	.dfu_string = "sf 0:0=u-boot-bin raw 0x100000 0x50000;"
 		"u-boot-env raw 0x150000 0x200000",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 #if !CONFIG_IS_ENABLED(OF_PLATDATA)
diff --git a/board/socionext/developerbox/developerbox.c b/board/socionext/developerbox/developerbox.c
index 16e14d4f7f..d92e1d0962 100644
--- a/board/socionext/developerbox/developerbox.c
+++ b/board/socionext/developerbox/developerbox.c
@@ -41,10 +41,10 @@ struct efi_capsule_update_info update_info = {
 	.dfu_string = "mtd nor1=u-boot.bin raw 200000 100000;"
 			"fip.bin raw 180000 78000;"
 			"optee.bin raw 500000 100000",
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 static struct mm_region sc2a11_mem_map[] = {
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1a1b1844c8..5b28ccd32e 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -92,10 +92,10 @@
 struct efi_fw_image fw_images[1];
 
 struct efi_capsule_update_info update_info = {
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 int board_early_init_f(void)
diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
index d071ebfb9c..0328d68e75 100644
--- a/board/xilinx/common/board.c
+++ b/board/xilinx/common/board.c
@@ -52,10 +52,10 @@ struct efi_fw_image fw_images[] = {
 };
 
 struct efi_capsule_update_info update_info = {
+	.num_images = ARRAY_SIZE(fw_images),
 	.images = fw_images,
 };
 
-u8 num_image_type_guids = ARRAY_SIZE(fw_images);
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
 #define EEPROM_HEADER_MAGIC		0xdaaddeed
diff --git a/include/efi_loader.h b/include/efi_loader.h
index b395eef9e7..941d63467c 100644
--- a/include/efi_loader.h
+++ b/include/efi_loader.h
@@ -1078,15 +1078,16 @@ struct efi_fw_image {
  * platforms which enable capsule updates
  *
  * @dfu_string:		String used to populate dfu_alt_info
+ * @num_images:		The number of images array entries
  * @images:		Pointer to an array of updatable images
  */
 struct efi_capsule_update_info {
 	const char *dfu_string;
+	int num_images;
 	struct efi_fw_image *images;
 };
 
 extern struct efi_capsule_update_info update_info;
-extern u8 num_image_type_guids;
 
 /**
  * Install the ESRT system table.
diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
index 93e2b01c07..cc650e1443 100644
--- a/lib/efi_loader/efi_firmware.c
+++ b/lib/efi_loader/efi_firmware.c
@@ -131,7 +131,7 @@ static efi_status_t efi_fill_image_desc_array(
 	struct efi_fw_image *fw_array;
 	int i;
 
-	total_size = sizeof(*image_info) * num_image_type_guids;
+	total_size = sizeof(*image_info) * update_info.num_images;
 
 	if (*image_info_size < total_size) {
 		*image_info_size = total_size;
@@ -141,13 +141,13 @@ static efi_status_t efi_fill_image_desc_array(
 	*image_info_size = total_size;
 
 	fw_array = update_info.images;
-	*descriptor_count = num_image_type_guids;
+	*descriptor_count = update_info.num_images;
 	*descriptor_version = EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
 	*descriptor_size = sizeof(*image_info);
 	*package_version = 0xffffffff; /* not supported */
 	*package_version_name = NULL; /* not supported */
 
-	for (i = 0; i < num_image_type_guids; i++) {
+	for (i = 0; i < update_info.num_images; i++) {
 		image_info[i].image_index = fw_array[i].image_index;
 		image_info[i].image_type_id = fw_array[i].image_type_id;
 		image_info[i].image_id = fw_array[i].image_index;
diff --git a/lib/fwu_updates/fwu.c b/lib/fwu_updates/fwu.c
index 5313d07302..3b1785e7b1 100644
--- a/lib/fwu_updates/fwu.c
+++ b/lib/fwu_updates/fwu.c
@@ -151,7 +151,7 @@ static int fwu_get_image_type_id(u8 *image_index, efi_guid_t *image_type_id)
 
 	index = *image_index;
 	image = update_info.images;
-	for (i = 0; i < num_image_type_guids; i++) {
+	for (i = 0; i < update_info.num_images; i++) {
 		if (index == image[i].image_index) {
 			guidcpy(image_type_id, &image[i].image_type_id);
 			return 0;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
