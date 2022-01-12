Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F253F48C1B4
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:54:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B34F8C60461;
	Wed, 12 Jan 2022 09:54:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44B6AC60460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:54:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7I3BF005683;
 Wed, 12 Jan 2022 10:53:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=r80AdfBx+IvdR4Td01P+RZPzpA+0ru4Gm7qes3QuXqA=;
 b=anqOdAcJPCHREsnP3alSr3tGZcUuncfDcDsQVpbbSMVtsGEa/GdqQMHk/GCQCB8MyeVI
 2l7/6zmw8lTt9wzZbHR0oLvB3UNl/W5FYjBwbVtBax1XT7MUgR2HVqnQ2qupOEJxvaZS
 /YmqdqzBTdzFTf7PMta6nTSGZK3pYaXtxaTdiprrmzyJANhgWwTmF0yeeHzBnlGEJY8e
 oyHEAQEaCTNsHHstYSbDFyTqKwDNzyTG/59GyBC9pQ2f9uGY7VNZM29DWhUSzeqrbMrj
 hlw0fzWupl8g5/jTp//P8JNKfAZUYwS6pin6dKAAfe+siqRizXSm1lNgQ1GhW/xXuIlJ 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtft1242-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14B4810002A;
 Wed, 12 Jan 2022 10:53:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08B922194F4;
 Wed, 12 Jan 2022 10:53:58 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:57
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:49 +0100
Message-ID: <20220112105327.8.Ie3a53cf98ca389d4d05b0d353047f19ddc1c2530@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 8/9] doc: add include/dm/of*.h to the HTML
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

Correct Sphinx style comments in include/dm/ofnode.h
and add the device tree node API to the HTML documentation;
the ofnode functions are compatible with Live tree or with flat
device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst         |   9 ++
 include/dm/of.h        |  13 +-
 include/dm/of_access.h | 141 ++++++++---------
 include/dm/of_addr.h   |  33 ++--
 include/dm/of_extra.h  |  48 +++---
 include/dm/ofnode.h    | 332 +++++++++++++++++++++--------------------
 6 files changed, 297 insertions(+), 279 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index 19a473f1f0..5bb66f2f50 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -17,3 +17,12 @@ Device
 .. kernel-doc:: include/dm/device.h
 .. kernel-doc:: include/dm/devres.h
 .. kernel-doc:: include/dm/read.h
+
+Device tree
+-----------
+
+.. kernel-doc:: include/dm/of.h
+.. kernel-doc:: include/dm/ofnode.h
+.. kernel-doc:: include/dm/of_extra.h
+.. kernel-doc:: include/dm/of_access.h
+.. kernel-doc:: include/dm/of_addr.h
diff --git a/include/dm/of.h b/include/dm/of.h
index 5cb6f44a6c..963e1de44c 100644
--- a/include/dm/of.h
+++ b/include/dm/of.h
@@ -58,14 +58,13 @@ struct device_node {
  * struct of_phandle_args - structure to hold phandle and arguments
  *
  * This is used when decoding a phandle in a device tree property. Typically
- * these look like this:
+ * these look like this: ::
  *
- * wibble {
- *    phandle = <5>;
- * };
- *
- * ...
- * some-prop = <&wibble 1 2 3>
+ *   wibble {
+ *     phandle = <5>;
+ *   };
+ *   ...
+ *   some-prop = <&wibble 1 2 3>
  *
  * Here &node is the phandle of the node 'wibble', i.e. 5. There are three
  * arguments: 1, 2, 3.
diff --git a/include/dm/of_access.h b/include/dm/of_access.h
index cc382b1671..2beb3797d7 100644
--- a/include/dm/of_access.h
+++ b/include/dm/of_access.h
@@ -44,7 +44,7 @@ static inline void of_node_put(const struct device_node *np) { }
  * which controls the given node.
  *
  * @np: Node pointer to check
- * @return number of address cells this node uses
+ * Return: number of address cells this node uses
  */
 int of_n_addr_cells(const struct device_node *np);
 
@@ -55,7 +55,7 @@ int of_n_addr_cells(const struct device_node *np);
  * which controls the given node.
  *
  * @np: Node pointer to check
- * @return number of size cells this node uses
+ * Return: number of size cells this node uses
  */
 int of_n_size_cells(const struct device_node *np);
 
@@ -65,7 +65,7 @@ int of_n_size_cells(const struct device_node *np);
  * This function matches fdt_address_cells().
  *
  * @np: Node pointer to check
- * @return value of #address-cells property in this node, or 2 if none
+ * Return: value of #address-cells property in this node, or 2 if none
  */
 int of_simple_addr_cells(const struct device_node *np);
 
@@ -75,7 +75,7 @@ int of_simple_addr_cells(const struct device_node *np);
  * This function matches fdt_size_cells().
  *
  * @np: Node pointer to check
- * @return value of #size-cells property in this node, or 2 if none
+ * Return: value of #size-cells property in this node, or 2 if none
  */
 int of_simple_size_cells(const struct device_node *np);
 
@@ -85,7 +85,7 @@ int of_simple_size_cells(const struct device_node *np);
  * @np: Pointer to device node holding property
  * @name: Name of property
  * @lenp: If non-NULL, returns length of property
- * @return pointer to property, or NULL if not found
+ * Return: pointer to property, or NULL if not found
  */
 struct property *of_find_property(const struct device_node *np,
 				  const char *name, int *lenp);
@@ -98,7 +98,7 @@ struct property *of_find_property(const struct device_node *np,
  * @np: Pointer to device node holding property
  * @name: Name of property
  * @lenp: If non-NULL, returns length of property
- * @return pointer to property value, or NULL if not found
+ * Return: pointer to property value, or NULL if not found
  */
 const void *of_get_property(const struct device_node *np, const char *name,
 			    int *lenp);
@@ -110,7 +110,7 @@ const void *of_get_property(const struct device_node *np, const char *name,
  * and read all the property with of_get_next_property_by_prop().
  *
  * @np: Pointer to device node
- * @return pointer to property or NULL if not found
+ * Return: pointer to property or NULL if not found
  */
 const struct property *of_get_first_property(const struct device_node *np);
 
@@ -122,7 +122,7 @@ const struct property *of_get_first_property(const struct device_node *np);
  *
  * @np: Pointer to device node
  * @property: pointer of the current property
- * @return pointer to next property or NULL if not found
+ * Return: pointer to next property or NULL if not found
  */
 const struct property *of_get_next_property(const struct device_node *np,
 					    const struct property *property);
@@ -132,11 +132,11 @@ const struct property *of_get_next_property(const struct device_node *np,
  *
  * Get value for the property identified by node and property pointer.
  *
- * @node: node to read
+ * @np: Pointer to device node
  * @property: pointer of the property to read
- * @propname: place to property name on success
+ * @name: place to property name on success
  * @lenp: place to put length on success
- * @return pointer to property value or NULL if error
+ * Return: pointer to property value or NULL if error
  */
 const void *of_get_property_by_prop(const struct device_node *np,
 				    const struct property *property,
@@ -145,7 +145,7 @@ const void *of_get_property_by_prop(const struct device_node *np,
 
 /**
  * of_device_is_compatible() - Check if the node matches given constraints
- * @device: pointer to node
+ * @np: Pointer to device node
  * @compat: required compatible string, NULL or "" for any match
  * @type: required device_type value, NULL or "" for any match
  * @name: required node name, NULL or "" for any match
@@ -154,7 +154,7 @@ const void *of_get_property_by_prop(const struct device_node *np,
  * properties of the given @device. A constraints can be skipped by
  * passing NULL or an empty string as the constraint.
  *
- * @return 0 for no match, and a positive integer on match. The return
+ * Return: 0 for no match, and a positive integer on match. The return
  * value is a relative score with larger values indicating better
  * matches. The score is weighted for the most specific compatible value
  * to get the highest score. Matching type is next, followed by matching
@@ -179,9 +179,9 @@ int of_device_is_compatible(const struct device_node *np, const char *compat,
 /**
  * of_device_is_available() - check if a device is available for use
  *
- * @device: Node to check for availability
+ * @np: Pointer to device node to check for availability
  *
- * @return true if the status property is absent or set to "okay", false
+ * Return: true if the status property is absent or set to "okay", false
  * otherwise
  */
 bool of_device_is_available(const struct device_node *np);
@@ -189,8 +189,8 @@ bool of_device_is_available(const struct device_node *np);
 /**
  * of_get_parent() - Get a node's parent, if any
  *
- * @node: Node to check
- * @eturns a node pointer, or NULL if none
+ * @np: Pointer to device node  to check
+ * Return: a node pointer, or NULL if none
  */
 struct device_node *of_get_parent(const struct device_node *np);
 
@@ -208,7 +208,7 @@ struct device_node *of_get_parent(const struct device_node *np);
  *	foo		Valid alias
  *	foo/bar		Valid alias + relative path
  *
- * @return a node pointer or NULL if not found
+ * Return: a node pointer or NULL if not found
  */
 struct device_node *of_find_node_opts_by_path(const char *path,
 					      const char **opts);
@@ -228,7 +228,7 @@ static inline struct device_node *of_find_node_by_path(const char *path)
  * @type: The type string to match "device_type" or NULL to ignore
  * @compatible:	The string to match to one of the tokens in the device
  *	"compatible" list.
- * @return node pointer or NULL if not found
+ * Return: node pointer or NULL if not found
  */
 struct device_node *of_find_compatible_node(struct device_node *from,
 				const char *type, const char *compatible);
@@ -243,7 +243,7 @@ struct device_node *of_find_compatible_node(struct device_node *from,
  * @propname: property name to check
  * @propval: property value to search for
  * @proplen: length of the value in propval
- * @return node pointer or NULL if not found
+ * Return: node pointer or NULL if not found
  */
 struct device_node *of_find_node_by_prop_value(struct device_node *from,
 					       const char *propname,
@@ -254,7 +254,7 @@ struct device_node *of_find_node_by_prop_value(struct device_node *from,
  *
  * @handle:	phandle of the node to find
  *
- * @return node pointer, or NULL if not found
+ * Return: node pointer, or NULL if not found
  */
 struct device_node *of_find_node_by_phandle(phandle handle);
 
@@ -268,7 +268,7 @@ struct device_node *of_find_node_by_phandle(phandle handle);
  * @propname:	name of the property to be searched.
  * @outp:	pointer to return value, modified only if return value is 0.
  *
- * @return 0 on success, -EINVAL if the property does not exist,
+ * Return: 0 on success, -EINVAL if the property does not exist,
  * -ENODATA if property does not have a value, and -EOVERFLOW if the
  * property data isn't large enough.
  */
@@ -286,9 +286,10 @@ int of_read_u32(const struct device_node *np, const char *propname, u32 *outp);
  * @index:	index of the u32 in the list of values
  * @outp:	pointer to return value, modified only if return value is 0.
  *
- * @return 0 on success, -EINVAL if the property does not exist,
- * -ENODATA if property does not have a value, and -EOVERFLOW if the
- * property data isn't large enough.
+ * Return:
+ *   0 on success, -EINVAL if the property does not exist,
+ *   -ENODATA if property does not have a value, and -EOVERFLOW if the
+ *   property data isn't large enough.
  */
 int of_read_u32_index(const struct device_node *np, const char *propname,
 		      int index, u32 *outp);
@@ -303,9 +304,10 @@ int of_read_u32_index(const struct device_node *np, const char *propname,
  * @propname:	name of the property to be searched.
  * @outp:	pointer to return value, modified only if return value is 0.
  *
- * @return 0 on success, -EINVAL if the property does not exist,
- * -ENODATA if property does not have a value, and -EOVERFLOW if the
- * property data isn't large enough.
+ * Return:
+ *   0 on success, -EINVAL if the property does not exist,
+ *   -ENODATA if property does not have a value, and -EOVERFLOW if the
+ *   property data isn't large enough.
  */
 int of_read_u64(const struct device_node *np, const char *propname, u64 *outp);
 
@@ -319,8 +321,9 @@ int of_read_u64(const struct device_node *np, const char *propname, u64 *outp);
  * @propname:	name of the property to be searched.
  * @out_values:	pointer to return value, modified only if return value is 0.
  * @sz:		number of array elements to read
- * @return 0 on success, -EINVAL if the property does not exist, -ENODATA
- * if property does not have a value, and -EOVERFLOW is longer than sz.
+ * Return:
+ *   0 on success, -EINVAL if the property does not exist, -ENODATA
+ *   if property does not have a value, and -EOVERFLOW is longer than sz.
  */
 int of_read_u32_array(const struct device_node *np, const char *propname,
 		      u32 *out_values, size_t sz);
@@ -334,8 +337,9 @@ int of_read_u32_array(const struct device_node *np, const char *propname,
  * @np: pointer to node containing string list property
  * @propname: string list property name
  * @string: pointer to string to search for in string list
- * @return 0 on success, -EINVAL if the property does not exist, -ENODATA
- * if property does not have a value, and -EOVERFLOW is longer than sz.
+ * Return:
+ *   0 on success, -EINVAL if the property does not exist, -ENODATA
+ *   if property does not have a value, and -EOVERFLOW is longer than sz.
  */
 int of_property_match_string(const struct device_node *np, const char *propname,
 			     const char *string);
@@ -350,15 +354,17 @@ int of_property_read_string_helper(const struct device_node *np,
  * @np:		device node from which the property value is to be read.
  * @propname:	name of the property to be searched.
  * @index:	index of the string in the list of strings
- * @out_string:	pointer to null terminated return string, modified only if
+ * @output:	pointer to null terminated return string, modified only if
  *		return value is 0.
  *
  * Search for a property in a device tree node and retrieve a null
  * terminated string value (pointer to data, not a copy) in the list of strings
  * contained in that property.
- * Returns 0 on success, -EINVAL if the property does not exist, -ENODATA if
- * property does not have a value, and -EILSEQ if the string is not
- * null-terminated within the length of the property data.
+ *
+ * Return:
+ *   0 on success, -EINVAL if the property does not exist, -ENODATA if
+ *   property does not have a value, and -EILSEQ if the string is not
+ *   null-terminated within the length of the property data.
  *
  * The out_string pointer is modified only if a valid string can be decoded.
  */
@@ -377,10 +383,12 @@ static inline int of_property_read_string_index(const struct device_node *np,
  * @propname:	name of the property to be searched.
  *
  * Search for a property in a device tree node and retrieve the number of null
- * terminated string contain in it. Returns the number of strings on
- * success, -EINVAL if the property does not exist, -ENODATA if property
- * does not have a value, and -EILSEQ if the string is not null-terminated
- * within the length of the property data.
+ * terminated string contain in it.
+ *
+ * Return:
+ *   the number of strings on success, -EINVAL if the property does not exist,
+ *   -ENODATA if property does not have a value, and -EILSEQ if the string is
+ *   not null-terminated within the length of the property data.
  */
 static inline int of_property_count_strings(const struct device_node *np,
 					    const char *propname)
@@ -395,8 +403,9 @@ static inline int of_property_count_strings(const struct device_node *np,
  * @index: For properties holding a table of phandles, this is the index into
  *         the table
  *
- * Returns the device_node pointer with refcount incremented.  Use
- * of_node_put() on it when done.
+ * Return:
+ *   the device_node pointer with refcount incremented.  Use
+ *   of_node_put() on it when done.
  */
 struct device_node *of_parse_phandle(const struct device_node *np,
 				     const char *phandle_name, int index);
@@ -410,10 +419,11 @@ struct device_node *of_parse_phandle(const struct device_node *np,
  * @cells_count: Cell count to use if @cells_name is NULL
  * @index:	index of a phandle to parse out
  * @out_args:	optional pointer to output arguments structure (will be filled)
- * @return 0 on success (with @out_args filled out if not NULL), -ENOENT if
- *	@list_name does not exist, -EINVAL if a phandle was not found,
- *	@cells_name could not be found, the arguments were truncated or there
- *	were too many arguments.
+ * Return:
+ *   0 on success (with @out_args filled out if not NULL), -ENOENT if
+ *   @list_name does not exist, -EINVAL if a phandle was not found,
+ *   @cells_name could not be found, the arguments were truncated or there
+ *   were too many arguments.
  *
  * This function is useful to parse lists of phandles and their arguments.
  * Returns 0 on success and fills out_args, on error returns appropriate
@@ -422,19 +432,17 @@ struct device_node *of_parse_phandle(const struct device_node *np,
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
  * of_parse_phandle_with_args(node3, "list", "#list-cells", 1, &args);
@@ -451,14 +459,13 @@ int of_parse_phandle_with_args(const struct device_node *np,
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
  * @cells_count: Cell count to use if @cells_name is NULL
- * @return number of phandle found, -ENOENT if
- *	@list_name does not exist, -EINVAL if a phandle was not found,
- *	@cells_name could not be found, the arguments were truncated or there
- *	were too many arguments.
+ * Return:
+ *   number of phandle found, -ENOENT if @list_name does not exist,
+ *   -EINVAL if a phandle was not found, @cells_name could not be found,
+ *   the arguments were truncated or there were too many arguments.
  *
  * Returns number of phandle found on success, on error returns appropriate
  * errno value.
- *
  */
 int of_count_phandle_with_args(const struct device_node *np,
 			       const char *list_name, const char *cells_name,
@@ -471,7 +478,7 @@ int of_count_phandle_with_args(const struct device_node *np,
  * the lookup table with the properties.  It returns the number of alias
  * properties found, or an error code in case of failure.
  *
- * @return 9 if OK, -ENOMEM if not enough memory
+ * Return: 9 if OK, -ENOMEM if not enough memory
  */
 int of_alias_scan(void);
 
@@ -483,7 +490,7 @@ int of_alias_scan(void);
  *
  * @np:		Pointer to the given device_node
  * @stem:	Alias stem of the given device_node
- * @return alias ID, if found, else -ENODEV
+ * Return: alias ID, if found, else -ENODEV
  */
 int of_alias_get_id(const struct device_node *np, const char *stem);
 
@@ -493,14 +500,14 @@ int of_alias_get_id(const struct device_node *np, const char *stem);
  *
  * The function travels the lookup table to get the highest alias id for the
  * given alias stem.
- * @return alias ID, if found, else -1
+ * Return: alias ID, if found, else -1
  */
 int of_alias_get_highest_id(const char *stem);
 
 /**
  * of_get_stdout() - Get node to use for stdout
  *
- * @return node referred to by stdout-path alias, or NULL if none
+ * Return: node referred to by stdout-path alias, or NULL if none
  */
 struct device_node *of_get_stdout(void);
 
diff --git a/include/dm/of_addr.h b/include/dm/of_addr.h
index ee21d5cf4f..e7f3a28081 100644
--- a/include/dm/of_addr.h
+++ b/include/dm/of_addr.h
@@ -20,11 +20,11 @@
  * that can be mapped to a cpu physical address). This is not really specified
  * that way, but this is traditionally the way IBM at least do things
  *
- * @np: node to check
+ * @np: pointer to node to check
  * @in_addr: pointer to input address
- * @return translated address or OF_BAD_ADDR on error
+ * Return: translated address or OF_BAD_ADDR on error
  */
-u64 of_translate_address(const struct device_node *no, const __be32 *in_addr);
+u64 of_translate_address(const struct device_node *np, const __be32 *in_addr);
 
 /**
  * of_translate_dma_address() - translate a device-tree DMA address to a CPU
@@ -38,11 +38,11 @@ u64 of_translate_address(const struct device_node *no, const __be32 *in_addr);
  * that can be mapped to a cpu physical address). This is not really specified
  * that way, but this is traditionally the way IBM at least do things
  *
- * @np: node to check
+ * @np: ne
  * @in_addr: pointer to input DMA address
- * @return translated DMA address or OF_BAD_ADDR on error
+ * Return: translated DMA address or OF_BAD_ADDR on error
  */
-u64 of_translate_dma_address(const struct device_node *no, const __be32 *in_addr);
+u64 of_translate_dma_address(const struct device_node *np, const __be32 *in_addr);
 
 
 /**
@@ -51,14 +51,13 @@ u64 of_translate_dma_address(const struct device_node *no, const __be32 *in_addr
  * Get DMA ranges for a specifc node, this is useful to perform bus->cpu and
  * cpu->bus address translations
  *
- * @param blob		Pointer to device tree blob
- * @param node_offset	Node DT offset
- * @param cpu		Pointer to variable storing the range's cpu address
- * @param bus		Pointer to variable storing the range's bus address
- * @param size		Pointer to variable storing the range's size
- * @return translated DMA address or OF_BAD_ADDR on error
+ * @np:		Pointer to device tree blob
+ * @cpu:	Pointer to variable storing the range's cpu address
+ * @bus:	Pointer to variable storing the range's bus address
+ * @size:	Pointer to variable storing the range's size
+ * Return: translated DMA address or OF_BAD_ADDR on error
  */
-int of_get_dma_range(const struct device_node *dev, phys_addr_t *cpu,
+int of_get_dma_range(const struct device_node *np, phys_addr_t *cpu,
 		     dma_addr_t *bus, u64 *size);
 
 /**
@@ -72,9 +71,9 @@ int of_get_dma_range(const struct device_node *dev, phys_addr_t *cpu,
  * @index: Index of address to read (0 = first)
  * @size: place to put size on success
  * @flags: place to put flags on success
- * @return pointer to address which can be read
+ * Return: pointer to address which can be read
  */
-const __be32 *of_get_address(const struct device_node *no, int index,
+const __be32 *of_get_address(const struct device_node *np, int index,
 			     u64 *size, unsigned int *flags);
 
 struct resource;
@@ -90,9 +89,9 @@ struct resource;
  * @np: node to check
  * @index: index of address to read (0 = first)
  * @r: place to put resource information
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
-int of_address_to_resource(const struct device_node *no, int index,
+int of_address_to_resource(const struct device_node *np, int index,
 			   struct resource *r);
 
 #endif
diff --git a/include/dm/of_extra.h b/include/dm/of_extra.h
index c2498aa585..17e85a819b 100644
--- a/include/dm/of_extra.h
+++ b/include/dm/of_extra.h
@@ -41,11 +41,11 @@ struct fmap_entry {
 };
 
 /**
- * Read a flash entry from the fdt
+ * ofnode_read_fmap_entry() - Read a flash entry from the fdt
  *
- * @param node		Reference to node to read
- * @param entry		Place to put offset and size of this node
- * @return 0 if ok, -ve on error
+ * @node:	Reference to node to read
+ * @entry:	Place to put offset and size of this node
+ * Return: 0 if ok, -ve on error
  */
 int ofnode_read_fmap_entry(ofnode node, struct fmap_entry *entry);
 
@@ -58,11 +58,11 @@ int ofnode_read_fmap_entry(ofnode node, struct fmap_entry *entry);
  * The property must hold one address with a length. This is only tested on
  * 32-bit machines.
  *
- * @param node		ofnode to examine
- * @param prop_name	name of property to find
- * @param basep		Returns base address of region
- * @param size		Returns size of region
- * @return 0 if ok, -1 on error (property not found)
+ * @node:	ofnode to examine
+ * @prop_name:	name of property to find
+ * @basep:	Returns base address of region
+ * @sizep:	Returns size of region
+ * Return: 0 if ok, -1 on error (property not found)
  */
 int ofnode_decode_region(ofnode node, const char *prop_name, fdt_addr_t *basep,
 			 fdt_size_t *sizep);
@@ -81,14 +81,14 @@ int ofnode_decode_region(ofnode node, const char *prop_name, fdt_addr_t *basep,
  * The property value must have an offset and a size. The function checks
  * that the region is entirely within the memory bank.5
  *
- * @param node		ofnode containing the properties (-1 for /config)
- * @param mem_type	Type of memory to use, which is a name, such as
- *			"u-boot" or "kernel".
- * @param suffix	String to append to the memory/offset
- *			property names
- * @param basep		Returns base of region
- * @param sizep		Returns size of region
- * @return 0 if OK, -ive on error
+ * @config_node:	ofnode containing the properties (invalid for "/config")
+ * @mem_type:	Type of memory to use, which is a name, such as
+ *		"u-boot" or "kernel".
+ * @suffix:	String to append to the memory/offset
+ *		property names
+ * @basep:	Returns base of region
+ * @sizep:	Returns size of region
+ * Return: 0 if OK, -ive on error
  */
 int ofnode_decode_memory_region(ofnode config_node, const char *mem_type,
 				const char *suffix, fdt_addr_t *basep,
@@ -102,15 +102,15 @@ int ofnode_decode_memory_region(ofnode config_node, const char *mem_type,
  *
  * This function supports the following two DT bindings:
  * - the new DT binding, where 'fixed-link' is a sub-node of the
- *   Ethernet device
+ * Ethernet device
  * - the old DT binding, where 'fixed-link' is a property with 5
- *   cells encoding various information about the fixed PHY
+ * cells encoding various information about the fixed PHY
  *
  * If both new and old bindings exist, the new one is preferred.
  *
- * @param eth_node	ofnode containing the fixed-link subnode/property
- * @param phy_node	if fixed-link PHY detected, containing the PHY ofnode
- * @return true if a fixed-link pseudo-PHY device exists, false otherwise
+ * @eth_node:	ofnode containing the fixed-link subnode/property
+ * @phy_node:	if fixed-link PHY detected, containing the PHY ofnode
+ * Return: true if a fixed-link pseudo-PHY device exists, false otherwise
  */
 bool ofnode_phy_is_fixed_link(ofnode eth_node, ofnode *phy_node);
 
@@ -123,8 +123,8 @@ bool ofnode_phy_is_fixed_link(ofnode eth_node, ofnode *phy_node);
  * is connected to an on-board PHY or an SFP cage, and is not relevant when it
  * has a fixed link (in that case, in-band autoneg should not be used).
  *
- * @param eth_node	ofnode belonging to the Ethernet controller
- * @return true if in-band autoneg should be used, false otherwise
+ * @eth_node:	ofnode belonging to the Ethernet controller
+ * Return: true if in-band autoneg should be used, false otherwise
  */
 bool ofnode_eth_uses_inband_aneg(ofnode eth_node);
 
diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index 6601bd8318..8b4f628856 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -19,7 +19,7 @@
 struct resource;
 
 /**
- * ofnode - reference to a device tree node
+ * typedef union ofnode_union ofnode - reference to a device tree node
  *
  * This union can hold either a straightforward pointer to a struct device_node
  * in the live device tree, or an offset within the flat device tree. In the
@@ -27,7 +27,7 @@ struct resource;
  *
  * Thus we can reference nodes in both the live tree (once available) and the
  * flat tree (until then). Functions are available to translate between an
- * ofnode and either an offset or a struct device_node *.
+ * ofnode and either an offset or a `struct device_node *`.
  *
  * The reference can also hold a null offset, in which case the pointer value
  * here is NULL. This corresponds to a struct device_node * value of
@@ -61,7 +61,7 @@ struct ofnode_phandle_args {
 };
 
 /**
- * ofprop - reference to a property of a device tree node
+ * struct ofprop - reference to a property of a device tree node
  *
  * This struct hold the reference on one property of one node,
  * using struct ofnode and an offset within the flat device tree or either
@@ -91,7 +91,7 @@ struct ofprop {
  * This cannot be called if the reference contains an offset.
  *
  * @node: Reference containing struct device_node * (possibly invalid)
- * @return pointer to device node (can be NULL)
+ * Return: pointer to device node (can be NULL)
  */
 static inline const struct device_node *ofnode_to_np(ofnode node)
 {
@@ -108,7 +108,7 @@ static inline const struct device_node *ofnode_to_np(ofnode node)
  * This cannot be called if the reference contains a node pointer.
  *
  * @node: Reference containing offset (possibly invalid)
- * @return DT offset (can be -1)
+ * Return: DT offset (can be -1)
  */
 static inline int ofnode_to_offset(ofnode node)
 {
@@ -122,7 +122,8 @@ static inline int ofnode_to_offset(ofnode node)
 /**
  * ofnode_valid() - check if an ofnode is valid
  *
- * @return true if the reference contains a valid ofnode, false if it is NULL
+ * @node: Reference containing offset (possibly invalid)
+ * Return: true if the reference contains a valid ofnode, false if it is NULL
  */
 static inline bool ofnode_valid(ofnode node)
 {
@@ -136,7 +137,7 @@ static inline bool ofnode_valid(ofnode node)
  * offset_to_ofnode() - convert a DT offset to an ofnode
  *
  * @of_offset: DT offset (either valid, or -1)
- * @return reference to the associated DT offset
+ * Return: reference to the associated DT offset
  */
 static inline ofnode offset_to_ofnode(int of_offset)
 {
@@ -154,7 +155,7 @@ static inline ofnode offset_to_ofnode(int of_offset)
  * np_to_ofnode() - convert a node pointer to an ofnode
  *
  * @np: Live node pointer (can be NULL)
- * @return reference to the associated node pointer
+ * Return: reference to the associated node pointer
  */
 static inline ofnode np_to_ofnode(const struct device_node *np)
 {
@@ -173,7 +174,7 @@ static inline ofnode np_to_ofnode(const struct device_node *np)
  * is valid is not permitted.
  *
  * @node: reference to check (possibly invalid)
- * @return true if the reference is a live node pointer, false if it is a DT
+ * Return: true if the reference is a live node pointer, false if it is a DT
  * offset
  */
 static inline bool ofnode_is_np(ofnode node)
@@ -193,7 +194,9 @@ static inline bool ofnode_is_np(ofnode node)
 /**
  * ofnode_equal() - check if two references are equal
  *
- * @return true if equal, else false
+ * @ref1: first reference to check (possibly invalid)
+ * @ref2: second reference to check (possibly invalid)
+ * Return: true if equal, else false
  */
 static inline bool ofnode_equal(ofnode ref1, ofnode ref2)
 {
@@ -237,28 +240,28 @@ static inline ofnode ofnode_root(void)
  *
  * @node:	valid node reference that has to be compared
  * @name:	name that has to be compared with the node name
- * @return true if matches, false if it doesn't match
+ * Return: true if matches, false if it doesn't match
  */
 bool ofnode_name_eq(ofnode node, const char *name);
 
 /**
  * ofnode_read_u32() - Read a 32-bit integer from a property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int ofnode_read_u32(ofnode node, const char *propname, u32 *outp);
 
 /**
  * ofnode_read_u32_index() - Read a 32-bit integer from a multi-value property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @index:	index of the integer to return
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int ofnode_read_u32_index(ofnode node, const char *propname, int index,
 			  u32 *outp);
@@ -266,47 +269,47 @@ int ofnode_read_u32_index(ofnode node, const char *propname, int index,
 /**
  * ofnode_read_s32() - Read a 32-bit integer from a property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 static inline int ofnode_read_s32(ofnode node, const char *propname,
-				  s32 *out_value)
+				  s32 *outp)
 {
-	return ofnode_read_u32(node, propname, (u32 *)out_value);
+	return ofnode_read_u32(node, propname, (u32 *)outp);
 }
 
 /**
  * ofnode_read_u32_default() - Read a 32-bit integer from a property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
-u32 ofnode_read_u32_default(ofnode ref, const char *propname, u32 def);
+u32 ofnode_read_u32_default(ofnode node, const char *propname, u32 def);
 
 /**
  * ofnode_read_u32_index_default() - Read a 32-bit integer from a multi-value
  *                                   property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @index:	index of the integer to return
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
-u32 ofnode_read_u32_index_default(ofnode ref, const char *propname, int index,
+u32 ofnode_read_u32_index_default(ofnode node, const char *propname, int index,
 				  u32 def);
 
 /**
  * ofnode_read_s32_default() - Read a 32-bit integer from a property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
 int ofnode_read_s32_default(ofnode node, const char *propname, s32 def);
 
@@ -316,17 +319,17 @@ int ofnode_read_s32_default(ofnode node, const char *propname, s32 def);
  * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @outp:	place to put value (if found)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int ofnode_read_u64(ofnode node, const char *propname, u64 *outp);
 
 /**
  * ofnode_read_u64_default() - Read a 64-bit integer from a property
  *
- * @ref:	valid node reference to read property from
+ * @node:	valid node reference to read property from
  * @propname:	name of the property to read from
  * @def:	default value to return if the property has no value
- * @return property value, or @def if not found
+ * Return: property value, or @def if not found
  */
 u64 ofnode_read_u64_default(ofnode node, const char *propname, u64 def);
 
@@ -336,8 +339,8 @@ u64 ofnode_read_u64_default(ofnode node, const char *propname, u64 def);
  * @node:	valid node reference to read property from
  * @propname:	name of the property to read
  * @sizep:	if non-NULL, returns the size of the property, or an error code
-		if not found
- * @return property value, or NULL if there is no such property
+ *              if not found
+ * Return: property value, or NULL if there is no such property
  */
 const void *ofnode_read_prop(ofnode node, const char *propname, int *sizep);
 
@@ -346,7 +349,7 @@ const void *ofnode_read_prop(ofnode node, const char *propname, int *sizep);
  *
  * @node:	valid node reference to read property from
  * @propname:	name of the property to read
- * @return string from property value, or NULL if there is no such property
+ * Return: string from property value, or NULL if there is no such property
  */
 const char *ofnode_read_string(ofnode node, const char *propname);
 
@@ -357,7 +360,7 @@ const char *ofnode_read_string(ofnode node, const char *propname);
  * @propname:	name of the property to read
  * @out_values:	pointer to return value, modified only if return value is 0
  * @sz:		number of array elements to read
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  *
  * Search for a property in a device node and read 32-bit value(s) from
  * it. Returns 0 on success, -EINVAL if the property does not exist,
@@ -374,7 +377,7 @@ int ofnode_read_u32_array(ofnode node, const char *propname,
  *
  * @node:	valid node reference to read property from
  * @propname:	name of property to read
- * @return true if property is present (meaning true), false if not present
+ * Return: true if property is present (meaning true), false if not present
  */
 bool ofnode_read_bool(ofnode node, const char *propname);
 
@@ -383,7 +386,7 @@ bool ofnode_read_bool(ofnode node, const char *propname);
  *
  * @node:	valid reference to parent node
  * @subnode_name: name of subnode to find
- * @return reference to subnode (which can be invalid if there is no such
+ * Return: reference to subnode (which can be invalid if there is no such
  * subnode)
  */
 ofnode ofnode_find_subnode(ofnode node, const char *subnode_name);
@@ -429,7 +432,7 @@ static inline ofnode ofnode_next_subnode(ofnode node)
  * by default.
  *
  * @node: node to examine
- * @return false (not enabled) or true (enabled)
+ * Return: false (not enabled) or true (enabled)
  */
 bool ofnode_is_enabled(ofnode node);
 
@@ -437,7 +440,7 @@ bool ofnode_is_enabled(ofnode node);
  * ofnode_first_subnode() - find the first subnode of a parent node
  *
  * @node:	valid reference to a valid parent node
- * @return reference to the first subnode (which can be invalid if the parent
+ * Return: reference to the first subnode (which can be invalid if the parent
  * node has no subnodes)
  */
 ofnode ofnode_first_subnode(ofnode node);
@@ -446,7 +449,7 @@ ofnode ofnode_first_subnode(ofnode node);
  * ofnode_next_subnode() - find the next sibling of a subnode
  *
  * @node:	valid reference to previous node (sibling)
- * @return reference to the next subnode (which can be invalid if the node
+ * Return: reference to the next subnode (which can be invalid if the node
  * has no more siblings)
  */
 ofnode ofnode_next_subnode(ofnode node);
@@ -456,7 +459,7 @@ ofnode ofnode_next_subnode(ofnode node);
  * ofnode_get_parent() - get the ofnode's parent (enclosing ofnode)
  *
  * @node: valid node to look up
- * @return ofnode reference of the parent node
+ * Return: ofnode reference of the parent node
  */
 ofnode ofnode_get_parent(ofnode node);
 
@@ -464,7 +467,7 @@ ofnode ofnode_get_parent(ofnode node);
  * ofnode_get_name() - get the name of a node
  *
  * @node: valid node to look up
- * @return name of node
+ * Return: name of node
  */
 const char *ofnode_get_name(ofnode node);
 
@@ -474,7 +477,7 @@ const char *ofnode_get_name(ofnode node);
  * @node: valid node to look up
  * @buf: buffer to write the node path into
  * @buflen: buffer size
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int ofnode_get_path(ofnode node, char *buf, int buflen);
 
@@ -482,7 +485,7 @@ int ofnode_get_path(ofnode node, char *buf, int buflen);
  * ofnode_get_by_phandle() - get ofnode from phandle
  *
  * @phandle:	phandle to look up
- * @return ofnode reference to the phandle
+ * Return: ofnode reference to the phandle
  */
 ofnode ofnode_get_by_phandle(uint phandle);
 
@@ -491,7 +494,7 @@ ofnode ofnode_get_by_phandle(uint phandle);
  *
  * @node: node to check
  * @propname: property to check
- * @return size of property if present, or -EINVAL if not
+ * Return: size of property if present, or -EINVAL if not
  */
 int ofnode_read_size(ofnode node, const char *propname);
 
@@ -504,7 +507,7 @@ int ofnode_read_size(ofnode node, const char *propname);
  * @node: node to read from
  * @index: Index of address to read (0 for first)
  * @size: Pointer to size of the address
- * @return address, or FDT_ADDR_T_NONE if not present or invalid
+ * Return: address, or FDT_ADDR_T_NONE if not present or invalid
  */
 phys_addr_t ofnode_get_addr_size_index(ofnode node, int index,
 				       fdt_size_t *size);
@@ -521,7 +524,7 @@ phys_addr_t ofnode_get_addr_size_index(ofnode node, int index,
  * @node: node to read from
  * @index: Index of address to read (0 for first)
  * @size: Pointer to size of the address
- * @return address, or FDT_ADDR_T_NONE if not present or invalid
+ * Return: address, or FDT_ADDR_T_NONE if not present or invalid
  */
 phys_addr_t ofnode_get_addr_size_index_notrans(ofnode node, int index,
 					       fdt_size_t *size);
@@ -533,7 +536,7 @@ phys_addr_t ofnode_get_addr_size_index_notrans(ofnode node, int index,
  *
  * @node: node to read from
  * @index: Index of address to read (0 for first)
- * @return address, or FDT_ADDR_T_NONE if not present or invalid
+ * Return: address, or FDT_ADDR_T_NONE if not present or invalid
  */
 phys_addr_t ofnode_get_addr_index(ofnode node, int index);
 
@@ -543,7 +546,7 @@ phys_addr_t ofnode_get_addr_index(ofnode node, int index);
  * This reads the register address from a node
  *
  * @node: node to read from
- * @return address, or FDT_ADDR_T_NONE if not present or invalid
+ * Return: address, or FDT_ADDR_T_NONE if not present or invalid
  */
 phys_addr_t ofnode_get_addr(ofnode node);
 
@@ -553,7 +556,7 @@ phys_addr_t ofnode_get_addr(ofnode node);
  * This reads the register size from a node
  *
  * @node: node to read from
- * @return size of the address, or FDT_SIZE_T_NONE if not present or invalid
+ * Return: size of the address, or FDT_SIZE_T_NONE if not present or invalid
  */
 fdt_size_t ofnode_get_size(ofnode node);
 
@@ -570,7 +573,7 @@ fdt_size_t ofnode_get_size(ofnode node);
  * @propname: name of the property containing the string list
  * @string: string to look up in the string list
  *
- * @return:
+ * Return:
  *   the index of the string in the list of strings
  *   -ENODATA if the property is not found
  *   -EINVAL on some other error
@@ -591,9 +594,9 @@ int ofnode_stringlist_search(ofnode node, const char *propname,
  * @node: node to check
  * @propname: name of the property containing the string list
  * @index: index of the string to return (cannot be negative)
- * @lenp: return location for the string length or an error code on failure
+ * @outp: return location for the string
  *
- * @return:
+ * Return:
  *   0 if found or -ve error value if not found
  */
 int ofnode_read_string_index(ofnode node, const char *propname, int index,
@@ -603,8 +606,8 @@ int ofnode_read_string_index(ofnode node, const char *propname, int index,
  * ofnode_read_string_count() - find the number of strings in a string list
  *
  * @node: node to check
- * @propname: name of the property containing the string list
- * @return:
+ * @property: name of the property containing the string list
+ * Return:
  *   number of strings in the list, or -ve error value if not found
  */
 int ofnode_read_string_count(ofnode node, const char *property);
@@ -620,11 +623,12 @@ int ofnode_read_string_count(ofnode node, const char *property);
  * changed as they point directly into the devicetree property.
  *
  * @node: node to check
+ * @property: name of the property containing the string list
  * @listp: returns an allocated, NULL-terminated list of strings if the return
  *	value is > 0, else is set to NULL
- * @return number of strings in list, 0 if none, -ENOMEM if out of memory,
- *	-EINVAL if no such property, -EENODATA if property is empty
- * @return: NULL-terminated list of strings (NULL if no property or empty)
+ * Return:
+ * number of strings in list, 0 if none, -ENOMEM if out of memory,
+ * -EINVAL if no such property, -EENODATA if property is empty
  */
 int ofnode_read_string_list(ofnode node, const char *property,
 			    const char ***listp);
@@ -639,19 +643,17 @@ int ofnode_read_string_list(ofnode node, const char *property,
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
  * ofnode_parse_phandle_with_args(node3, "list", "#list-cells", 0, 1, &args);
@@ -659,13 +661,14 @@ int ofnode_read_string_list(ofnode node, const char *property,
  * @node:	device tree node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
- * @cells_count: Cell count to use if @cells_name is NULL
+ * @cell_count: Cell count to use if @cells_name is NULL
  * @index:	index of a phandle to parse out
  * @out_args:	optional pointer to output arguments structure (will be filled)
- * @return 0 on success (with @out_args filled out if not NULL), -ENOENT if
- *	@list_name does not exist, -EINVAL if a phandle was not found,
- *	@cells_name could not be found, the arguments were truncated or there
- *	were too many arguments.
+ * Return:
+ *   0 on success (with @out_args filled out if not NULL), -ENOENT if
+ *   @list_name does not exist, -EINVAL if a phandle was not found,
+ *   @cells_name could not be found, the arguments were truncated or there
+ *   were too many arguments.
  */
 int ofnode_parse_phandle_with_args(ofnode node, const char *list_name,
 				   const char *cells_name, int cell_count,
@@ -682,10 +685,10 @@ int ofnode_parse_phandle_with_args(ofnode node, const char *list_name,
  * @node:	device tree node containing a list
  * @list_name:	property name that contains a list
  * @cells_name:	property name that specifies phandles' arguments count
- * @cells_count: Cell count to use if @cells_name is NULL
- * @return number of phandle on success, -ENOENT if @list_name does not
- *      exist, -EINVAL if a phandle was not found, @cells_name could not
- *      be found.
+ * @cell_count: Cell count to use if @cells_name is NULL
+ * Return:
+ *   number of phandle on success, -ENOENT if @list_name does not exist,
+ *   -EINVAL if a phandle was not found, @cells_name could not be found.
  */
 int ofnode_count_phandle_with_args(ofnode node, const char *list_name,
 				   const char *cells_name, int cell_count);
@@ -694,7 +697,7 @@ int ofnode_count_phandle_with_args(ofnode node, const char *list_name,
  * ofnode_path() - find a node by full path
  *
  * @path: Full path to node, e.g. "/bus/spi@1"
- * @return reference to the node found. Use ofnode_valid() to check if it exists
+ * Return: reference to the node found. Use ofnode_valid() to check if it exists
  */
 ofnode ofnode_path(const char *path);
 
@@ -704,9 +707,9 @@ ofnode ofnode_path(const char *path);
  * This looks for a property within the /chosen node and returns its value
  *
  * @propname: Property name to look for
- * @sizep: Returns size of property, or FDT_ERR_... error code if function
+ * @sizep: Returns size of property, or  `FDT_ERR_...` error code if function
  *	returns NULL
- * @return property value if found, else NULL
+ * Return: property value if found, else NULL
  */
 const void *ofnode_read_chosen_prop(const char *propname, int *sizep);
 
@@ -717,7 +720,7 @@ const void *ofnode_read_chosen_prop(const char *propname, int *sizep);
  * checking that it is a valid nul-terminated string
  *
  * @propname: Property name to look for
- * @return string value if found, else NULL
+ * Return: string value if found, else NULL
  */
 const char *ofnode_read_chosen_string(const char *propname);
 
@@ -727,7 +730,8 @@ const char *ofnode_read_chosen_string(const char *propname);
  * This looks up a named property in the chosen node and uses that as a path to
  * look up a code.
  *
- * @return the referenced node if present, else ofnode_null()
+ * @propname: Property name to look for
+ * Return: the referenced node if present, else ofnode_null()
  */
 ofnode ofnode_get_chosen_node(const char *propname);
 
@@ -737,9 +741,9 @@ ofnode ofnode_get_chosen_node(const char *propname);
  * This looks for a property within the /aliases node and returns its value
  *
  * @propname: Property name to look for
- * @sizep: Returns size of property, or FDT_ERR_... error code if function
+ * @sizep: Returns size of property, or `FDT_ERR_...` error code if function
  *	returns NULL
- * @return property value if found, else NULL
+ * Return: property value if found, else NULL
  */
 const void *ofnode_read_aliases_prop(const char *propname, int *sizep);
 
@@ -749,7 +753,8 @@ const void *ofnode_read_aliases_prop(const char *propname, int *sizep);
  * This looks up a named property in the aliases node and uses that as a path to
  * look up a code.
  *
- * @return the referenced node if present, else ofnode_null()
+ * @propname: Property name to look for
+ * Return: the referenced node if present, else ofnode_null()
  */
 ofnode ofnode_get_aliases_node(const char *propname);
 
@@ -761,10 +766,10 @@ struct display_timing;
  * See doc/device-tree-bindings/video/display-timing.txt for binding
  * information.
  *
- * @node	'display-timing' node containing the timing subnodes
- * @index	Index number to read (0=first timing subnode)
- * @config	Place to put timings
- * @return 0 if OK, -FDT_ERR_NOTFOUND if not found
+ * @node:	'display-timing' node containing the timing subnodes
+ * @index:	Index number to read (0=first timing subnode)
+ * @config:	Place to put timings
+ * Return: 0 if OK, -FDT_ERR_NOTFOUND if not found
  */
 int ofnode_decode_display_timing(ofnode node, int index,
 				 struct display_timing *config);
@@ -775,7 +780,7 @@ int ofnode_decode_display_timing(ofnode node, int index,
  * @node: node to read
  * @propname: property to read
  * @lenp: place to put length on success
- * @return pointer to property, or NULL if not found
+ * Return: pointer to property, or NULL if not found
  */
 const void *ofnode_get_property(ofnode node, const char *propname, int *lenp);
 
@@ -787,7 +792,7 @@ const void *ofnode_get_property(ofnode node, const char *propname, int *lenp);
  *
  * @node: node to read
  * @prop: place to put argument reference
- * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
  */
 int ofnode_get_first_property(ofnode node, struct ofprop *prop);
 
@@ -798,7 +803,7 @@ int ofnode_get_first_property(ofnode node, struct ofprop *prop);
  * and read all the property with ofnode_get_property_by_prop().
  *
  * @prop: reference of current argument and place to put reference of next one
- * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
  */
 int ofnode_get_next_property(struct ofprop *prop);
 
@@ -810,7 +815,7 @@ int ofnode_get_next_property(struct ofprop *prop);
  * @prop: reference on property
  * @propname: If non-NULL, place to property name on success,
  * @lenp: If non-NULL, place to put length on success
- * @return 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
+ * Return: 0 if OK, -ve on error. -FDT_ERR_NOTFOUND if not found
  */
 const void *ofnode_get_property_by_prop(const struct ofprop *prop,
 					const char **propname, int *lenp);
@@ -819,7 +824,7 @@ const void *ofnode_get_property_by_prop(const struct ofprop *prop,
  * ofnode_is_available() - check if a node is marked available
  *
  * @node: node to check
- * @return true if node's 'status' property is "okay" (or is missing)
+ * Return: true if node's 'status' property is "okay" (or is missing)
  */
 bool ofnode_is_available(ofnode node);
 
@@ -832,7 +837,7 @@ bool ofnode_is_available(ofnode node);
  * @node: node to read from
  * @propname: property to read
  * @sizep: place to put size value (on success)
- * @return address value, or FDT_ADDR_T_NONE on error
+ * Return: address value, or FDT_ADDR_T_NONE on error
  */
 phys_addr_t ofnode_get_addr_size(ofnode node, const char *propname,
 				 phys_size_t *sizep);
@@ -845,11 +850,12 @@ phys_addr_t ofnode_get_addr_size(ofnode node, const char *propname,
  * for the array (count bytes). It may have more, but this will be ignored.
  * The data is not copied.
  *
- * @node	node to examine
- * @propname	name of property to find
- * @sz		number of array elements
- * @return pointer to byte array if found, or NULL if the property is not
- *		found or there is not enough data
+ * @node:	node to examine
+ * @propname:	name of property to find
+ * @sz:		number of array elements
+ * Return:
+ * pointer to byte array if found, or NULL if the property is not found or
+ * there is not enough data
  */
 const uint8_t *ofnode_read_u8_array_ptr(ofnode node, const char *propname,
 					size_t sz);
@@ -861,13 +867,14 @@ const uint8_t *ofnode_read_u8_array_ptr(ofnode node, const char *propname,
  * corresponds to the given type in the form of fdt_pci_addr.
  * The property must hold one fdt_pci_addr with a lengh.
  *
- * @node	node to examine
- * @type	pci address type (FDT_PCI_SPACE_xxx)
- * @propname	name of property to find
- * @addr	returns pci address in the form of fdt_pci_addr
- * @return 0 if ok, -ENOENT if the property did not exist, -EINVAL if the
- *		format of the property was invalid, -ENXIO if the requested
- *		address type was not found
+ * @node:	node to examine
+ * @type:	pci address type (FDT_PCI_SPACE_xxx)
+ * @propname:	name of property to find
+ * @addr:	returns pci address in the form of fdt_pci_addr
+ * Return:
+ * 0 if ok, -ENOENT if the property did not exist, -EINVAL if the
+ * format of the property was invalid, -ENXIO if the requested
+ * address type was not found
  */
 int ofnode_read_pci_addr(ofnode node, enum fdt_pci_space type,
 			 const char *propname, struct fdt_pci_addr *addr);
@@ -878,10 +885,10 @@ int ofnode_read_pci_addr(ofnode node, enum fdt_pci_space type,
  * Look at the compatible property of a device node that represents a PCI
  * device and extract pci vendor id and device id from it.
  *
- * @param node		node to examine
- * @param vendor	vendor id of the pci device
- * @param device	device id of the pci device
- * @return 0 if ok, negative on error
+ * @node:	node to examine
+ * @vendor:	vendor id of the pci device
+ * @device:	device id of the pci device
+ * Return: 0 if ok, negative on error
  */
 int ofnode_read_pci_vendev(ofnode node, u16 *vendor, u16 *device);
 
@@ -892,7 +899,7 @@ int ofnode_read_pci_vendev(ofnode node, u16 *vendor, u16 *device);
  * which controls the given node.
  *
  * @node: Node to check
- * @return number of address cells this node uses
+ * Return: number of address cells this node uses
  */
 int ofnode_read_addr_cells(ofnode node);
 
@@ -903,7 +910,7 @@ int ofnode_read_addr_cells(ofnode node);
  * which controls the given node.
  *
  * @node: Node to check
- * @return number of size cells this node uses
+ * Return: number of size cells this node uses
  */
 int ofnode_read_size_cells(ofnode node);
 
@@ -912,8 +919,8 @@ int ofnode_read_size_cells(ofnode node);
  *
  * This function matches fdt_address_cells().
  *
- * @np: Node pointer to check
- * @return value of #address-cells property in this node, or 2 if none
+ * @node: Node to check
+ * Return: value of #address-cells property in this node, or 2 if none
  */
 int ofnode_read_simple_addr_cells(ofnode node);
 
@@ -922,8 +929,8 @@ int ofnode_read_simple_addr_cells(ofnode node);
  *
  * This function matches fdt_size_cells().
  *
- * @np: Node pointer to check
- * @return value of #size-cells property in this node, or 2 if none
+ * @node: Node to check
+ * Return: value of #size-cells property in this node, or 2 if none
  */
 int ofnode_read_simple_size_cells(ofnode node);
 
@@ -942,14 +949,13 @@ int ofnode_read_simple_size_cells(ofnode node);
  * There are 4 settings currently in use
  * - u-boot,dm-pre-proper: U-Boot proper pre-relocation only
  * - u-boot,dm-pre-reloc: legacy and indicates any of TPL or SPL
- *   Existing platforms only use it to indicate nodes needed in
- *   SPL. Should probably be replaced by u-boot,dm-spl for
- *   new platforms.
+ * Existing platforms only use it to indicate nodes needed in
+ * SPL. Should probably be replaced by u-boot,dm-spl for new platforms.
  * - u-boot,dm-spl: SPL and U-Boot pre-relocation
  * - u-boot,dm-tpl: TPL and U-Boot pre-relocation
  *
  * @node: node to check
- * @return true if node is needed in SPL/TL, false otherwise
+ * Return: true if node is needed in SPL/TL, false otherwise
  */
 bool ofnode_pre_reloc(ofnode node);
 
@@ -961,7 +967,7 @@ bool ofnode_pre_reloc(ofnode node);
  * @node: Node to read from
  * @index: Index of resource to read (0 = first)
  * @res: Returns resource that was read, on success
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int ofnode_read_resource(ofnode node, uint index, struct resource *res);
 
@@ -975,7 +981,7 @@ int ofnode_read_resource(ofnode node, uint index, struct resource *res);
  * @node: Node to read from
  * @name: Name of resource to read
  * @res: Returns resource that was read, on success
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int ofnode_read_resource_byname(ofnode node, const char *name,
 				struct resource *res);
@@ -987,7 +993,7 @@ int ofnode_read_resource_byname(ofnode node, const char *name,
  *
  * @from: ofnode to start from (use ofnode_null() to start at the beginning)
  * @compat: Compatible string to match
- * @return ofnode found, or ofnode_null() if none
+ * Return: ofnode found, or ofnode_null() if none
  */
 ofnode ofnode_by_compatible(ofnode from, const char *compat);
 
@@ -998,9 +1004,11 @@ ofnode ofnode_by_compatible(ofnode from, const char *compat);
  * @propval and a length @proplen.
  *
  * @from: ofnode to start from (use ofnode_null() to start at the
- * beginning) @propname: property name to check @propval: property value to
- * search for @proplen: length of the value in propval @return ofnode
- * found, or ofnode_null() if none
+ * beginning)
+ * @propname: property name to check
+ * @propval: property value to search for
+ * @proplen: length of the value in propval
+ * Return: ofnode found, or ofnode_null() if none
  */
 ofnode ofnode_by_prop_value(ofnode from, const char *propname,
 			    const void *propval, int proplen);
@@ -1011,14 +1019,13 @@ ofnode ofnode_by_prop_value(ofnode from, const char *propname,
  * @node:       child node (ofnode, lvalue)
  * @parent:     parent node (ofnode)
  *
- * This is a wrapper around a for loop and is used like so:
+ * This is a wrapper around a for loop and is used like so: ::
  *
- *	ofnode node;
- *
- *	ofnode_for_each_subnode(node, parent) {
- *		Use node
- *		...
- *	}
+ *   ofnode node;
+ *   ofnode_for_each_subnode(node, parent) {
+ *       Use node
+ *       ...
+ *   }
  *
  * Note that this is implemented as a macro and @node is used as
  * iterator in the loop. The parent variable can be a constant or even a
@@ -1036,14 +1043,13 @@ ofnode ofnode_by_prop_value(ofnode from, const char *propname,
  * @node:       child node (ofnode, lvalue)
  * @compat:     compatible string to match
  *
- * This is a wrapper around a for loop and is used like so:
- *
- *	ofnode node;
+ * This is a wrapper around a for loop and is used like so: ::
  *
- *	ofnode_for_each_compatible_node(node, parent, compatible) {
- *		Use node
- *		...
- *	}
+ *   ofnode node;
+ *   ofnode_for_each_compatible_node(node, parent, compatible) {
+ *      Use node
+ *      ...
+ *   }
  *
  * Note that this is implemented as a macro and @node is used as
  * iterator in the loop.
@@ -1056,8 +1062,8 @@ ofnode ofnode_by_prop_value(ofnode from, const char *propname,
 /**
  * ofnode_get_child_count() - get the child count of a ofnode
  *
- * @node: valid node to get its child count
- * @return the number of subnodes
+ * @parent: valid node to get its child count
+ * Return: the number of subnodes
  */
 int ofnode_get_child_count(ofnode parent);
 
@@ -1068,10 +1074,9 @@ int ofnode_get_child_count(ofnode parent);
  * function walks up the tree and applies the various bus mappings along the
  * way.
  *
- * @ofnode: Device tree node giving the context in which to translate the
- *          address
+ * @node: Device tree node giving the context in which to translate the address
  * @in_addr: pointer to the address to translate
- * @return the translated address; OF_BAD_ADDR on error
+ * Return: the translated address; OF_BAD_ADDR on error
  */
 u64 ofnode_translate_address(ofnode node, const fdt32_t *in_addr);
 
@@ -1082,10 +1087,10 @@ u64 ofnode_translate_address(ofnode node, const fdt32_t *in_addr);
  * This function walks up the tree and applies the various bus mappings along
  * the way.
  *
- * @ofnode: Device tree node giving the context in which to translate the
- *          DMA address
+ * @node: Device tree node giving the context in which to translate the
+ *        DMA address
  * @in_addr: pointer to the DMA address to translate
- * @return the translated DMA address; OF_BAD_ADDR on error
+ * Return: the translated DMA address; OF_BAD_ADDR on error
  */
 u64 ofnode_translate_dma_address(ofnode node, const fdt32_t *in_addr);
 
@@ -1095,12 +1100,11 @@ u64 ofnode_translate_dma_address(ofnode node, const fdt32_t *in_addr);
  * Get DMA ranges for a specifc node, this is useful to perform bus->cpu and
  * cpu->bus address translations
  *
- * @param blob		Pointer to device tree blob
- * @param node_offset	Node DT offset
- * @param cpu		Pointer to variable storing the range's cpu address
- * @param bus		Pointer to variable storing the range's bus address
- * @param size		Pointer to variable storing the range's size
- * @return translated DMA address or OF_BAD_ADDR on error
+ * @node: Device tree node
+ * @cpu: Pointer to variable storing the range's cpu address
+ * @bus: Pointer to variable storing the range's bus address
+ * @size: Pointer to variable storing the range's size
+ * Return: translated DMA address or OF_BAD_ADDR on error
  */
 int ofnode_get_dma_range(ofnode node, phys_addr_t *cpu, dma_addr_t *bus,
 			 u64 *size);
@@ -1112,7 +1116,7 @@ int ofnode_get_dma_range(ofnode node, phys_addr_t *cpu, dma_addr_t *bus,
  *
  * @node:	Device tree node for which compatible needs to be verified.
  * @compat:	Compatible string which needs to verified in the given node.
- * @return true if OK, false if the compatible is not found
+ * Return: true if OK, false if the compatible is not found
  */
 int ofnode_device_is_compatible(ofnode node, const char *compat);
 
@@ -1127,7 +1131,7 @@ int ofnode_device_is_compatible(ofnode node, const char *compat);
  * @len:	The length of the new value of the property
  * @value:	The new value of the property (must be valid prior to calling
  *		the function)
- * @return 0 if successful, -ve on error
+ * Return: 0 if successful, -ve on error
  */
 int ofnode_write_prop(ofnode node, const char *propname, int len,
 		      const void *value);
@@ -1142,7 +1146,7 @@ int ofnode_write_prop(ofnode node, const char *propname, int len,
  * @propname:	The name of the string property to set
  * @value:	The new value of the string property (must be valid prior to
  *		calling the function)
- * @return 0 if successful, -ve on error
+ * Return: 0 if successful, -ve on error
  */
 int ofnode_write_string(ofnode node, const char *propname, const char *value);
 
@@ -1157,7 +1161,7 @@ int ofnode_write_string(ofnode node, const char *propname, const char *value);
  * @node:	The node to enable
  * @value:	Flag that tells the function to either disable or enable the
  *		node
- * @return 0 if successful, -ve on error
+ * Return: 0 if successful, -ve on error
  */
 int ofnode_set_enabled(ofnode node, bool value);
 
@@ -1168,8 +1172,8 @@ int ofnode_set_enabled(ofnode node, bool value);
  *
  * See doc/config.txt for bindings
  *
- * @prop_name	property name to look up
- * @return true, if it exists, false if not
+ * @prop_name:	property name to look up
+ * Return: true, if it exists, false if not
  */
 bool ofnode_conf_read_bool(const char *prop_name);
 
@@ -1182,7 +1186,7 @@ bool ofnode_conf_read_bool(const char *prop_name);
  *
  * @prop_name: property name to look up
  * @default_val: default value to return if the property is not found
- * @return integer value, if found, or @default_val if not
+ * Return: integer value, if found, or @default_val if not
  */
 int ofnode_conf_read_int(const char *prop_name, int default_val);
 
@@ -1194,7 +1198,7 @@ int ofnode_conf_read_int(const char *prop_name, int default_val);
  * See doc/config.txt for bindings
  *
  * @prop_name: property name to look up
- * @return string value, if found, or NULL if not
+ * Return: string value, if found, or NULL if not
  */
 const char *ofnode_conf_read_str(const char *prop_name);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
