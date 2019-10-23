Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F692E1D1B
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B923C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F473C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDgx34013942; Wed, 23 Oct 2019 15:45:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iAFRvROSIJnZgLCW8JxrHnRorgEqbGhMpQZ4WymeFJg=;
 b=v/jocOawLxTD1K+OB2Hr05eZLy0ClSSwe2nMMADwJA01ty4pITwpnApx8atrDdXX5kAS
 f63C3BcVYzC1HJGzDSg9IdgGHfhDFNrlGrvnFmgcnoCaQ4fGJDBiZNnyDW7pyl7sL4gW
 D8RWFegqrcszG0vQQvr2+2VR5rzjGCnIXuD0jzvDRbMNmP5/5XPj/CazajU2CNnCG6Ev
 s7ZNBqlslHhay5L5qt/hOhRLjcxMrvEvlhGQRkhIXogPsKlz6lTIYcMehELupxhTx/9f
 iaWU6iRpKVrfQdNgpfmdqQq6L/6sAEgXnYcgaL7LE1z1yu1/MzzCFRnGsUYz60ACrpxg VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4uxdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8248C10002A;
 Wed, 23 Oct 2019 15:44:59 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78DE72FF5FE;
 Wed, 23 Oct 2019 15:44:59 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:44:59 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:44:58
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:39 +0200
Message-ID: <20191023134448.20149-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 04/13] dm: pinctrl: migrate pinctrl-generic to
	livetree
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
- ofnode_get_first_property
- ofnode_get_next_property
- ofnode_get_property_by_prop
- ofnode_read_string_count
- ofnode_read_string_index
and get rid of DECLARE_GLOBAL_DATA_PTR.

This solve parsing issue during test in sandbox for pin
configuration (OF_LIVE is activated in sandbox_defconfig
and sub node are not correctly parsed in
pinctrl_generic_set_state_subnode with fdt lib API).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-generic.c | 36 +++++++++++++++----------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index eecf0f5dc1..474a2e65ca 100644
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
@@ -243,18 +241,18 @@ static int pinctrl_generic_set_state_one(struct udevice *dev,
 					 struct udevice *config,
 					 bool is_group, unsigned selector)
 {
-	const void *fdt = gd->fdt_blob;
-	int node_offset = dev_of_offset(config);
 	const char *propname;
 	const void *value;
-	int prop_offset, len, func_selector, param, ret;
+	const void *property;
+	int len, func_selector, param, ret;
 	u32 arg, default_val;
 
-	for (prop_offset = fdt_first_property_offset(fdt, node_offset);
-	     prop_offset > 0;
-	     prop_offset = fdt_next_property_offset(fdt, prop_offset)) {
-		value = fdt_getprop_by_offset(fdt, prop_offset,
-					      &propname, &len);
+	for (property = ofnode_get_first_property(dev_ofnode(config));
+	     property;
+	     property = ofnode_get_next_property(dev_ofnode(config),
+						 property)) {
+		value = ofnode_get_property_by_prop(dev_ofnode(config),
+						    property, &propname, &len);
 		if (!value)
 			return -EINVAL;
 
@@ -298,19 +296,18 @@ static int pinctrl_generic_set_state_one(struct udevice *dev,
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
+	strings_count = ofnode_read_string_count(dev_ofnode(config),
+						 subnode_target_type);
 	if (strings_count < 0) {
 		subnode_target_type = "groups";
 		is_group = true;
-		strings_count = fdt_stringlist_count(fdt, node,
-						     subnode_target_type);
+		strings_count = ofnode_read_string_count(dev_ofnode(config),
+							 subnode_target_type);
 		if (strings_count < 0) {
 			/* skip this node; may contain config child nodes */
 			return 0;
@@ -318,10 +315,11 @@ static int pinctrl_generic_set_state_subnode(struct udevice *dev,
 	}
 
 	for (i = 0; i < strings_count; i++) {
-		name = fdt_stringlist_get(fdt, node, subnode_target_type, i,
-					  NULL);
-		if (!name)
-			return -EINVAL;
+		ret = ofnode_read_string_index(dev_ofnode(config),
+					       subnode_target_type, i,
+					       &name);
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
