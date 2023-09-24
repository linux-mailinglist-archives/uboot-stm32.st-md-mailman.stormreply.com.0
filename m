Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D04AC7ACBD6
	for <lists+uboot-stm32@lfdr.de>; Sun, 24 Sep 2023 22:40:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A07C6A5EA;
	Sun, 24 Sep 2023 20:40:27 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 168CBC65068
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 20:40:26 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3512f905f6cso6079865ab.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 13:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695588025; x=1696192825;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1PQfn3/7Yrwcrmwx/KLIYy9BH5dC3SzsUg6uxL6ytaE=;
 b=lf3FmG2n5dFiptw/tZWni53KfxvwK8eRUxsqWz1UFqbIabG00mvkG0ffxDyKG9XIbf
 0J8Wmzd3hHSGSJYERcg7e3Q6ILYtk0QWu7YqEfBnySqkXRfQGZ7W2TfKcXty4O+DGz84
 Z+zwyvhTJ7Zvk5RxR9FFKezzrx+zsRdpfl8f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695588025; x=1696192825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1PQfn3/7Yrwcrmwx/KLIYy9BH5dC3SzsUg6uxL6ytaE=;
 b=PeoRf74yhN5+bCvTD+7A8OHNbKo1UU59q5LJeMo/C3zOTyZo4R0YOa7T+U9dthpZUu
 yfW4r7WEbRWaR8QxJo5eFmSToh2639S6LlTdWr8ayjPM33c06n8/qqsgQydlvk1CNBIW
 VvtGiAOFsj0s7J8Q/7P6EDdGuvU8w3Jv3DcJqf80cOPzAWG2p9RUD4gqhjbuZfJY8j/W
 UcaYNVcZMYlZE4QF7db65tp/cDMLbNaXKdMt5K1+KpDO4MoyuBA++OCNfA1wMmVx4mMD
 Owf4vrN2nryvuBD4TloA9nuuSVBx1qagl1Zk/7ZMOaFPwiHwArUsqHlKiR4Ubus/Zwhe
 CIhg==
X-Gm-Message-State: AOJu0YxH4sK8GGKUp/Ao9I0YFS1NRkgR9+9w1udNWW7TcpG2eWG6BkAU
 ZX9LjthEbLHbs1LdoRZWafjAbQ==
X-Google-Smtp-Source: AGHT+IF6AcgDlNxTwLTye2qnzQqz7+V5/tX93qAKD2qgpc23WhAba7awt/uxjb/F2Ro60JLG4I1EJA==
X-Received: by 2002:a05:6e02:1bac:b0:34f:6f44:aec4 with SMTP id
 n12-20020a056e021bac00b0034f6f44aec4mr7593634ili.8.1695588024986; 
 Sun, 24 Sep 2023 13:40:24 -0700 (PDT)
Received: from sjg1.roam.corp.google.com (c-73-14-173-85.hsd1.co.comcast.net.
 [73.14.173.85]) by smtp.gmail.com with ESMTPSA id
 m11-20020a02cdcb000000b0043a1b74a0e3sm2311705jap.90.2023.09.24.13.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 13:40:24 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 24 Sep 2023 14:39:23 -0600
Message-ID: <20230924203953.1829820-6-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230924203953.1829820-1-sjg@chromium.org>
References: <20230924203953.1829820-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Michal Suchanek <msuchanek@suse.de>, Leo <ycliang@andestech.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Michael Walle <michael@walle.cc>, Stefano Babic <sbabic@denx.de>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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

Some commands assume that CONFIG_SYS_LONGHELP is always defined.
Declaration of long help should be bracketed by an #ifdef to avoid an
'unused variable' warning.

Fix this treewide.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-imx/cmd_dek.c                |  3 ++-
 arch/arm/mach-imx/cmd_mfgprot.c            |  3 ++-
 arch/arm/mach-imx/imx8/snvs_security_sc.c  | 10 ++++++++++
 arch/arm/mach-stm32mp/cmd_stm32key.c       |  2 ++
 board/freescale/common/cmd_esbc_validate.c |  3 ++-
 board/kontron/sl28/cmds.c                  |  2 ++
 cmd/adc.c                                  |  2 ++
 cmd/arm/exception.c                        |  2 ++
 cmd/arm/exception64.c                      |  2 ++
 cmd/axi.c                                  |  2 ++
 cmd/blob.c                                 |  2 ++
 cmd/cyclic.c                               |  2 ++
 cmd/mux.c                                  |  2 ++
 cmd/osd.c                                  |  2 ++
 cmd/pcap.c                                 |  2 ++
 cmd/riscv/exception.c                      |  2 ++
 cmd/sandbox/exception.c                    |  2 ++
 cmd/scp03.c                                |  2 ++
 cmd/wdt.c                                  |  2 ++
 cmd/x86/exception.c                        |  2 ++
 20 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
index 6fa5b41fcd38..25ea7d3b37da 100644
--- a/arch/arm/mach-imx/cmd_dek.c
+++ b/arch/arm/mach-imx/cmd_dek.c
@@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, int flag, int argc,
 	return blob_encap_dek(src_addr, dst_addr, len);
 }
 
-/***************************************************/
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char dek_blob_help_text[] =
 	"src dst len            - Encapsulate and create blob of data\n"
 	"                         $len bits long at address $src and\n"
 	"                         store the result at address $dst.\n";
+#endif
 
 U_BOOT_CMD(
 	dek_blob, 4, 1, do_dek_blob,
diff --git a/arch/arm/mach-imx/cmd_mfgprot.c b/arch/arm/mach-imx/cmd_mfgprot.c
index 9576b48dde30..bf19f80dde9b 100644
--- a/arch/arm/mach-imx/cmd_mfgprot.c
+++ b/arch/arm/mach-imx/cmd_mfgprot.c
@@ -133,13 +133,14 @@ free_m:
 	return ret;
 }
 
-/***************************************************/
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char mfgprot_help_text[] =
 	"Usage:\n"
 	 "Print the public key for Manufacturing Protection\n"
 	 "\tmfgprot pubk\n"
 	 "Generates a Manufacturing Protection signature\n"
 	 "\tmfgprot sign <data_addr> <size>";
+#endif
 
 U_BOOT_CMD(
 	mfgprot, 4, 1, do_mfgprot,
diff --git a/arch/arm/mach-imx/imx8/snvs_security_sc.c b/arch/arm/mach-imx/imx8/snvs_security_sc.c
index 1eaa68f8d5ff..e14727d7ca0b 100644
--- a/arch/arm/mach-imx/imx8/snvs_security_sc.c
+++ b/arch/arm/mach-imx/imx8/snvs_security_sc.c
@@ -598,6 +598,7 @@ exit:
 }
 #endif /* CONFIG_IMX_SNVS_SEC_SC_AUTO */
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char snvs_cfg_help_text[] =
 	"snvs_cfg\n"
 	"\thp.lock\n"
@@ -620,6 +621,7 @@ static char snvs_cfg_help_text[] =
 	"\tlp.act_tamper_routing_ctl2\n"
 	"\n"
 	"ALL values should be in hexadecimal format";
+#endif
 
 #define NB_REGISTERS 18
 static int do_snvs_cfg(struct cmd_tbl *cmdtp, int flag, int argc,
@@ -663,6 +665,7 @@ U_BOOT_CMD(snvs_cfg,
 	   snvs_cfg_help_text
 );
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char snvs_dgo_cfg_help_text[] =
 	"snvs_dgo_cfg\n"
 	"\ttamper_offset_ctl\n"
@@ -673,6 +676,7 @@ static char snvs_dgo_cfg_help_text[] =
 	"\ttamper_core_volt_mon_ctl\n"
 	"\n"
 	"ALL values should be in hexadecimal format";
+#endif
 
 static int do_snvs_dgo_cfg(struct cmd_tbl *cmdtp, int flag, int argc,
 			   char *const argv[])
@@ -703,12 +707,14 @@ U_BOOT_CMD(snvs_dgo_cfg,
 	   snvs_dgo_cfg_help_text
 );
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char tamper_pin_cfg_help_text[] =
 	"snvs_dgo_cfg\n"
 	"\tpad\n"
 	"\tvalue\n"
 	"\n"
 	"ALL values should be in hexadecimal format";
+#endif
 
 static int do_tamper_pin_cfg(struct cmd_tbl *cmdtp, int flag, int argc,
 			     char *const argv[])
@@ -735,6 +741,7 @@ U_BOOT_CMD(tamper_pin_cfg,
 	   tamper_pin_cfg_help_text
 );
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char snvs_clear_status_help_text[] =
 	"snvs_clear_status\n"
 	"\tHPSR\n"
@@ -744,6 +751,7 @@ static char snvs_clear_status_help_text[] =
 	"\n"
 	"Write the status registers with the value provided,"
 	" clearing the status";
+#endif
 
 static int do_snvs_clear_status(struct cmd_tbl *cmdtp, int flag, int argc,
 				char *const argv[])
@@ -779,9 +787,11 @@ U_BOOT_CMD(snvs_clear_status,
 	   snvs_clear_status_help_text
 );
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char snvs_sec_status_help_text[] =
 	"snvs_sec_status\n"
 	"Display information about the security related to tamper and secvio";
+#endif
 
 static int do_snvs_sec_status(struct cmd_tbl *cmdtp, int flag, int argc,
 			      char *const argv[])
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 85be8e23bdba..0f27fa128148 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -419,12 +419,14 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
 	return CMD_RET_SUCCESS;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char stm32key_help_text[] =
 	"list : list the supported key with description\n"
 	"stm32key select [<key>] : Select the key identified by <key> or display the key used for read/fuse command\n"
 	"stm32key read [<addr> | -a ] : Read the curent key at <addr> or current / all (-a) key in OTP\n"
 	"stm32key fuse [-y] <addr> : Fuse the current key at addr in OTP\n"
 	"stm32key close [-y] : Close the device\n";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Manage key on STM32", stm32key_help_text,
 	U_BOOT_SUBCMD_MKENT(list, 1, 0, do_stm32key_list),
diff --git a/board/freescale/common/cmd_esbc_validate.c b/board/freescale/common/cmd_esbc_validate.c
index 6c096266b484..e678a5768117 100644
--- a/board/freescale/common/cmd_esbc_validate.c
+++ b/board/freescale/common/cmd_esbc_validate.c
@@ -62,7 +62,7 @@ static int do_esbc_validate(struct cmd_tbl *cmdtp, int flag, int argc,
 	return 0;
 }
 
-/***************************************************/
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char esbc_validate_help_text[] =
 	"esbc_validate hdr_addr <hash_val> - Validates signature using\n"
 	"                          RSA verification\n"
@@ -71,6 +71,7 @@ static char esbc_validate_help_text[] =
 	"                          $hash_val -Optional\n"
 	"                          It provides Hash of public/srk key to be\n"
 	"                          used to verify signature.\n";
+#endif
 
 U_BOOT_CMD(
 	esbc_validate,	3,	0,	do_esbc_validate,
diff --git a/board/kontron/sl28/cmds.c b/board/kontron/sl28/cmds.c
index 08a22b5d01e0..c83f3245d5f8 100644
--- a/board/kontron/sl28/cmds.c
+++ b/board/kontron/sl28/cmds.c
@@ -171,8 +171,10 @@ out:
 	return CMD_RET_FAILURE;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char sl28_help_text[] =
 	"nvm [<hex>] - display/set the 16 non-volatile bits\n";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(sl28, "SMARC-sAL28 specific", sl28_help_text,
 			U_BOOT_SUBCMD_MKENT(nvm, 2, 1, do_sl28_nvm));
diff --git a/cmd/adc.c b/cmd/adc.c
index a739d9e46411..ffd112581797 100644
--- a/cmd/adc.c
+++ b/cmd/adc.c
@@ -152,11 +152,13 @@ static int do_adc_scan(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char adc_help_text[] =
 	"list - list ADC devices\n"
 	"adc info <name> - Get ADC device info\n"
 	"adc single <name> <channel> [varname] - Get Single data of ADC device channel\n"
 	"adc scan <name> [channel mask] - Scan all [or masked] ADC channels";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(adc, "ADC sub-system", adc_help_text,
 	U_BOOT_SUBCMD_MKENT(list, 1, 1, do_adc_list),
diff --git a/cmd/arm/exception.c b/cmd/arm/exception.c
index 522f6dff53f2..6f2cdfe17346 100644
--- a/cmd/arm/exception.c
+++ b/cmd/arm/exception.c
@@ -50,6 +50,7 @@ static struct cmd_tbl cmd_sub[] = {
 			 "", ""),
 };
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char exception_help_text[] =
 	"<ex>\n"
 	"  The following exceptions are available:\n"
@@ -57,5 +58,6 @@ static char exception_help_text[] =
 	"  unaligned  - data abort\n"
 	"  undefined  - undefined instruction\n"
 	;
+#endif
 
 #include <exception.h>
diff --git a/cmd/arm/exception64.c b/cmd/arm/exception64.c
index 589a23115b04..6afe5e2ab5b6 100644
--- a/cmd/arm/exception64.c
+++ b/cmd/arm/exception64.c
@@ -78,6 +78,7 @@ static struct cmd_tbl cmd_sub[] = {
 			 "", ""),
 };
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char exception_help_text[] =
 	"<ex>\n"
 	"  The following exceptions are available:\n"
@@ -85,5 +86,6 @@ static char exception_help_text[] =
 	"  unaligned  - unaligned LDAR data abort\n"
 	"  undefined  - undefined instruction exception\n"
 	;
+#endif
 
 #include <exception.h>
diff --git a/cmd/axi.c b/cmd/axi.c
index b97b43eb7d01..272fc6131f07 100644
--- a/cmd/axi.c
+++ b/cmd/axi.c
@@ -344,11 +344,13 @@ static int do_ihs_axi(struct cmd_tbl *cmdtp, int flag, int argc,
 		return CMD_RET_USAGE;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char axi_help_text[] =
 	"bus  - show AXI bus info\n"
 	"axi dev [bus] - show or set current AXI bus to bus number [bus]\n"
 	"axi md size addr [# of objects] - read from AXI device at address [addr] and data width [size] (one of 8, 16, 32)\n"
 	"axi mw size addr value [count] - write data [value] to AXI device at address [addr] and data width [size] (one of 8, 16, 32)\n";
+#endif
 
 U_BOOT_CMD(axi, 7, 1, do_ihs_axi,
 	   "AXI sub-system",
diff --git a/cmd/blob.c b/cmd/blob.c
index 7c77c410d528..70b0df1114ba 100644
--- a/cmd/blob.c
+++ b/cmd/blob.c
@@ -99,6 +99,7 @@ static int do_blob(struct cmd_tbl *cmdtp, int flag, int argc,
 }
 
 /***************************************************/
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char blob_help_text[] =
 	"enc src dst len km - Encapsulate and create blob of data\n"
 	"                          $len bytes long at address $src and\n"
@@ -116,6 +117,7 @@ static char blob_help_text[] =
 	"                          The modifier is required for generation\n"
 	"                          /use as key for cryptographic operation.\n"
 	"                          Key modifier should be 16 byte long.\n";
+#endif
 
 U_BOOT_CMD(
 	blob, 6, 1, do_blob,
diff --git a/cmd/cyclic.c b/cmd/cyclic.c
index 946f1d78184d..789eba4eb046 100644
--- a/cmd/cyclic.c
+++ b/cmd/cyclic.c
@@ -76,9 +76,11 @@ static int do_cyclic_list(struct cmd_tbl *cmdtp, int flag, int argc,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char cyclic_help_text[] =
 	"demo <cycletime_ms> <delay_us> - register cyclic demo function\n"
 	"cyclic list - list cyclic functions\n";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(cyclic, "Cyclic", cyclic_help_text,
 	U_BOOT_SUBCMD_MKENT(demo, 3, 1, do_cyclic_demo),
diff --git a/cmd/mux.c b/cmd/mux.c
index c75907af7726..d20a151948dc 100644
--- a/cmd/mux.c
+++ b/cmd/mux.c
@@ -173,10 +173,12 @@ static int do_mux_deselect(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char mux_help_text[] =
 	"list - List all Muxes and their states\n"
 	"select <chip> <id> <state> - Select the given mux state\n"
 	"deselect <chip> <id> - Deselect the given mux and reset it to its idle state";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(mux, "List, select, and deselect muxes", mux_help_text,
 			U_BOOT_SUBCMD_MKENT(list, 1, 1, do_mux_list),
diff --git a/cmd/osd.c b/cmd/osd.c
index c8c62d4a2ab3..9cf7cc91b283 100644
--- a/cmd/osd.c
+++ b/cmd/osd.c
@@ -278,12 +278,14 @@ static int do_osd(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 		return CMD_RET_USAGE;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char osd_help_text[] =
 	"show  - show OSD info\n"
 	"osd dev [dev] - show or set current OSD\n"
 	"write [pos_x] [pos_y] [buffer] [count] - write 8-bit hex encoded buffer to osd memory at a given position\n"
 	"print [pos_x] [pos_y] [color] [text] - write ASCII buffer (given by text data and driver-specific color information) to osd memory\n"
 	"size [size_x] [size_y] - set OSD XY size in characters\n";
+#endif
 
 U_BOOT_CMD(
 	osd, 6, 1, do_osd,
diff --git a/cmd/pcap.c b/cmd/pcap.c
index ab5c1a7e8737..ac09a0756102 100644
--- a/cmd/pcap.c
+++ b/cmd/pcap.c
@@ -48,6 +48,7 @@ static int do_pcap_clear(struct cmd_tbl *cmdtp, int flag, int argc,
 	return pcap_clear() ? CMD_RET_FAILURE : CMD_RET_SUCCESS;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char pcap_help_text[] =
 	"- network packet capture\n\n"
 	"pcap\n"
@@ -61,6 +62,7 @@ static char pcap_help_text[] =
 	"\t<addr>: user address to which pcap will be stored (hexedcimal)\n"
 	"\t<max_size>: Maximum size of pcap file (decimal)\n"
 	"\n";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(pcap, "pcap", pcap_help_text,
 			U_BOOT_SUBCMD_MKENT(init, 3, 0, do_pcap_init),
diff --git a/cmd/riscv/exception.c b/cmd/riscv/exception.c
index 7a08061d1203..f71d3e3252d7 100644
--- a/cmd/riscv/exception.c
+++ b/cmd/riscv/exception.c
@@ -43,6 +43,7 @@ static struct cmd_tbl cmd_sub[] = {
 			 "", ""),
 };
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char exception_help_text[] =
 	"<ex>\n"
 	"  The following exceptions are available:\n"
@@ -50,5 +51,6 @@ static char exception_help_text[] =
 	"  undefined - illegal instruction\n"
 	"  unaligned - load address misaligned\n"
 	;
+#endif
 
 #include <exception.h>
diff --git a/cmd/sandbox/exception.c b/cmd/sandbox/exception.c
index 1aa1d673aed4..7837f5de285f 100644
--- a/cmd/sandbox/exception.c
+++ b/cmd/sandbox/exception.c
@@ -31,11 +31,13 @@ static struct cmd_tbl cmd_sub[] = {
 			 "", ""),
 };
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char exception_help_text[] =
 	"<ex>\n"
 	"  The following exceptions are available:\n"
 	"  undefined  - undefined instruction\n"
 	"  sigsegv    - illegal memory access\n"
 	;
+#endif
 
 #include <exception.h>
diff --git a/cmd/scp03.c b/cmd/scp03.c
index 216c942dd48b..611112059a43 100644
--- a/cmd/scp03.c
+++ b/cmd/scp03.c
@@ -41,10 +41,12 @@ int do_scp03_provision(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char text[] =
 	"provides a command to enable SCP03 and provision the SCP03 keys\n"
 	" enable    - enable SCP03 on the TEE\n"
 	" provision - provision SCP03 on the TEE\n";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(scp03, "Secure Channel Protocol 03 control", text,
 	U_BOOT_SUBCMD_MKENT(enable, 1, 1, do_scp03_enable),
diff --git a/cmd/wdt.c b/cmd/wdt.c
index 27410981e7bf..255dfc0b0ffd 100644
--- a/cmd/wdt.c
+++ b/cmd/wdt.c
@@ -157,6 +157,7 @@ static int do_wdt_expire(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char wdt_help_text[] =
 	"list - list watchdog devices\n"
 	"wdt dev [<name>] - get/set current watchdog device\n"
@@ -164,6 +165,7 @@ static char wdt_help_text[] =
 	"wdt stop - stop watchdog timer\n"
 	"wdt reset - reset watchdog timer\n"
 	"wdt expire [flags] - expire watchdog timer immediately\n";
+#endif
 
 U_BOOT_CMD_WITH_SUBCMDS(wdt, "Watchdog sub-system", wdt_help_text,
 	U_BOOT_SUBCMD_MKENT(list, 1, 1, do_wdt_list),
diff --git a/cmd/x86/exception.c b/cmd/x86/exception.c
index 82faaa913e5c..8f2f6c135952 100644
--- a/cmd/x86/exception.c
+++ b/cmd/x86/exception.c
@@ -20,10 +20,12 @@ static struct cmd_tbl cmd_sub[] = {
 			 "", ""),
 };
 
+#if IS_ENABLED(CONFIG_SYS_LONGHELP)
 static char exception_help_text[] =
 	"<ex>\n"
 	"  The following exceptions are available:\n"
 	"  undefined  - undefined instruction\n"
 	;
+#endif
 
 #include <exception.h>
-- 
2.42.0.515.g380fc7ccd1-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
