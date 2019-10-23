Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 901F9E1D13
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7E6BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18CDEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:44:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDhFBW023201; Wed, 23 Oct 2019 15:44:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JhRHIO4gNy9QxZv0wKgjUhoeOC2LWaiN4BlMqTIqMC4=;
 b=oesZTNvG03tu+o7KJAfIMMK4H/fcRS7Sgc2E/cQC50AeC4xVA8pgi5xn7TMWUsEMyvkL
 8JUZjuNkHJiYZpRA8y0xQDli5m+hScz3IPXmM9PxvekHy0xD7ou45RysuG9fx++H5QwC
 YluvundOp5TTW7BocQTgadYC46mio5GCL6gZbphueK2tBa/x7/8OkrOvaomFOMJZ9sjq
 B3mla/6mdAPAyTfjPgGhnkw1P42RDzv+C8gm0gP4FrGmSLfRl7RFsKmtgWPjd0HMzTJ7
 pLqlhlj3ohT5MwghWeklQrbKvqyHGcJiW0PAMMfm2YLBsCrlsbUgGKjg/jQSv6gQcHzR Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s73xkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:44:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A32310002A;
 Wed, 23 Oct 2019 15:44:56 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 205692FF5FE;
 Wed, 23 Oct 2019 15:44:56 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:44:55 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:44:55
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:37 +0200
Message-ID: <20191023134448.20149-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Adam Ford <aford173@gmail.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/13] dm: pinctrl: convert pinctrl-single to
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

Convert 'pinctrl-single' using livetree functions
- ofnode_get_property
- ofnode_read_u32_default
- ofnode_read_u32_array
- ofnode_read_bool
- dev_read_addr
and get rid of DECLARE_GLOBAL_DATA_PTR.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-single.c | 33 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1dfc97dcea..67429d6995 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -9,8 +9,6 @@
 #include <linux/libfdt.h>
 #include <asm/io.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 struct single_pdata {
 	fdt_addr_t base;	/* first configuration register */
 	int offset;		/* index of last configuration register */
@@ -117,13 +115,12 @@ static int single_configure_bits(struct udevice *dev,
 static int single_set_state(struct udevice *dev,
 			    struct udevice *config)
 {
-	const void *fdt = gd->fdt_blob;
 	const struct single_fdt_pin_cfg *prop;
 	const struct single_fdt_bits_cfg *prop_bits;
 	int len;
 
-	prop = fdt_getprop(fdt, dev_of_offset(config), "pinctrl-single,pins",
-			   &len);
+	prop = ofnode_get_property(dev_ofnode(dev), "pinctrl-single,pins",
+				   &len);
 
 	if (prop) {
 		dev_dbg(dev, "configuring pins for %s\n", config->name);
@@ -136,9 +133,9 @@ static int single_set_state(struct udevice *dev,
 	}
 
 	/* pinctrl-single,pins not found so check for pinctrl-single,bits */
-	prop_bits = fdt_getprop(fdt, dev_of_offset(config),
-				"pinctrl-single,bits",
-				    &len);
+	prop_bits = ofnode_get_property(dev_ofnode(dev),
+					"pinctrl-single,bits",
+					&len);
 	if (prop_bits) {
 		dev_dbg(dev, "configuring pins for %s\n", config->name);
 		if (len % sizeof(struct single_fdt_bits_cfg)) {
@@ -160,27 +157,27 @@ static int single_ofdata_to_platdata(struct udevice *dev)
 	int res;
 	struct single_pdata *pdata = dev->platdata;
 
-	pdata->width = fdtdec_get_int(gd->fdt_blob, dev_of_offset(dev),
-				      "pinctrl-single,register-width", 0);
+	pdata->width = ofnode_read_u32_default(dev_ofnode(dev),
+					       "pinctrl-single,register-width",
+					       0);
 
-	res = fdtdec_get_int_array(gd->fdt_blob, dev_of_offset(dev),
-				   "reg", of_reg, 2);
+	res = ofnode_read_u32_array(dev_ofnode(dev), "reg", of_reg, 2);
 	if (res)
 		return res;
 	pdata->offset = of_reg[1] - pdata->width / 8;
 
-	addr = devfdt_get_addr(dev);
+	addr = dev_read_addr(dev);
 	if (addr == FDT_ADDR_T_NONE) {
 		dev_dbg(dev, "no valid base register address\n");
 		return -EINVAL;
 	}
 	pdata->base = addr;
 
-	pdata->mask = fdtdec_get_int(gd->fdt_blob, dev_of_offset(dev),
-				     "pinctrl-single,function-mask",
-				     0xffffffff);
-	pdata->bits_per_mux = fdtdec_get_bool(gd->fdt_blob, dev_of_offset(dev),
-					      "pinctrl-single,bit-per-mux");
+	pdata->mask = ofnode_read_u32_default(dev_ofnode(dev),
+					      "pinctrl-single,function-mask",
+					      0xffffffff);
+	pdata->bits_per_mux = ofnode_read_bool(dev_ofnode(dev),
+					       "pinctrl-single,bit-per-mux");
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
