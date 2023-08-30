Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2BE78D3CB
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 10:00:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EA69C6A613;
	Wed, 30 Aug 2023 08:00:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87E1EC65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 08:00:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U5udwi011513; Wed, 30 Aug 2023 10:00:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=nNJIeiM
 lAJhf8DrBAZQsl9HuEiC4z+Qi9B/wh5HdCg8=; b=qLEfnqHrbdRpg3JMFIboIyy
 BSRk73zrRNHbtr8ws4AOtgfWwy4A/eNCGkYBJ/12o6RKltXjgM3xuFVXnkms2uUC
 XveloKTHlaH+L4rwzMJJEFxSqPBr1ZsserrkBHRdeQtyQCmhK2OV0fQ5XGjonZBO
 p9XcxPVP9Ttyfxk+mZbTZBY8hsK/1QG4OOAQ9KmO22qAsAi3z2ot6PqEXef8D1GJ
 61Z/uA+NTUXVI7EiTqTzyBx9kcpgeXaiBLT0v0o+FApBSVMorzmWsSBFiViYNCx4
 FMNYiWIkf9/YMbs52Ma3eIchw1TPzKbE5TNQqnMrRvfnxT3yFJxwLKwotXsoLBA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq6h47w9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 10:00:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48C4910005D;
 Wed, 30 Aug 2023 10:00:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38A5F21BF4F;
 Wed, 30 Aug 2023 10:00:56 +0200 (CEST)
Received: from localhost (10.201.22.39) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 30 Aug
 2023 10:00:55 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 30 Aug 2023 10:00:08 +0200
Message-ID: <20230830080008.455157-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Marek Vasut <marex@denx.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [Uboot-stm32] [PATCH] usb: host: ehci-generic: check for companion
	controller
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

EHCI is usually used with companion controller (like OHCI) as companion
controller. This information on the companion is missing currently in
companion drivers.
So, if the usb-uclass isn't aware, it may scan busses in any order: OHCI
first, then EHCI.
This is seen on STM32MP1 where DT probing makes the probe order to occur
by increasing address (OHCI address < EHCI address).

When a low speed or full-speed device is plugged in, it's not detected as
EHCI should first detect it, and give ownership (handover) to OHCI.

Current situation on STM32MP1 (with a low speed device plugged-in)
STM32MP> usb start
starting USB...
Bus usb@5800c000: USB OHCI 1.0
Bus usb@5800d000: USB EHCI 1.00
scanning bus usb@5800c000 for devices... 1 USB Device(s) found
scanning bus usb@5800d000 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found

The "companion" property in the device tree allow to retrieve companion
controller information, from the EHCI node. This allow marking the
companion driver as such.

With this patch (same low speed device plugged in):
STM32MP> usb start
starting USB...
Bus usb@5800c000: USB OHCI 1.0
Bus usb@5800d000: USB EHCI 1.00
scanning bus usb@5800d000 for devices... 1 USB Device(s) found
scanning bus usb@5800c000 for devices... 2 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
STM32MP> usb tree
USB device tree:
  1  Hub (12 Mb/s, 0mA)
  |   U-Boot Root Hub
  |
  +-2  Human Interface (1.5 Mb/s, 100mA)
       HP HP USB 1000dpi Laser Mouse

  1  Hub (480 Mb/s, 0mA)
     u-boot EHCI Host Controller

This also optimize bus scan when a High speed device is plugged in, as
the usb-uclass skips OHCI in this case:

STM32MP> usb reset
resetting USB...
Bus usb@5800c000: USB OHCI 1.0
Bus usb@5800d000: USB EHCI 1.00
scanning bus usb@5800d000 for devices... 2 USB Device(s) found
       scanning usb for storage devices... 1 Storage Device(s) found
STM32MP> usb tree
USB device tree:
  1  Hub (480 Mb/s, 0mA)
  |  u-boot EHCI Host Controller
  |
  +-2  Mass Storage (480 Mb/s, 200mA)
       SanDisk Cruzer Blade 03003432021922011407

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---

 drivers/usb/host/ehci-generic.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index a765a307a323..539c0d0e61bc 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -66,6 +66,7 @@ static int ehci_usb_probe(struct udevice *dev)
 	struct ehci_hccr *hccr;
 	struct ehci_hcor *hcor;
 	int err, ret;
+	struct udevice *companion_dev;
 
 	err = 0;
 	ret = clk_get_bulk(dev, &priv->clocks);
@@ -104,6 +105,29 @@ static int ehci_usb_probe(struct udevice *dev)
 	hcor = (struct ehci_hcor *)((uintptr_t)hccr +
 				    HC_LENGTH(ehci_readl(&hccr->cr_capbase)));
 
+	/*
+	 * Enforce optional companion controller is marked as such. This allows
+	 * the bus scan in usb-uclass to 1st scan the primary controller,
+	 * before the companion controller (ownership is given to companion
+	 * when low or full speed devices have been detected).
+	 */
+	err = uclass_get_device_by_phandle(UCLASS_USB, dev, "companion", &companion_dev);
+	if (!err) {
+		struct usb_bus_priv *companion_bus_priv;
+
+		dev_dbg(companion_dev, "companion of %s\n", dev->name);
+		companion_bus_priv = dev_get_uclass_priv(companion_dev);
+		companion_bus_priv->companion = true;
+	} else if (err && err != -ENOENT && err != -ENODEV) {
+		/*
+		 * Treat everything else than no companion or disabled
+		 * companion as an error. (It may not be enabled on boards
+		 * that have a High-Speed HUB to handle FS and LS traffic).
+		 */
+		dev_err(dev, "Failed to get companion (err=%d)\n", err);
+		goto phy_err;
+	}
+
 	err = ehci_register(dev, hccr, hcor, NULL, 0, USB_INIT_HOST);
 	if (err)
 		goto phy_err;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
