Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247F15A94B
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 13:40:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC71EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 12:40:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D46C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 12:40:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CCCmOU032742; Wed, 12 Feb 2020 13:40:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HuAh5BRVHmxHNh7JcL+pm5mAKkfJxUd/nj9NQShsCjQ=;
 b=gbodruZyaE102Lqg+L6n4b85Ni/NG5pjP1xtnICq4KcHOf5qBWs9exxs+JI0oQAQ8Nxp
 QYxx97+wLAo65HTj2sWJ1HPV/Ay7BSvzXNBO/Kv+BlKfblAC2QaXQOpLW0+sNiemsWhH
 nUthulg+GQuxl/6WYCieFMUs36PSXDR2bKXneL8NCpWoomAAoy9Qg9cWSPnzb3IsbCYe
 vXRSNfzIOdGT1cRstxahHah06QEqM90+vitRElc3zR8hTgj74ckAlVvZshwOgMIfE7+Z
 aLVZ0LsCuGnV0nYF9v78GV79yueylMAt3kzGgbzNtvKxcQ/ZpP5fjfY8g6BbCGwaIzg4 HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9x7u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 13:40:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8207A10002A;
 Wed, 12 Feb 2020 13:40:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 798902B1867;
 Wed, 12 Feb 2020 13:40:06 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 13:40:06 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 13:39:57 +0100
Message-ID: <20200212124001.12788-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212124001.12788-1-patrick.delaunay@st.com>
References: <20200212124001.12788-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_06:2020-02-11,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 4/7] stm32mp1: use the command env info in
	env_check
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

Activate CMD_NVEDIT_INFO and use the new command "env info -d -p -q"
to automatically save the environment on first boot.

This patch allows to remove the env_default variable.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- activate CMD_NVEDIT_INFO in sandbox (new patch)

 arch/arm/mach-stm32mp/Kconfig | 1 +
 include/configs/stm32mp1.h    | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 137178aa45..63dc94f894 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -45,6 +45,7 @@ config STM32MP15x
 	select STM32_RESET
 	select STM32_SERIAL
 	select SYS_ARCH_TIMER
+	imply CMD_NVEDIT_INFO
 	imply SYSRESET_PSCI if STM32MP1_TRUSTED
 	imply SYSRESET_SYSCON if !STM32MP1_TRUSTED
 	help
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index a66534e027..02d32f2040 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -218,9 +218,7 @@
 	"fdt_high=0xffffffff\0" \
 	"initrd_high=0xffffffff\0" \
 	"altbootcmd=run bootcmd\0" \
-	"env_default=1\0" \
-	"env_check=if test $env_default -eq 1;"\
-		" then env set env_default 0;env save;fi\0" \
+	"env_check=if env info -p -d -q; then env save; fi\0" \
 	STM32MP_BOOTCMD \
 	STM32MP_MTDPARTS \
 	STM32MP_DFU_ALT_RAM \
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
