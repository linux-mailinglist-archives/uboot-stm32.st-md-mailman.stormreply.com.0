Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B670B696
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 May 2023 09:34:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3EBCC6A617;
	Mon, 22 May 2023 07:34:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15AABC6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 07:34:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so57562675e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684740857; x=1687332857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c8K0aGy6FWiqoJ2qJaHY6ZAFWerhJ0FxZvuYWP0M64I=;
 b=WCk2qlOasSsqOn9xGl5CwM28bC/neUxk5uAq6FA0ItqLkG+mpPpFhqxu8xx0AttUa0
 /54GwjhE2/Nmg9Pw2Aj8yOqc9paz2mTwdPBkRNuAiUaONS0mF8WdcGRN3EsVN3EBiZYv
 QYf6X/jOhDLnwY+mFnHW7BEP9Z3Fx2YPB9IueQxfCRkkckYyxPd0fvcya6QdEjZ1UvLY
 hhAMarrerJYX7wWL/bzNBd5G0wen66NlT6oMleozCbyg2bdtdAQuLLZsw72RhAPjHfB8
 sEGZyuuYpO6dUzy46NyaxTH8b2kcylAtWGIwyCfph+zDG9BLO8ZDSTTnP5yB7j8u3kIg
 xdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684740857; x=1687332857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8K0aGy6FWiqoJ2qJaHY6ZAFWerhJ0FxZvuYWP0M64I=;
 b=eyXGulijU6gIt4hAxCDspoV5is/jb0tOfwT4IszHpNpdhWC2Qb/dVc/DAojavGQCp1
 MUoFw8ExKB4iiRWZjn5DKU0V14sfuwqZoyWDdFKzJzp54soMCit6HLLi4xCkUt3exM1/
 C24tsCaKTlC6k7M86Ztnni5cupeCDEjSqzJIBZBS/LNdTjj9aKQQx3uFI1bgFFcY5Dem
 N5xMKowKyJBGsqwdISm5F2I9jo0TW8jJ2DPcb8iN7szoAL6nnVqMyTn1hmQ8VJBpETRl
 njFiwQ1MhXmofwb1EusIiZBGpGZ0k/+wPKiQl6FYTWwhZBn8rBQsQ6bHJmOmOIpXPtPq
 uj2g==
X-Gm-Message-State: AC+VfDxgAh6pFe72AUy39qMs7U8wAtS/fMu2oEhAu2tFoz0q0VOE7Y+u
 YcK1drXrexBt1WmEClPidggIBw==
X-Google-Smtp-Source: ACHHUZ4eFmiB980H+tlb8EyzvbWdxYosJGSCGqU3m6070ai4ypq08uwk3koB/W4e3wA6CO1Agjiblg==
X-Received: by 2002:a7b:c31a:0:b0:3f5:f83:4d84 with SMTP id
 k26-20020a7bc31a000000b003f50f834d84mr6698372wmj.31.1684740857319; 
 Mon, 22 May 2023 00:34:17 -0700 (PDT)
Received: from hera (ppp176092130041.access.hol.gr. [176.92.130.41])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a7bc44d000000b003f42328b5d9sm7329614wmi.39.2023.05.22.00.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 00:34:17 -0700 (PDT)
Date: Mon, 22 May 2023 10:34:13 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Message-ID: <ZGsa9SldhGqh+vS1@hera>
References: <20230519103214.1239656-1-masahisa.kojima@linaro.org>
 <20230519103214.1239656-2-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519103214.1239656-2-masahisa.kojima@linaro.org>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Takahiro Akashi <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 Michael Walle <michael@walle.cc>, Mario Six <mario.six@gdsys.cc>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Michal Simek <michal.simek@amd.com>, Heiko Thiery <heiko.thiery@gmail.com>,
 "moderated list:STM32MP1 BOARD" <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v6 1/8] efi_loader: add the number of
 image entries in efi_capsule_update_info
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

On Fri, May 19, 2023 at 07:32:07PM +0900, Masahisa Kojima wrote:
> The number of image array entries global variable is required
> to support EFI capsule update. This information is exposed as a
> num_image_type_guids variable, but this information
> should be included in the efi_capsule_update_info structure.
>
> This commit adds the num_images member in the
> efi_capsule_update_info structure. All board files supporting
> EFI capsule update are updated.
>
> Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
> ---
> Newly created in v6
>
>  arch/arm/mach-rockchip/board.c                         | 4 ++--
>  board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c    | 2 +-
>  board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c | 2 +-
>  board/emulation/qemu-arm/qemu-arm.c                    | 2 +-
>  board/kontron/pitx_imx8m/pitx_imx8m.c                  | 2 +-
>  board/kontron/sl-mx8mm/sl-mx8mm.c                      | 2 +-
>  board/kontron/sl28/sl28.c                              | 2 +-
>  board/rockchip/evb_rk3399/evb-rk3399.c                 | 2 +-
>  board/sandbox/sandbox.c                                | 2 +-
>  board/socionext/developerbox/developerbox.c            | 2 +-
>  board/st/stm32mp1/stm32mp1.c                           | 2 +-
>  board/xilinx/common/board.c                            | 2 +-
>  include/efi_loader.h                                   | 3 ++-
>  lib/efi_loader/efi_firmware.c                          | 6 +++---
>  lib/fwu_updates/fwu.c                                  | 2 +-
>  15 files changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm/mach-rockchip/board.c b/arch/arm/mach-rockchip/board.c
> index f1f70c81d0..8daa74b3eb 100644
> --- a/arch/arm/mach-rockchip/board.c
> +++ b/arch/arm/mach-rockchip/board.c
> @@ -41,7 +41,7 @@ static bool updatable_image(struct disk_partition *info)
>  	uuid_str_to_bin(info->type_guid, image_type_guid.b,
>  			UUID_STR_FORMAT_GUID);
>
> -	for (i = 0; i < num_image_type_guids; i++) {
> +	for (i = 0; i < update_info.num_images; i++) {
>  		if (!guidcmp(&fw_images[i].image_type_id, &image_type_guid)) {
>  			ret = true;
>  			break;
> @@ -59,7 +59,7 @@ static void set_image_index(struct disk_partition *info, int index)
>  	uuid_str_to_bin(info->type_guid, image_type_guid.b,
>  			UUID_STR_FORMAT_GUID);
>
> -	for (i = 0; i < num_image_type_guids; i++) {
> +	for (i = 0; i < update_info.num_images; i++) {
>  		if (!guidcmp(&fw_images[i].image_type_id, &image_type_guid)) {
>  			fw_images[i].image_index = index;
>  			break;
> diff --git a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
> index 466174679e..b79a2380aa 100644
> --- a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
> +++ b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
> @@ -54,10 +54,10 @@ struct efi_fw_image fw_images[] = {
>
>  struct efi_capsule_update_info update_info = {
>  	.dfu_string = "mmc 2=flash-bin raw 0 0x1B00 mmcpart 1",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>
> diff --git a/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c b/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
> index b373e45df9..af070ec315 100644
> --- a/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
> +++ b/board/compulab/imx8mm-cl-iot-gate/imx8mm-cl-iot-gate.c
> @@ -50,10 +50,10 @@ struct efi_fw_image fw_images[] = {
>
>  struct efi_capsule_update_info update_info = {
>  	.dfu_string = "mmc 2=flash-bin raw 0x42 0x1D00 mmcpart 1",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  int board_phys_sdram_size(phys_size_t *size)
> diff --git a/board/emulation/qemu-arm/qemu-arm.c b/board/emulation/qemu-arm/qemu-arm.c
> index 34ed3e8ae6..dfea0d92a3 100644
> --- a/board/emulation/qemu-arm/qemu-arm.c
> +++ b/board/emulation/qemu-arm/qemu-arm.c
> @@ -47,10 +47,10 @@ struct efi_fw_image fw_images[] = {
>  };
>
>  struct efi_capsule_update_info update_info = {
> +	.num_images = ARRAY_SIZE(fw_images)
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  static struct mm_region qemu_arm64_mem_map[] = {
> diff --git a/board/kontron/pitx_imx8m/pitx_imx8m.c b/board/kontron/pitx_imx8m/pitx_imx8m.c
> index fcda86bc1b..4548e7c1df 100644
> --- a/board/kontron/pitx_imx8m/pitx_imx8m.c
> +++ b/board/kontron/pitx_imx8m/pitx_imx8m.c
> @@ -43,10 +43,10 @@ struct efi_fw_image fw_images[] = {
>
>  struct efi_capsule_update_info update_info = {
>  	.dfu_string = "mmc 0=flash-bin raw 0x42 0x1000 mmcpart 1",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  int board_early_init_f(void)
> diff --git a/board/kontron/sl-mx8mm/sl-mx8mm.c b/board/kontron/sl-mx8mm/sl-mx8mm.c
> index 250195694b..ddb509eb66 100644
> --- a/board/kontron/sl-mx8mm/sl-mx8mm.c
> +++ b/board/kontron/sl-mx8mm/sl-mx8mm.c
> @@ -29,10 +29,10 @@ struct efi_fw_image fw_images[] = {
>
>  struct efi_capsule_update_info update_info = {
>  	.dfu_string = "sf 0:0=flash-bin raw 0x400 0x1f0000",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  int board_phys_sdram_size(phys_size_t *size)
> diff --git a/board/kontron/sl28/sl28.c b/board/kontron/sl28/sl28.c
> index 89948e087f..4ab221c12b 100644
> --- a/board/kontron/sl28/sl28.c
> +++ b/board/kontron/sl28/sl28.c
> @@ -40,10 +40,10 @@ struct efi_fw_image fw_images[] = {
>  struct efi_capsule_update_info update_info = {
>  	.dfu_string = "sf 0:0=u-boot-bin raw 0x210000 0x1d0000;"
>  			"u-boot-env raw 0x3e0000 0x20000",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  int board_early_init_f(void)
> diff --git a/board/rockchip/evb_rk3399/evb-rk3399.c b/board/rockchip/evb_rk3399/evb-rk3399.c
> index c99ffdd75e..3c773d0930 100644
> --- a/board/rockchip/evb_rk3399/evb-rk3399.c
> +++ b/board/rockchip/evb_rk3399/evb-rk3399.c
> @@ -18,10 +18,10 @@
>  static struct efi_fw_image fw_images[ROCKPI4_UPDATABLE_IMAGES] = {0};
>
>  struct efi_capsule_update_info update_info = {
> +	.num_images = ROCKPI4_UPDATABLE_IMAGES,
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ROCKPI4_UPDATABLE_IMAGES;
>  #endif
>
>  #ifndef CONFIG_SPL_BUILD
> diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
> index 2e44bdf0df..c7b6cb78ff 100644
> --- a/board/sandbox/sandbox.c
> +++ b/board/sandbox/sandbox.c
> @@ -67,10 +67,10 @@ struct efi_fw_image fw_images[] = {
>  struct efi_capsule_update_info update_info = {
>  	.dfu_string = "sf 0:0=u-boot-bin raw 0x100000 0x50000;"
>  		"u-boot-env raw 0x150000 0x200000",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  #if !CONFIG_IS_ENABLED(OF_PLATDATA)
> diff --git a/board/socionext/developerbox/developerbox.c b/board/socionext/developerbox/developerbox.c
> index 16e14d4f7f..d92e1d0962 100644
> --- a/board/socionext/developerbox/developerbox.c
> +++ b/board/socionext/developerbox/developerbox.c
> @@ -41,10 +41,10 @@ struct efi_capsule_update_info update_info = {
>  	.dfu_string = "mtd nor1=u-boot.bin raw 200000 100000;"
>  			"fip.bin raw 180000 78000;"
>  			"optee.bin raw 500000 100000",
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  static struct mm_region sc2a11_mem_map[] = {
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 1a1b1844c8..5b28ccd32e 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -92,10 +92,10 @@
>  struct efi_fw_image fw_images[1];
>
>  struct efi_capsule_update_info update_info = {
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  int board_early_init_f(void)
> diff --git a/board/xilinx/common/board.c b/board/xilinx/common/board.c
> index d071ebfb9c..0328d68e75 100644
> --- a/board/xilinx/common/board.c
> +++ b/board/xilinx/common/board.c
> @@ -52,10 +52,10 @@ struct efi_fw_image fw_images[] = {
>  };
>
>  struct efi_capsule_update_info update_info = {
> +	.num_images = ARRAY_SIZE(fw_images),
>  	.images = fw_images,
>  };
>
> -u8 num_image_type_guids = ARRAY_SIZE(fw_images);
>  #endif /* EFI_HAVE_CAPSULE_SUPPORT */
>
>  #define EEPROM_HEADER_MAGIC		0xdaaddeed
> diff --git a/include/efi_loader.h b/include/efi_loader.h
> index b395eef9e7..941d63467c 100644
> --- a/include/efi_loader.h
> +++ b/include/efi_loader.h
> @@ -1078,15 +1078,16 @@ struct efi_fw_image {
>   * platforms which enable capsule updates
>   *
>   * @dfu_string:		String used to populate dfu_alt_info
> + * @num_images:		The number of images array entries
>   * @images:		Pointer to an array of updatable images
>   */
>  struct efi_capsule_update_info {
>  	const char *dfu_string;
> +	int num_images;
>  	struct efi_fw_image *images;
>  };
>
>  extern struct efi_capsule_update_info update_info;
> -extern u8 num_image_type_guids;
>
>  /**
>   * Install the ESRT system table.
> diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
> index 93e2b01c07..cc650e1443 100644
> --- a/lib/efi_loader/efi_firmware.c
> +++ b/lib/efi_loader/efi_firmware.c
> @@ -131,7 +131,7 @@ static efi_status_t efi_fill_image_desc_array(
>  	struct efi_fw_image *fw_array;
>  	int i;
>
> -	total_size = sizeof(*image_info) * num_image_type_guids;
> +	total_size = sizeof(*image_info) * update_info.num_images;
>
>  	if (*image_info_size < total_size) {
>  		*image_info_size = total_size;
> @@ -141,13 +141,13 @@ static efi_status_t efi_fill_image_desc_array(
>  	*image_info_size = total_size;
>
>  	fw_array = update_info.images;
> -	*descriptor_count = num_image_type_guids;
> +	*descriptor_count = update_info.num_images;
>  	*descriptor_version = EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
>  	*descriptor_size = sizeof(*image_info);
>  	*package_version = 0xffffffff; /* not supported */
>  	*package_version_name = NULL; /* not supported */
>
> -	for (i = 0; i < num_image_type_guids; i++) {
> +	for (i = 0; i < update_info.num_images; i++) {
>  		image_info[i].image_index = fw_array[i].image_index;
>  		image_info[i].image_type_id = fw_array[i].image_type_id;
>  		image_info[i].image_id = fw_array[i].image_index;
> diff --git a/lib/fwu_updates/fwu.c b/lib/fwu_updates/fwu.c
> index 5313d07302..3b1785e7b1 100644
> --- a/lib/fwu_updates/fwu.c
> +++ b/lib/fwu_updates/fwu.c
> @@ -151,7 +151,7 @@ static int fwu_get_image_type_id(u8 *image_index, efi_guid_t *image_type_id)
>
>  	index = *image_index;
>  	image = update_info.images;
> -	for (i = 0; i < num_image_type_guids; i++) {
> +	for (i = 0; i < update_info.num_images; i++) {
>  		if (index == image[i].image_index) {
>  			guidcpy(image_type_id, &image[i].image_type_id);
>  			return 0;
> --
> 2.17.1
>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
