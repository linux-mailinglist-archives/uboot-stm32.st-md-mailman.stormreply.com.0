Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D3217461
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 18:47:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09CF4C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 16:47:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3675C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 16:47:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067GY49C032169; Tue, 7 Jul 2020 18:47:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3N1lRZa7kU9XilLIJL1GZanfXAFGX/zqe+JZF/7b6Ck=;
 b=t5BBVLArvjCtTOIjIjQAqMDeevHHHaT6Nq/RNReA+Gop2u4Wuu9FC74qM+XlgXWglTWS
 rHMexTc1Ua4n48GT+36KfPSgltxQhMhqkf0WXHNRUADi4vMO6nULZfjuk8c2mUK2I9FB
 Sshokc8duTKtcZ844EaawZjCB5N3Dv3vAJpP2OhWAMLPHI12raj4gKb8kcUTOtkzHenh
 ZZMC+wmALNH8dqzVd7tUOGnzyG5sgmj/dmlN4gn4dE+Ccws6n35h8s61vUX3ohpgWcgY
 KxGALZmTkQWwlFUI1HE942Co37Te5nLcH73trRS+ggjVMS7lFrmGwoFiqkLMOB4JQASg pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322ew9ah0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 18:47:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6699A10002A;
 Tue,  7 Jul 2020 18:47:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 603A12AC709;
 Tue,  7 Jul 2020 18:47:34 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 7 Jul 2020 18:47:33 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Jul 2020 18:47:29 +0200
Message-ID: <20200707164729.20359-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_09:2020-07-07,
 2020-07-07 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] Revert "ARM: dts: stm32: Reinstate card
	detect behavior on ST boards"
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
the gpio flags are supported by stm32 pinctrl driver.

The cd-gpios is correctly handle in U-Boot and the patch on the
device tree can be removed.

This reverts commit 792919241b3d750cd5295dfe6dd1d0958b9be468.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 2 --
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 7b8c1c1cc7..06cff38460 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -162,8 +162,6 @@
 
 &sdmmc1 {
 	u-boot,dm-spl;
-	broken-cd;
-	/delete-property/ cd-gpios;
 };
 
 &sdmmc1_b4_pins_a {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index ef3e7f45a3..7759ba2896 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -158,8 +158,6 @@
 
 &sdmmc1 {
 	u-boot,dm-spl;
-	broken-cd;
-	/delete-property/ cd-gpios;
 };
 
 &sdmmc1_b4_pins_a {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
