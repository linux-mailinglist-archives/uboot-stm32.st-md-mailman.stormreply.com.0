Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2548C1AE
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:53:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EDACC5F1FD;
	Wed, 12 Jan 2022 09:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA3DC5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:53:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7CNag023994;
 Wed, 12 Jan 2022 10:53:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=O6sM+Fj890beuoDBn6KIChCyBq2JpGNiNIIELUc10fY=;
 b=XyJhqnnHnNdG9VUZGc2p8g8On2/fvXhmV8xho1MGh60li4XXUzubutA4EIYT++Krm0Y9
 OvRM0o9PZ7pp4Iqot1yxEP55oQYE4F6cZr0rnWSo4l6OYIkL7joLSGH+enuq6UF2oQnp
 yFxgKQ/s+q8EkHi7HljzurwZCt2GQZydT45Ay6f/YC3TUDCqMbE45PAsm1i1Vit6aehc
 rP0ge1pySZIS9qm1tYhyEfq/jR902d4Eh59fWjvveDzwzDKR7QcFUT1SlC6zLXfFVIz8
 Iz0dkjkuLl9unG1tpoK5hCCPZKIzG2HwXW8B2G/LKXqxPztl8Td4EmnBNlsrUPtdu1aI BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dh9cbdc03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A772310002A;
 Wed, 12 Jan 2022 10:53:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FDCD2194F4;
 Wed, 12 Jan 2022 10:53:53 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:53
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:44 +0100
Message-ID: <20220112105327.3.I7df1d1140b004557c4f18c3ca04777a8bb18666a@changeid>
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
Subject: [Uboot-stm32] [PATCH 3/9] doc: add include/dm/lists.h to the HTML
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

Correct Sphinx style comments in include/dm/lists.h
and add the list API to the HTML documentation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst     | 1 +
 include/dm/lists.h | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index 181a454c24..168d129250 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -8,3 +8,4 @@ Uclass and Driver
 
 .. kernel-doc:: include/dm/uclass.h
 .. kernel-doc:: include/dm/root.h
+.. kernel-doc:: include/dm/lists.h
diff --git a/include/dm/lists.h b/include/dm/lists.h
index 5896ae3658..fc3b4ae585 100644
--- a/include/dm/lists.h
+++ b/include/dm/lists.h
@@ -19,13 +19,14 @@
  * for binding a driver given its name and plat.
  *
  * @name: Name of driver to look up
- * @return pointer to driver, or NULL if not found
+ * Return: pointer to driver, or NULL if not found
  */
 struct driver *lists_driver_lookup_name(const char *name);
 
 /**
  * lists_uclass_lookup() - Return uclass_driver based on ID of the class
- * id:		ID of the class
+ *
+ * @id:		ID of the class
  *
  * This function returns the pointer to uclass_driver, which is the class's
  * base structure based on the ID of the class. Returns NULL on error.
@@ -56,7 +57,8 @@ int lists_bind_drivers(struct udevice *parent, bool pre_reloc_only);
  * @drv: if non-NULL, force this driver to be bound
  * @pre_reloc_only: If true, bind only nodes with special devicetree properties,
  * or drivers with the DM_FLAG_PRE_RELOC flag. If false bind all drivers.
- * @return 0 if device was bound, -EINVAL if the device tree is invalid,
+ *
+ * Return: 0 if device was bound, -EINVAL if the device tree is invalid,
  * other -ve value on error
  */
 int lists_bind_fdt(struct udevice *parent, ofnode node, struct udevice **devp,
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
