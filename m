Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 647FE6F06BA
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:36:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED8E5C6907C;
	Thu, 27 Apr 2023 13:36:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CF0EC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:36:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RBBC3r002136; Thu, 27 Apr 2023 15:36:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=XYSUIzZ+l9hG52GZBPyd5V+zDVrPOpk8e38RdvLoQ8A=;
 b=D/EhTSG1C4+UZjTdCyg0kC7oGTUQ740syS62yLXHLdNtW5DS3Hos/GMqUArCzwq/8MmM
 1TnhS/06W/ulc9gnZeXaVjIPuc8b4JJ7C8RSsgZFsgL2ATf2gpB7/MAk1G6PyaUf2PzX
 mHPVP9jDEIokqkKQ5p+doL7c3OB3223nTEDM1uA0cRejtCrOb7yRzLkv91mSV9g9sxRp
 QH1V5IQs3qBqWOidymFlzGUYj3xv4B2XhkVAxKvngSIVNyeyfpICFviAC1tPgBMgz6OS
 /6Pr9uWn3GCgy/cG3i+ahHNuJ3yLvCZQBDRRDtStC8J4c6hipDeDcokotcLb6uRIcqGh QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q70w8jh0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:36:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8B66100034;
 Thu, 27 Apr 2023 15:36:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A34E5226FD5;
 Thu, 27 Apr 2023 15:36:49 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:36:49 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:33 +0200
Message-ID: <20230427153632.1.I6aa05833267d4f481cd4b93967b34341002e2566@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/6] stm32mp: add support of STM32MP15x Rev.Y
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

Add support of STM32MP15x Rev.Y for the Silicon revision REV_ID = 0x2003.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
 arch/arm/mach-stm32mp/stm32mp15x.c             | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 0d39b67178e4..83fb32a45fcc 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -44,6 +44,7 @@ u32 get_cpu_dev(void);
 #define CPU_REV1_2	0x1003
 #define CPU_REV2	0x2000
 #define CPU_REV2_1	0x2001
+#define CPU_REV2_2	0x2003
 
 /* return Silicon revision = REV_ID[15:0] of Device Version */
 u32 get_cpu_rev(void);
diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
index 660c907a6ba3..afc56b02eea4 100644
--- a/arch/arm/mach-stm32mp/stm32mp15x.c
+++ b/arch/arm/mach-stm32mp/stm32mp15x.c
@@ -266,7 +266,7 @@ static const char * const soc_type[] = {
 };
 
 static const char * const soc_pkg[] = { "??", "AD", "AC", "AB", "AA" };
-static const char * const soc_rev[] = { "?", "A", "B", "Z" };
+static const char * const soc_rev[] = { "?", "A", "B", "Z", "Y"};
 
 static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
 				   unsigned int *rev)
@@ -307,6 +307,9 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
 	case CPU_REV2_1:
 		*rev = 3;
 		break;
+	case CPU_REV2_2:
+		*rev = 4;
+		break;
 	default:
 		*rev = 0;
 		break;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
