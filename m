Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7A38799F
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BE39C5978D;
	Tue, 18 May 2021 13:12:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FECBC58D5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ID6jcJ016744; Tue, 18 May 2021 15:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=UJxYODCbOFxBIFdfEo14/7YijiNM3Yns46fY+Wp4gLg=;
 b=sdeBKT6fvCBe1HS5ScmlVA4dPzAdSkjgTO1dq8DoXJl1H/waSSudzPhcSaIg3ysDuHvY
 SFp4OLqs7jvXkIS1JHgf37ioxIb5sQ29etXAyNf+XEMCMmVuz4I83kMZaow5hzEr1Y8S
 AVbLM/3L0OecFfDe9YoRENporMSCGKlyIEJCvtTf9B2MX01iuhWM7DLSt5ms3rosFo2f
 Rw26cOy5UDXafyYGrtL13cko0FkLFLtIE8NJyooL72Kjc0M/iNCEBc4Ix8Sx0fMi8tdm
 sIqq3hfS1wj6aloYHX1UO7B5yIfEGDVK5re1Lb2+enpSNEWVBz33JNj/9lIPWU4wHppu 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38mda9gcay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF82810002A;
 Tue, 18 May 2021 15:12:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3DA72275E0;
 Tue, 18 May 2021 15:12:19 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:19
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:06 +0200
Message-ID: <20210518151206.3.I6f9c5a83cfe16a49ab3f724cc0be3b59f4bcd05c@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrick
 Delaunay <patrick.delaunay@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 03/10] stm32mp: stm32prog: add support of
	initrd in flashlayout
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

Add the support in command stm32prog of kernel load and start
with initrd file, identify by the partition Type "Binary" in
the flashlayout.tsv, for example:

- 0x01 fsbl	Binary none 0x0 tfa.stm32
- 0x03 fip	Binary none 0x0 fip.bin
P 0x10 kernel System ram0 0xC2000000 uImage.bin
P 0x11 dtb FileSystem ram0 0xC4000000 board.dtb
P 0x12 initrd Binary ram0 0xC4400000 <initrd>

The <initrd> file can be a legacy image "uInitrd", generated
with mkimage, or a RAW initrd image "initrd.gz".

After a DFU detach the bootm command with be executed
with the associated address, for example:

$> bootm 0xC2000000 0xC4400000:<size> 0xC4000000

When the "Binary" partition type is absent, the 'bootm'
command starts the kernel without ramdisk, for example:

$> bootm 0xC2000000 - 0xC4000000

With this paths, it is no more mandatory to generate FIT
including the kernel, DT and initrd:

- 0x01 fsbl Binary none 0x0 tfa.stm32
- 0x03 fip Binary none 0x0 fip.bin
P 0x10 fit System ram0 0xC2000000 fit.bin

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../cmd_stm32prog/cmd_stm32prog.c             | 22 +++++++++++++------
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 10 ++++++---
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  2 ++
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index e36501a86b..e584bb52bd 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -45,7 +45,6 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 	bool reset = false;
 	struct image_header_s header;
 	struct stm32prog_data *data;
-	u32 uimage, dtb;
 
 	if (argc < 3 ||  argc > 5)
 		return CMD_RET_USAGE;
@@ -119,21 +118,23 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		goto cleanup;
 	}
 
-	uimage = data->uimage;
-	dtb = data->dtb;
-
 	stm32prog_clean(data);
 	free(stm32prog_data);
 	stm32prog_data = NULL;
 
 	puts("Download done\n");
 
-	if (uimage) {
+	if (data->uimage) {
 		char boot_addr_start[20];
 		char dtb_addr[20];
+		char initrd_addr[40];
 		char *bootm_argv[5] = {
 			"bootm", boot_addr_start, "-", dtb_addr, NULL
 		};
+		u32 uimage = data->uimage;
+		u32 dtb = data->dtb;
+		u32 initrd = data->initrd;
+
 		if (!dtb)
 			bootm_argv[3] = env_get("fdtcontroladdr");
 		else
@@ -142,8 +143,15 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 
 		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
 			 "0x%x", uimage);
-		printf("Booting kernel at %s - %s...\n\n\n",
-		       boot_addr_start, bootm_argv[3]);
+
+		if (initrd) {
+			snprintf(initrd_addr, sizeof(initrd_addr) - 1, "0x%x:0x%x",
+				 initrd, data->initrd_size);
+			bootm_argv[2] = initrd_addr;
+		}
+
+		printf("Booting kernel at %s %s %s...\n\n\n",
+		       boot_addr_start, bootm_argv[2], bootm_argv[3]);
 		/* Try bootm for legacy and FIT format image */
 		if (genimg_get_format((void *)uimage) != IMAGE_FORMAT_INVALID)
 			do_bootm(cmdtp, 0, 4, bootm_argv);
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 84b880261a..ea69d5dd16 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1473,7 +1473,7 @@ error:
 	return ret;
 }
 
-static void stm32prog_end_phase(struct stm32prog_data *data)
+static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
 {
 	if (data->phase == PHASE_FLASHLAYOUT) {
 		if (parse_flash_layout(data, STM32_DDR_BASE, 0))
@@ -1489,6 +1489,10 @@ static void stm32prog_end_phase(struct stm32prog_data *data)
 			data->uimage = data->cur_part->addr;
 		if (data->cur_part->part_type == PART_FILESYSTEM)
 			data->dtb = data->cur_part->addr;
+		if (data->cur_part->part_type == PART_BINARY) {
+			data->initrd = data->cur_part->addr;
+			data->initrd_size = offset;
+		}
 	}
 
 	if (CONFIG_IS_ENABLED(MMC) &&
@@ -1747,7 +1751,7 @@ void dfu_flush_callback(struct dfu_entity *dfu)
 	if (dfu->dev_type == DFU_DEV_RAM) {
 		if (dfu->alt == 0 &&
 		    stm32prog_data->phase == PHASE_FLASHLAYOUT) {
-			stm32prog_end_phase(stm32prog_data);
+			stm32prog_end_phase(stm32prog_data, dfu->offset);
 			/* waiting DFU DETACH for reenumeration */
 		}
 	}
@@ -1756,7 +1760,7 @@ void dfu_flush_callback(struct dfu_entity *dfu)
 		return;
 
 	if (dfu->alt == stm32prog_data->cur_part->alt_id) {
-		stm32prog_end_phase(stm32prog_data);
+		stm32prog_end_phase(stm32prog_data, dfu->offset);
 		stm32prog_next_phase(stm32prog_data);
 	}
 }
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index ad404879a7..efb51a3022 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -142,6 +142,8 @@ struct stm32prog_data {
 	/* bootm information */
 	u32	uimage;
 	u32	dtb;
+	u32	initrd;
+	u32	initrd_size;
 };
 
 extern struct stm32prog_data *stm32prog_data;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
