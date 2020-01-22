Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4215145727
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 14:52:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76BA4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 13:52:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 937C2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 13:52:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MDm0fY014654; Wed, 22 Jan 2020 14:52:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZCsWhnePDn5xfdXxwlMhx8VMlJZgTIpRqO0RZV4I4So=;
 b=T4yoD3WEwU8K67t7h1oA1UVKU7+um9O2OCtoNVZA15qXc4Pz28jQo3ZrtdGg3qW9BSTW
 mWdVvIbiK7l8/LBCcKuWWuX00X06W2JtnJxnhksj3haIukm+Ib1DhhD7Hs/f8zB4rspI
 ZV71Cz6UWlmMMT9uca7RSUXC9A2qzdJe10pJv0vxwZ5jBeRGrdh+a8UYB6gyV3hhAUdN
 wfcQlHfxh9Mkn+pjPAPEyyEHKVL6MLc3wiMdTZB5qFf3bfzcfpZeTVDVXD53pNWkkxvG
 cvJoWVR+q5xwuJN/NgLAyZSvK9eVCl4EtB4DjJ07A4uDpbaaUTD89pLY/4rg1R3NJjxA zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc54vbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 14:52:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25D26100038;
 Wed, 22 Jan 2020 14:52:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BC302C6A66;
 Wed, 22 Jan 2020 14:52:49 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Jan 2020 14:52:48 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Jan 2020 14:52:41 +0100
Message-ID: <20200122135243.17683-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122135243.17683-1-patrick.delaunay@st.com>
References: <20200122135243.17683-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v2 2/4] Revert "stm32mp1: remove the imply
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

Changes in v2: None

 arch/arm/mach-stm32mp/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index ae28f6e206..e920b89ef5 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -46,7 +46,9 @@ config TARGET_STM32MP1
 	select STM32_SERIAL
 	select SYS_ARCH_TIMER
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
