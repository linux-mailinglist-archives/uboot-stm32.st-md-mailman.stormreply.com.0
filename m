Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4224E9D78
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 19:26:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F4012C6046A;
	Mon, 28 Mar 2022 17:26:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76931C6046A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:26:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDdXKC008198;
 Mon, 28 Mar 2022 19:26:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=/p5xXIzO5hlO4BsNO9Jj3DBaZSMVkmL3e3RBazNWTBg=;
 b=z+MMnOgGFJpfMbEwEcTp6ANRmRube6vGl8nMgk537fybMggf6D1Tu4qy1v+THIzdo0A6
 cbXs6a7nCiZKqSLNfHnQ/3mfc/gENW2XMarXw3mUSrHkHXL5Cl0jkqe+BQdXYfJKpz0h
 Onhtvo9aNvKVvhRRROsCf913qYqwRaJYEsDxeX1AvvJHVg4PWqPHRnAgJ+6X7Srax6J3
 MhDqTbh19b45pGhSOdBsIWPVh5EDvYY1hF2FJB37obDrJ999AgH7f/DjN1ia62I55zsP
 swfkxPay+ug8LZ/aTPmarq3Bv68zH5yyxw3PxnFocpFkV3XpSYPBBmNcTDjOTEJq3tla 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1rud4g10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 19:26:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8014810002A;
 Mon, 28 Mar 2022 19:26:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79C1E237D8C;
 Mon, 28 Mar 2022 19:26:42 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 19:26:41
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 19:25:32 +0200
Message-ID: <20220328192520.7.I08598ebf2b427ac25eaf56e05799ac8d2dc42947@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_08,2022-03-28_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 7/8] stm32mp: stm32prog: handle U-Boot script
	in flashlayout alternate
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

Update the stm32prog command to allow the reception of U-Boot script in
the FlashLayout alternate during the first USB enumeration.

This patch is aligned with the last TF-A behavior: the Flashlayout
is now loaded by U-Boot; it is no more present at STM32_DDR_BASE when
the stm32prog is launched after a serial boot, on UART or on USB.

The received script must be a U-Boot legacy image, no more need to add
a stm32image header.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 9 ++-------
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 9 +++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     | 2 ++
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 3957e06e5d..f59414e716 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -76,13 +76,6 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		stm32prog_header_check(addr, &header);
 		if (header.type == HEADER_STM32IMAGE) {
 			size = header.image_length + header.length;
-
-#if defined(CONFIG_LEGACY_IMAGE_FORMAT)
-			/* uImage detected in STM32IMAGE, execute the script */
-			if (IMAGE_FORMAT_LEGACY ==
-			    genimg_get_format((void *)(addr + header.length)))
-				return image_source_script(addr + header.length, "script@1");
-#endif
 		}
 	}
 
@@ -160,6 +153,8 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		else if (CONFIG_IS_ENABLED(CMD_BOOTZ))
 			do_bootz(cmdtp, 0, 4, bootm_argv);
 	}
+	if (data->script)
+		image_source_script(data->script, "script@stm32prog");
 
 	if (reset) {
 		puts("Reset...\n");
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index d3b3e1ed72..65655e25ca 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -6,6 +6,7 @@
 #include <command.h>
 #include <console.h>
 #include <dfu.h>
+#include <image.h>
 #include <malloc.h>
 #include <misc.h>
 #include <mmc.h>
@@ -1697,6 +1698,14 @@ error:
 static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
 {
 	if (data->phase == PHASE_FLASHLAYOUT) {
+#if defined(CONFIG_LEGACY_IMAGE_FORMAT)
+		if (genimg_get_format((void *)STM32_DDR_BASE) == IMAGE_FORMAT_LEGACY) {
+			data->script = STM32_DDR_BASE;
+			data->phase = PHASE_END;
+			log_notice("U-Boot script received\n");
+			return;
+		}
+#endif
 		if (parse_flash_layout(data, STM32_DDR_BASE, 0))
 			stm32prog_err("Layout: invalid FlashLayout");
 		return;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index b3e5c74810..ac300768ca 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -170,6 +170,8 @@ struct stm32prog_data {
 	u32	initrd;
 	u32	initrd_size;
 
+	u32	script;
+
 	/* OPTEE PTA NVMEM */
 	struct udevice *tee;
 	u32 tee_session;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
