Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4960E1475C
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 11:17:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09C38C9AE3F
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 09:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B26C9AE3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 09:17:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469GqWv010400; Mon, 6 May 2019 11:17:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AhidzK1XLZGFNwXN15UcbIyglafYOQLxbnrLNTs/xMA=;
 b=ZlcWTTNz7faIGnTegxqSR15uRo/GLXV4vBeT9s+AmhffDA4jeSBTMCkfSRtsD4euQNZZ
 D8bqORcbr/WYYjh3OyGz2cykeBxzrDXwmN+4MUT4H7sVq8JFmpBaDAmngovKRu3MLm8D
 P0p8U7LjcRwa9Cvix0kPNpwZM7TiBpiA/+KwHuYC4TZoMZz718zI4HP6eKXGW9iaaVHd
 b2Vr5lg5PQcpqEMQRm/9EKEM6TaGeNNWiKNTYCFkm9JHdpMUZQcnjdyWQPHgcYcEPTaa
 krTdo099es2Z9/Aab7Jru4/YBYxM42AO//FSbW2OzA9kMTRbAThrdMygSQoGFVaJIdvt VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s94cd8eau-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 11:17:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF0EF3A;
 Mon,  6 May 2019 09:17:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B662D15BC;
 Mon,  6 May 2019 09:17:09 +0000 (GMT)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 6 May 2019 11:17:09 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 May 2019 11:16:53 +0200
Message-ID: <1557134223-4549-3-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
References: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 02/12] ARM: dts: stm32: Fix qspi memory map
	size for stm32f7 boards
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

stm32f746-disco embeds a 16Mb qspi flash, stm32f746-eval and
stm32f769-disco embeds a 64Mb qspi flash.
Update the reg property accordingly

Remove deprecated memory-map property.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32746g-eval-u-boot.dtsi  | 1 +
 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
index 9b55bb7..935d44d 100644
--- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
@@ -177,6 +177,7 @@
 };
 
 &qspi {
+	reg = <0xA0001000 0x1000>, <0x90000000 0x4000000>;
 	qflash0: n25q512a {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index bc337b1..a6799be 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -234,6 +234,7 @@
 };
 
 &qspi {
+	reg = <0xA0001000 0x1000>, <0x90000000 0x1000000>;
 	qflash0: n25q128a {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -241,7 +242,6 @@
 		spi-max-frequency = <108000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <1>;
-		memory-map = <0x90000000 0x1000000>;
 		reg = <0>;
 	};
 };
diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index e9e43cb..96770da 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -155,6 +155,7 @@
 };
 
 &qspi {
+	reg = <0xA0001000 0x1000>, <0x90000000 0x4000000>;
 	flash0: mx66l51235l {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
