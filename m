Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B8109A70
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F3EAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0802C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lSRk008390; Tue, 26 Nov 2019 09:49:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MpVyh26/IXePxmAnOFO7KE+C5JHUghEzd1mAKCrS4yc=;
 b=u3I+SJtOk27CPBeIXmbwrXLNyG5Mqzva7rxLTZqnyIw6iS4litD5LcgcBcXkEIKnNh9E
 HW3tQMkwX3G8njzp+63lS5xrShJusV/5fSxLjt5DthrSPiS690qYYWUuk00l0yV8oVsi
 1xKCE6DRnDO3o9b5QtTt+DMVjRx/WXMwVoAkeYvxzKbKpwM4ZyDTBhCv5MhsyvQXMV4M
 SStZBZdAJHkLlG3IY13TUfhCY/haJ06JGRkiV/4ty8WUW6GD8XtGonmpDa0y44D0g5y1
 ciDPQsorOzRPq8h/uQbdP04Bazf87iNnNo2UxyMVx3wfGSdGnD6wfJwViNuESsdopSge og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wevhjnxak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2782100034;
 Tue, 26 Nov 2019 09:49:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C52E02ACE57;
 Tue, 26 Nov 2019 09:49:14 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:14 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:48:58 +0100
Message-ID: <20191126084911.19761-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 01/14] dm: pinctrl: convert pinctrl-single
	to livetree
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
- dev_read_prop
- dev_read_u32_default
- dev_read_u32_array
- dev_read_bool
- dev_read_addr
and get rid of DECLARE_GLOBAL_DATA_PTR.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- use the dev_ API instead of ofnode_ function.

 drivers/pinctrl/pinctrl-single.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 1dfc97dcea..6d8f989ebd 100644
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
@@ -117,13 +115,11 @@ static int single_configure_bits(struct udevice *dev,
 static int single_set_state(struct udevice *dev,
 			    struct udevice *config)
 {
-	const void *fdt = gd->fdt_blob;
 	const struct single_fdt_pin_cfg *prop;
 	const struct single_fdt_bits_cfg *prop_bits;
 	int len;
 
-	prop = fdt_getprop(fdt, dev_of_offset(config), "pinctrl-single,pins",
-			   &len);
+	prop = dev_read_prop(dev, "pinctrl-single,pins", &len);
 
 	if (prop) {
 		dev_dbg(dev, "configuring pins for %s\n", config->name);
@@ -136,9 +132,7 @@ static int single_set_state(struct udevice *dev,
 	}
 
 	/* pinctrl-single,pins not found so check for pinctrl-single,bits */
-	prop_bits = fdt_getprop(fdt, dev_of_offset(config),
-				"pinctrl-single,bits",
-				    &len);
+	prop_bits = dev_read_prop(dev, "pinctrl-single,bits", &len);
 	if (prop_bits) {
 		dev_dbg(dev, "configuring pins for %s\n", config->name);
 		if (len % sizeof(struct single_fdt_bits_cfg)) {
@@ -160,27 +154,24 @@ static int single_ofdata_to_platdata(struct udevice *dev)
 	int res;
 	struct single_pdata *pdata = dev->platdata;
 
-	pdata->width = fdtdec_get_int(gd->fdt_blob, dev_of_offset(dev),
-				      "pinctrl-single,register-width", 0);
+	pdata->width =
+		dev_read_u32_default(dev, "pinctrl-single,register-width", 0);
 
-	res = fdtdec_get_int_array(gd->fdt_blob, dev_of_offset(dev),
-				   "reg", of_reg, 2);
+	res = dev_read_u32_array(dev, "reg", of_reg, 2);
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
+	pdata->mask = dev_read_u32_default(dev, "pinctrl-single,function-mask",
+					   0xffffffff);
+	pdata->bits_per_mux = dev_read_bool(dev, "pinctrl-single,bit-per-mux");
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
