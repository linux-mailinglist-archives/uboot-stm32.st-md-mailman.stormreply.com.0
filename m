Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8BFCD5
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 17:26:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A809CC35E0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 15:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEEDAC35E06
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 15:26:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFLgta016934; Tue, 30 Apr 2019 17:26:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CJL9izjm14Flm2WKsarq6PpF+7y4vd9L4zRd32AOpFo=;
 b=i5bx3LUBLdNK3/5eW2Z3oxSV3srbP25ExPZtrMW63QWG2PuOGKgQPwGBMLXtoB5WAIn0
 5o3rppUNMsQ5j/KM1/WTVtKzq/ti640BZllkgsbnOtvAEc0xGryaE7CdYV5cir1ZMLl/
 IzyvRfNqrOzmp0+XZXCoJppOJGYVvCJIPvGSRIro+RcRe3Reyj9tPMoYpSFuSY7Dkljs
 aTyrXo0Ro5nx922S8tKu3iclYTviCpUNxh+V4Xd8tkPfXAQ4PcfSdlxaa1Z3+EMJnqH0
 ZCMh0jLCBpfQb/UIYurLSdTWwUDNhn4UZW5Daw4h+Wcc9oLubf/phtmsCGMgSsq2Lxni mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r0evh8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 17:26:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78B6031;
 Tue, 30 Apr 2019 15:26:31 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6151728B8;
 Tue, 30 Apr 2019 15:26:31 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 17:26:31 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>, <michal.simek@xilinx.com>, <sr@denx.de>,
 <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 17:26:21 +0200
Message-ID: <1556637983-5654-3-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
References: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 2/4] ARM: dts: stm32mp: Add iwdg2 support
	for stm32mp157c
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

This patch adds independent watchdog support for stm32mp157c
in SPL.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 arch/arm/dts/stm32mp157-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
index ab6f673..09560e2 100644
--- a/arch/arm/dts/stm32mp157-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
@@ -140,3 +140,7 @@
 	compatible = "st,stm32-gpio";
 	u-boot,dm-pre-reloc;
 };
+
+&iwdg2 {
+	u-boot,dm-pre-reloc;
+};
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
