Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81160109A71
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46F72C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 040A0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lNGc000461; Tue, 26 Nov 2019 09:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=OJ4RvCu/2lcd6BmUk8PIEYByo32lHAVHRAX07KvPylo=;
 b=Jmu3m4xfqO1erFcgP3MMiT/Kdd2v1EwOJ1iECk11yGAfrtJLLjofkvA2Ke6avRZ8KZkl
 /NM8ElJIhJuKNv/HNMiRIKuYzg7kxmNMQmQ6MAYBkhrjBbYpTpdVjDq66eoVzOya4mNm
 QcNlVOWMAEf19dR2PAoL6NiCd6XGHAurLEFJ4jcaWZAWRhgtJUYZ3KaDK+STAynTc+o5
 lvsTddJsI8A+Qg0+AAUgK8iFNZ+TMaFbJ3EBvEVoJIm+ELlGJNmH83Tu7xFE1V3H+n4F
 qzbqueEpGHwjFLDNRT1nai71RmEg2lipVZzurhtWcL8C7zQdJpEKSyNHZFMOB0SrQNCV 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9p7ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91C1910002A;
 Tue, 26 Nov 2019 09:49:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 881E52ACE58;
 Tue, 26 Nov 2019 09:49:15 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:15 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:48:59 +0100
Message-ID: <20191126084911.19761-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 02/14] dm: core: add ofnode and dev
	function to iterate on node property
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
- dev_read_first_prop
- dev_read_next_prop
- dev_read_prop_by_prop
and
- ofnode_get_first_property
- ofnode_get_next_property
- ofnode_get_property_by_prop

For example:
struct ofprop property;

dev_for_each_property(property, config) {
	value = dev_read_prop_by_prop(&property, &propname, &len);

or:
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

Changes in v2:
- Identify property with a new struct ofprop as proposed
  by Simon Glass
- Add dev_ iterate functions

 drivers/core/of_access.c | 32 +++++++++++++++++++
 drivers/core/ofnode.c    | 48 ++++++++++++++++++++++++++++
 drivers/core/read.c      | 16 ++++++++++
 include/dm/of_access.h   | 40 ++++++++++++++++++++++++
 include/dm/ofnode.h      | 63 ++++++++++++++++++++++++++++++++++++-
 include/dm/read.h        | 67 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 265 insertions(+), 1 deletion(-)

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
index 8f0eab2ca6..cb27562fec 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -536,6 +536,54 @@ const void *ofnode_get_property(ofnode node, const char *propname, int *lenp)
 				   propname, lenp);
 }
 
+int ofnode_get_first_property(ofnode node, struct ofprop *prop)
+{
+	prop->node = node;
+
+	if (ofnode_is_np(node)) {
+		prop->prop = of_get_first_property(ofnode_to_np(prop->node));
+		if (!prop->prop)
+			return -FDT_ERR_NOTFOUND;
+	} else {
+		prop->offset =
+			fdt_first_property_offset(gd->fdt_blob,
+						  ofnode_to_offset(prop->node));
+		if (prop->offset < 0)
+			return prop->offset;
+	}
+
+	return 0;
+}
+
+int ofnode_get_next_property(struct ofprop *prop)
+{
+	if (ofnode_is_np(prop->node)) {
+		prop->prop = of_get_next_property(ofnode_to_np(prop->node),
+						  prop->prop);
+		if (!prop->prop)
+			return -FDT_ERR_NOTFOUND;
+	} else {
+		prop->offset = fdt_next_property_offset(gd->fdt_blob,
+							prop->offset);
+		if (prop->offset  < 0)
+			return prop->offset;
+	}
+
+	return 0;
+}
+
+const void *ofnode_get_property_by_prop(const struct ofprop *prop,
+					const char **propname, int *lenp)
+{
+	if (ofnode_is_np(prop->node))
+		return of_get_property_by_prop(ofnode_to_np(prop->node),
+					       prop->prop, propname, lenp);
+	else
+		return fdt_getprop_by_offset(gd->fdt_blob,
+					     prop->offset,
+					     propname, lenp);
+}
+
 bool ofnode_is_available(ofnode node)
 {
 	if (ofnode_is_np(node))
diff --git a/drivers/core/read.c b/drivers/core/read.c
index 9602e52d1b..a9f5d147b2 100644
--- a/drivers/core/read.c
+++ b/drivers/core/read.c
@@ -238,6 +238,22 @@ const void *dev_read_prop(struct udevice *dev, const char *propname, int *lenp)
 	return ofnode_get_property(dev_ofnode(dev), propname, lenp);
 }
 
+int dev_read_first_prop(struct udevice *dev, struct ofprop *prop)
+{
+	return ofnode_get_first_property(dev_ofnode(dev), prop);
+}
+
+int dev_read_next_prop(struct ofprop *prop)
+{
+	return ofnode_get_next_property(prop);
+}
+
+const void *dev_read_prop_by_prop(struct ofprop *prop,
+				  const char **propname, int *lenp)
+{
+	return ofnode_get_property_by_prop(prop, propname, lenp);
+}
+
 int dev_read_alias_seq(struct udevice *dev, int *devnump)
 {
 	ofnode node = dev_ofnode(dev);
diff --git a/include/dm/of_access.h b/include/dm/of_access.h
index 13fedb7cf5..1eb1ce13d0 100644
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
+ * @np: Pointer to device node
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
+ * @np: Pointer to device node
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
index 5c4cbf0998..02687eeeef 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -58,6 +58,31 @@ struct ofnode_phandle_args {
 	uint32_t args[OF_MAX_PHANDLE_ARGS];
 };
 
+/**
+ * ofprop - reference to a property of a device tree node
+ *
+ * This struct hold the reference on one property of one node,
+ * using struct ofnode and an offset within the flat device tree or either
+ * a pointer to a struct property in the live device tree.
+ *
+ * Thus we can reference arguments in both the live tree and the flat tree.
+ *
+ * The property reference can also hold a null reference. This corresponds to
+ * a struct property NULL pointer or an offset of -1.
+ *
+ * @node: Pointer to device node
+ * @offset: Pointer into flat device tree, used for flat tree.
+ * @prop: Pointer to property, used for live treee.
+ */
+
+struct ofprop {
+	ofnode node;
+	union {
+		int offset;
+		const struct property *prop;
+	};
+};
+
 /**
  * _ofnode_to_np() - convert an ofnode to a live DT node pointer
  *
@@ -543,7 +568,7 @@ int ofnode_decode_display_timing(ofnode node, int index,
 				 struct display_timing *config);
 
 /**
- * ofnode_get_property()- - get a pointer to the value of a node property
+ * ofnode_get_property() - get a pointer to the value of a node property
  *
  * @node: node to read
  * @propname: property to read
@@ -552,6 +577,42 @@ int ofnode_decode_display_timing(ofnode node, int index,
  */
 const void *ofnode_get_property(ofnode node, const char *propname, int *lenp);
 
+/**
+ * ofnode_get_first_property()- get the reference of the first property
+ *
+ * Get reference to the first property of the node, it is used to iterate
+ * and read all the property with ofnode_get_property_by_prop().
+ *
+ * @node: node to read
+ * @prop: place to put argument reference
+ * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ */
+int ofnode_get_first_property(ofnode node, struct ofprop *prop);
+
+/**
+ * ofnode_get_next_property() - get the reference of the next property
+ *
+ * Get reference to the next property of the node, it is used to iterate
+ * and read all the property with ofnode_get_property_by_prop().
+ *
+ * @prop: reference of current argument and place to put reference of next one
+ * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ */
+int ofnode_get_next_property(struct ofprop *prop);
+
+/**
+ * ofnode_get_property_by_ofprop() - get a pointer to the value of a property
+ *
+ * Get value for the property identified by the provided reference.
+ *
+ * @prop: reference on property
+ * @propname: If non-NULL, place to property name on success,
+ * @lenp: If non-NULL, place to put length on success
+ * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ */
+const void *ofnode_get_property_by_prop(const struct ofprop *prop,
+					const char **propname, int *lenp);
+
 /**
  * ofnode_is_available() - check if a node is marked available
  *
diff --git a/include/dm/read.h b/include/dm/read.h
index d37fcb504d..3c6bed7bff 100644
--- a/include/dm/read.h
+++ b/include/dm/read.h
@@ -465,6 +465,42 @@ int dev_read_phandle(struct udevice *dev);
  */
 const void *dev_read_prop(struct udevice *dev, const char *propname, int *lenp);
 
+/**
+ * dev_read_first_prop()- get the reference of the first property
+ *
+ * Get reference to the first property of the node, it is used to iterate
+ * and read all the property with dev_read_prop_by_prop().
+ *
+ * @dev: device to check
+ * @prop: place to put argument reference
+ * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ */
+int dev_read_first_prop(struct udevice *dev, struct ofprop *prop);
+
+/**
+ * ofnode_get_next_property() - get the reference of the next property
+ *
+ * Get reference to the next property of the node, it is used to iterate
+ * and read all the property with dev_read_prop_by_prop().
+ *
+ * @prop: reference of current argument and place to put reference of next one
+ * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ */
+int dev_read_next_prop(struct ofprop *prop);
+
+/**
+ * dev_read_prop_by_prop() - get a pointer to the value of a property
+ *
+ * Get value for the property identified by the provided reference.
+ *
+ * @prop: reference on property
+ * @propname: If non-NULL, place to property name on success,
+ * @lenp: If non-NULL, place to put length on success
+ * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ */
+const void *dev_read_prop_by_prop(struct ofprop *prop,
+				  const char **propname, int *lenp);
+
 /**
  * dev_read_alias_seq() - Get the alias sequence number of a node
  *
@@ -812,6 +848,23 @@ static inline const void *dev_read_prop(struct udevice *dev,
 	return ofnode_get_property(dev_ofnode(dev), propname, lenp);
 }
 
+static inline int dev_read_first_prop(struct udevice *dev, struct ofprop *prop)
+{
+	return ofnode_get_first_property(dev_ofnode(dev), prop);
+}
+
+static inline int dev_read_next_prop(struct ofprop *prop)
+{
+	return ofnode_get_next_property(prop);
+}
+
+static inline const void *dev_read_prop_by_prop(struct ofprop *prop,
+						const char **propname,
+						int *lenp)
+{
+	return ofnode_get_property_by_prop(prop, propname, lenp);
+}
+
 static inline int dev_read_alias_seq(struct udevice *dev, int *devnump)
 {
 	return fdtdec_get_alias_seq(gd->fdt_blob, dev->uclass->uc_drv->name,
@@ -889,4 +942,18 @@ static inline int dev_read_alias_highest_id(const char *stem)
 	     ofnode_valid(subnode); \
 	     subnode = ofnode_next_subnode(subnode))
 
+/**
+ * dev_for_each_property() - Helper function to iterate through property
+ *
+ * This creates a for() loop which works through the property in a device's
+ * device-tree node.
+ *
+ * @prop: struct ofprop holding the current property
+ * @dev: device to use for interation (struct udevice *)
+ */
+#define dev_for_each_property(prop, dev) \
+	for (int ret_prop = dev_read_first_prop(dev, &prop); \
+	     !ret_prop; \
+	     ret_prop = dev_read_next_prop(&prop))
+
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
