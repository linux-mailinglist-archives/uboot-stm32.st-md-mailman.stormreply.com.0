Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA74E97C
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:39:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3B81CA75B7
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:39:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D8FECA75B5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:39:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDbm7E014836; Fri, 21 Jun 2019 15:39:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Nsv2yVyAWg2LKWYOYb4VVtzKcFnZGMM9no6RAeLc9sc=;
 b=pRsfegULGBXdXoZ3cLQSaQAH+G+iWgiD+P1DqYM01IudGQDCIz6GYgn49UD1zd4fhm/e
 PFU78HxEk5OkU6Q9VC7jC4gsE6U3fdLZMIdaMrJ+NcEwXVaRWY0R3bzS82lSw4Suz6d8
 U9R8ppHmWiMcd83uvA4HKrEE5a2smOKoqPsUljQm+dL1CYT9DDWdLonx8J2ij0gMTKqs
 dg2NSXoUq3QQnZJAPSyhui4RKoupyPitafYlnfLUm3nBwufoF+44YT+iEjyuKgr/APrN
 wvqUH28o0HQQ0SYXu/1PcDd+2pQRGOWkDgiKbEAzN1zT9TvDuTQ351Y7H+aDTbwF0CIi eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxssbc8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:39:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF1D849;
 Fri, 21 Jun 2019 13:39:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 950AE2A67;
 Fri, 21 Jun 2019 13:39:29 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:39:29 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:39:24 +0200
Message-ID: <20190621133925.8643-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621133925.8643-1-patrice.chotard@st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH 3/4] ARM: dts: stm32: Remove useless "st,
	stm32-gpio" compatible string
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

Since pinctrl_stm32 driver update, each gpio bank is now binded
by pinctrl driver. The compatible string "st,stm32-gpio" becomes
useless, remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32429i-eval-u-boot.dtsi  | 11 -----------
 arch/arm/dts/stm32f429-disco-u-boot.dtsi | 11 -----------
 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 11 -----------
 arch/arm/dts/stm32f7-u-boot.dtsi         | 17 -----------------
 arch/arm/dts/stm32mp157-u-boot.dtsi      | 12 ------------
 5 files changed, 62 deletions(-)

diff --git a/arch/arm/dts/stm32429i-eval-u-boot.dtsi b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
index 6da0a636c1..fe437bbfe2 100644
--- a/arch/arm/dts/stm32429i-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
@@ -92,57 +92,46 @@
 };
 
 &gpioa {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiob {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioc {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiod {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioe {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiof {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiog {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioh {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioi {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioj {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiok {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
diff --git a/arch/arm/dts/stm32f429-disco-u-boot.dtsi b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
index 0cc3100440..52f80320bc 100644
--- a/arch/arm/dts/stm32f429-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
@@ -79,57 +79,46 @@
 };
 
 &gpioa {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiob {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioc {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiod {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioe {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiof {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiog {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioh {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioi {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioj {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiok {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index 3da308e6a4..2409cf746a 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -94,57 +94,46 @@
 };
 
 &gpioa {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiob {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioc {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiod {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioe {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiof {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiog {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioh {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioi {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioj {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiok {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
diff --git a/arch/arm/dts/stm32f7-u-boot.dtsi b/arch/arm/dts/stm32f7-u-boot.dtsi
index 29b157324e..3ba7f8410d 100644
--- a/arch/arm/dts/stm32f7-u-boot.dtsi
+++ b/arch/arm/dts/stm32f7-u-boot.dtsi
@@ -65,58 +65,41 @@
 };
 
 &gpioa {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiob {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioc {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiod {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioe {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiof {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiog {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioh {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioi {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
-&gpioj {
-	compatible = "st,stm32-gpio";
-};
-
-&gpiok {
-	compatible = "st,stm32-gpio";
-};
-
 &pinctrl {
 	u-boot,dm-pre-reloc;
 
diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
index 09560e2d91..66dc6df787 100644
--- a/arch/arm/dts/stm32mp157-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
@@ -82,62 +82,50 @@
 };
 
 &gpioa {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiob {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioc {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiod {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioe {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiof {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiog {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioh {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioi {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioj {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpiok {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
 &gpioz {
-	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
