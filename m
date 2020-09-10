Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC12649AB
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 18:26:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73243C424B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:26:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F45FC424B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 16:26:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AGMhZV030448; Thu, 10 Sep 2020 18:26:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=/+ZEXHr261IOJdj/TDIkPGpzYSbwFW6hiVs/jLJ5avY=;
 b=NH/oRkMf3dE1WGEbsLLELG9dBjGkbcPrlqLshnL8HXdL43Z7Kl3LQm5uLGVnSxqcWt06
 V/tUG4B3J54FWafTxAAt4kpEQSWKHazLgSb4Cd8lrhjYQ/4t8siOdHCcW4cP9JpbCZFl
 saWtNY1awbiOQRx/B9OGy1SC6Q2gar82e/tYwDd7jkog0PAOPCj45+GspbpXHCJCk3Qu
 yVaPEpbWlgkRycU9lwNorbVwnzF4kCe5dBOnhNgk8RD5Nv9+JpEmOtOUu/xeYUkn8y13
 LWwa1w7jzXsIpNNuGV1Ddtr8RzZc09nNmEcw+rJrOK/I+yRvd1wTHW9Zpq2oTcWRCeSk +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev4687-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:26:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55B09100034;
 Thu, 10 Sep 2020 18:26:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B8252BC7B4;
 Thu, 10 Sep 2020 18:26:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 18:26:19 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 18:26:17 +0200
Message-ID: <20200910162617.28257-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_05:2020-09-10,
 2020-09-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] dm: add cells_count parameter in live DT APIs
	of_parse_phandle_with_args
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

In the live tree API ofnode_parse_phandle_with_args, the cell_count
argument must be used when cells_name is NULL.

But this argument is not provided to the live DT function
of_parse_phandle_with_args even it is provided to
fdtdec_parse_phandle_with_args.

This patch adds support of the cells_count parameter in dev_ and
of_node API to allow migration and support of live DT:
- of_parse_phandle_with_args

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/core/of_access.c | 7 ++++---
 drivers/core/ofnode.c    | 3 ++-
 include/dm/of_access.h   | 4 +++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/core/of_access.c b/drivers/core/of_access.c
index 922e78f99b..bcf1644d05 100644
--- a/drivers/core/of_access.c
+++ b/drivers/core/of_access.c
@@ -745,13 +745,14 @@ struct device_node *of_parse_phandle(const struct device_node *np,
 
 int of_parse_phandle_with_args(const struct device_node *np,
 			       const char *list_name, const char *cells_name,
-			       int index, struct of_phandle_args *out_args)
+			       int cell_count, int index,
+			       struct of_phandle_args *out_args)
 {
 	if (index < 0)
 		return -EINVAL;
 
-	return __of_parse_phandle_with_args(np, list_name, cells_name, 0,
-					    index, out_args);
+	return __of_parse_phandle_with_args(np, list_name, cells_name,
+					    cell_count, index, out_args);
 }
 
 int of_count_phandle_with_args(const struct device_node *np,
diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index d02d8d33fe..79fcdf5ce2 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -409,7 +409,8 @@ int ofnode_parse_phandle_with_args(ofnode node, const char *list_name,
 		int ret;
 
 		ret = of_parse_phandle_with_args(ofnode_to_np(node),
-						 list_name, cells_name, index,
+						 list_name, cells_name,
+						 cell_count, index,
 						 &args);
 		if (ret)
 			return ret;
diff --git a/include/dm/of_access.h b/include/dm/of_access.h
index f95a00d065..2fa65c9332 100644
--- a/include/dm/of_access.h
+++ b/include/dm/of_access.h
@@ -407,6 +407,7 @@ struct device_node *of_parse_phandle(const struct device_node *np,
  * @np:		pointer to a device tree node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
+ * @cells_count: Cell count to use if @cells_name is NULL
  * @index:	index of a phandle to parse out
  * @out_args:	optional pointer to output arguments structure (will be filled)
  * @return 0 on success (with @out_args filled out if not NULL), -ENOENT if
@@ -440,7 +441,8 @@ struct device_node *of_parse_phandle(const struct device_node *np,
  */
 int of_parse_phandle_with_args(const struct device_node *np,
 			       const char *list_name, const char *cells_name,
-			       int index, struct of_phandle_args *out_args);
+			       int cells_count, int index,
+			       struct of_phandle_args *out_args);
 
 /**
  * of_count_phandle_with_args() - Count the number of phandle in a list
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
