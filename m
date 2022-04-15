Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CF5029ED
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Apr 2022 14:32:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CBBBC6049C;
	Fri, 15 Apr 2022 12:32:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82322C60496
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 12:32:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23F8bx3T014652;
 Fri, 15 Apr 2022 14:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YDshVxOsAnn2acpz1CZZNMXOUddN7jA73UnnKYgxyWI=;
 b=CDOo4SjwCkx4PzMiK6W1xtUgmA+JRHOUWiaqd3mCRO/eev6hB+VpDu51MxKpYs/b03aD
 pVV/WMZubgyMcAG5UXdWETnBLVJ61DTWASsKynqisyLYPzsmN1OTJb0FbwOszkARtsWL
 G3LVMmm78fzlIPTKOwEP8J0twPBHlzIMGSCsCSx1PCFF5RgdFk41jHAZWr791dF1gYT3
 HPpwGNTchEETDYiiAoHVabBFZJmDnzUlhO6omf7pfVInzPdkdYzRqEpqeiOJET3N6xJ3
 YrOcrtQmxCRklQtI+XwKFhCJV3G4xaNDGvcJqwy2GW/Q9r7xBcaWSmw1e2TsG4QraqSa vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb7gpu4dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Apr 2022 14:32:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1916100034;
 Fri, 15 Apr 2022 14:31:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB8B121CEC6;
 Fri, 15 Apr 2022 14:31:59 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 15 Apr 2022 14:31:59
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 15 Apr 2022 14:31:55 +0200
Message-ID: <20220415143153.2.Ie4aa91b7f1b08b59b02853e7f28c2b48445ba0f6@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415143153.1.I23ed8b36e294031f1f614d2304ea17085f075612@changeid>
References: <20220415143153.1.I23ed8b36e294031f1f614d2304ea17085f075612@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_04,2022-04-15_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/2] configs: stm32mp1: Add support for
	baudrates higher than 115200 for st-link
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

On STMicroelectronics boards, the UART can reliably go up to
2000000 bauds when connected to the on-board ST-LINK-V2 for STM32MP15

Unfortunately U-Boot will fall back to 115200 unless higher rates are
declared via CONFIG_SYS_BAUDRATE_TABLE.

This patch add the support of higher baudrates on STMicroelectronics
boards with ST-LINK.

Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/stm32mp15_st_common.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
index e8dad004c6..3c0ffb8f56 100644
--- a/include/configs/stm32mp15_st_common.h
+++ b/include/configs/stm32mp15_st_common.h
@@ -13,6 +13,11 @@
 
 #include <configs/stm32mp15_common.h>
 
+/* uart with on-board st-link */
+#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
+					 230400, 460800, 921600, \
+					 1000000, 2000000 }
+
 #ifdef CONFIG_EXTRA_ENV_SETTINGS
 /*
  * default bootcmd for stm32mp1 STMicroelectronics boards:
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
