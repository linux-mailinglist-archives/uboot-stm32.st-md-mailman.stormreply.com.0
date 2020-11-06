Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE92A9B6B
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49B37C36B0B;
	Fri,  6 Nov 2020 18:02:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6103C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hw3bk013437; Fri, 6 Nov 2020 19:02:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=pAd3XXRaj3UzZBxnCY/g7D3jDlm32VOBOOaiEQeebGM=;
 b=t7LDM3lAH6tc05OC6i/K9f36FTVbramSx+ZapVwhlpttDJ/vTty3pwnZUOQUd1XQBBmf
 M28FaUgv7OjDDush+hvX4Ktpe9aheWD8+uAthuNjdm5k2V1M6gOY486D4QOCtpiMTwjM
 mcbHjWyp61/rYU8vksE2FbwwXmqTlvO5UMltWNbTfmOP845ZgMkjY2bMIHda0jmOQb1b
 0QGe3i2XPtIVz36peGg8pVFwz0sBdgp2m28w8RQKIGvA5FjgoUqWOZq5KQhNJX+lVvLs
 adf2ON2rTSMwdllNDzAQkLggmicSTQCQKkobZkGOEyo+9/RZFcgJvyHBx/i6w2BzQDnz Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xgbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 961E510002A;
 Fri,  6 Nov 2020 19:02:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FDE724C7A5;
 Fri,  6 Nov 2020 19:02:30 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:29
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:43 +0100
Message-ID: <20201106180201.31784-16-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 15/33] misc: rcc: migrate trace to dev macro
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

Change debug and pr_err to dev macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/misc/stm32_rcc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index b82fe54c60..c1a99d78e2 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -4,6 +4,8 @@
  * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_NOP
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
@@ -45,10 +47,10 @@ static int stm32_rcc_bind(struct udevice *dev)
 		(struct stm32_rcc_clk *)dev_get_driver_data(dev);
 	int ret;
 
-	debug("%s(dev=%p)\n", __func__, dev);
+	dev_dbg(dev, "RCC bind\n");
 	drv = lists_driver_lookup_name(rcc_clk->drv_name);
 	if (!drv) {
-		debug("Cannot find driver '%s'\n", rcc_clk->drv_name);
+		dev_err(dev, "Cannot find driver '%s'\n", rcc_clk->drv_name);
 		return -ENOENT;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
