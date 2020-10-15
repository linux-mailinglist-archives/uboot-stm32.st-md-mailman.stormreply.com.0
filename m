Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501528F216
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 14:31:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98453C3FADE;
	Thu, 15 Oct 2020 12:31:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20213C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 12:31:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FCQKQO000936; Thu, 15 Oct 2020 14:31:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=TYVfjxqPnrutVNpHoCz9dsfh50Cm6YwSLSA1Iwz2ByU=;
 b=nY8+brPYlqKZBtd4I1DqGSwZIvzalSKzJnOt4p2/erSHpN99FqTAEm5VdOBcsE/C9oY6
 6hccwFC5thElIStD1gVqdP/1qzFwLlt/lNt6QnjE5rveE5QhMbrB2WTTl3Ld/bLPDqnt
 AY8DyxyRBZN0TH8bvY9ceRs7tPJ1Itsp4jh6+AwTdJF34leoGLDRWd9IZJklj5gz2HJ9
 tQBUNCEcs0V1Jnw+SceIdXAFudwIcsAxi7Z+r4dnHASI72++XAXgGsl5tfQPsvwpSJLB
 crD+AJFQr3BxMBeeTjHp9T9BHkcWnp+7dY2eyLDZFZk+mu5cZbszTPCrVERQ2GXCFPmQ gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356emxu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 14:31:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEF8610002A;
 Thu, 15 Oct 2020 14:31:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3E93221777;
 Thu, 15 Oct 2020 14:31:54 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct 2020 14:31:54
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Oct 2020 14:31:50 +0200
Message-ID: <20201015123152.6923-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_07:2020-10-14,
 2020-10-15 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] configs: stm32mp15: activate CMD_IMPORTENV
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

Activate CONFIG_CMD_IMPORTENV to accept the command "env import".
This command is useful in script to include some variable.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 -
 configs/stm32mp15_trusted_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index a8c4112dbe..b4cba318fd 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -32,7 +32,6 @@ CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
 # CONFIG_CMD_ELF is not set
 # CONFIG_CMD_EXPORTENV is not set
-# CONFIG_CMD_IMPORTENV is not set
 CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 0792884a9d..3a54aeffaf 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -16,7 +16,6 @@ CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
 # CONFIG_CMD_ELF is not set
 # CONFIG_CMD_EXPORTENV is not set
-# CONFIG_CMD_IMPORTENV is not set
 CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
