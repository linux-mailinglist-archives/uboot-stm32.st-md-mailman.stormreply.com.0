Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32717C53F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 19:18:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46EC3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 18:18:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 186B7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 18:18:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026IEJTL015182; Fri, 6 Mar 2020 19:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=H7jZvd/uyhaehMgXNJW6NCsGAz0A1rbfCjtBCWlM4Mk=;
 b=wbwsnoij78XleNI5cKwvpTsVASreMoSixuV0frfZb7jswefeaAOf+ttvGI7ib8nagrfJ
 J6z+b+JUyDxb8vIxG24RR7nTqgu8A1pRedF6LMkSCxSVWDnoDXGwuW5N+0NfNPcmhFlf
 b1D0NQEtbKjy6590jIXNhAUZ8GYXiloMBsZXhCD4s3TAPTMUaS6gVaAIeZVVhdFke8aI
 p6soDgOSHMG5ref51Tze3WSCH6BUDT6ce5OWCN+7pHq2NqiANShiie1AKfJoAnm4bYLv
 AIW/tosoETd+ttutEU6ESzfQ9Gpbw8mbh9fvNmlMClADd2yYBKPsKNdFk+Wp02njrnpl FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem1h168-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 19:18:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1B11100038;
 Fri,  6 Mar 2020 19:18:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E76DF2AA9F5;
 Fri,  6 Mar 2020 19:18:01 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 19:18:01 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 19:17:56 +0100
Message-ID: <20200306181758.12336-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306181758.12336-1-patrick.delaunay@st.com>
References: <20200306181758.12336-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_06:2020-03-06,
 2020-03-06 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v3 2/4] Revert "stm32mp1: remove the imply
	BOOTSTAGE"
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

This reverts the workaround introduced by the
commit 16fec9b0bc1a ("stm32mp1: remove the imply BOOTSTAGE")
As the bootstage alignment issue is now solved.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2: None

 arch/arm/mach-stm32mp/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index e4d621dee8..1489cbd5f3 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -62,7 +62,9 @@ config TARGET_ST_STM32MP15x
 	bool "STMicroelectronics STM32MP15x boards"
 	select STM32MP15x
 	imply BOOTCOUNT_LIMIT
+	imply BOOTSTAGE
 	imply CMD_BOOTCOUNT
+	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
 	imply DISABLE_CONSOLE
 	imply PRE_CONSOLE_BUFFER
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
