Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E450ED12E9
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 17:37:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF90DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 15:37:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ED6CC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 15:37:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99FawPa011750; Wed, 9 Oct 2019 17:37:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tOBTwXs3sQB1xAiX4LmYkiuBuSZ8s9YohqI4BiDZEmw=;
 b=R359+imO3h1EBjcI4y3djN/ZrekgEYEHNL1tuVfvvAWXEyMWk9ozzNNb9J7Ff7lF2wk2
 t4dpDHCwFOnlWUQBwIa52QSOWBqHV41oV9m2T/7Z6w7nfGJ1MONb29+uTUvdaa40PAp4
 srTRF4L7SuaWtyoYfrf+QZCuqIg9rAitnzA5jCjom+5VTJqg7lk2zHX93VpXTnO8tflf
 ixDL22eYQ7N0HKm5mKPtrB8Cu+5H8qUiOl7/eUr9EDirKAEKliknX+Rju9o391f244XJ
 wBYnqI5aLamylqtPKkwte/UX24OSB/cqUHomLC4QuZycGgWjKnH6I+jbCpTCQG9XaJMh Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn0xtpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 17:37:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFB96100039;
 Wed,  9 Oct 2019 17:36:44 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D589D2A56A6;
 Wed,  9 Oct 2019 17:36:44 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 17:36:44 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 17:36:44
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>
Date: Wed, 9 Oct 2019 17:36:28 +0200
Message-ID: <1570635389-8445-5-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_07:2019-10-08,2019-10-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 4/5] stm32mp1: Fixup the Linux DeviceTree with
	coprocessor information
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

When the coprocessor has been started, provide the context to Linux
kernel so it can handle it:
- update the coprocessor node of kernel DeviceTree with the
  "early-booted" property.
- write the resource table address in a dedicated backup register.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 board/st/stm32mp1/stm32mp1.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 18f9b84..8c669d0 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -891,6 +891,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, bd_t *bd)
 {
+	int off, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
 #ifdef CONFIG_FDT_FIXUP_PARTITIONS
 	struct node_info nodes[] = {
 		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
@@ -899,6 +900,17 @@ int ft_board_setup(void *blob, bd_t *bd)
 	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
 #endif
 
+	/* Update DT if coprocessor started */
+	off = fdt_path_offset(blob, "/mlahb/m4@10000000");
+	if (off > 0) {
+		if (!rproc_is_running(id)) {
+			fdt_setprop_empty(blob, off, "early-booted");
+		} else {
+			fdt_delprop(blob, off, "early-booted");
+			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
+		}
+	}
+
 	return 0;
 }
 #endif
@@ -918,10 +930,8 @@ static void board_copro_image_process(ulong fw_image, size_t fw_size)
 	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
 	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
 
-	if (!ret) {
+	if (!ret)
 		rproc_start(id);
-		env_set("copro_state", "booted");
-	}
 }
 
 U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
