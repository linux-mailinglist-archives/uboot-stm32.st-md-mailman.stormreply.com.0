Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C274759C68
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:03:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89C22C20B43
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:03:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC715C5BF22
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:03:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SD1Zga023795; Fri, 28 Jun 2019 15:03:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=61q4NQmjEy+hBYuiYdyFuXjrpMGeK+GjS+hx2woKr3c=;
 b=teGrMoMCwBQT8hRAcN3DdRAO2+G4/+2HhLbhAjpJoxsn1OljrI+r7BGhdL4abokh/eqa
 AW00IRUVUK+up6/BjIBxSbfBAwL6gT8Sxoj6tDilrxffJURh8RNS/rSs984TA+MYMOmP
 uZZfTWPcrb881hA0hie1TEkzU6Hw0aFVAeMve70LNl3wGnlN4vYoAELywKxuzcNlk2Ql
 YKm3iB5d2eKr8pTyfnv8G6s4WTmy99flt2hQ3/SEx1D8kZIr1r5PsZ82dsz+20ejoPhy
 c3/Gi1W6q8wxtXGSmbRBZR0HIRiLTSKaVPOEK+hLzcE6rA+43fSgNk6ydmUN7p03n3bs pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tcyq0emjq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 15:03:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5A4331;
 Fri, 28 Jun 2019 13:03:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D2EF2933;
 Fri, 28 Jun 2019 13:03:15 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Jun 2019 15:03:15 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Jun 2019 15:02:58 +0200
Message-ID: <20190628130301.18094-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130301.18094-1-patrice.chotard@st.com>
References: <20190628130301.18094-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32: Use kernel qspi
	compatible string for stm32f7-uboot.dtsi
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

For STM32 QSPI driver, "st,stm32-qspi" compatible string was first
introduced in U-boot. But later in kernel side, "st,stm32f469-qspi"
was used.
To simplify, align U-boot QSPI compatible string with kernel one.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32f7-u-boot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32f7-u-boot.dtsi b/arch/arm/dts/stm32f7-u-boot.dtsi
index 29b157324e..ef30afbabb 100644
--- a/arch/arm/dts/stm32f7-u-boot.dtsi
+++ b/arch/arm/dts/stm32f7-u-boot.dtsi
@@ -44,7 +44,7 @@
 		};
 
 		qspi: quadspi@A0001000 {
-			compatible = "st,stm32-qspi";
+			compatible = "st,stm32f469-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xA0001000 0x1000>, <0x90000000 0x10000000>;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
