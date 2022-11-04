Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F761A4CF
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Nov 2022 23:49:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5E62C65045;
	Fri,  4 Nov 2022 22:49:16 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F866C65040
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 22:49:15 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id bp12so2002184ilb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 15:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lnu3/ZkBF6tAO4A1bKhvDx1JSJvvn/MU5ocmLC8Vx0=;
 b=S6s8mPp9Cr+70mr5yM7ewgu8lXfRWtA9lvqgbTEWLbWbxgif9N76ujheEaa387Im/+
 Nj6eks7rmA2n39T/VgOg47EcY9G2nQqt2YTwfgDYFHXyJdXBcluT0ELGFi4Xn0Sysgqk
 wtxBQrXHMBrOwv+Dwlv+VsJ/eHYw7LF7i4rUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lnu3/ZkBF6tAO4A1bKhvDx1JSJvvn/MU5ocmLC8Vx0=;
 b=FloEONcGxrvU5ngoZ3PN7QnmjgqCIczh0UIuEpFcJmiv6ouF2Sgo/Q4PWZH4xfdc1q
 mmWqkfsqGPoTO5CEselQozGY5zLJxD1y3SsF975zaOo3Vc4mcLj4RRuZaKMiugC82EUr
 O5px8rzBxOhxeQqOY47vkjd8FlUaN+RA+zakgeX0vibSO2z/dFVKTV1w33CbSpIBjjfq
 bGucjIQHXdTiRIAc4EbkAiNvZHAxk95r5DuCuzypKJotrdHcZWnYsmO/B7cjg/6dLPXR
 r39qblBJenL9SG9mNk/JaAaf0puhmATohbis7RXL7WQM26r/SyuBrsul/jPFNWK6EqDI
 4PuA==
X-Gm-Message-State: ACrzQf1JQ9ENoSo02CTMXut++fevKrpws1bd+H2FOxiCUdkcgdUuOxj+
 wro9aT9arJEEY+QtxOqn/6Fklg==
X-Google-Smtp-Source: AMsMyM7jberHEPSZpyIYq8cM3JSpKv2do/MKx4G7ZM2xMxI4l5zgzecxXZ3rgCU8VbwRu6xS9M75Tg==
X-Received: by 2002:a92:de49:0:b0:2eb:1f07:5a7e with SMTP id
 e9-20020a92de49000000b002eb1f075a7emr347606ilr.0.1667602153930; 
 Fri, 04 Nov 2022 15:49:13 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a05663800d800b003734c4d01d2sm95189jao.61.2022.11.04.15.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 15:49:13 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri,  4 Nov 2022 16:48:28 -0600
Message-Id: <20221104224844.467576-11-sjg@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221104224844.467576-1-sjg@chromium.org>
References: <20221104224844.467576-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Steven Lawrance <steven.lawrance@softathome.com>,
 Lukasz Majewski <lukma@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Jan Kiszka <jan.kiszka@siemens.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 John Keeping <john@metanate.com>, Anatolij Gustschin <agust@denx.de>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH v2 10/25] image: Move common image code to
	image_board and command
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

We should use the cmd/ directory for commands rather than for common code
used elsewhere in U-Boot. Move the common 'source' code into
image-board.c to achieve this.

The image_source_script() function needs to call run_command_list()  so
seems to belong better in the command library. Move and rename it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 .../cmd_stm32prog/cmd_stm32prog.c             |   2 +-
 boot/bootmeth_script.c                        |   2 +-
 boot/image-board.c                            | 133 +++++++++++++++
 cmd/source.c                                  | 155 +-----------------
 common/command.c                              |  19 +++
 drivers/usb/gadget/f_sdp.c                    |   2 +-
 include/command.h                             |  12 ++
 include/image.h                               |  12 --
 8 files changed, 168 insertions(+), 169 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 007f7131306..6fb3d868d77 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -154,7 +154,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 			do_bootz(cmdtp, 0, 4, bootm_argv);
 	}
 	if (data->script)
-		image_source_script(data->script, "script@stm32prog");
+		cmd_source_script(data->script, "script@stm32prog");
 
 	if (reset) {
 		puts("Reset...\n");
diff --git a/boot/bootmeth_script.c b/boot/bootmeth_script.c
index d1c3f940037..16c5dadcca1 100644
--- a/boot/bootmeth_script.c
+++ b/boot/bootmeth_script.c
@@ -101,7 +101,7 @@ static int script_boot(struct udevice *dev, struct bootflow *bflow)
 	log_debug("mmc_bootdev: %s\n", env_get("mmc_bootdev"));
 
 	addr = map_to_sysmem(bflow->buf);
-	ret = image_source_script(addr, NULL);
+	ret = cmd_source_script(addr, NULL);
 	if (ret)
 		return log_msg_ret("boot", ret);
 
diff --git a/boot/image-board.c b/boot/image-board.c
index 34d1e5f18be..7f96a80c85b 100644
--- a/boot/image-board.c
+++ b/boot/image-board.c
@@ -971,3 +971,136 @@ void genimg_print_time(time_t timestamp)
 	       tm.tm_year, tm.tm_mon, tm.tm_mday,
 	       tm.tm_hour, tm.tm_min, tm.tm_sec);
 }
+
+/**
+ * get_default_image() - Return default property from /images
+ *
+ * Return: Pointer to value of default property (or NULL)
+ */
+static const char *get_default_image(const void *fit)
+{
+	int images_noffset;
+
+	images_noffset = fdt_path_offset(fit, FIT_IMAGES_PATH);
+	if (images_noffset < 0)
+		return NULL;
+
+	return fdt_getprop(fit, images_noffset, FIT_DEFAULT_PROP, NULL);
+}
+
+int image_locate_script(void *buf, int size, const char *fit_uname,
+			char **datap, uint *lenp)
+{
+	const struct legacy_img_hdr *hdr;
+	const void *fit_data;
+	const void *fit_hdr;
+	size_t fit_len;
+	int noffset;
+	int verify;
+	ulong len;
+	u32 *data;
+
+	verify = env_get_yesno("verify");
+
+	switch (genimg_get_format(buf)) {
+	case IMAGE_FORMAT_LEGACY:
+		if (IS_ENABLED(CONFIG_LEGACY_IMAGE_FORMAT)) {
+			hdr = buf;
+
+			if (!image_check_magic(hdr)) {
+				puts("Bad magic number\n");
+				return 1;
+			}
+
+			if (!image_check_hcrc(hdr)) {
+				puts("Bad header crc\n");
+				return 1;
+			}
+
+			if (verify) {
+				if (!image_check_dcrc(hdr)) {
+					puts("Bad data crc\n");
+					return 1;
+				}
+			}
+
+			if (!image_check_type(hdr, IH_TYPE_SCRIPT)) {
+				puts("Bad image type\n");
+				return 1;
+			}
+
+			/* get length of script */
+			data = (u32 *)image_get_data(hdr);
+
+			len = uimage_to_cpu(*data);
+			if (!len) {
+				puts("Empty Script\n");
+				return 1;
+			}
+
+			/*
+			 * scripts are just multi-image files with one
+			 * component, so seek past the zero-terminated sequence
+			 * of image lengths to get to the actual image data
+			 */
+			while (*data++);
+		}
+		break;
+	case IMAGE_FORMAT_FIT:
+		if (IS_ENABLED(CONFIG_FIT)) {
+			fit_hdr = buf;
+			if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
+				puts("Bad FIT image format\n");
+				return 1;
+			}
+
+			if (!fit_uname)
+				fit_uname = get_default_image(fit_hdr);
+
+			if (!fit_uname) {
+				puts("No FIT subimage unit name\n");
+				return 1;
+			}
+
+			/* get script component image node offset */
+			noffset = fit_image_get_node(fit_hdr, fit_uname);
+			if (noffset < 0) {
+				printf("Can't find '%s' FIT subimage\n",
+				       fit_uname);
+				return 1;
+			}
+
+			if (!fit_image_check_type(fit_hdr, noffset,
+						  IH_TYPE_SCRIPT)) {
+				puts("Not a image image\n");
+				return 1;
+			}
+
+			/* verify integrity */
+			if (verify) {
+				if (!fit_image_verify(fit_hdr, noffset)) {
+					puts("Bad Data Hash\n");
+					return 1;
+				}
+			}
+
+			/* get script subimage data address and length */
+			if (fit_image_get_data(fit_hdr, noffset, &fit_data, &fit_len)) {
+				puts("Could not find script subimage data\n");
+				return 1;
+			}
+
+			data = (u32 *)fit_data;
+			len = (ulong)fit_len;
+		}
+		break;
+	default:
+		puts("Wrong image format for \"source\" command\n");
+		return -EPERM;
+	}
+
+	*datap = (char *)data;
+	*lenp = len;
+
+	return 0;
+}
diff --git a/cmd/source.c b/cmd/source.c
index dfa995f1df6..04a086b3582 100644
--- a/cmd/source.c
+++ b/cmd/source.c
@@ -24,158 +24,6 @@
 #include <asm/byteorder.h>
 #include <asm/io.h>
 
-/**
- * get_default_image() - Return default property from /images
- *
- * Return: Pointer to value of default property (or NULL)
- */
-static const char *get_default_image(const void *fit)
-{
-	int images_noffset;
-
-	images_noffset = fdt_path_offset(fit, FIT_IMAGES_PATH);
-	if (images_noffset < 0)
-		return NULL;
-
-	return fdt_getprop(fit, images_noffset, FIT_DEFAULT_PROP, NULL);
-}
-
-int image_locate_script(void *buf, int size, const char *fit_uname,
-			char **datap, uint *lenp)
-{
-	ulong		len;
-	const struct legacy_img_hdr *hdr;
-	u32		*data;
-	int		verify;
-	const void*	fit_hdr;
-	int		noffset;
-	const void	*fit_data;
-	size_t		fit_len;
-
-	verify = env_get_yesno("verify");
-
-	switch (genimg_get_format(buf)) {
-	case IMAGE_FORMAT_LEGACY:
-		if (IS_ENABLED(CONFIG_LEGACY_IMAGE_FORMAT)) {
-			hdr = buf;
-
-			if (!image_check_magic(hdr)) {
-				puts("Bad magic number\n");
-				return 1;
-			}
-
-			if (!image_check_hcrc(hdr)) {
-				puts("Bad header crc\n");
-				return 1;
-			}
-
-			if (verify) {
-				if (!image_check_dcrc(hdr)) {
-					puts("Bad data crc\n");
-					return 1;
-				}
-			}
-
-			if (!image_check_type(hdr, IH_TYPE_SCRIPT)) {
-				puts("Bad image type\n");
-				return 1;
-			}
-
-			/* get length of script */
-			data = (u32 *)image_get_data(hdr);
-
-			len = uimage_to_cpu(*data);
-			if (!len) {
-				puts("Empty Script\n");
-				return 1;
-			}
-
-			/*
-			 * scripts are just multi-image files with one
-			 * component, so seek past the zero-terminated sequence
-			 * of image lengths to get to the actual image data
-			 */
-			while (*data++);
-		}
-		break;
-	case IMAGE_FORMAT_FIT:
-		if (IS_ENABLED(CONFIG_FIT)) {
-			fit_hdr = buf;
-			if (fit_check_format(fit_hdr, IMAGE_SIZE_INVAL)) {
-				puts("Bad FIT image format\n");
-				return 1;
-			}
-
-			if (!fit_uname)
-				fit_uname = get_default_image(fit_hdr);
-
-			if (!fit_uname) {
-				puts("No FIT subimage unit name\n");
-				return 1;
-			}
-
-			/* get script component image node offset */
-			noffset = fit_image_get_node(fit_hdr, fit_uname);
-			if (noffset < 0) {
-				printf("Can't find '%s' FIT subimage\n",
-				       fit_uname);
-				return 1;
-			}
-
-			if (!fit_image_check_type(fit_hdr, noffset,
-						  IH_TYPE_SCRIPT)) {
-				puts("Not a image image\n");
-				return 1;
-			}
-
-			/* verify integrity */
-			if (verify) {
-				if (!fit_image_verify(fit_hdr, noffset)) {
-					puts("Bad Data Hash\n");
-					return 1;
-				}
-			}
-
-			/* get script subimage data address and length */
-			if (fit_image_get_data(fit_hdr, noffset, &fit_data, &fit_len)) {
-				puts("Could not find script subimage data\n");
-				return 1;
-			}
-
-			data = (u32 *)fit_data;
-			len = (ulong)fit_len;
-		}
-		break;
-	default:
-		puts("Wrong image format for \"source\" command\n");
-		return -EPERM;
-	}
-
-	*datap = (char *)data;
-	*lenp = len;
-
-	return 0;
-}
-
-int image_source_script(ulong addr, const char *fit_uname)
-{
-	char *data;
-	void *buf;
-	uint len;
-	int ret;
-
-	buf = map_sysmem(addr, 0);
-	ret = image_locate_script(buf, 0, fit_uname, &data, &len);
-	unmap_sysmem(buf);
-	if (ret)
-		return CMD_RET_FAILURE;
-
-	debug("** Script length: %d\n", len);
-	return run_command_list(data, len, 0);
-}
-
-/**************************************************/
-#if defined(CONFIG_CMD_SOURCE)
 static int do_source(struct cmd_tbl *cmdtp, int flag, int argc,
 		     char *const argv[])
 {
@@ -199,7 +47,7 @@ static int do_source(struct cmd_tbl *cmdtp, int flag, int argc,
 	}
 
 	printf ("## Executing script at %08lx\n", addr);
-	rcode = image_source_script(addr, fit_uname);
+	rcode = cmd_source_script(addr, fit_uname);
 	return rcode;
 }
 
@@ -220,4 +68,3 @@ U_BOOT_CMD(
 	source, 2, 0,	do_source,
 	"run script from memory", source_help_text
 );
-#endif
diff --git a/common/command.c b/common/command.c
index 41c91c6d8c8..1f52a15bc12 100644
--- a/common/command.c
+++ b/common/command.c
@@ -13,7 +13,9 @@
 #include <command.h>
 #include <console.h>
 #include <env.h>
+#include <image.h>
 #include <log.h>
+#include <mapmem.h>
 #include <asm/global_data.h>
 #include <linux/ctype.h>
 
@@ -654,3 +656,20 @@ int cmd_process_error(struct cmd_tbl *cmdtp, int err)
 
 	return CMD_RET_SUCCESS;
 }
+
+int cmd_source_script(ulong addr, const char *fit_uname)
+{
+	char *data;
+	void *buf;
+	uint len;
+	int ret;
+
+	buf = map_sysmem(addr, 0);
+	ret = image_locate_script(buf, 0, fit_uname, &data, &len);
+	unmap_sysmem(buf);
+	if (ret)
+		return CMD_RET_FAILURE;
+
+	debug("** Script length: %d\n", len);
+	return run_command_list(data, len, 0);
+}
diff --git a/drivers/usb/gadget/f_sdp.c b/drivers/usb/gadget/f_sdp.c
index af4b167e17a..282c15ce21f 100644
--- a/drivers/usb/gadget/f_sdp.c
+++ b/drivers/usb/gadget/f_sdp.c
@@ -868,7 +868,7 @@ static int sdp_handle_in_ep(struct spl_image_info *spl_image,
 			jump_to_image_no_args(&spl_image);
 #else
 			/* In U-Boot, allow jumps to scripts */
-			image_source_script(sdp_func->jmp_address, "script@1");
+			cmd_source_script(sdp_func->jmp_address, "script@1");
 #endif
 		}
 
diff --git a/include/command.h b/include/command.h
index 966fd23c639..f32d41ccc34 100644
--- a/include/command.h
+++ b/include/command.h
@@ -279,6 +279,18 @@ int run_commandf(const char *fmt, ...);
  * Return: 0 on success, or != 0 on error.
  */
 int run_command_list(const char *cmd, int len, int flag);
+
+/**
+ * cmd_source_script() - Execute a script
+ *
+ * Executes a U-Boot script at a particular address in memory. The script should
+ * have a header (FIT or legacy) with the script type (IH_TYPE_SCRIPT).
+ *
+ * @addr: Address of script
+ * @fit_uname: FIT subimage name
+ * Return: result code (enum command_ret_t)
+ */
+int cmd_source_script(ulong addr, const char *fit_uname);
 #endif	/* __ASSEMBLY__ */
 
 /*
diff --git a/include/image.h b/include/image.h
index 375b9648e68..306d2528d74 100644
--- a/include/image.h
+++ b/include/image.h
@@ -708,18 +708,6 @@ int fit_image_load(struct bootm_headers *images, ulong addr,
 		   int arch, int image_ph_type, int bootstage_id,
 		   enum fit_load_op load_op, ulong *datap, ulong *lenp);
 
-/**
- * image_source_script() - Execute a script
- *
- * Executes a U-Boot script at a particular address in memory. The script should
- * have a header (FIT or legacy) with the script type (IH_TYPE_SCRIPT).
- *
- * @addr: Address of script
- * @fit_uname: FIT subimage name
- * Return: result code (enum command_ret_t)
- */
-int image_source_script(ulong addr, const char *fit_uname);
-
 /**
  * image_locate_script() - Locate the raw script in an image
  *
-- 
2.38.1.431.g37b22c650d-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
