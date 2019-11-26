Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD502109A75
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76EF4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 993E6C36B14
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8l23U001617; Tue, 26 Nov 2019 09:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qFitZvsUK4SEM0Jygu+1Tnw5x+FIPDCz9F0CRBpJ2PI=;
 b=tHv2HDVAyrlSeGjNIo6I7ilZpULoCWbxHkjCnS1oe9savL7zUs5z5y5eSa97lCmsiA+U
 t7gLbnwtDZxE+smlsM5oSF93Amsv6eT8/VZxU/xvV1mtb+rm+UusvoSQwiaaDpAQsK0j
 ZZ1iiT4VaUOCLSTObHsbIwlww8IkZX71CE7pyWlZpSibOmmlJ+S7Mx+8XxL6HqQkLLjc
 yVLXqTruzK8znzKWaFwPmhNQmhPTVI7gIJj2EQrZvUtRhX4wHB4j0amrAA7cvQX79BIH
 YnW9/xvmLN3hZgVeW3PB9gQUnloFGIxWV6aRUpzM3FjYad5d+w0hB/ZpYuaLiBxRqQVc 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weudw5v24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A507100039;
 Tue, 26 Nov 2019 09:49:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DDEF2ACE57;
 Tue, 26 Nov 2019 09:49:16 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:15 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:00 +0100
Message-ID: <20191126084911.19761-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 03/14] dm: pinctrl: migrate pinctrl-generic
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

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
