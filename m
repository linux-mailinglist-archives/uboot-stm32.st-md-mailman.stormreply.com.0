Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DBB200831
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 13:56:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42521C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:56:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBAE7C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:56:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JBiftF021921; Fri, 19 Jun 2020 13:56:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wh12cJ428xaBW4Ec7UqYCMn4xpdyEuPS2Hsau9E+YwY=;
 b=PZxi3/ARtONmdPYr1+VXb+kj1UL3f3MZXECtGGlyo2f9/cudUYSd64MYubYpL60l1h+O
 I3BQIE+QGlwWB7axkRCqkEX8fKJtqhRfocRHaHm29KWe0hYyQcZ6vyoOTz7ZOt47R9UY
 RU5/QIjcO0B8Hui+/O3AOhZSql1KQtWjdHDenrESGIg5t1OWbkfyUd/X4peO4TYCtJQo
 UVSdH5+oKKu3IzPYx2eCrpQCHopx7zD8Xdhl6eca7PBw2n8mdFnq3UPOJg2Yor4diRBe
 UVnUNEe6E0MZLV+Sn8IHFk9/VLD/Qnq79DtiRAXKYWfeJTzlSibNpY48F16C8dtrjmit tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64cgkmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:56:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7212100039;
 Fri, 19 Jun 2020 13:56:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF7A42BF9CD;
 Fri, 19 Jun 2020 13:56:20 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 13:56:20 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 13:56:07 +0200
Message-ID: <20200619115611.16375-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619115611.16375-1-patrick.delaunay@st.com>
References: <20200619115611.16375-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_08:2020-06-19,
 2020-06-19 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v5 1/5] stm32mp1: use the command env info in
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

(no changes since v1)

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
