Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D00887AF96
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C5B8C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C4BFC35E02
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHFmSi001887; Tue, 30 Jul 2019 19:17:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4PrDO8ff4U0nvPwEkJU1r3SCbciNMBjhVJ7grKWJyZ0=;
 b=FuxuQkm/72ZPh+gymqZ/fNLlDipIg3SrTbsqI+i28Vd11bCQYj4+O8dL2G5O7aarIwbf
 1ixTDMZiBIhkcRZsrDYkY6hffNrh4kRzu5noqeizRA/iHIE2L0E6otAEjxLzJMZUtwo5
 Ci4YTNoljdBhQET3xedjHi/HnPGJp+oPRkPirKMDvJbenP1+xFGmgkqaJfzNGm80fK7a
 FnNU6TfuLsp69UvkTlXy70lCC0OvyoqZkb3qpqKBeHCe9daS1M9FqTzODeDdszUfsIhW
 ErU5JlJjS3bCjlvDA3Cr61LzwSYB3XnaUtXdz72kj5uAS07YnWFqdIbfetidWf7APaq0 pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acuh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC45931;
 Tue, 30 Jul 2019 17:17:39 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A82B029B3;
 Tue, 30 Jul 2019 17:17:39 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:39 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:39
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:42 +0200
Message-ID: <1564507016-16570-35-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 34/48] stm32mp1: board: Update the way
	vdd-supply is retrieved from DT
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

Due to kernel DT alignment, pwr-supply is renamed to vdd-supply
and is a subnode of pwr-regulators.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-avenger96.dts | 5 ++++-
 arch/arm/dts/stm32mp157a-dk1.dts       | 5 ++++-
 arch/arm/dts/stm32mp157c-ed1.dts       | 5 ++++-
 board/st/stm32mp1/stm32mp1.c           | 8 +++++---
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
index ba86cf5..5b15a4a 100644
--- a/arch/arm/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/dts/stm32mp157a-avenger96.dts
@@ -283,7 +283,10 @@
 };
 
 &pwr {
-	pwr-supply = <&vdd>;
+	pwr-regulators {
+		vdd-supply = <&vdd>;
+		vdd_3v3_usbfs-supply = <&vdd_usb>;
+	};
 };
 
 &rng1 {
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index 1d5c1a6..ba612a5 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -308,7 +308,10 @@
 };
 
 &pwr {
-	pwr-supply = <&vdd>;
+	pwr-regulators {
+		vdd-supply = <&vdd>;
+		vdd_3v3_usbfs-supply = <&vdd_usb>;
+	};
 };
 
 &rng1 {
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index 94ac025..3e8b7b5 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -218,7 +218,10 @@
 };
 
 &pwr {
-	pwr-supply = <&vdd>;
+	pwr-regulators {
+		vdd-supply = <&vdd>;
+		vdd_3v3_usbfs-supply = <&vdd_usb>;
+	};
 };
 
 &rng1 {
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index c61a562..a96e675 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -471,7 +471,9 @@ static void sysconf_init(void)
 	 *   => U-Boot set the register only if VDD < 2.7V (in DT)
 	 *      but this value need to be consistent with board design
 	 */
-	ret = syscon_get_by_driver_data(STM32MP_SYSCON_PWR, &pwr_dev);
+	ret = uclass_get_device_by_driver(UCLASS_PMIC,
+					  DM_GET_DRIVER(stm32mp_pwr_pmic),
+					  &pwr_dev);
 	if (!ret) {
 		ret = uclass_get_device_by_driver(UCLASS_MISC,
 						  DM_GET_DRIVER(stm32mp_bsec),
@@ -485,8 +487,8 @@ static void sysconf_init(void)
 		if (!ret)
 			otp = otp & BIT(13);
 
-		/* get VDD = pwr-supply */
-		ret = device_get_supply_regulator(pwr_dev, "pwr-supply",
+		/* get VDD = vdd-supply */
+		ret = device_get_supply_regulator(pwr_dev, "vdd-supply",
 						  &pwr_reg);
 
 		/* check if VDD is Low Voltage */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
