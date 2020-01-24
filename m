Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2D148535
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:34:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7807AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:34:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3CDAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:34:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCXxfB000464; Fri, 24 Jan 2020 13:33:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XdwUIS21fKwDLZ7yE87wF+UfpPsmvv+0EPt83GZSJb0=;
 b=e7g+Y74tM+ivWgEN32UCyewH77RLrm3K3b3dW1NY6esECXqkmrlGxYwzZKZoKYUuT3IL
 mbq7hiDKaSUR9jzgrVwDlhTm+WsSZJLMwT/c6vxdrI2IFD1nkg3FEZMAPhL3RQ+KbBnT
 w9aClcx14yQ3iRyazSPoCA8Pn3lxS+jujrmhEgqpkW+yCV2/S0UKNEsjVYHhV5VHG+SY
 KsqhYwTy1VlTXMf/YSJRdmJYdIQ440XtPV9wyspe0O3buigNht4IkeD9CVrf4/1uUCMg
 2cbnOwjOc1T3oFCMGdLMyYjZlWqvqviVUE8/JyMxoKOl0XaGmIRrr4vh6dsBXKrE0IfX GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xksspfmhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:33:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78A2410003E;
 Fri, 24 Jan 2020 13:33:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 714402A76F8;
 Fri, 24 Jan 2020 13:33:52 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jan 2020 13:33:52 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jan 2020 13:33:45 +0100
Message-ID: <20200124123346.32210-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124123346.32210-1-patrick.delaunay@st.com>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/5] stm32mp1: use the command env info in
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
