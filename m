Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE232004D4
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:20:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9F0C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 09:20:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABED1C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 09:20:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05J9GOoj012765; Fri, 19 Jun 2020 11:20:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eZnIR1OI3o4Huo9LKQfiNMtHF3Mu8AEgs88CZRDd0f8=;
 b=JoWgfLkE8mM0oRmXntRXP8MesUKUS5Yl9lPdll7DJsuee4y69P5Wh1TePhLiw/7EfVrx
 hrzySlkuZLob8/ODH9EdwPpkNCuzW0PplEqG4bMXvS/dwv9dP3mz06jlbkC8g8KHZzdK
 wdbD5QvQSvqCfhjJjHnQ1CIv5+AKyThryDG0ZDxjtQPferETETkNOaiUO/mwRDfQKpil
 q4YcP//GmEJIHdLCt+xQV7B3h9rNYpY0EnzusP6sCsfAT7i5r5kVITRxmAb6JlbyO9Dd
 BkDJAFCSRKkKCwr1FRj072oHYs1pBL35feNxGY77en1WDJih1h2q1uQtV4FHaSMVFyBL cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64aque0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 11:20:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FE21100034;
 Fri, 19 Jun 2020 11:20:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B81A2B0F5E;
 Fri, 19 Jun 2020 11:20:01 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 11:20:01 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 11:19:45 +0200
Message-ID: <20200619091945.11656-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_05:2020-06-18,
 2020-06-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Reinstate card detect
	behavior on ST boards
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

The cd-gpios with (GPIO_ACTIVE_LOW | GPIO_PULL_UP) gpio is thus far
unsupported, reinstate the old cd-gpios behavior until this handling
is fully implemented. This avoid potential issue for SDCard boot:
the card detect fails with floating gpio.

Hi,

I don't have boot issue on my boards (DK2 and EV1) but this
patch avoids potential issue with floating gpio as issue see
by Marek on DHSOM.

To be reverted in v2020.10 when the serie [1] is accepted.

The generic impacts in gpio uclass [2] is already accepted
for V2020.07 and merged in master branch.

[1] stm32mp1: activate gpio hog support and add new pinctrl ops
http://patchwork.ozlabs.org/project/uboot/list/?series=181294

[2] dm: add support of new binding in gpio and pincontrol
http://patchwork.ozlabs.org/project/uboot/list/?series=152777&state=*

Patrick

END

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 2 ++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 3fedb6f1e1..e13dade463 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -171,6 +171,8 @@
 
 &sdmmc1 {
 	u-boot,dm-spl;
+	broken-cd;
+	/delete-property/ cd-gpios;
 };
 
 &sdmmc1_b4_pins_a {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index a07c585415..b16dc28d47 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -167,6 +167,8 @@
 
 &sdmmc1 {
 	u-boot,dm-spl;
+	broken-cd;
+	/delete-property/ cd-gpios;
 };
 
 &sdmmc1_b4_pins_a {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
