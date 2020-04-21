Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB01B2ABE
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73238C36B11
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9EE8C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8EkB014151; Tue, 21 Apr 2020 17:11:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3aTQ2F4g+WWktD7WZNcezghTQ+vF+ZM+Q5GqVcGQXsU=;
 b=BRJ2MBlhwHNri9Dn/4voY57iji9Lxmuofu51BHP+3eK1VuOvSBC0xpcgqc95IpQCUNRJ
 ho5cAIaGSo3ULSpx5qJb5KnrcJ5tVOdYsQbn4UtYxg9X7zNSmSeWoRV6KJFtxMandHHz
 lix1z9couppm76d81j0s6bvwWrY7NxwrXsO3o7ry3RIXKv3VqqhzXBXBFKBke+Etwvpv
 RHoGCDBrOgJmrCzcK5E4L8KBjNwzWU9TmcxKGprqNBeCK/uv5eNN/8a9GVnXfRx6MuMI
 IQQE+fgBzy3gMv3mJ6133+s5s3zaxn7AkTW62wYH2s0OHCI8YWe9gqG4OkbjvPsjvRA5 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8s67x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B0ED10002A;
 Tue, 21 Apr 2020 17:11:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82A7A2BE249;
 Tue, 21 Apr 2020 17:11:52 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:52 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:27 +0200
Message-ID: <20200421171123.8.I6f11a8bc7a6681ab18c3bbbc1ac73cbdac030982@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 8/9] board: stm32mp1: update vddcore in SPL
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

For board using STPMIC1, the vddcore is provided by BUCK1 of STMPIC1
and need to be updated for 800MHz support and only after the clock
tree initialization.

The VDDCORE voltage value in provide by clock driver, saved in global
variable  opp_voltage_mv and udpated SPL in board_early_init_f().

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/spl.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index e65ff288ea..616fb1d6f2 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -12,6 +12,26 @@
 #include <power/pmic.h>
 #include <power/stpmic1.h>
 #include <asm/arch/ddr.h>
+#include "../common/stpmic1.h"
+
+/* board early initialisation in board_f: need to use global variable */
+#if defined(CONFIG_PMIC_STPMIC1) && defined(CONFIG_SPL_POWER_SUPPORT)
+static u32 opp_voltage_mv __section(".data");
+
+void board_vddcore_init(u32 voltage_mv)
+{
+	opp_voltage_mv = voltage_mv;
+}
+#endif
+
+int board_early_init_f(void)
+{
+#if defined(CONFIG_PMIC_STPMIC1) && defined(CONFIG_SPL_POWER_SUPPORT)
+	stmpic_buck1_set(opp_voltage_mv);
+#endif
+
+	return 0;
+}
 
 void spl_board_init(void)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
