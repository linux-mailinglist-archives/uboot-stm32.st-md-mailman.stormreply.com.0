Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBBEA23226
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2025 17:44:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35409C78F67;
	Thu, 30 Jan 2025 16:44:31 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1802EC78F6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 16:44:24 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEV8gC023077;
 Thu, 30 Jan 2025 17:44:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8AiXexKuKVLeHlIn91hCn+BGknKknGip2iS9tcyZ86s=; b=sAXEVOQTnk53lHdU
 DDTZiTfRqLR20R4HkLtvtLYPjxtIprcFMsS/g2/l5CZB1Y26riGDCz80TQ2y9s2H
 3y7G4hIDrWD7q4NFk4f5hKOOMT1PEXncU4+pwtJ9z6+976Gi77mv7iqbko3jOlPP
 1eupea8NAK340q1yHIKBMuumRpAjHhskSlZdDBT2fDnkkNtLkgMRsKAkhve2M+dh
 5EZzIuXaIzt3xBdkGmKhlGVe+CbIRuwIb8lVbaSuPaM9xOjgYZhqx+doAVOfpTEe
 Sj7N5TOY/Vr4enoYvkKr5peVyHnVoyCJJM8yuitVCil8jTXWu6I57S7Q3myKnPXx
 hwhaQQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44g6v6j3ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 17:44:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1840F40050;
 Thu, 30 Jan 2025 17:43:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79A223EC65E;
 Thu, 30 Jan 2025 17:35:56 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 17:35:56 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jan 2025 17:35:47 +0100
Message-ID: <20250130163547.512990-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130163547.512990-1-patrice.chotard@foss.st.com>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v5 9/9] configs: stih410-b2260: Enable
	CMD_USB_MASS_STORAGE flag
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

Enable CMD_USB_MASS_STORAGE flag.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

---

(no changes since v1)

 configs/stih410-b2260_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index 5641fd1d8d7..1e5190dc828 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -25,6 +25,7 @@ CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_TIME=y
 CONFIG_CMD_TIMER=y
 CONFIG_CMD_EXT4_WRITE=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
