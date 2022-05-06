Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8FF51D9E2
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:06:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95EF3C628B1;
	Fri,  6 May 2022 14:06:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BFA5C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:06:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246BCCQc015536;
 Fri, 6 May 2022 16:06:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=iSo7grwwrEnyaPfb9pW4Oj2Ckxsigb6iKzSPs7HwJxk=;
 b=som3MmQ1/u6wNz64UJAmy5AFUpe/wOjkt8XWA1JtDRrXAkY3uLlm1P2gay7sUnCKsk+l
 kgoMJFL/1nPfzWzGs3QqasYbWFqz7xcwG7T1Rjs4WnzABioeEAfGq1Eeccv9tAqm0BIc
 xPB5ILwPvf4mlg2V0/WY88i78CCoan8FBXJDBMlpT6P6bzeqrVn1yWkPgdq2FSdUBkPy
 /zHkhI5oyk7hAisgvkeRG7fMp7dQscMJt0aqDoSlod4ccs09yCr7I6GDWfTnE1GMQZEM
 i3QC3GpDwd8/+2f5vLoNq5a20dyCMbKzpN3w8dbRhgn+/7EUL/pqytDMJ9skKoMWX3sN Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf11dk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:06:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CB76100038;
 Fri,  6 May 2022 16:06:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2677E2194F4;
 Fri,  6 May 2022 16:06:28 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:06:27
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:09 +0200
Message-ID: <20220506160540.2.Iea6a315c629bbbb6cbc18889a2207a465acb9bcc@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 02/16] configs: stm32mp1: move SUPPORT_SPL in
	STM32MP15x
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

The SPL is only supported by STM32MP15x not by all the
SOC with STM32MP arch.
Only TFABOOT is supported in next products.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/Kconfig              | 1 -
 arch/arm/mach-stm32mp/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 57946f61fa..82d6274c92 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1939,7 +1939,6 @@ config ARCH_STM32MP
 	select OF_SYSTEM_SETUP
 	select PINCTRL
 	select REGMAP
-	select SUPPORT_SPL
 	select SYSCON
 	select SYSRESET
 	select SYS_THUMB_BUILD
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index e48f98ba29..be0d74b4ac 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -46,6 +46,7 @@ config STM32MP15x
 	select STM32_RCC
 	select STM32_RESET
 	select STM32_SERIAL
+	select SUPPORT_SPL
 	select SYS_ARCH_TIMER
 	imply CMD_NVEDIT_INFO
 	help
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
