Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C65175849
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 11:27:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 045E4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 10:27:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6441FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 10:27:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022ANd4l010058; Mon, 2 Mar 2020 11:27:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nX+MiOiioS7cPdFh7+LLdiwKtP52nWA1AU1BOeBCp2Y=;
 b=LF+YushIHgGw7MjGVKejHtvw1WTanyBxjgLgALQeRXfUXpgp2C3Ta1JTiGoENHUlNk/0
 w1bqG2USTTVnA8oc+VMgZcx88HfPJ4SdxeSXm87eYJ0XsfWltiWWSGLXXAYZs0cdEdc/
 iOtjFFUYDoIuIzZFnjb8XwLP4laXil1/19TuBmNeVbCMJWHur6mOqvOMDt784jc+e4Ui
 cs8fYQsQlh083fmIPSOWLacuMrX0dP7Vbnes+heXheHmbbbGjF248C8oqPQ+GZ+xuw/Q
 T8Wyfg9XRgCd3H+xT1uhAQESPKOQlkOcvZh20GOzD3plKQRrAIAG51PehvGQc0YOtXd1 CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea6jwp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 11:27:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB009100038;
 Mon,  2 Mar 2020 11:27:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD7262B189C;
 Mon,  2 Mar 2020 11:27:07 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 2 Mar 2020 11:27:06 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 2 Mar 2020 11:27:02 +0100
Message-ID: <20200302102702.6917-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-02-28,
 2020-03-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Ludovic Barre <ludovic.barre@st.com>, Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: psci: set cntfrq register of cpu on
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

From: Ludovic Barre <ludovic.barre@st.com>

This path allows to set the cntfrq register of targeted cpu.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/psci.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
index 1d91b2d324..3fb038d3e7 100644
--- a/arch/arm/mach-stm32mp/psci.c
+++ b/arch/arm/mach-stm32mp/psci.c
@@ -30,6 +30,22 @@ u8 psci_state[STM32MP1_PSCI_NR_CPUS] __secure_data = {
 	 PSCI_AFFINITY_LEVEL_ON,
 	 PSCI_AFFINITY_LEVEL_OFF};
 
+static u32 __secure_data cntfrq;
+
+static u32 __secure cp15_read_cntfrq(void)
+{
+	u32 frq;
+
+	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r" (frq));
+
+	return frq;
+}
+
+static void __secure cp15_write_cntfrq(u32 frq)
+{
+	asm volatile ("mcr p15, 0, %0, c14, c0, 0" : : "r" (frq));
+}
+
 static inline void psci_set_state(int cpu, u8 state)
 {
 	psci_state[cpu] = state;
@@ -63,6 +79,9 @@ void __secure psci_arch_cpu_entry(void)
 
 	psci_set_state(cpu, PSCI_AFFINITY_LEVEL_ON);
 
+	/* write the saved cntfrq */
+	cp15_write_cntfrq(cntfrq);
+
 	/* reset magic in TAMP register */
 	writel(0xFFFFFFFF, TAMP_BACKUP_MAGIC_NUMBER);
 }
@@ -130,6 +149,9 @@ s32 __secure psci_cpu_on(u32 function_id, u32 target_cpu, u32 pc,
 	if (psci_state[cpu] == PSCI_AFFINITY_LEVEL_ON)
 		return ARM_PSCI_RET_ALREADY_ON;
 
+	/* read and save cntfrq of current cpu to write on target cpu  */
+	cntfrq = cp15_read_cntfrq();
+
 	/* reset magic in TAMP register */
 	if (readl(TAMP_BACKUP_MAGIC_NUMBER))
 		writel(0xFFFFFFFF, TAMP_BACKUP_MAGIC_NUMBER);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
