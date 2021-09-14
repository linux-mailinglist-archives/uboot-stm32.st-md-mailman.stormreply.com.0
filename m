Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7D40AD48
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Sep 2021 14:15:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A26DC597BC;
	Tue, 14 Sep 2021 12:15:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7F3DC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Sep 2021 12:14:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E9MY76019631; 
 Tue, 14 Sep 2021 14:14:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=NRulMbwBKmdSp2Rh4O1h+lZQfwSTmOilj2V2fy9CnU4=;
 b=kUruEzkDjB2UoqozR0z7qumzwO8rkXokBCQPQbSjT+Boqu+KSCFz1SOHD5FZ50PP4wxq
 a4PvqGxBdNMXFffgyT4Lgfqs7FeDkHPy6OT9+98JiG80yBQ3VpCuz97juzRN6SwAZ30L
 aaeqvIulKS9nVF98j91rz9xVyC1kL9h4oEzHCg8wrtjkRkmPgaYOOqdAmMRQP4RQ5sKE
 90Ley3EtJL7rEcHxzYF47Krbeor7+zQEygDQqoGPdkyqe0OdPTgxmoFTSxszMLPkdBUX
 9qEtIf4rxc1Mhemny17F7rJqOuOBFwBVxi6I6805hSbUVvmEREdSFgBHe8+aQE2hCda3 nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b2hgnuh60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 14:14:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2199210002A;
 Tue, 14 Sep 2021 14:14:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13DCD21B529;
 Tue, 14 Sep 2021 14:14:56 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 14 Sep 2021 14:14:55
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Sep 2021 14:14:52 +0200
Message-ID: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_03,2021-09-14_01,2020-04-07_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: use ssbl partition name
	for U-Boot
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

Continue to use the "ssbl" name for GPT partition of secondary boot
stage = U-Boot for basic boot with SPL to avoid to disturb existing user.

The "fip" partition name is only used for TFA_BOOT with FIP, it is a TF-A
BL2 requirement; it the default configuration for STMicroelectronics
boards.

Fixes: b73e8bf453f8 ("arm: stm32mp: add defconfig for trusted boot with FIP")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 4 +++-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 0101962ea5..15a04ae927 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -21,11 +21,13 @@
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
+#endif
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 32777384c6..408abaf52f 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -20,11 +20,13 @@
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
+#endif
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
