Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCEDE1D12
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED34C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A707C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:44:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDgx31013942; Wed, 23 Oct 2019 15:44:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QxoSayLHiX0JALfVGJRPAgX6lGzvMLc6/CgKwRyOINo=;
 b=Jt6kZUW2KrH+Gseq3WMIZeLLwPkHyafjmfdtC0x2IciIQS7Zlu8am9I8SNopqCpl2OqY
 neIN8KsKejaNZ/fXyO1PoG7e5h/9KKp/UbVadg0ET9KUbFqCvcD+P7df4f16nZStDVcV
 +Sc6CVgpN9BINT7mKkwuiN7a+QB/wbcAg892GdvLxh4+Ipy4dU99zWY0V4bdjGE3hWZj
 UqL4T7NmsigXNrgmtjFPWac9nHKLGm6ea4pwEo0aAiWV8PwNy1p29CePsriFipK3invx
 FF/aCSumUefmtNGx/8OECOOE+m6YSWXPklTSh5AMRsTmPS4lDB7A+JjjPhlvesgims/m 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4uxdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:44:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9459010002A;
 Wed, 23 Oct 2019 15:44:57 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B4482FF5FE;
 Wed, 23 Oct 2019 15:44:57 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:44:57 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:44:57
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:38 +0200
Message-ID: <20191023134448.20149-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/13] dm: core: add ofnode function to
	iterate on node property
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

Add functions to iterate on all property with livetree
- ofnode_get_first_property
- ofnode_get_next_property
- ofnode_get_property_by_prop

For example:
for (prop = ofnode_get_first_property(dev_ofnode(dev));
     prop;
     prop = ofnode_get_next_property(dev_ofnode(dev),prop))
{
     value = ofnode_get_property_by_prop(dev_ofnode(dev), prop,
					 &propname, &len);
....
}

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/core/of_access.c | 32 ++++++++++++++++++++++++++++
 drivers/core/ofnode.c    | 45 ++++++++++++++++++++++++++++++++++++++++
 include/dm/of_access.h   | 40 +++++++++++++++++++++++++++++++++++
 include/dm/ofnode.h      | 39 +++++++++++++++++++++++++++++++++-
 4 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/core/of_access.c b/drivers/core/of_access.c
index 945b81448c..86fe42ad14 100644
--- a/drivers/core/of_access.c
+++ b/drivers/core/of_access.c
@@ -170,6 +170,38 @@ const void *of_get_property(const struct device_node *np, const char *name,
 	return pp ? pp->value : NULL;
 }
 
+const struct property *of_get_first_property(const struct device_node *np)
+{
+	if (!np)
+		return NULL;
+
+	return  np->properties;
+}
+
+const struct property *of_get_next_property(const struct device_node *np,
+					    const struct property *property)
+{
+	if (!np)
+		return NULL;
+
+	return property->next;
+}
+
+const void *of_get_property_by_prop(const struct device_node *np,
+				    const struct property *property,
+				    const char **name,
+				    int *lenp)
+{
+	if (!np || !property)
+		return NULL;
+	if (name)
+		*name = property->name;
+	if (lenp)
+		*lenp = property->length;
+
+	return property->value;
+}
+
 static const char *of_prop_next_string(struct property *prop, const char *cur)
 {
 	const void *curv = cur;
diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index 297f0a0c7c..4169befd92 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -536,6 +536,51 @@ const void *ofnode_get_property(ofnode node, const char *propname, int *lenp)
 				   propname, lenp);
 }
 
+const void *ofnode_get_first_property(ofnode node)
+{
+	int prop_offset;
+
+	if (ofnode_is_np(node)) {
+		return of_get_first_property(ofnode_to_np(node));
+	} else {
+		prop_offset = fdt_first_property_offset(gd->fdt_blob,
+							ofnode_to_offset(node));
+		if (prop_offset < 0)
+			return NULL;
+
+		return (void *)(uintptr_t)prop_offset;
+	}
+}
+
+const void *ofnode_get_next_property(ofnode node, const void *property)
+{
+	int prop_offset;
+
+	if (ofnode_is_np(node)) {
+		return of_get_next_property(ofnode_to_np(node), property);
+	} else {
+		prop_offset = (uintptr_t)property;
+		prop_offset = fdt_next_property_offset(gd->fdt_blob,
+						       prop_offset);
+		if (prop_offset < 0)
+			return NULL;
+
+		return (void *)(uintptr_t)prop_offset;
+	}
+}
+
+const void *ofnode_get_property_by_prop(ofnode node, const void *property,
+					const char **propname, int *lenp)
+{
+	if (ofnode_is_np(node))
+		return of_get_property_by_prop(ofnode_to_np(node),
+					       property, propname, lenp);
+	else
+		return fdt_getprop_by_offset(gd->fdt_blob,
+					     (uintptr_t)property,
+					     propname, lenp);
+}
+
 bool ofnode_is_available(ofnode node)
 {
 	if (ofnode_is_np(node))
diff --git a/include/dm/of_access.h b/include/dm/of_access.h
index 13fedb7cf5..0418782aa2 100644
--- a/include/dm/of_access.h
+++ b/include/dm/of_access.h
@@ -103,6 +103,46 @@ struct property *of_find_property(const struct device_node *np,
 const void *of_get_property(const struct device_node *np, const char *name,
 			    int *lenp);
 
+/**
+ * of_get_first_property()- get to the pointer of the first property
+ *
+ * Get pointer to the first property of the node, it is used to iterate
+ * and read all the property with of_get_next_property_by_prop().
+ *
+ * @p: Pointer to device node
+ * @return pointer to property or NULL if not found
+ */
+const struct property *of_get_first_property(const struct device_node *np);
+
+/**
+ * of_get_next_property() - get to the pointer of the next property
+ *
+ * Get pointer to the next property of the node, it is used to iterate
+ * and read all the property with of_get_property_by_prop().
+ *
+ * @p: Pointer to device node
+ * @property: pointer of the current property
+ * @return pointer to next property or NULL if not found
+ */
+const struct property *of_get_next_property(const struct device_node *np,
+					    const struct property *property);
+
+/**
+ * of_get_property_by_prop() - get a property value of a node property
+ *
+ * Get value for the property identified by node and property pointer.
+ *
+ * @node: node to read
+ * @property: pointer of the property to read
+ * @propname: place to property name on success
+ * @lenp: place to put length on success
+ * @return pointer to property value or NULL if error
+ */
+const void *of_get_property_by_prop(const struct device_node *np,
+				    const struct property *property,
+				    const char **name,
+				    int *lenp);
+
 /**
  * of_device_is_compatible() - Check if the node matches given constraints
  * @device: pointer to node
diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index 5c4cbf0998..08d684cea0 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -543,7 +543,7 @@ int ofnode_decode_display_timing(ofnode node, int index,
 				 struct display_timing *config);
 
 /**
- * ofnode_get_property()- - get a pointer to the value of a node property
+ * ofnode_get_property() - get a pointer to the value of a node property
  *
  * @node: node to read
  * @propname: property to read
@@ -552,6 +552,43 @@ int ofnode_decode_display_timing(ofnode node, int index,
  */
 const void *ofnode_get_property(ofnode node, const char *propname, int *lenp);
 
+/**
+ * ofnode_get_first_property()- get to the pointer of the first property
+ *
+ * Get pointer to the first property of the node, it is used to iterate
+ * and read all the property with ofnode_get_property_by_prop().
+ *
+ * @node: node to read
+ * @return pointer or offset to property, used to iterate, or NULL
+ */
+const void *ofnode_get_first_property(ofnode node);
+
+/**
+ * ofnode_get_next_property() - get to the pointer of the next property
+ *
+ * Get pointer to the next property of the node, it is used to iterate
+ * and read all the property with ofnode_get_property_by_prop().
+ *
+ * @node: node to read
+ * @property: pointer or offset of the current property
+ * @return pointer or offset to next property or NULL
+ */
+const void *ofnode_get_next_property(ofnode node, const void *property);
+
+/**
+ * ofnode_get_property_by_prop() - get a pointer to the value of a node property
+ *
+ * Get value for the property identified by node and property.
+ *
+ * @node: node to read
+ * @property: pointer or offset of the property to read
+ * @propname: place to property name on success
+ * @lenp: place to put length on success
+ * @return pointer to property or NULL if error
+ */
+const void *ofnode_get_property_by_prop(ofnode node, const void *property,
+					const char **propname, int *lenp);
+
 /**
  * ofnode_is_available() - check if a node is marked available
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
