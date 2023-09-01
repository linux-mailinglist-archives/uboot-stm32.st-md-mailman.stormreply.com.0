Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8239F78FB7A
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 11:52:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4010FC6B442;
	Fri,  1 Sep 2023 09:52:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FC98C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 09:52:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3814ahtl019031; Fri, 1 Sep 2023 11:52:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=/rRD2I+
 2BZ5RcUlO2bUT6DdpIz5xFDk71l+jJYVb708=; b=rzbkMJcVPzKaRwgWoaSHcnr
 R3RsUpsuzaWya77/ouC13MsON047EP1Zrvc7bx3wwK9p+L8YjnQ/hKkHDd6y9ogU
 IcldpMQZd9c9VpEk3wFwrsJpjGq5gIbo12QlDVGm2Kl0XrXxBZQ54vTDPiH3Q8ej
 WIGFxQECNn4r1qklHxN7gB6niSYl5kah+JnJY1cNQAdEzfMIG+j/iDud0nsZ9S3T
 s2L4oQ+ePZK37yvv/XW2VY7yFSsohS6O3NqK0Ugq0FbeXeMQ0cPzk0z+16z+gn8g
 Vj7IlCq9VM3wukDRvuo7ZA28c6ViZ2uUbAp2+KJQN+iivfoWXwDzPHuphtjOBtw=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq89ca4hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 11:52:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86F68100058;
 Fri,  1 Sep 2023 11:52:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57B5B211F2F;
 Fri,  1 Sep 2023 11:52:42 +0200 (CEST)
Received: from localhost (10.201.22.39) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 1 Sep
 2023 11:52:39 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 1 Sep 2023 11:52:01 +0200
Message-ID: <20230901095201.3874129-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_07,2023-08-31_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2] usb: check for companion controller in
	uclass
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

Changes in v2:
- move companion probing from generic ehci driver to usb-uclass, after
  Marek's questions on design choice.
- rename commit title to follow this change

---
 drivers/usb/host/usb-uclass.c | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/usb/host/usb-uclass.c b/drivers/usb/host/usb-uclass.c
index 02c0138a2065..e238eee8c84d 100644
--- a/drivers/usb/host/usb-uclass.c
+++ b/drivers/usb/host/usb-uclass.c
@@ -249,6 +249,37 @@ static void remove_inactive_children(struct uclass *uc, struct udevice *bus)
 	}
 }
 
+static int usb_probe_companion(struct udevice *bus)
+{
+	struct udevice *companion_dev;
+	int ret;
+
+	/*
+	 * Enforce optional companion controller is marked as such in order to
+	 * 1st scan the primary controller, before the companion controller
+	 * (ownership is given to companion when low or full speed devices
+	 * have been detected).
+	 */
+	ret = uclass_get_device_by_phandle(UCLASS_USB, bus, "companion", &companion_dev);
+	if (!ret) {
+		struct usb_bus_priv *companion_bus_priv;
+
+		debug("%s is the companion of %s\n", companion_dev->name, bus->name);
+		companion_bus_priv = dev_get_uclass_priv(companion_dev);
+		companion_bus_priv->companion = true;
+	} else if (ret && ret != -ENOENT && ret != -ENODEV) {
+		/*
+		 * Treat everything else than no companion or disabled
+		 * companion as an error. (It may not be enabled on boards
+		 * that have a High-Speed HUB to handle FS and LS traffic).
+		 */
+		printf("Failed to get companion (ret=%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 int usb_init(void)
 {
 	int controllers_initialized = 0;
@@ -299,6 +330,11 @@ int usb_init(void)
 			printf("probe failed, error %d\n", ret);
 			continue;
 		}
+
+		ret = usb_probe_companion(bus);
+		if (ret)
+			continue;
+
 		controllers_initialized++;
 		usb_started = true;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
