Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEE217445
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 18:42:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84992C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 16:42:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15B31C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 16:42:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067GXvIU016488; Tue, 7 Jul 2020 18:42:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eRnglmWKecWgJvD+HlrRA7yQKyzYq0+l8xFVR/PA7KI=;
 b=y7IMEQmIJvDPcjKsxQWcMuHkiRmCTZaF4TPfCSUsrkD0DPc2TCNj6xPIqjUmp/BsuSdI
 4l0ofPfHhuUFCabTR1C8y3loLI73DAVthPeJmcnSIIyDV1xLkUq/7VCsKhpoq6MobMZD
 hSn/ykCOGpCXVBvs3i3aNcZtYujeQ66pTUfEZF83SprE5RH91u0MZ3/1aqUo9RGqyNM9
 +VOc8obVsQVcz+4/i4wT1j6mlVRvuwubHS2nnVswpjdjVYvDjnwGh+HMy0c63FSiyJfO
 PPOa6euQzjxoYwrjGbciOyPg0zVBUCDy0FNWyrCou9/4CxulDVHApSrW1s3hWQzLBaOT Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfj3cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 18:42:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC90310002A;
 Tue,  7 Jul 2020 18:42:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2A6D2C125C;
 Tue,  7 Jul 2020 18:42:30 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 7 Jul 2020 18:42:30 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Jul 2020 18:42:24 +0200
Message-ID: <20200707164224.18972-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_09:2020-07-07,
 2020-07-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] Revert "ARM: dts: stm32: Reinstate card
	detect behavior on DHSOM"
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

Since commit f13ff88b61c3 ("gpio: stm32: add ops set_dir_flags")
the gpio flags are aupported by stm32 pinctrl driver.

The cd-gpios is correctly handle in U-Boot and the patch on the
device tree can be removed.

This reverts commit 3c2e2a1a79608c5e046313a8c47586d9a734e2a3.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 69c5af4241..f96de9e7a3 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -264,9 +264,6 @@
 
 &sdmmc1 {
 	u-boot,dm-spl;
-	broken-cd;
-	/delete-property/ cd-gpios;
-	/delete-property/ disable-wp;
 };
 
 &sdmmc1_b4_pins_a {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
