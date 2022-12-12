Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95469649F15
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 13:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46511C65E75;
	Mon, 12 Dec 2022 12:50:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93B57C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 10:33:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCAVxwF010532; Mon, 12 Dec 2022 11:32:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=4lfk+/PxgZO6QHSloW453Ak235CBUboQr2DBt7JUSig=;
 b=2Bb8bC+fkyPPsqSvautON+D4JwdqLVxNhfzhlNq3294zMbRu/cGaY+fXsD0rehEkefF8
 2KdtRTJ3cD7URcMTzSyXD9dmZ/C0IrGDFr+Uv19Pg4FICC6FrmJ6+8e/7xJyHXnYEPB7
 1778I+oTettsCBBFSHfr55awkOCo6TIZJX6OH3sEGbWauq6rRBkokthucUti2+bmzZNq
 Btct9ajg8Wjc48Xx65JVteimckWVk0apVjQHg9fmqDwYqCsjs4qtNh1DiNTLXa4z2vF1
 KsR0PJtyc1w/5siuZQpmSx8GmkPGdXDRe/Bh7bsml9Hi07ir99+jpq5kZx9TIIBNaBYB tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mcjb5a1hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 11:32:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76D3F10003B;
 Mon, 12 Dec 2022 11:32:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66AC021D384;
 Mon, 12 Dec 2022 11:32:54 +0100 (CET)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 12 Dec
 2022 11:32:54 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 12 Dec 2022 11:32:42 +0100
Message-ID: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Mailman-Approved-At: Mon, 12 Dec 2022 12:50:06 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: update vbus-supply of
	usbphyc_port0 on stm32mp157c-ev1
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

phy-stm32-usbphyc bindings uses a connector node with vbus-supply
property.

[backport from linux 43e55d778a6b]
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ev1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index 07bcd7c50672..2d5db41ed67b 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -393,6 +393,10 @@
 	st,tune-squelch-level = <3>;
 	st,tune-hs-rx-offset = <2>;
 	st,no-lsfs-sc;
+	connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&vbus_sw>;
+	};
 };
 
 &usbphyc_port1 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
