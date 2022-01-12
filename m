Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D024848C1B3
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:53:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 943F5C60466;
	Wed, 12 Jan 2022 09:53:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9400C60463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:53:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C6oMb0024918;
 Wed, 12 Jan 2022 10:53:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=0EBZfrcp+8VL8IqGxMObguPQdFZbE5tSJP1ihPBYIEM=;
 b=654LxijLQNdREgX9HAgsWKqT5BTVYV/BT6R3JqvU45h0HzZQNgmm9rbJykF9DeQ1P+On
 PthC7fUVWNSnODyouQOGkXop7gktwmyTKBYbK8qoDj0bRmid2Dqfo8pxfwuEEbHgvycM
 ivd3OhBgFOPbfbDOwYfiFTcOOtVCTdJRmMhWOw7XiTAcZhbPmfORYPjDYb9PgkY3lNxU
 Z6BrcQV/K8cJomtqyHKhPZMBo89yb2EMx9weab7UwN+SD7Qqq2wuG/n98H/5iRYRMpGJ
 SfjVwRGiUuMjka2X15gVUMJrj9n6uHsWQNpEpF+0pT9sw3ahHiYBLNl50aCRnXv8iCej dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dh9cbdc0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27E9910002A;
 Wed, 12 Jan 2022 10:53:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EF5D2194F4;
 Wed, 12 Jan 2022 10:53:57 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:56
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:48 +0100
Message-ID: <20220112105327.7.Iab4c78649bf9b7ec9692476312ef779b7a9655fb@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 7/9] doc: add include/dm/read.h to the HTML
	documentation
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

Correct Sphinx style comments in include/dm/read.h
and add the device read from device tree API to the HTML
documentation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst    |   1 +
 include/dm/read.h | 163 +++++++++++++++++++++++-----------------------
 2 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index 0342620786..19a473f1f0 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -16,3 +16,4 @@ Device
 
 .. kernel-doc:: include/dm/device.h
 .. kernel-doc:: include/dm/devres.h
+.. kernel-doc:: include/dm/read.h
diff --git a/include/dm/read.h b/include/dm/read.h
index 75c6ad6ee4..18b84905f4 100644
--- a/include/dm/read.h
+++ b/include/dm/read.h
@@ -37,7 +37,7 @@ static inline const struct device_node *dev_np(const struct udevice *dev)
  * @dev:	device to read DT property from
  * @propname:	name of the property to read from
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dev_read_u32(const struct udevice *dev, const char *propname, u32 *outp);
 
@@ -47,7 +47,7 @@ int dev_read_u32(const struct udevice *dev, const char *propname, u32 *outp);
  * @dev:	device to read DT property from
  * @propname:	name of the property to read from
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
 int dev_read_u32_default(const struct udevice *dev, const char *propname,
 			 int def);
@@ -60,7 +60,7 @@ int dev_read_u32_default(const struct udevice *dev, const char *propname,
  * @propname:	name of the property to read from
  * @index:	index of the integer to return
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dev_read_u32_index(struct udevice *dev, const char *propname, int index,
 		       u32 *outp);
@@ -73,7 +73,7 @@ int dev_read_u32_index(struct udevice *dev, const char *propname, int index,
  * @propname:	name of the property to read from
  * @index:	index of the integer to return
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
 u32 dev_read_u32_index_default(struct udevice *dev, const char *propname,
 			       int index, u32 def);
@@ -84,7 +84,7 @@ u32 dev_read_u32_index_default(struct udevice *dev, const char *propname,
  * @dev:	device to read DT property from
  * @propname:	name of the property to read from
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dev_read_s32(const struct udevice *dev, const char *propname, s32 *outp);
 
@@ -94,7 +94,7 @@ int dev_read_s32(const struct udevice *dev, const char *propname, s32 *outp);
  * @dev:	device to read DT property from
  * @propname:	name of the property to read from
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
 int dev_read_s32_default(const struct udevice *dev, const char *propname,
 			 int def);
@@ -107,7 +107,7 @@ int dev_read_s32_default(const struct udevice *dev, const char *propname,
  * @dev:	device to read DT property from
  * @propname:	name of the property to read from
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dev_read_u32u(const struct udevice *dev, const char *propname, uint *outp);
 
@@ -117,7 +117,7 @@ int dev_read_u32u(const struct udevice *dev, const char *propname, uint *outp);
  * @dev:        device to read DT property from
  * @propname:   name of the property to read from
  * @outp:       place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dev_read_u64(const struct udevice *dev, const char *propname, u64 *outp);
 
@@ -127,7 +127,7 @@ int dev_read_u64(const struct udevice *dev, const char *propname, u64 *outp);
  * @dev:        device to read DT property from
  * @propname:   name of the property to read from
  * @def:        default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
 u64 dev_read_u64_default(const struct udevice *dev, const char *propname,
 			 u64 def);
@@ -137,7 +137,7 @@ u64 dev_read_u64_default(const struct udevice *dev, const char *propname,
  *
  * @dev:	device to read DT property from
  * @propname:	name of the property to read
- * @return string from property value, or NULL if there is no such property
+ * Return: string from property value, or NULL if there is no such property
  */
 const char *dev_read_string(const struct udevice *dev, const char *propname);
 
@@ -146,7 +146,7 @@ const char *dev_read_string(const struct udevice *dev, const char *propname);
  *
  * @dev:	device to read DT property from
  * @propname:	name of property to read
- * @return true if property is present (meaning true), false if not present
+ * Return: true if property is present (meaning true), false if not present
  */
 bool dev_read_bool(const struct udevice *dev, const char *propname);
 
@@ -155,17 +155,17 @@ bool dev_read_bool(const struct udevice *dev, const char *propname);
  *
  * @dev:	device whose DT node contains the subnode
  * @subnode_name: name of subnode to find
- * @return reference to subnode (which can be invalid if there is no such
+ * Return: reference to subnode (which can be invalid if there is no such
  * subnode)
  */
-ofnode dev_read_subnode(const struct udevice *dev, const char *subbnode_name);
+ofnode dev_read_subnode(const struct udevice *dev, const char *subnode_name);
 
 /**
  * dev_read_size() - read the size of a property
  *
  * @dev: device to check
  * @propname: property to check
- * @return size of property if present, or -EINVAL if not
+ * Return: size of property if present, or -EINVAL if not
  */
 int dev_read_size(const struct udevice *dev, const char *propname);
 
@@ -176,7 +176,7 @@ int dev_read_size(const struct udevice *dev, const char *propname);
  * @index: the 'reg' property can hold a list of <addr, size> pairs
  *	   and @index is used to select which one is required
  *
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t dev_read_addr_index(const struct udevice *dev, int index);
 
@@ -188,7 +188,7 @@ fdt_addr_t dev_read_addr_index(const struct udevice *dev, int index);
  * @index: the 'reg' property can hold a list of <addr, size> pairs
  *	   and @index is used to select which one is required
  *
- * @return pointer or NULL if not found
+ * Return: pointer or NULL if not found
  */
 void *dev_read_addr_index_ptr(const struct udevice *dev, int index);
 
@@ -200,7 +200,7 @@ void *dev_read_addr_index_ptr(const struct udevice *dev, int index);
  *	   and @index is used to select which one is required
  * @size: place to put size value (on success)
  *
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t dev_read_addr_size_index(const struct udevice *dev, int index,
 				    fdt_size_t *size);
@@ -213,7 +213,7 @@ fdt_addr_t dev_read_addr_size_index(const struct udevice *dev, int index,
  * @index: the 'reg' property can hold a list of <addr, size> pairs
  *	   and @index is used to select which one is required
  *
- * @return pointer or NULL if not found
+ * Return: pointer or NULL if not found
  */
 void *dev_remap_addr_index(const struct udevice *dev, int index);
 
@@ -225,7 +225,7 @@ void *dev_remap_addr_index(const struct udevice *dev, int index);
  *	  'reg-names' property providing named-based identification. @index
  *	  indicates the value to search for in 'reg-names'.
  *
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t dev_read_addr_name(const struct udevice *dev, const char *name);
 
@@ -238,7 +238,7 @@ fdt_addr_t dev_read_addr_name(const struct udevice *dev, const char *name);
  *	  indicates the value to search for in 'reg-names'.
  *  @size: place to put size value (on success)
  *
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t dev_read_addr_size_name(const struct udevice *dev, const char *name,
 				   fdt_size_t *size);
@@ -252,7 +252,7 @@ fdt_addr_t dev_read_addr_size_name(const struct udevice *dev, const char *name,
  *	  'reg-names' property providing named-based identification. @index
  *	  indicates the value to search for in 'reg-names'.
  *
- * @return pointer or NULL if not found
+ * Return: pointer or NULL if not found
  */
 void *dev_remap_addr_name(const struct udevice *dev, const char *name);
 
@@ -261,7 +261,7 @@ void *dev_remap_addr_name(const struct udevice *dev, const char *name);
  *
  * @dev: Device to read from
  *
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t dev_read_addr(const struct udevice *dev);
 
@@ -271,7 +271,7 @@ fdt_addr_t dev_read_addr(const struct udevice *dev);
  *
  * @dev: Device to read from
  *
- * @return pointer or NULL if not found
+ * Return: pointer or NULL if not found
  */
 void *dev_read_addr_ptr(const struct udevice *dev);
 
@@ -291,7 +291,7 @@ void *dev_read_addr_ptr(const struct udevice *dev);
  *    fdtdec_get_addr() and friends.
  *
  * @dev: Device to read from
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t dev_read_addr_pci(const struct udevice *dev);
 
@@ -301,7 +301,7 @@ fdt_addr_t dev_read_addr_pci(const struct udevice *dev);
  *
  * @dev: Device to read from
  *
- * @return pointer or NULL if not found
+ * Return: pointer or NULL if not found
  */
 void *dev_remap_addr(const struct udevice *dev);
 
@@ -314,7 +314,7 @@ void *dev_remap_addr(const struct udevice *dev);
  * @dev: Device to read from
  * @propname: property to read
  * @sizep: place to put size value (on success)
- * @return address value, or FDT_ADDR_T_NONE on error
+ * Return: address value, or FDT_ADDR_T_NONE on error
  */
 fdt_addr_t dev_read_addr_size(const struct udevice *dev, const char *propname,
 			      fdt_size_t *sizep);
@@ -323,7 +323,7 @@ fdt_addr_t dev_read_addr_size(const struct udevice *dev, const char *propname,
  * dev_read_name() - get the name of a device's node
  *
  * @dev: Device to read from
- * @return name of node
+ * Return: name of node
  */
 const char *dev_read_name(const struct udevice *dev);
 
@@ -340,12 +340,12 @@ const char *dev_read_name(const struct udevice *dev);
  * @propname: name of the property containing the string list
  * @string: string to look up in the string list
  *
- * @return:
+ * Return:
  *   the index of the string in the list of strings
  *   -ENODATA if the property is not found
  *   -EINVAL on some other error
  */
-int dev_read_stringlist_search(const struct udevice *dev, const char *property,
+int dev_read_stringlist_search(const struct udevice *dev, const char *propname,
 			       const char *string);
 
 /**
@@ -354,9 +354,9 @@ int dev_read_stringlist_search(const struct udevice *dev, const char *property,
  * @dev: device to examine
  * @propname: name of the property containing the string list
  * @index: index of the string to return
- * @out: return location for the string
+ * @outp: return location for the string
  *
- * @return:
+ * Return:
  *   length of string, if found or -ve error value if not found
  */
 int dev_read_string_index(const struct udevice *dev, const char *propname,
@@ -367,7 +367,7 @@ int dev_read_string_index(const struct udevice *dev, const char *propname,
  *
  * @dev: device to examine
  * @propname: name of the property containing the string list
- * @return:
+ * Return:
  *   number of strings in the list, or -ve error value if not found
  */
 int dev_read_string_count(const struct udevice *dev, const char *propname);
@@ -386,8 +386,9 @@ int dev_read_string_count(const struct udevice *dev, const char *propname);
  * @propname: name of the property containing the string list
  * @listp: returns an allocated, NULL-terminated list of strings if the return
  *	value is > 0, else is set to NULL
- * @return number of strings in list, 0 if none, -ENOMEM if out of memory,
- *	-ENOENT if no such property
+ * Return:
+ * number of strings in list, 0 if none, -ENOMEM if out of memory,
+ * -ENOENT if no such property
  */
 int dev_read_string_list(const struct udevice *dev, const char *propname,
 			 const char ***listp);
@@ -402,19 +403,17 @@ int dev_read_string_list(const struct udevice *dev, const char *propname,
  * Caller is responsible to call of_node_put() on the returned out_args->np
  * pointer.
  *
- * Example:
+ * Example: ::
  *
- * phandle1: node1 {
- *	#list-cells = <2>;
- * }
- *
- * phandle2: node2 {
- *	#list-cells = <1>;
- * }
- *
- * node3 {
- *	list = <&phandle1 1 2 &phandle2 3>;
- * }
+ *   phandle1: node1 {
+ *       #list-cells = <2>;
+ *   };
+ *   phandle2: node2 {
+ *       #list-cells = <1>;
+ *   };
+ *   node3 {
+ *       list = <&phandle1 1 2 &phandle2 3>;
+ *   };
  *
  * To get a device_node of the `node2' node you may call this:
  * dev_read_phandle_with_args(dev, "list", "#list-cells", 0, 1, &args);
@@ -422,10 +421,10 @@ int dev_read_string_list(const struct udevice *dev, const char *propname,
  * @dev:	device whose node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
- * @cells_count: Cell count to use if @cells_name is NULL
+ * @cell_count: Cell count to use if @cells_name is NULL
  * @index:	index of a phandle to parse out
  * @out_args:	optional pointer to output arguments structure (will be filled)
- * @return 0 on success (with @out_args filled out if not NULL), -ENOENT if
+ * Return: 0 on success (with @out_args filled out if not NULL), -ENOENT if
  *	@list_name does not exist, -EINVAL if a phandle was not found,
  *	@cells_name could not be found, the arguments were truncated or there
  *	were too many arguments.
@@ -441,12 +440,11 @@ int dev_read_phandle_with_args(const struct udevice *dev, const char *list_name,
  * For example, this allows to allocate the right amount of memory to keep
  * clock's reference contained into the "clocks" property.
  *
- *
  * @dev:	device whose node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
- * @cells_count: Cell count to use if @cells_name is NULL
- * @Returns number of phandle found on success, on error returns appropriate
+ * @cell_count: Cell count to use if @cells_name is NULL
+ * Return: number of phandle found on success, on error returns appropriate
  * errno value.
  */
 
@@ -461,7 +459,7 @@ int dev_count_phandle_with_args(const struct udevice *dev,
  * which controls the given node.
  *
  * @dev: device to check
- * @return number of address cells this node uses
+ * Return: number of address cells this node uses
  */
 int dev_read_addr_cells(const struct udevice *dev);
 
@@ -472,7 +470,7 @@ int dev_read_addr_cells(const struct udevice *dev);
  * which controls the given node.
  *
  * @dev: device to check
- * @return number of size cells this node uses
+ * Return: number of size cells this node uses
  */
 int dev_read_size_cells(const struct udevice *dev);
 
@@ -482,7 +480,7 @@ int dev_read_size_cells(const struct udevice *dev);
  * This function matches fdt_address_cells().
  *
  * @dev: device to check
- * @return number of address cells this node uses
+ * Return: number of address cells this node uses
  */
 int dev_read_simple_addr_cells(const struct udevice *dev);
 
@@ -492,7 +490,7 @@ int dev_read_simple_addr_cells(const struct udevice *dev);
  * This function matches fdt_size_cells().
  *
  * @dev: device to check
- * @return number of size cells this node uses
+ * Return: number of size cells this node uses
  */
 int dev_read_simple_size_cells(const struct udevice *dev);
 
@@ -500,7 +498,7 @@ int dev_read_simple_size_cells(const struct udevice *dev);
  * dev_read_phandle() - Get the phandle from a device
  *
  * @dev: device to check
- * @return phandle (1 or greater), or 0 if no phandle or other error
+ * Return: phandle (1 or greater), or 0 if no phandle or other error
  */
 int dev_read_phandle(const struct udevice *dev);
 
@@ -510,7 +508,7 @@ int dev_read_phandle(const struct udevice *dev);
  * @dev: device to check
  * @propname: property to read
  * @lenp: place to put length on success
- * @return pointer to property, or NULL if not found
+ * Return: pointer to property, or NULL if not found
  */
 const void *dev_read_prop(const struct udevice *dev, const char *propname,
 			  int *lenp);
@@ -523,7 +521,7 @@ const void *dev_read_prop(const struct udevice *dev, const char *propname,
  *
  * @dev: device to check
  * @prop: place to put argument reference
- * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
  */
 int dev_read_first_prop(const struct udevice *dev, struct ofprop *prop);
 
@@ -534,7 +532,7 @@ int dev_read_first_prop(const struct udevice *dev, struct ofprop *prop);
  * and read all the property with dev_read_prop_by_prop().
  *
  * @prop: reference of current argument and place to put reference of next one
- * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
  */
 int dev_read_next_prop(struct ofprop *prop);
 
@@ -546,7 +544,7 @@ int dev_read_next_prop(struct ofprop *prop);
  * @prop: reference on property
  * @propname: If non-NULL, place to property name on success,
  * @lenp: If non-NULL, place to put length on success
- * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
  */
 const void *dev_read_prop_by_prop(struct ofprop *prop,
 				  const char **propname, int *lenp);
@@ -560,7 +558,7 @@ const void *dev_read_prop_by_prop(struct ofprop *prop,
  *
  * @dev: device to look up
  * @devnump: set to the sequence number if one is found
- * @return 0 if a sequence was found, -ve if not
+ * Return: 0 if a sequence was found, -ve if not
  */
 int dev_read_alias_seq(const struct udevice *dev, int *devnump);
 
@@ -576,7 +574,7 @@ int dev_read_alias_seq(const struct udevice *dev, int *devnump);
  * @propname:	name of the property to read
  * @out_values:	pointer to return value, modified only if return value is 0
  * @sz:		number of array elements to read
- * @return 0 on success, -EINVAL if the property does not exist, -ENODATA if
+ * Return: 0 on success, -EINVAL if the property does not exist, -ENODATA if
  * property does not have a value, and -EOVERFLOW if the property data isn't
  * large enough.
  */
@@ -587,7 +585,7 @@ int dev_read_u32_array(const struct udevice *dev, const char *propname,
  * dev_read_first_subnode() - find the first subnode of a device's node
  *
  * @dev: device to look up
- * @return reference to the first subnode (which can be invalid if the device's
+ * Return: reference to the first subnode (which can be invalid if the device's
  * node has no subnodes)
  */
 ofnode dev_read_first_subnode(const struct udevice *dev);
@@ -596,7 +594,7 @@ ofnode dev_read_first_subnode(const struct udevice *dev);
  * ofnode_next_subnode() - find the next sibling of a subnode
  *
  * @node:	valid reference to previous node (sibling)
- * @return reference to the next subnode (which can be invalid if the node
+ * Return: reference to the next subnode (which can be invalid if the node
  * has no more siblings)
  */
 ofnode dev_read_next_subnode(ofnode node);
@@ -612,8 +610,9 @@ ofnode dev_read_next_subnode(ofnode node);
  * @dev: device to look up
  * @propname: name of property to find
  * @sz: number of array elements
- * @return pointer to byte array if found, or NULL if the property is not
- *		found or there is not enough data
+ * Return:
+ * pointer to byte array if found, or NULL if the property is not found or
+ * there is not enough data
  */
 const uint8_t *dev_read_u8_array_ptr(const struct udevice *dev,
 				     const char *propname, size_t sz);
@@ -627,7 +626,7 @@ const uint8_t *dev_read_u8_array_ptr(const struct udevice *dev,
  * by default.
  *
  * @dev: device to examine
- * @return integer value 0 (not enabled) or 1 (enabled)
+ * Return: integer value 0 (not enabled) or 1 (enabled)
  */
 int dev_read_enabled(const struct udevice *dev);
 
@@ -635,9 +634,9 @@ int dev_read_enabled(const struct udevice *dev);
  * dev_read_resource() - obtain an indexed resource from a device.
  *
  * @dev: device to examine
- * @index index of the resource to retrieve (0 = first)
- * @res returns the resource
- * @return 0 if ok, negative on error
+ * @index: index of the resource to retrieve (0 = first)
+ * @res: returns the resource
+ * Return: 0 if ok, negative on error
  */
 int dev_read_resource(const struct udevice *dev, uint index,
 		      struct resource *res);
@@ -648,7 +647,7 @@ int dev_read_resource(const struct udevice *dev, uint index,
  * @dev: device to examine
  * @name: name of the resource to retrieve
  * @res: returns the resource
- * @return 0 if ok, negative on error
+ * Return: 0 if ok, negative on error
  */
 int dev_read_resource_byname(const struct udevice *dev, const char *name,
 			     struct resource *res);
@@ -662,7 +661,7 @@ int dev_read_resource_byname(const struct udevice *dev, const char *name,
  *
  * @dev: device giving the context in which to translate the address
  * @in_addr: pointer to the address to translate
- * @return the translated address; OF_BAD_ADDR on error
+ * Return: the translated address; OF_BAD_ADDR on error
  */
 u64 dev_translate_address(const struct udevice *dev, const fdt32_t *in_addr);
 
@@ -675,7 +674,7 @@ u64 dev_translate_address(const struct udevice *dev, const fdt32_t *in_addr);
  *
  * @dev: device giving the context in which to translate the DMA address
  * @in_addr: pointer to the DMA address to translate
- * @return the translated DMA address; OF_BAD_ADDR on error
+ * Return: the translated DMA address; OF_BAD_ADDR on error
  */
 u64 dev_translate_dma_address(const struct udevice *dev,
 			      const fdt32_t *in_addr);
@@ -690,7 +689,7 @@ u64 dev_translate_dma_address(const struct udevice *dev,
  * @cpu: base address for CPU's view of memory
  * @bus: base address for BUS's view of memory
  * @size: size of the address space
- * @return 0 if ok, negative on error
+ * Return: 0 if ok, negative on error
  */
 int dev_get_dma_range(const struct udevice *dev, phys_addr_t *cpu,
 		      dma_addr_t *bus, u64 *size);
@@ -701,15 +700,15 @@ int dev_get_dma_range(const struct udevice *dev, phys_addr_t *cpu,
  *
  * The function travels the lookup table to get the highest alias id for the
  * given alias stem.
- * @return alias ID, if found, else -1
+ * Return: alias ID, if found, else -1
  */
 int dev_read_alias_highest_id(const char *stem);
 
 /**
  * dev_get_child_count() - get the child count of a device
  *
- * @dev: device to use for interation (struct udevice *)
- * @return the count of child subnode
+ * @dev: device to use for interation (`struct udevice *`)
+ * Return: the count of child subnode
  */
 int dev_get_child_count(const struct udevice *dev);
 
@@ -720,8 +719,8 @@ int dev_get_child_count(const struct udevice *dev);
  * range for this node.
  *
  * @dev: device to examine
- * @res returns the resource
- * @return 0 if ok, negative on error
+ * @res: returns the resource
+ * Return: 0 if ok, negative on error
  */
 int dev_read_pci_bus_range(const struct udevice *dev, struct resource *res);
 
@@ -737,7 +736,7 @@ int dev_read_pci_bus_range(const struct udevice *dev, struct resource *res);
  *       one or more display timing nodes.
  * @index: index number to read (0=first timing subnode)
  * @config: place to put timings
- * @return 0 if OK, -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -FDT_ERR_NOTFOUND if not found
  */
 int dev_decode_display_timing(const struct udevice *dev, int index,
 			      struct display_timing *config);
@@ -1100,7 +1099,7 @@ static inline int dev_decode_display_timing(const struct udevice *dev,
  * device-tree node.
  *
  * @subnode: ofnode holding the current subnode
- * @dev: device to use for interation (struct udevice *)
+ * @dev: device to use for interation (`struct udevice *`)
  */
 #define dev_for_each_subnode(subnode, dev) \
 	for (subnode = dev_read_first_subnode(dev); \
@@ -1114,7 +1113,7 @@ static inline int dev_decode_display_timing(const struct udevice *dev,
  * device-tree node.
  *
  * @prop: struct ofprop holding the current property
- * @dev: device to use for interation (struct udevice *)
+ * @dev: device to use for interation (`struct udevice *`)
  */
 #define dev_for_each_property(prop, dev) \
 	for (int ret_prop = dev_read_first_prop(dev, &prop); \
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
