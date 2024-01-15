Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837182DAE9
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 15:06:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1BC6C6B476;
	Mon, 15 Jan 2024 14:06:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5298C6DD74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:06:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FDYn8F011875; Mon, 15 Jan 2024 15:06:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=Fdi9etyhYpxZapUVaf+cv+ovuXOhhoFyM98Vc3uIXqk=; b=fU
 TcwmyR02HOc8phwc4Q039aMFpBftsYHlVIChQ8uarFJU1qQlfwelwdQ4x+1IK5iU
 mZ0b8x9uGwqnDRzsV8rUZgSBu6S+v9y44q59BfvvDMrHe0nuQM5+LxQzu7niCSIT
 gqLiTJTLAQEvR/HZqLS7VaLHXxAsoqwHzkRRCzQUcaFmhvqUTZ2NnOmdIGVy5mcx
 0ZlQr5oq4LhLSliUQ8riaCGwhg3FFPBlwApNUedL5c5WbgQkd34T5Mp4kIva3oI+
 TQJ3LRoLeZr/VAoDH/FBaeupxVamvBm1RqqYbIcIhorhOOW1+lY/FCBywcYE8QCI
 vjsNYVRxkXrfTtw76ObQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkma5ryum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 15:06:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 292BD100057;
 Mon, 15 Jan 2024 15:06:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2222629865B;
 Mon, 15 Jan 2024 15:06:08 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 15:06:07 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 15:05:47 +0100
Message-ID: <20240115150451.v2.4.I81fedd3d2ff9635b3738dd1ef349c936bc9b433d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 04/14] stm32mp: bsec: add support of
	stm32mp25
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

Add support of BSEC for STM32MP25x family to access OTP.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/bsec.c               | 7 +++++++
 arch/arm/mach-stm32mp/include/mach/stm32.h | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 705c994d9307..5b869017ec1a 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -784,9 +784,16 @@ static const struct stm32mp_bsec_drvdata stm32mp15_data = {
 	.size = 96,
 	.ta = false,
 };
+
+static const struct stm32mp_bsec_drvdata stm32mp25_data = {
+	.size = 368, /* 384 but no access to HWKEY and STM32PRVKEY */
+	.ta = true,
+};
+
 static const struct udevice_id stm32mp_bsec_ids[] = {
 	{ .compatible = "st,stm32mp13-bsec", .data = (ulong)&stm32mp13_data},
 	{ .compatible = "st,stm32mp15-bsec", .data = (ulong)&stm32mp15_data},
+	{ .compatible = "st,stm32mp25-bsec", .data = (ulong)&stm32mp25_data},
 	{}
 };
 
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 46d469881b32..45c929aa605d 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -197,7 +197,8 @@ enum forced_boot_mode {
 #ifdef CONFIG_STM32MP25X
 #define BSEC_OTP_SERIAL	5
 #define BSEC_OTP_RPN	9
-#define BSEC_OTP_PKG	246
+#define BSEC_OTP_PKG	122
+#define BSEC_OTP_MAC	247
 #endif
 
 #ifndef __ASSEMBLY__
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
