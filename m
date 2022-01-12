Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E548C1AD
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:53:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C4CFC5F1F5;
	Wed, 12 Jan 2022 09:53:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3604C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:53:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7I3ZT005676;
 Wed, 12 Jan 2022 10:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JkW47P4wmQRSQusuKvOmEl5JJ0I5zM2BJWe8P/29RiA=;
 b=7dMcXYJBlvHYwQWgwVSf8FRzghxWUZzWCK284/Nmexirx3kM8ti33aiAkFNi8olQ3kwC
 xoGomxn5K5g3Czu+TFfyGNBejbflfZBOMJ2fblPvHWWUwFWEXd33ipkKp462lhG2OYey
 AtIPIsUOeiDqO/qo0zf8BMZaH8EQnfLM0LEBbCqX6cXihfk3G3e1GSQpmbc5MSdYh27s
 ZxK5yO8lfCBtO/KVh+1sPfv/doKFDhCdzKJPXd5ry+0+ClVA9Polp3RFbKbQ0fSAkqor
 o0cW1tvTWddYnXfbqfxIBAjBdH0Gm0529sStGlTEcB1GUVxONk5OmJmOdR8CwauI7Zjl og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtft123c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D250C100034;
 Wed, 12 Jan 2022 10:53:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA2C12194F4;
 Wed, 12 Jan 2022 10:53:52 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:52
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:43 +0100
Message-ID: <20220112105327.2.If9a3d60d774b6205ab356990d2f9437e97afe0b1@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 2/9] doc: add include/dm/root.h to the HTML
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

Correct Sphinx style comments in include/dm/devres.h
and add the associated driver model API to the HTML documentation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst    |  1 +
 include/dm/root.h | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index edce25da51..181a454c24 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -7,3 +7,4 @@ Uclass and Driver
 -----------------
 
 .. kernel-doc:: include/dm/uclass.h
+.. kernel-doc:: include/dm/root.h
diff --git a/include/dm/root.h b/include/dm/root.h
index 780f269db6..e888fb993c 100644
--- a/include/dm/root.h
+++ b/include/dm/root.h
@@ -19,7 +19,7 @@ extern struct list_head uclass_head;
  *
  * This function returns pointer to the root node of the driver tree,
  *
- * @return pointer to root device, or NULL if not inited yet
+ * Return: pointer to root device, or NULL if not inited yet
  */
 struct udevice *dm_root(void);
 
@@ -27,6 +27,8 @@ struct global_data;
 /**
  * dm_fixup_for_gd_move() - Handle global_data moving to a new place
  *
+ * @new_gd: Pointer to the new global data
+ *
  * The uclass list is part of global_data. Due to the way lists work, moving
  * the list will cause it to become invalid. This function fixes that up so
  * that the uclass list will work correctly.
@@ -40,7 +42,7 @@ void dm_fixup_for_gd_move(struct global_data *new_gd);
  *
  * @pre_reloc_only: If true, bind only drivers with the DM_FLAG_PRE_RELOC
  * flag. If false bind all drivers.
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_scan_plat(bool pre_reloc_only);
 
@@ -52,7 +54,7 @@ int dm_scan_plat(bool pre_reloc_only);
  *
  * @pre_reloc_only: If true, bind only nodes with special devicetree properties,
  * or drivers with the DM_FLAG_PRE_RELOC flag. If false bind all drivers.
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_scan_fdt(bool pre_reloc_only);
 
@@ -65,7 +67,7 @@ int dm_scan_fdt(bool pre_reloc_only);
  *
  * @pre_reloc_only: If true, bind only nodes with special devicetree properties,
  * or drivers with the DM_FLAG_PRE_RELOC flag. If false bind all drivers.
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_extended_scan(bool pre_reloc_only);
 
@@ -79,7 +81,7 @@ int dm_extended_scan(bool pre_reloc_only);
  *
  * @pre_reloc_only: If true, bind only nodes with special devicetree properties,
  * or drivers with the DM_FLAG_PRE_RELOC flag. If false bind all drivers.
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_scan_other(bool pre_reloc_only);
 
@@ -92,7 +94,7 @@ int dm_scan_other(bool pre_reloc_only);
  *
  * @pre_reloc_only: If true, bind only nodes with special devicetree properties,
  * or drivers with the DM_FLAG_PRE_RELOC flag. If false bind all drivers.
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_init_and_scan(bool pre_reloc_only);
 
@@ -103,7 +105,7 @@ int dm_init_and_scan(bool pre_reloc_only);
  * This needs to be called before anything uses the DM
  *
  * @of_live:	Enable live device tree
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_init(bool of_live);
 
@@ -111,7 +113,7 @@ int dm_init(bool of_live);
  * dm_uninit - Uninitialise Driver Model structures
  *
  * All devices will be removed and unbound
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_uninit(void);
 
@@ -124,7 +126,7 @@ int dm_uninit(void);
  * All devices with the matching flags set will be removed
  *
  * @flags: Flags for selective device removal
- * @return 0 if OK, -ve on error
+ * Return: 0 if OK, -ve on error
  */
 int dm_remove_devices_flags(uint flags);
 #else
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
