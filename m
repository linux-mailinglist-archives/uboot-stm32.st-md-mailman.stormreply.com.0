Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8015AFF8
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 001FBC36B10
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88B8DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIXwmZ014893; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HADjJcgOzRUCWH4pyg1x4O6jeMWnTbRC90FRVuRChuI=;
 b=rai4Q0I37soDtfvs+HWjyNysE4TOL+1iwLHa70lyELbid5nNbGZYuRNwZt0DO+fqHgZY
 GhjdQ+3/y/4uZBFN3dEjswOhSWMbbK4NKIF2Bm0kgvpHWRSXLwtMaxcbsZMf5wRrKvSs
 L5eRdorlXUhKTCnsv1wlDHD3jXrFEtC9JHZV5aIgohg9GEmeDN5+CXKbsEjTZz9ueWS4
 GdDDw33RFuqlrApX9FvIyuV916lFfW5o1CNi1xlnFyFevIVjbGIose/HU9KQKqG8OObr
 IgtXcDEQUbvWUN1xmM7fpm4LaWMH9n9T3KwZsM+GgonYrtaCZxUTgbaX5ClUa9TTtdRw 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqtyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6DFD10003B;
 Wed, 12 Feb 2020 19:37:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF1992C60AA;
 Wed, 12 Feb 2020 19:37:55 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:55 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:43 +0100
Message-ID: <20200212183744.5309-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/10] arm: stm32mp: add function get_soc_name
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

Add a function get_soc_name to get a string with the full name
of the SOC "STM32MP15xxx Rev.x"

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c                    | 14 +++++++++++---
 arch/arm/mach-stm32mp/include/mach/sys_proto.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 5febed735c..9c5e0448ce 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -279,8 +279,7 @@ u32 get_cpu_package(void)
 	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
 }
 
-#if defined(CONFIG_DISPLAY_CPUINFO)
-int print_cpuinfo(void)
+void get_soc_name(char name[SOC_NAME_SIZE])
 {
 	char *cpu_s, *cpu_r, *pkg;
 
@@ -344,7 +343,16 @@ int print_cpuinfo(void)
 		break;
 	}
 
-	printf("CPU: STM32MP%s%s Rev.%s\n", cpu_s, pkg, cpu_r);
+	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s", cpu_s, pkg, cpu_r);
+}
+
+#if defined(CONFIG_DISPLAY_CPUINFO)
+int print_cpuinfo(void)
+{
+	char name[SOC_NAME_SIZE];
+
+	get_soc_name(name);
+	printf("CPU: %s\n", name);
 
 	return 0;
 }
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index da46c11573..065b7b2856 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -29,6 +29,10 @@ u32 get_cpu_package(void);
 #define PKG_AC_TFBGA361	2
 #define PKG_AD_TFBGA257	1
 
+/* Get SOC name */
+#define SOC_NAME_SIZE 20
+void get_soc_name(char name[SOC_NAME_SIZE]);
+
 /* return boot mode */
 u32 get_bootmode(void);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
