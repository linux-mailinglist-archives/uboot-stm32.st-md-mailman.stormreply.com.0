Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEA138F2E
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EC90C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B728C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASfWO021641; Mon, 13 Jan 2020 11:35:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=V/Xky93WoqWHyJ3crG304O3deRMTaF5NNfOHXmTFy5A=;
 b=ve1PMSw6zPZ78iBGAoQ9vKuu6wTImRYo5dWLyY35kLtpMizo/rpIW7pmVQaym32Yj3eQ
 WPmQINXjpkTbL6zNJtKyrI1sgvsnd8v5COeMH6z5Zr4nL8mbedDS2iG9ie45w64wBbxu
 WZ8xm+OYM6/tkRPdil9qUP4POfE1GDy4g+wf7AAdeN/MMd8ohRyyW1fn2V+nRmp9hfig
 5+ZOxS0FWmvs0aH45Sx+Ge6xzlrzpT0rk82P/o7MygCT1BPAf4HM6hMcc+1e1BH+Q3ro
 8sK6WGPXyOM0X2EqM2hrzOiWe+2iOt9IoO/2iP/fJ10OMRCGxHGgV+Dc2e1yYPm44QVO cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78ryk7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7538100034;
 Mon, 13 Jan 2020 11:35:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD8992A96E8;
 Mon, 13 Jan 2020 11:35:19 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:34:57 +0100
Message-ID: <20200113103515.20879-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 03/21] dm: pinctrl: migrate pinctrl-generic
	to livetree
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

Migrate pinctrl-generic to livetree:
- dev_for_each_property
- dev_read_prop_by_prop
- dev_read_string_count
- dev_read_string_index
and get rid of DECLARE_GLOBAL_DATA_PTR.

This patch solves the parsing issue during sandbox tests for pin
configuration (OF_LIVE is activated in sandbox_defconfig
and sub node are not correctly parsed in
pinctrl_generic_set_state_subnode with fdt lib API).

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- Change dev_ functions in pinctrl-generic

 drivers/pinctrl/pinctrl-generic.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index eecf0f5dc1..9c4f73b1be 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -8,8 +8,6 @@
 #include <linux/compat.h>
 #include <dm/pinctrl.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 /**
  * pinctrl_pin_name_to_selector() - return the pin selector for a pin
  *
@@ -243,18 +241,14 @@ static int pinctrl_generic_set_state_one(struct udevice *dev,
 					 struct udevice *config,
 					 bool is_group, unsigned selector)
 {
-	const void *fdt = gd->fdt_blob;
-	int node_offset = dev_of_offset(config);
 	const char *propname;
 	const void *value;
-	int prop_offset, len, func_selector, param, ret;
+	struct ofprop property;
+	int len, func_selector, param, ret;
 	u32 arg, default_val;
 
-	for (prop_offset = fdt_first_property_offset(fdt, node_offset);
-	     prop_offset > 0;
-	     prop_offset = fdt_next_property_offset(fdt, prop_offset)) {
-		value = fdt_getprop_by_offset(fdt, prop_offset,
-					      &propname, &len);
+	dev_for_each_property(property, config) {
+		value = dev_read_prop_by_prop(&property, &propname, &len);
 		if (!value)
 			return -EINVAL;
 
@@ -298,19 +292,17 @@ static int pinctrl_generic_set_state_one(struct udevice *dev,
 static int pinctrl_generic_set_state_subnode(struct udevice *dev,
 					     struct udevice *config)
 {
-	const void *fdt = gd->fdt_blob;
-	int node = dev_of_offset(config);
 	const char *subnode_target_type = "pins";
 	bool is_group = false;
 	const char *name;
 	int strings_count, selector, i, ret;
 
-	strings_count = fdt_stringlist_count(fdt, node, subnode_target_type);
+	strings_count = dev_read_string_count(config, subnode_target_type);
 	if (strings_count < 0) {
 		subnode_target_type = "groups";
 		is_group = true;
-		strings_count = fdt_stringlist_count(fdt, node,
-						     subnode_target_type);
+		strings_count = dev_read_string_count(config,
+						      subnode_target_type);
 		if (strings_count < 0) {
 			/* skip this node; may contain config child nodes */
 			return 0;
@@ -318,10 +310,10 @@ static int pinctrl_generic_set_state_subnode(struct udevice *dev,
 	}
 
 	for (i = 0; i < strings_count; i++) {
-		name = fdt_stringlist_get(fdt, node, subnode_target_type, i,
-					  NULL);
-		if (!name)
-			return -EINVAL;
+		ret = dev_read_string_index(config, subnode_target_type, i,
+					    &name);
+		if (ret)
+			return ret;
 
 		if (is_group)
 			selector = pinctrl_group_name_to_selector(dev, name);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
