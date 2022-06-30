Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7FF561DB7
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 16:20:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0219C04005;
	Thu, 30 Jun 2022 14:20:39 +0000 (UTC)
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 7D03DC03FC8 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 14:20:38 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx4.securetransport.de (Postfix) with ESMTPSA id 0FE9A720507;
 Thu, 30 Jun 2022 16:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1656598820;
 bh=hMrdvXVjFgeMKCNfgchOwStS6qkv/LIDjUb0z7T1P0Q=;
 h=From:To:CC:Subject:Date:From;
 b=X2qPjDg3hYCgickb5RHrplwUcMmUgOTN9771AFhtR/FYaL6QHbk2r4jofVPmfYntK
 FrJOhckcg8ry9mLh2WqSIMEcarOXi8xiapj+qcx5plk8zMEXaSADgoZvKcC4VquYH5
 Wb3aAGX8xFOHg2eJIqysBOHDT31Yt70MI5H98R+97M35PZSTlMkLd04PBizZtJCKho
 3oGVWhL/y3SaoDE684ss6E40jZlR6swUZr+uLZtg/se3nWQoQfeN0iLMhZHv7Xryhk
 Btf3GmhCk586FGhTbVeKlCSmAzfUasSH9alPWLR/M1/QpjAq0Rq4K3XS5sedod3X1S
 xsZmz/vp80oWQ==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 30 Jun 2022 16:20:13 +0200
Received: from debian-vm.dh-electronics.org (10.64.6.150) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9
 via Frontend Transport; Thu, 30 Jun 2022 16:20:12 +0200
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 16:19:48 +0200
Message-ID: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Klartext: yes
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Johann Neuhauser <jneuhauser@dh-electronics.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: Drop fastboot and
	stm32prog trigger gpios on DHCOM
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

PA13 and PA14 are used for USB power control and can't be used
to enforce fastboot or stm32prog mode by pressing a button.

Defining CONFIG_FASTBOOT/CONFIG_CMD_STM32PROG without this patch applied
results in fastboot/stm32prog always starting, because PA13/PA14 are always
low during boot. So drop the wrong trigger gpios definitions.

Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>

---

 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index d73967ac1b5d..ee747a52bb7c 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -27,8 +27,6 @@
 	config {
 		u-boot,boot-led = "heartbeat";
 		u-boot,error-led = "error";
-		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 		dh,som-coding-gpios = <&gpiof 12 0>, <&gpiof 13 0>, <&gpiof 15 0>;
 		dh,ddr3-coding-gpios = <&gpioz 6 0>, <&gpioz 7 0>;
 	};
-- 
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
