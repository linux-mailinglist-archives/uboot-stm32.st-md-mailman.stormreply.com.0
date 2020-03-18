Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F31896E8
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D88DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F3CBC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HV4m019419; Wed, 18 Mar 2020 09:25:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vthw+iUx9BZl2wnpItMz6NrowG29EnZ+p2/gvureLI4=;
 b=zBRm28RnSn7RMw0YBW4NYf2BplAD4+lv2ugAABchXK8pIeHDZLFCICYyB5d0fifBA2ul
 2W2ER0aF2iFoMTt6Q8eSjeAfKTUBzm6FGI/9SVb9i5fEhRmz8t4qp4uCbq4LKXXVtTAj
 5fIiJYwbF7RnHMS3gzaejZF21BI6Ro74Jw+81bPCqX16emnaQZOWSQ7YMbZfbJzmW7si
 m3ZI2rlLGjwJbXKB3GK4pdG+cm+MiKBA+uMJ/DjUZ62ZCtxh6a/BZdfpTZ4/V2a0FdXX
 yIV0CV/mCjBXGzbFFDadc1iq5GlenqhobgsRssiRfsz4PimZxrnglAl3kJHBXsXO/GJp sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D87EE100039;
 Wed, 18 Mar 2020 09:25:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5E8821CA95;
 Wed, 18 Mar 2020 09:25:08 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:08 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:48 +0100
Message-ID: <20200318082503.8025-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/18] stm32mp: add function get_cpu_dev
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

Add a function get_cpu_dev to get the DEV_ID present
in DBGMCU_IDC register.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c                    | 11 ++++++-----
 arch/arm/mach-stm32mp/include/mach/sys_proto.h |  5 +++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index e14e3e47f2..36a9205819 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -236,6 +236,11 @@ static u32 read_idc(void)
 	return readl(DBGMCU_IDC);
 }
 
+u32 get_cpu_dev(void)
+{
+	return (read_idc() & DBGMCU_IDC_DEV_ID_MASK) >> DBGMCU_IDC_DEV_ID_SHIFT;
+}
+
 u32 get_cpu_rev(void)
 {
 	return (read_idc() & DBGMCU_IDC_REV_ID_MASK) >> DBGMCU_IDC_REV_ID_SHIFT;
@@ -266,11 +271,7 @@ static u32 get_cpu_rpn(void)
 
 u32 get_cpu_type(void)
 {
-	u32 id;
-
-	id = (read_idc() & DBGMCU_IDC_DEV_ID_MASK) >> DBGMCU_IDC_DEV_ID_SHIFT;
-
-	return (id << 16) | get_cpu_rpn();
+	return (get_cpu_dev() << 16) | get_cpu_rpn();
 }
 
 /* Get Package options from OTP */
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 1617126bea..4b6c7b8bdd 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -20,6 +20,11 @@
 /* return CPU_STMP32MP...Xxx constants */
 u32 get_cpu_type(void);
 
+#define CPU_DEV_STM32MP15	0x500
+
+/* return CPU_DEV constants */
+u32 get_cpu_dev(void);
+
 #define CPU_REVA	0x1000
 #define CPU_REVB	0x2000
 #define CPU_REVZ	0x2001
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
