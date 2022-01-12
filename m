Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECA48C1BA
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:55:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02EBEC60463;
	Wed, 12 Jan 2022 09:55:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EFE9C60460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:55:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C6UQ6o018228;
 Wed, 12 Jan 2022 10:55:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YGrYwib6Egkux2NBvbUND1+vEDy97mr+Moj/lVDoHeU=;
 b=FdG42pja+NsMk/jMceKGl7i8uNM3GvLkNj6enHDNy104OTgNKOSL2XfI+iGl8maleZX6
 jy3F6x+T65QI54WlNASEsyGba+0HdW1/egCmeLKytfq791M2IrWaNjuZgh/WnaaYer/y
 6lDf7uLGEAz2md/NBhpNpa/KTc/vL+PfJbm0MAcvdo+Ptdofz4YOf1mGhDSUvlq3Kg3j
 t0gPr2a76cW/r3bmJMcnh50uYKqp/6zLEFoGzraYIN1QyQRTu8JHM3eOb1oHwwKZPANb
 yaAXQ31nRd2V0OgSzLS7MX9whgqkQUDg98jXnQCKNE31j+khwMkP4fhim4QvjSAzLfW5 Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhssdsbe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:55:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1AC0100034;
 Wed, 12 Jan 2022 10:55:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E998721A20A;
 Wed, 12 Jan 2022 10:55:53 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:55:53
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:55:41 +0100
Message-ID: <20220112105532.9.I34e44fa4682aa44191b0eb03369f2d925904f344@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112105532.8.Ie3a53cf98ca389d4d05b0d353047f19ddc1c2530@changeid>
References: <20220112105532.8.Ie3a53cf98ca389d4d05b0d353047f19ddc1c2530@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 9/9] doc: add include/dm/fdtaddr.h to the HTML
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

Correct Sphinx style comments in include/dm/fdtaddr.h
and add the devfdt API to the HTML documentation;
these functions are NOT compatible with live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst       |  1 +
 include/dm/fdtaddr.h | 25 ++++++++++++-------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index 5bb66f2f50..df605dae9d 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -26,3 +26,4 @@ Device tree
 .. kernel-doc:: include/dm/of_extra.h
 .. kernel-doc:: include/dm/of_access.h
 .. kernel-doc:: include/dm/of_addr.h
+.. kernel-doc:: include/dm/fdtaddr.h
diff --git a/include/dm/fdtaddr.h b/include/dm/fdtaddr.h
index d2c1994291..c9d2b27ba6 100644
--- a/include/dm/fdtaddr.h
+++ b/include/dm/fdtaddr.h
@@ -19,7 +19,7 @@ struct udevice;
  *
  * @dev: Pointer to a device
  *
- * @return addr
+ * Return: addr
  */
 fdt_addr_t devfdt_get_addr(const struct udevice *dev);
 
@@ -29,7 +29,7 @@ fdt_addr_t devfdt_get_addr(const struct udevice *dev);
  *
  * @dev: Pointer to a device
  *
- * @return Pointer to addr, or NULL if there is no such property
+ * Return: Pointer to addr, or NULL if there is no such property
  */
 void *devfdt_get_addr_ptr(const struct udevice *dev);
 
@@ -39,7 +39,7 @@ void *devfdt_get_addr_ptr(const struct udevice *dev);
  *
  * @dev: Pointer to a device
  *
- * @return Pointer to addr, or NULL if there is no such property
+ * Return: Pointer to addr, or NULL if there is no such property
  */
 void *devfdt_remap_addr(const struct udevice *dev);
 
@@ -51,7 +51,7 @@ void *devfdt_remap_addr(const struct udevice *dev);
  *
  * @dev: Pointer to a device
  *
- * @return Pointer to addr, or NULL if there is no such property
+ * Return: Pointer to addr, or NULL if there is no such property
  */
 void *devfdt_remap_addr_index(const struct udevice *dev, int index);
 
@@ -64,7 +64,7 @@ void *devfdt_remap_addr_index(const struct udevice *dev, int index);
  *
  * @dev: Pointer to a device
  *
- * @return Pointer to addr, or NULL if there is no such property
+ * Return: Pointer to addr, or NULL if there is no such property
  */
 void *devfdt_remap_addr_name(const struct udevice *dev, const char *name);
 
@@ -76,8 +76,7 @@ void *devfdt_remap_addr_name(const struct udevice *dev, const char *name);
  * @dev: Pointer to device
  * @size: size of the memory to map
  *
- * @return  mapped address, or NULL if the device does not have reg
- *          property.
+ * Return: mapped address, or NULL if the device does not have reg property.
  */
 void *devfdt_map_physmem(const struct udevice *dev, unsigned long size);
 
@@ -88,7 +87,7 @@ void *devfdt_map_physmem(const struct udevice *dev, unsigned long size);
  * @index: the 'reg' property can hold a list of <addr, size> pairs
  *	   and @index is used to select which one is required
  *
- * @return addr
+ * Return: addr
  */
 fdt_addr_t devfdt_get_addr_index(const struct udevice *dev, int index);
 
@@ -100,7 +99,7 @@ fdt_addr_t devfdt_get_addr_index(const struct udevice *dev, int index);
  * @index: the 'reg' property can hold a list of <addr, size> pairs
  *	   and @index is used to select which one is required
  *
- * @return Pointer to addr, or NULL if there is no such property
+ * Return: Pointer to addr, or NULL if there is no such property
  */
 void *devfdt_get_addr_index_ptr(const struct udevice *dev, int index);
 
@@ -115,7 +114,7 @@ void *devfdt_get_addr_index_ptr(const struct udevice *dev, int index);
  * @size: Pointer to size varible - this function returns the size
  *        specified in the 'reg' property here
  *
- * @return addr
+ * Return: addr
  */
 fdt_addr_t devfdt_get_addr_size_index(const struct udevice *dev, int index,
 				      fdt_size_t *size);
@@ -128,7 +127,7 @@ fdt_addr_t devfdt_get_addr_size_index(const struct udevice *dev, int index,
  *	  'reg-names' property providing named-based identification. @index
  *	  indicates the value to search for in 'reg-names'.
  *
- * @return addr
+ * Return: addr
  */
 fdt_addr_t devfdt_get_addr_name(const struct udevice *dev, const char *name);
 
@@ -145,7 +144,7 @@ fdt_addr_t devfdt_get_addr_name(const struct udevice *dev, const char *name);
  * @size: Pointer to size variable - this function returns the size
  *        specified in the 'reg' property here
  *
- * @return addr
+ * Return: addr
  */
 fdt_addr_t devfdt_get_addr_size_name(const struct udevice *dev,
 				     const char *name, fdt_size_t *size);
@@ -154,7 +153,7 @@ fdt_addr_t devfdt_get_addr_size_name(const struct udevice *dev,
  * devfdt_get_addr_pci() - Read an address and handle PCI address translation
  *
  * @dev: Device to read from
- * @return address or FDT_ADDR_T_NONE if not found
+ * Return: address or FDT_ADDR_T_NONE if not found
  */
 fdt_addr_t devfdt_get_addr_pci(const struct udevice *dev);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
