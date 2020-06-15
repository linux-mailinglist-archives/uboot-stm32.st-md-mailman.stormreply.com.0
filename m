Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE41F9435
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 12:03:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75EDDC36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 10:03:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1315DC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 10:03:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F9vvH9032123; Mon, 15 Jun 2020 12:02:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tMliWcF4mteStfgDYiStXvyfQhWhI3SHMOQfwKnm7Zs=;
 b=dzwTnUf40CFs1bl0oeZOJV0SLupqXEYMLD60hPdzWh1Mrzw5jGiC+//vvBg+pX+mecOS
 MTxO4bjpoEyBeQbOCr2SVanDVtmuRkCzxwKjtLd7woO7YDPlbXmqJI6G8j8atforZTVR
 U34+OfbGsswc0NRUaL4W4axchF9Ko+AgjfHh62VuEFvIdEiSsAuxWtV/Dl4rLuzC1JwV
 BNMzuWtUHP5cQfGXvYEWfa5+CUwV7uqwb83qEIWBXopDWqg5B5MYPxnrWnyszchABuhZ
 4f3cPB1/Z7wV3Vwih3B+Hh02apVm8fmyzrLZJNkWT8G234cEFcN3REX3WrTMsFoQdAIY Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph0tss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:02:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28245100034;
 Mon, 15 Jun 2020 12:02:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 148142C38CA;
 Mon, 15 Jun 2020 12:02:49 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 12:02:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 12:02:46 +0200
Message-ID: <20200615100246.19616-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615100246.19616-1-patrick.delaunay@st.com>
References: <20200615100246.19616-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp1: use the command env info in
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



Previously sent in serie
cmd: env: add option for quiet output on env info
http://patchwork.ozlabs.org/project/uboot/list/?series=158105

Resend as separate serie without the "-q" option.

END

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig | 1 +
 include/configs/stm32mp1.h    | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 6c995ed8d8..478fd2f17d 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -46,6 +46,7 @@ config STM32MP15x
 	select STM32_RESET
 	select STM32_SERIAL
 	select SYS_ARCH_TIMER
+	imply CMD_NVEDIT_INFO
 	imply SYSRESET_PSCI if TFABOOT
 	imply SYSRESET_SYSCON if !TFABOOT
 	help
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index f271b84a59..e927787be0 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -155,9 +155,7 @@
 	"splashimage=0xc4300000\0"  \
 	"ramdisk_addr_r=0xc4400000\0" \
 	"altbootcmd=run bootcmd\0" \
-	"env_default=1\0" \
-	"env_check=if test $env_default -eq 1;"\
-		" then env set env_default 0;env save;fi\0" \
+	"env_check=if env info -p -d; then env save; fi\0" \
 	STM32MP_BOOTCMD \
 	BOOTENV \
 	"boot_net_usb_start=true\0"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
