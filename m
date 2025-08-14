Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B8B2613C
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Aug 2025 11:43:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B5A7C36B3E;
	Thu, 14 Aug 2025 09:43:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61A16C36B18
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 09:43:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8jgtO022068;
 Thu, 14 Aug 2025 11:43:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=wbVKAvjPmm/+hM3TIxi+zo
 XPyXtvFh2bnyuvfbMyHXk=; b=Wh6O4vuu9cOMJDJRielHX16D4uYLl9lEbYkLKo
 KGPfmetcQ4rbiNQwg1jxqwq+zRCXbvPw+T/70vzQs21GAz03rlP4BAd2AC74XQif
 SDchIKhAj1ZBoNgXGRGxBBqd2+PEFCGEc/l4E0hdsut8Pb5EURI+rNHdsOJoENUV
 O/t9PWcHc51FmR+FgXHTIjK8ZMTxuWp9swkMPpkf6mduZpXysVEljLEsv4GAzjbP
 xhnxnbWCZRJd0kLejuxVTPKNEI8MXvesS4Nx8q7S2yLKKVYBJYq7a+/oH9dX9dpf
 QZE52iyRUYQvKjFpcEETi35rPb2aksIsiiQN5qZCiHMpHaHg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dwp236wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 11:43:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5D29E4002D;
 Thu, 14 Aug 2025 11:42:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2293D6C9737;
 Thu, 14 Aug 2025 11:41:19 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 11:41:18 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 14 Aug 2025 11:41:15 +0200
Message-ID: <20250814094116.1351454-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp25: Enable
	OF_UPSTREAM_BUILD_VENDOR
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

Enable OF_UPSTREAM_BUILD_VENDOR and set OF_UPSTREAM_VENDOR.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp25_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 14619ffd96c..2b02cd86d61 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -41,6 +41,8 @@ CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_LOG=y
 CONFIG_CMD_UBI=y
 CONFIG_OF_LIVE=y
+CONFIG_OF_UPSTREAM_BUILD_VENDOR=y
+CONFIG_OF_UPSTREAM_VENDOR="st"
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
-- 
2.25.1

base-commit: cd97f431b8062dcbc669d1ae7dd87736d9fca995
branch: upstream_OF_UPSTREAM_BUILD_VENDOR_for_mp25
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
