Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D4135EF2
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 18:11:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AACEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 17:11:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF965C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 17:11:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009H43B8018131; Thu, 9 Jan 2020 18:11:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+k/OYWpvlBMTspqlhXoFUFAd/Sy/CmQ9jOvcr3ZXphI=;
 b=jq1/gehGXm/oAnZlUgDGLBViemC++/s4x+DYbso27ac62y4AIuep4/01Lfp7xV3XfFzr
 CvjsKeNm8QgFnODPkYNaw6yUr5/MaXT1p2gdkqmAhCimVcNkZCuQ8aw6uzJ3E8I5hB8R
 7lG50DTdasvFDYz7b1Iq+0roPGwlLjhZSOK+914wHdbcuwRDx33ki5mXGDXeSSmQWeu7
 qpvyviuFwcs0UC4KhW6CZpsJFDqimXFV24w0q5Cz6iFqNccj1hipAUVP23aPkiw/GuHQ
 c1wtusymlmPQCte9CdNNcDPNkXENQaHZhNrL9E/wux5bwmyw62KqmIguAwd62eYxqnlF sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakkb34yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 18:11:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FE16100038;
 Thu,  9 Jan 2020 18:11:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0291D20F72D;
 Thu,  9 Jan 2020 18:11:33 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 9 Jan 2020 18:11:32 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Jan 2020 18:11:21 +0100
Message-ID: <20200109171123.16348-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200109171123.16348-1-patrick.delaunay@st.com>
References: <20200109171123.16348-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 1/3] Revert "stm32mp1: remove the imply
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
