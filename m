Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9E70B4F6
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 May 2023 08:21:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 759CAC6A617;
	Mon, 22 May 2023 06:21:19 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9BE5C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 10:32:45 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-24e14a24c9dso2438695a91.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684492364; x=1687084364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhY/pC98MMyzB5y9rLRxXrIfvmGA8MlTORscpxy4ots=;
 b=KUuaOJKfRNpFMz68ZXl+NWO0abFyBLYgzzUSveLifwo6AvOvODoCam6pZ7H+HhJsou
 Q9rlKTQliNEt2wL/GF0HB6lB9RjBAOsEqUqUcV3cFX61XEMPgSYbFXzlhRL1YrCihadk
 s8K5lkVl+94YBc8aYrODtwyWythr+O6jAYisCgPP011Xk95qCD2TDt5XjjByAbr0yMm1
 YgKW3Z47l8xwsyh9xP9XJvLEvwgrRlDJJ7F+el6tiDyeG2ir21fMqdwj2zC4TRWhYHqu
 WEeG+ZSSjZFuolIzXB7Cdg3qkUbmhBakW0HK29NO5r/0Uz2PcmszJAySqNR7nZFNqGA+
 G28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684492364; x=1687084364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhY/pC98MMyzB5y9rLRxXrIfvmGA8MlTORscpxy4ots=;
 b=D/Mv2pwSf4wbhWrqDeFa/UQ+EreoNQuauZ3IccOYyBcVOZqsWIYkPfagKb3Obumacu
 D6XzQvOII4yfujlUYlyRaIkl9ugNkn5vaXxbZxQUKrM4F3AUeA234hNfW63+WlV1la1v
 8yZmaR8vFHZk+rVkEmC/9iSGJATGR28XuyE4tKhlt1SJwZIxF04E37jMgbHUvm0D7mii
 ax83Qzx1dwGNaFPJnstCzs3acs9o0ZXpKWDh8v4odmb+tvOC3eePPM0s85zvMivp0nMO
 290D3GM0s1qOevh3s7daxf2PXjeV7WPuAzsgh3xxyJXX/IYKQlVCDEUNj1inRpaf3284
 NkYw==
X-Gm-Message-State: AC+VfDwZ/R+Nvbk6m7fYOf5C5O/tUt+aGVaVpK2sPu7mjRFXRBXnNojg
 CLqIOYSzzFFW1HeY+QS38N4Bcw==
X-Google-Smtp-Source: ACHHUZ7cmTz8mijZCZnIE/FynYBOnw0awwVJLYu1u5uLYGzP9wcLKAIQifPf4gFm7GPaMKP/b0g4Vw==
X-Received: by 2002:a17:90a:658c:b0:253:6d5d:906b with SMTP id
 k12-20020a17090a658c00b002536d5d906bmr1608237pjj.26.1684492364123; 
 Fri, 19 May 2023 03:32:44 -0700 (PDT)
Received: from ubuntu-SVE15129CJS.. ([240d:1a:cf7:5800:8e72:6c60:18e6:c4c4])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090a940d00b0025352448ba9sm1195870pjo.0.2023.05.19.03.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 03:32:43 -0700 (PDT)
From: Masahisa Kojima <masahisa.kojima@linaro.org>
To: u-boot@lists.denx.de
Date: Fri, 19 May 2023 19:32:07 +0900
Message-Id: <20230519103214.1239656-2-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519103214.1239656-1-masahisa.kojima@linaro.org>
References: <20230519103214.1239656-1-masahisa.kojima@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:21:18 +0000
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
Subject: [Uboot-stm32] [PATCH v6 1/8] efi_loader: add the number of image
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
---
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
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
