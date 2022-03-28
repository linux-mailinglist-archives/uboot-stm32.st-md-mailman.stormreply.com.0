Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020C4E9D76
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 19:26:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0D00C60465;
	Mon, 28 Mar 2022 17:26:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C729FC60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:26:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDktZp008185;
 Mon, 28 Mar 2022 19:26:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mVUsEm1+JjF89pv2gP1QMZwVqc69B3/IC51reKkuhuc=;
 b=doMeb8WDrKiEHQ9VbWMNtumMn5moX2Nf5sGrjUvm386pW7MJVQOh6cvRpLeLdKfempSC
 5UFQPxuG2nBPOZ6C/WLI1jTx7Fz4pc+KQqYUqcDZJgqb4r56CdSAE16Ajdp152ZSWEdU
 Ao4pur7kk9FVBl7+yjFuyu9lUZC3pk34Wj0PUgznqVDHDSHo0/yYACqkY1CSl4xgmYTZ
 nJDzELT6zBm2yI3M8q8lsk/717aQGhffFxQIXfWsMATUp2N19zK1DJ1fCql20IVrc4LJ
 XVEWi1sscR7+//agWzwiygGtWx8jgj5guNpQK6XQQlgDYcc5nlQ1ebPJOda85DhkIgIj 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1rud4g0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 19:26:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2C14100034;
 Mon, 28 Mar 2022 19:26:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACF75237D8C;
 Mon, 28 Mar 2022 19:26:41 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 19:26:41
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 19:25:31 +0200
Message-ID: <20220328192520.6.Ie76b6efe731c9d721b794d9ad6b394b38492a4df@changeid>
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
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 6/8] stm32mp: stm32prog: handle interruption
	during the first enumeration
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

When an interruption is received during the first USB enumeration
used to received the FlashLayout, with handle ctrl-c, the second
enumeration is not needed and the result for stm32prog_usb_loop
is false (reset is not needed).

This patch avoids the need of a second ctrl to interrupt the command
stm32prog.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index 82b702f93b..a8b57c4d8f 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -206,9 +206,12 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
 	g_dnl_set_product(product);
 
 	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
+		/* forget any previous Control C */
+		clear_ctrlc();
 		ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
-		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT)
-			return ret;
+		/* DFU reset received, no error or CtrlC */
+		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT || had_ctrlc())
+			return ret; /* true = reset on DFU error */
 		/* prepare the second enumeration with the FlashLayout */
 		stm32prog_dfu_init(data);
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
