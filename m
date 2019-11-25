Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EF01089B9
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 09:07:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4832EC36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 08:07:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCD21C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:07:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP7vIHp017840; Mon, 25 Nov 2019 09:07:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=OunMRvs0Kn35H9nymmyg4q1RkJeU3Ph1wS1r3Qgf6rQ=;
 b=DDLfjklXRe21sttuGhXMHFqHAdMzkVxphmif6shgoZ+gV7trXI2hxPdWVXf/hrHoRBP0
 SVagyVjtGoDrsbRu4wUml2cI9n5nB9QRNUYuCJWF3ZhsqRW7oO/sEOOPHj3n7WkE+rF+
 8B6duyg8ZRMG39y2rm4M34Mz7KsupbunUBSONCuxa7x2g19CAU+gUefh09wZV3FYxcXb
 jehb7YJpSH/DlnFXsUYL7qxawHpLY5Z6wcsLPBAo+z8/N/mZJbKxy8PQ7El+wYfb0ltr
 XpJLTkWAlMnWCCg0GHUXuhN7HvG5V7kVhYjw6DnC062wvOrMaQCpPLr7oEX+R8reKJwn XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9fu8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:07:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B43C4100038;
 Mon, 25 Nov 2019 09:07:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7BF52AC062;
 Mon, 25 Nov 2019 09:07:50 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 09:07:50 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 09:07:41 +0100
Message-ID: <20191125080741.2215-7-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125080741.2215-1-patrice.chotard@st.com>
References: <20191125080741.2215-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 6/6] cmd: pxe: Fix checkpatch WARNING/CHECK
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

 cmd/pxe.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/cmd/pxe.c b/cmd/pxe.c
index 757e186d32..ca1e1b188b 100644
--- a/cmd/pxe.c
+++ b/cmd/pxe.c
@@ -67,7 +67,7 @@ do_pxe_get(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 		return 1;
 
 	err = strict_strtoul(pxefile_addr_str, 16,
-				(unsigned long *)&pxefile_addr_r);
+			     (unsigned long *)&pxefile_addr_r);
 	if (err < 0)
 		return 1;
 
@@ -129,7 +129,7 @@ do_pxe_boot(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 
 	cfg = parse_pxefile(cmdtp, pxefile_addr_r);
 
-	if (cfg == NULL) {
+	if (!cfg) {
 		printf("Error parsing config file\n");
 		return 1;
 	}
@@ -169,10 +169,9 @@ static int do_pxe(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 	return CMD_RET_USAGE;
 }
 
-U_BOOT_CMD(
-	pxe, 3, 1, do_pxe,
-	"commands to get and boot from pxe files",
-	"get - try to retrieve a pxe file using tftp\npxe "
-	"boot [pxefile_addr_r] - boot from the pxe file at pxefile_addr_r\n"
+U_BOOT_CMD(pxe, 3, 1, do_pxe,
+	   "commands to get and boot from pxe files",
+	   "get - try to retrieve a pxe file using tftp\n"
+	   "pxe boot [pxefile_addr_r] - boot from the pxe file at pxefile_addr_r\n"
 );
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
