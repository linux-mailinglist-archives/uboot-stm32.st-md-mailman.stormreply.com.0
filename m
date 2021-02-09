Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C3314CA7
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 11:14:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36605C57B53;
	Tue,  9 Feb 2021 10:14:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AAD7C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:14:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119ACNFL024842; Tue, 9 Feb 2021 11:14:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=ts0oPQwD3j4Zd7vnCy7FLaPKL0zfSnQxU1eTwx3WW9w=;
 b=3mp8teZwxMqBOImmva/rGIe9XnzQbxTeccg2mNzltGi3/A9L8RnZDk/cTvL98udUcim+
 SuZ5/GA5HL2bD8X6GKq6VFpghUIrB/0CmlojmLMRDihhhEYn0a0qCKPVtC4r6CioIe8J
 407sbtLQV/hZ6w0ySc+QC+boebwN/rFNG24SdmG/L9mKATZPZ8xBNSoP5hdUekgC2GH/
 lt+bZ7krqLNVMdnBUlES1MQfgR3aOF+W9KgDAhdM3ieBCMNrcOImXWjTb16TlJEOwNfc
 qxai1VqGmVNyM7VU1o1y7xiHTeaJdSNzzt+yNXW3IeAVh5I6Y7a40I08MJwa9VYuiUaQ 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrauqwbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:14:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 151BB10002A;
 Tue,  9 Feb 2021 11:14:54 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1564225E96;
 Tue,  9 Feb 2021 11:14:53 +0100 (CET)
Received: from localhost (10.75.127.121) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 11:14:53 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Feb 2021 11:14:46 +0100
Message-ID: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG3NODE5.st.com (10.75.127.72) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] usb: dwc2: change compatible st,
	stm32mp1-hsotg to st, stm32mp15-hsotg
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

The Linux kernel v5.7-rc1 introduced the compatible "st,stm32mp15-hsotg".

See Linux kernel commit d49850110434 ("dt-bindings: usb: dwc2: add
support for STM32MP15 SoCs USB OTG HS and FS")

This patch updates the supported compatible in DWC2 driver,
removes the add-on done in U-Boot dtsi and keeps the compatible
defined in SOC dtsi arch/arm/dts/stm32mp151.dtsi:

usbotg_hs: usb-otg@49000000 {
	compatible = "st,stm32mp15-hsotg", "snps,dwc2";
	reg = <0x49000000 0x10000>;
...
};

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 3 ---
 drivers/usb/gadget/dwc2_udc_otg.c  | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index d0aa5eabe5..43a7909978 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -228,6 +228,3 @@
 	resets = <&rcc UART8_R>;
 };
 
-&usbotg_hs {
-	compatible = "st,stm32mp1-hsotg", "snps,dwc2";
-};
diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index e3871e381e..ecac80fc11 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice *dev)
 static const struct udevice_id dwc2_udc_otg_ids[] = {
 	{ .compatible = "snps,dwc2" },
 	{ .compatible = "brcm,bcm2835-usb" },
-	{ .compatible = "st,stm32mp1-hsotg",
+	{ .compatible = "st,stm32mp15-hsotg",
 	  .data = (ulong)dwc2_set_stm32mp1_hsotg_params },
 	{},
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
