Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5A210A1F
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jul 2020 13:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B800C36B23
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jul 2020 11:10:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F7B5C36B22
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 11:10:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061B5x7x021686; Wed, 1 Jul 2020 13:10:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=IZ8D6xiHIMwjT6Ql9fzoV2Z6GptChPDTI0XNzzCU5+U=;
 b=Za67y7cdcSanPX73arjtocHzfXN0oXFQQ9zilcQBQ0YL8dW1FzghHHpnUjSgW64B16jp
 jeBZvj+3KuXlWpB5n+O90jJcGjkxuKoFaL7RSaSJdISjLh8WQo6YNS9kOldrWJjK1B5r
 gGROS1KitTaq7Qr0MLAyFAJoAOEuVaNqMxUvJ/v/tvf0cG7eiTDNMZjJb7PZksuM3Snb
 Zf1l3OKtKQFakFNATqypgBtuoaxJQuUFVTrH5BQndQpPcu1ibG9z+Exj5JsGZQbGNRnd
 D/ov15tSYNkrYR9GOawJuUw2bKJES8Czb8QoM2kxMlpTU6HoCJ+pVpgxWEj2GKk4KGad lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1hj3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 13:10:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80C2010002A;
 Wed,  1 Jul 2020 13:10:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 699C72AFF08;
 Wed,  1 Jul 2020 13:10:17 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 1 Jul 2020 13:10:16 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 1 Jul 2020 13:10:10 +0200
Message-ID: <20200701111010.21586-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_07:2020-07-01,
 2020-07-01 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: remove hnp-srp-disable for
	usbotg on dk1
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

Remove hnp-srp-disable for usbotg node because this feature is only needed
for usbotg in HOST mode (in drivers/usb/host/dwc2.c)
and this feature is not activated in stm32mp15 U-Boot
(stm32mp15_basic_defconfig and stm32mp15_trusted_defconfig);
only the device mode is activated and OTG is not supported in DWC2 driver.

This patch reduces the difference between U-Boot and Linux kernel
device-tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index e13dade463..6e4e4922ab 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -203,5 +203,4 @@
 
 &usbotg_hs {
 	u-boot,force-b-session-valid;
-	hnp-srp-disable;
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
