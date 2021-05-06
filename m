Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7165375032
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 May 2021 09:31:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F9BDC5718F;
	Thu,  6 May 2021 07:31:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F29C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 May 2021 07:31:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1467QsCb007156; Thu, 6 May 2021 09:31:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=nPQ9hxlJKJ8TmYmxye5Mhqe4sDQvtl38n2MFF8yIvlI=;
 b=OeAV7UDpfc/bkaeY/vb5m52GjMjpgunVocblgm/7dVgsDn3Dx5pzlxIq3cYZR8H8hjtJ
 B40f+5x9y9o8dc6Y10N/uOyW5FaVqSc+Ej329qSCTHDYIWiQjknDk52SYMsTE87lwPyP
 9HW2zeJAXaEmWh4O/aPSruxSC0jAdB/21QmJic4jg/Vb5iK6eodUgsLc0yqcFlyaflNk
 PO9axzsx68bD7WH1SBVY4ifzr77A63hNZMezktJHtjNh5EZcDtDf7QCbPyQgq7V4OTaH
 vSQNzh81cWV3KpyrhwItxaq6lDFhslu9N0Gn3Y1kCVqjVrLD5BX59UWR3HYo/Gv4GJcr HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38c8xah4rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 09:31:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90DA8100038;
 Thu,  6 May 2021 09:31:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B30C21D182;
 Thu,  6 May 2021 09:31:03 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May 2021 09:31:02
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>
Date: Thu, 6 May 2021 09:31:00 +0200
Message-ID: <20210506093041.1.I0019059e1020cfe0079e48d563acf59c0d6f0a1e@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_05:2021-05-05,
 2021-05-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp: Enable UNZIP on
	STMicroelectronics stm32mp15 boards
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

The CMD_UNZIP provides the 'gzwrite' command, which is convenient
for writing e.g. gz-compressed images to eMMC from U-Boot.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index d7511a79a5..0c892dda8b 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -38,6 +38,7 @@ CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_UNZIP=y
 CONFIG_CMD_ADC=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_DFU=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index ee89a47171..f7aa571e8d 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -21,6 +21,7 @@ CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_UNZIP=y
 CONFIG_CMD_ADC=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_DFU=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
