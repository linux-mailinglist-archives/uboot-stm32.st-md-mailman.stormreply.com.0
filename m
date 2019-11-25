Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E31089B3
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 09:07:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02A3BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 08:07:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5455C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:07:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP7vIHn017840; Mon, 25 Nov 2019 09:07:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DHrtWunab0xWeKCp6le2+yjqeXa4w+vFXTm1X3xi1+g=;
 b=VgsaVupRaoZL2maKJY0Zk5dSDRYMDRQnmZWKrb8URvWMiMdN7rTYGZnFE8Y1n/pwxTbs
 QJsf2RPN8umtSKIU39NH664l3slyerrsyw31wsH2fbQQHQCxxPJzm8GLssqLDqh+a6pm
 CJRkucK92SGQLBGAh5LhPugX2voAVcsG9XV1IvsPT5R0K4bxZtRpHzIwU8ZDY7Seg8Wq
 o3aEBBdu/H80JZyC+YGkj/yAJQkH3C5ZYO3Jy9vgdNXSG+J0ScbHH+l1D/2WfJpuQzGV
 v7guo2vM/yqv+UlRlDTJRlJ0Cs9eAyL0fSTQ4cDO0w29NhmVpRDYcUucAmAhRx8msjCe Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9fu8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:07:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C38B10002A;
 Mon, 25 Nov 2019 09:07:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F388F2AC062;
 Mon, 25 Nov 2019 09:07:49 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 09:07:49 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 09:07:40 +0100
Message-ID: <20191125080741.2215-6-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125080741.2215-1-patrice.chotard@st.com>
References: <20191125080741.2215-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 5/6] cmd: sysboot: Fix checkpatch
	WARNING/CHECK
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

Fix checkpatch WARNING and CHECK issues

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 cmd/sysboot.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/cmd/sysboot.c b/cmd/sysboot.c
index 965799a1cb..793d67d2f5 100644
--- a/cmd/sysboot.c
+++ b/cmd/sysboot.c
@@ -79,20 +79,20 @@ static int do_sysboot(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 		pxefile_addr_str = argv[4];
 	}
 
-	if (argc < 6)
+	if (argc < 6) {
 		filename = env_get("bootfile");
-	else {
+	} else {
 		filename = argv[5];
 		env_set("bootfile", filename);
 	}
 
-	if (strstr(argv[3], "ext2"))
+	if (strstr(argv[3], "ext2")) {
 		do_getfile = do_get_ext2;
-	else if (strstr(argv[3], "fat"))
+	} else if (strstr(argv[3], "fat")) {
 		do_getfile = do_get_fat;
-	else if (strstr(argv[3], "any"))
+	} else if (strstr(argv[3], "any")) {
 		do_getfile = do_get_any;
-	else {
+	} else {
 		printf("Invalid filesystem: %s\n", argv[3]);
 		return 1;
 	}
@@ -111,7 +111,7 @@ static int do_sysboot(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 
 	cfg = parse_pxefile(cmdtp, pxefile_addr_r);
 
-	if (cfg == NULL) {
+	if (!cfg) {
 		printf("Error parsing config file\n");
 		return 1;
 	}
@@ -126,10 +126,9 @@ static int do_sysboot(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 	return 0;
 }
 
-U_BOOT_CMD(
-	sysboot, 7, 1, do_sysboot,
-	"command to get and boot from syslinux files",
-	"[-p] <interface> <dev[:part]> <ext2|fat|any> [addr] [filename]\n"
-	"    - load and parse syslinux menu file 'filename' from ext2, fat\n"
-	"      or any filesystem on 'dev' on 'interface' to address 'addr'"
+U_BOOT_CMD(sysboot, 7, 1, do_sysboot,
+	   "command to get and boot from syslinux files",
+	   "[-p] <interface> <dev[:part]> <ext2|fat|any> [addr] [filename]\n"
+	   "    - load and parse syslinux menu file 'filename' from ext2, fat\n"
+	   "      or any filesystem on 'dev' on 'interface' to address 'addr'"
 );
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
