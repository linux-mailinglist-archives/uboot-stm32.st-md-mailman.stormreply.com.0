Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72E2A9B7A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67117C3FAE2;
	Fri,  6 Nov 2020 18:02:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AEB4C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hw8Yx022292; Fri, 6 Nov 2020 19:02:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0hUvZ6Qe+tc5AXJNl1elgkj4zwNLPiaZDsfvzb2nsJ4=;
 b=BbDnFP2IwmRDs1fnt466rD2t+025DHFnHtSJqjbcxIZvH0VzPIIFpKtB6PdGl72fYkYG
 Y11ylDcOgiLclvXO+38pWg3dbpsGSqLeGPxs1xGtmGulg+VDWYOms518fx/mSFnWsLQ2
 7V+sNLvzTGybx047xMGkXeek3Sn9SV+LtCJueXth78UL8nekn+mEFgt70leteCi9NpHm
 xW683FB02Twr8v8/fPHQxlBR6W3XeP9/Q+/ncTKS0WApZwff3swi72CAfk19YcFvKvGf
 YqVItjkeoAz92fPv85Tas8eFXvU44l2u4oc3jm767xFYUJN6Va+v5g+1aoXKlU8QwkQe Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00ewube-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FF9C10002A;
 Fri,  6 Nov 2020 19:02:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A4FE25079D;
 Fri,  6 Nov 2020 19:02:50 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:49
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:55 +0100
Message-ID: <20201106180201.31784-28-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 27/33] memory: stm32-fmc2: migrate trace to
	dev and log macro
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

Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/memory/stm32-fmc2-ebi.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index d887a1e09d..e3cf75f6e3 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -3,10 +3,13 @@
  * Copyright (C) STMicroelectronics 2020
  */
 
+#define LOG_CATEGORY UCLASS_NOP
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
 #include <reset.h>
+#include <dm/device_compat.h>
 #include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
@@ -860,7 +863,7 @@ static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
 	u32 setup = 0;
 
 	if (!prop->set) {
-		pr_err("property %s is not well defined\n", prop->name);
+		log_err("property %s is not well defined\n", prop->name);
 		return -EINVAL;
 	}
 
@@ -873,8 +876,8 @@ static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
 
 		bprop = ofnode_read_bool(node, prop->name);
 		if (prop->mprop && !bprop) {
-			pr_err("mandatory property %s not defined in the device tree\n",
-			       prop->name);
+			log_err("mandatory property %s not defined in the device tree\n",
+				prop->name);
 			return -EINVAL;
 		}
 
@@ -886,8 +889,8 @@ static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
 
 		ret = ofnode_read_u32(node, prop->name, &val);
 		if (prop->mprop && ret) {
-			pr_err("mandatory property %s not defined in the device tree\n",
-			       prop->name);
+			log_err("mandatory property %s not defined in the device tree\n",
+				prop->name);
 			return ret;
 		}
 
@@ -949,8 +952,8 @@ static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
 
 		ret = stm32_fmc2_ebi_parse_prop(ebi, node, p, cs);
 		if (ret) {
-			pr_err("property %s could not be set: %d\n",
-			       p->name, ret);
+			log_err("property %s could not be set: %d\n",
+				p->name, ret);
 			return ret;
 		}
 	}
@@ -971,25 +974,24 @@ static int stm32_fmc2_ebi_parse_dt(struct udevice *dev,
 	dev_for_each_subnode(child, dev) {
 		ret = ofnode_read_u32(child, "reg", &bank);
 		if (ret) {
-			pr_err("could not retrieve reg property: %d\n", ret);
+			dev_err(dev, "could not retrieve reg property: %d\n", ret);
 			return ret;
 		}
 
 		if (bank >= FMC2_MAX_BANKS) {
-			pr_err("invalid reg value: %d\n", bank);
+			dev_err(dev, "invalid reg value: %d\n", bank);
 			return -EINVAL;
 		}
 
 		if (ebi->bank_assigned & BIT(bank)) {
-			pr_err("bank already assigned: %d\n", bank);
+			dev_err(dev, "bank already assigned: %d\n", bank);
 			return -EINVAL;
 		}
 
 		if (bank < FMC2_MAX_EBI_CE) {
 			ret = stm32_fmc2_ebi_setup_cs(ebi, child, bank);
 			if (ret) {
-				pr_err("setup chip select %d failed: %d\n",
-				       bank, ret);
+				dev_err(dev, "setup chip select %d failed: %d\n", bank, ret);
 				return ret;
 			}
 		}
@@ -999,12 +1001,12 @@ static int stm32_fmc2_ebi_parse_dt(struct udevice *dev,
 	}
 
 	if (!child_found) {
-		pr_warn("no subnodes found, disable the driver.\n");
+		dev_warn(dev, "no subnodes found, disable the driver.\n");
 		return -ENODEV;
 	}
 
 	if (stm32_fmc2_ebi_nwait_used_by_ctrls(ebi)) {
-		pr_err("NWAIT signal connected to EBI and NAND controllers\n");
+		dev_err(dev, "NWAIT signal connected to EBI and NAND controllers\n");
 		return -EINVAL;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
