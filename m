Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BED10649F17
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 13:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 617DCC65E79;
	Mon, 12 Dec 2022 12:50:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAD73C65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 10:46:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCAaxvf004907; Mon, 12 Dec 2022 11:46:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=FqAdTv+NiFqYgBARjHQykJEM1U3QCoobdSHfq0+hND4=;
 b=mTW51h+amJ5DnpuLlokhzshtjjM9Gg8+EIc/MlzWRU263zKmx6DH8l6iibSaJ4R7LvuJ
 kXwN1L9uOpP6fidNyMnuOTCuZErLzBtdG68w3fJ1czIpNHVUh8Qz2qtEVtkwVrH4CkqM
 fHdwFR6f+1StdWPer+BuknGyoffGeHrqq44tKChAj3e73bQHsgGDMQqk4AN22yjDETAb
 WRuuXL4p9hMQNQs8+NPBqTNZFyQZCWJr8NK5+EH1jmrBtc4p2Cb0hbJ0fmdb/frEtyhX
 5AQkGIBDUm+1th4A9vIpWUJC6Om+8Lvr7fWaCh1gGLC+CWtGiPtwnMtGMstL7Ffs7Vnq QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mcg4r3auu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 11:46:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41835100039;
 Mon, 12 Dec 2022 11:46:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B28221A22C;
 Mon, 12 Dec 2022 11:46:25 +0100 (CET)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 12 Dec
 2022 11:46:22 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 12 Dec 2022 11:44:37 +0100
Message-ID: <20221212104437.15838-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: add support for USB2514B
	onboard hub on stm32mp157c-ev1
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

Add support for USB2514B onboard hub on stm32mp157c EV1 board. The HUB
is supplied by a 3v3 PMIC regulator.

[backport from linux ad9591b01d24]
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ev1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index d142dd30e16b..07bcd7c50672 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -362,6 +362,14 @@
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* onboard HUB */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		vdd-supply = <&v3v3>;
+	};
 };
 
 &usbotg_hs {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
