Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31B48C1B0
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:53:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73251C60461;
	Wed, 12 Jan 2022 09:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45C57C5F1F7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:53:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C6UMvf018214;
 Wed, 12 Jan 2022 10:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=JjPSPdjKdzbOx5OmcEP+qRnnv5xjx5CbUJ1rMDZ3e6M=;
 b=DFJ2C4n7WbaFPvm458u9HcRf9bxk/qmhk+QSjBB0WecAqmPKFx1xIzYyfFaqrKWtqrEf
 MNmPN/6UQ4YiJ6bYhgxfdQr+F4QH8du1Li26eCICcJFjhqVBXzeqh2+8xoiW4+qac3s1
 zQ3hnhEa2Px1YoYLokfsNJH3OsR95wRux91PWbamhoNOUv15w4MDpN994SS528v5voi9
 RCRp3Ii1dOpacW2w6c0TDMSMewCBnsZS3dB1IhzSJkxoHGy94+7QifUg0DiTcqtUrOrv
 S9K/ExwSUHYm3aRueqjR+g+57qunPbReMyPPw0my0nCTQduviWwothi1vdh6iUFFgGfh Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhssdsb2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0C7610002A;
 Wed, 12 Jan 2022 10:53:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E82DB2194F4;
 Wed, 12 Jan 2022 10:53:51 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:51
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:42 +0100
Message-ID: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/9] doc: add include/dm/uclass.h to the HTML
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

Correct Sphinx style comments in include/dm/uclass.h
and add the driver model UCLASS API to the HTML documentation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst      |  9 ++++++
 doc/api/index.rst   |  1 +
 include/dm/uclass.h | 75 ++++++++++++++++++++++-----------------------
 3 files changed, 47 insertions(+), 38 deletions(-)
 create mode 100644 doc/api/dm.rst

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
new file mode 100644
index 0000000000..edce25da51
--- /dev/null
+++ b/doc/api/dm.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Driver Model
+============
+
+Uclass and Driver
+-----------------
+
+.. kernel-doc:: include/dm/uclass.h
diff --git a/doc/api/index.rst b/doc/api/index.rst
index 806c7385a6..3f36174167 100644
--- a/doc/api/index.rst
+++ b/doc/api/index.rst
@@ -7,6 +7,7 @@ U-Boot API documentation
    :maxdepth: 2
 
    dfu
+   dm
    efi
    getopt
    linker_lists
diff --git a/include/dm/uclass.h b/include/dm/uclass.h
index f1fd2ba246..a12a872d94 100644
--- a/include/dm/uclass.h
+++ b/include/dm/uclass.h
@@ -84,7 +84,7 @@ struct udevice;
  * its children. If non-zero this is the size of this data, to be allocated
  * in the child device's parent_plat pointer. This value is only used as
  * a fallback if this member is 0 in the driver.
- * @flags: Flags for this uclass (DM_UC_...)
+ * @flags: Flags for this uclass ``(DM_UC_...)``
  */
 struct uclass_driver {
 	const char *name;
@@ -127,17 +127,16 @@ struct uclass_driver {
  * build time. Before this is used, an extern UCLASS_DRIVER() must have been
  * declared.
  *
- * For example:
+ * For example: ::
  *
- * extern UCLASS_DRIVER(clk);
- *
- * struct uclass_driver *drvs[] = {
- *	DM_UCLASS_DRIVER_REF(clk),
- * };
+ *   extern UCLASS_DRIVER(clk);
+ *   struct uclass_driver *drvs[] = {
+ *       DM_UCLASS_DRIVER_REF(clk),
+ *   };
  *
  * @_name: Name of the uclass_driver. This must be a valid C identifier, used by
  *	the linker_list.
- * @returns struct uclass_driver * for the uclass driver
+ * Return: struct uclass_driver * for the uclass driver
  */
 #define DM_UCLASS_DRIVER_REF(_name)					\
 	ll_entry_ref(struct uclass_driver, _name, uclass_driver)
@@ -145,8 +144,8 @@ struct uclass_driver {
 /**
  * uclass_get_priv() - Get the private data for a uclass
  *
- * @uc		Uclass to check
- * @return private data, or NULL if none
+ * @uc:	Uclass to check
+ * Return: private data, or NULL if none
  */
 void *uclass_get_priv(const struct uclass *uc);
 
@@ -159,8 +158,8 @@ void *uclass_get_priv(const struct uclass *uc);
  *
  * @key: ID to look up
  * @ucp: Returns pointer to uclass (there is only one per ID)
- * @return 0 if OK, -EDEADLK if driver model is not yet inited, other -ve on
- *	other error
+ * Return: 0 if OK, -EDEADLK if driver model is not yet inited, other -ve on
+ * other error
  */
 int uclass_get(enum uclass_id key, struct uclass **ucp);
 
@@ -168,16 +167,16 @@ int uclass_get(enum uclass_id key, struct uclass **ucp);
  * uclass_get_name() - Get the name of a uclass driver
  *
  * @id: ID to look up
- * @returns the name of the uclass driver for that ID, or NULL if none
+ * Return: the name of the uclass driver for that ID, or NULL if none
  */
 const char *uclass_get_name(enum uclass_id id);
 
 /**
- * uclass_get_by_name() - Look up a uclass by its driver name
+ * uclass_get_by_name_len() - Look up a uclass by its partial driver name
  *
  * @name: Name to look up
- * @len: Length of name
- * @returns the associated uclass ID, or UCLASS_INVALID if not found
+ * @len: Length of the partial name
+ * Return: the associated uclass ID, or UCLASS_INVALID if not found
  */
 enum uclass_id uclass_get_by_name_len(const char *name, int len);
 
@@ -185,7 +184,7 @@ enum uclass_id uclass_get_by_name_len(const char *name, int len);
  * uclass_get_by_name() - Look up a uclass by its driver name
  *
  * @name: Name to look up
- * @returns the associated uclass ID, or UCLASS_INVALID if not found
+ * Return: the associated uclass ID, or UCLASS_INVALID if not found
  */
 enum uclass_id uclass_get_by_name(const char *name);
 
@@ -197,7 +196,7 @@ enum uclass_id uclass_get_by_name(const char *name);
  * @id: ID to look up
  * @index: Device number within that uclass (0=first)
  * @devp: Returns pointer to device (there is only one per for each ID)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int uclass_get_device(enum uclass_id id, int index, struct udevice **devp);
 
@@ -211,7 +210,7 @@ int uclass_get_device(enum uclass_id id, int index, struct udevice **devp);
  * @id: ID to look up
  * @name: name of a device to get
  * @devp: Returns pointer to device (the first one with the name)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int uclass_get_device_by_name(enum uclass_id id, const char *name,
 			      struct udevice **devp);
@@ -228,7 +227,7 @@ int uclass_get_device_by_name(enum uclass_id id, const char *name,
  * @id: ID to look up
  * @seq: Sequence number to find (0=first)
  * @devp: Returns pointer to device (there is only one for each seq)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int uclass_get_device_by_seq(enum uclass_id id, int seq, struct udevice **devp);
 
@@ -243,7 +242,7 @@ int uclass_get_device_by_seq(enum uclass_id id, int seq, struct udevice **devp);
  * @id: ID to look up
  * @node: Device tree offset to search for (if -ve then -ENODEV is returned)
  * @devp: Returns pointer to device (there is only one for each node)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int uclass_get_device_by_of_offset(enum uclass_id id, int node,
 				   struct udevice **devp);
@@ -257,9 +256,9 @@ int uclass_get_device_by_of_offset(enum uclass_id id, int node,
  * The device is probed to activate it ready for use.
  *
  * @id: ID to look up
- * @np: Device tree node to search for (if NULL then -ENODEV is returned)
+ * @node: Device tree node to search for (if NULL then -ENODEV is returned)
  * @devp: Returns pointer to device (there is only one for each node)
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int uclass_get_device_by_ofnode(enum uclass_id id, ofnode node,
 				struct udevice **devp);
@@ -275,8 +274,8 @@ int uclass_get_device_by_ofnode(enum uclass_id id, ofnode node,
  * @phandle_id: the phandle id to look up
  * @devp: Returns pointer to device (there is only one for each node). NULL if
  *	there is no such device.
- * @return 0 if OK, -ENODEV if there is no device match the phandle, other
- *	-ve on error
+ * Return: 0 if OK, -ENODEV if there is no device match the phandle, other
+ * -ve on error
  */
 int uclass_get_device_by_phandle_id(enum uclass_id id, uint phandle_id,
 				    struct udevice **devp);
@@ -292,8 +291,8 @@ int uclass_get_device_by_phandle_id(enum uclass_id id, uint phandle_id,
  * @parent: Parent device containing the phandle pointer
  * @name: Name of property in the parent device node
  * @devp: Returns pointer to device (there is only one for each node)
- * @return 0 if OK, -ENOENT if there is no @name present in the node, other
- *	-ve on error
+ * Return: 0 if OK, -ENOENT if there is no @name present in the node, other
+ * -ve on error
  */
 int uclass_get_device_by_phandle(enum uclass_id id, struct udevice *parent,
 				 const char *name, struct udevice **devp);
@@ -310,7 +309,7 @@ int uclass_get_device_by_phandle(enum uclass_id id, struct udevice *parent,
  * @id: ID to look up
  * @drv: Driver to look for
  * @devp: Returns pointer to the first device with that driver
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int uclass_get_device_by_driver(enum uclass_id id, const struct driver *drv,
 				struct udevice **devp);
@@ -327,7 +326,7 @@ int uclass_get_device_by_driver(enum uclass_id id, const struct driver *drv,
  * @devp: Returns pointer to the first device in that uclass if no error
  * occurred, or NULL if there is no first device, or an error occurred with
  * that device.
- * @return 0 if OK (found or not found), other -ve on error
+ * Return: 0 if OK (found or not found), other -ve on error
  */
 int uclass_first_device(enum uclass_id id, struct udevice **devp);
 
@@ -338,7 +337,7 @@ int uclass_first_device(enum uclass_id id, struct udevice **devp);
  *
  * @id: Uclass ID to look up
  * @devp: Returns pointer to the first device in that uclass, or NULL if none
- * @return 0 if found, -ENODEV if not found, other -ve on error
+ * Return: 0 if found, -ENODEV if not found, other -ve on error
  */
 int uclass_first_device_err(enum uclass_id id, struct udevice **devp);
 
@@ -353,7 +352,7 @@ int uclass_first_device_err(enum uclass_id id, struct udevice **devp);
  * @devp: On entry, pointer to device to lookup. On exit, returns pointer
  * to the next device in the uclass if no error occurred, or NULL if there is
  * no next device, or an error occurred with that next device.
- * @return 0 if OK (found or not found), other -ve on error
+ * Return: 0 if OK (found or not found), other -ve on error
  */
 int uclass_next_device(struct udevice **devp);
 
@@ -365,7 +364,7 @@ int uclass_next_device(struct udevice **devp);
  * @devp: On entry, pointer to device to lookup. On exit, returns pointer
  * to the next device in the uclass if no error occurred, or NULL if
  * there is no next device.
- * @return 0 if found, -ENODEV if not found, other -ve on error
+ * Return: 0 if found, -ENODEV if not found, other -ve on error
  */
 int uclass_next_device_err(struct udevice **devp);
 
@@ -380,7 +379,7 @@ int uclass_next_device_err(struct udevice **devp);
  * @id: Uclass ID to look up
  * @devp: Returns pointer to the first device in that uclass, or NULL if there
  * is no first device
- * @return 0 if OK (found or not found), other -ve on error. If an error occurs
+ * Return: 0 if OK (found or not found), other -ve on error. If an error occurs
  * it is still possible to move to the next device.
  */
 int uclass_first_device_check(enum uclass_id id, struct udevice **devp);
@@ -395,7 +394,7 @@ int uclass_first_device_check(enum uclass_id id, struct udevice **devp);
  *
  * @devp: On entry, pointer to device to lookup. On exit, returns pointer
  * to the next device in the uclass if any
- * @return 0 if OK (found or not found), other -ve on error. If an error occurs
+ * Return: 0 if OK (found or not found), other -ve on error. If an error occurs
  * it is still possible to move to the next device.
  */
 int uclass_next_device_check(struct udevice **devp);
@@ -409,7 +408,7 @@ int uclass_next_device_check(struct udevice **devp);
  * @id: Uclass ID to check
  * @driver_data: Driver data to search for
  * @devp: Returns pointer to the first matching device in that uclass, if found
- * @return 0 if found, -ENODEV if not found, other -ve on error
+ * Return: 0 if found, -ENODEV if not found, other -ve on error
  */
 int uclass_first_device_drvdata(enum uclass_id id, ulong driver_data,
 				struct udevice **devp);
@@ -421,7 +420,7 @@ int uclass_first_device_drvdata(enum uclass_id id, ulong driver_data,
  * looking for its ID.
  *
  * @id: uclass ID to look up
- * @return 0 if OK, other -ve on error
+ * Return: 0 if OK, other -ve on error
  */
 int uclass_probe_all(enum uclass_id id);
 
@@ -429,7 +428,7 @@ int uclass_probe_all(enum uclass_id id);
  * uclass_id_count() - Count the number of devices in a uclass
  *
  * @id: uclass ID to look up
- * @return number of devices in that uclass (0 if none)
+ * Return: number of devices in that uclass (0 if none)
  */
 int uclass_id_count(enum uclass_id id);
 
@@ -444,7 +443,7 @@ int uclass_id_count(enum uclass_id id);
  * @id: enum uclass_id ID to use
  * @pos: struct udevice * to hold the current device. Set to NULL when there
  * are no more devices.
- * @uc: temporary uclass variable (struct uclass *)
+ * @uc: temporary uclass variable (``struct uclass *``)
  */
 #define uclass_id_foreach_dev(id, pos, uc) \
 	if (!uclass_get(id, &uc)) \
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
