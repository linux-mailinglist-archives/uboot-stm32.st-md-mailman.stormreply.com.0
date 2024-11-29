Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7759DE6B4
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 13:50:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C69C78025;
	Fri, 29 Nov 2024 12:50:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 527D6C71289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 12:50:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATB2swO004562;
 Fri, 29 Nov 2024 13:50:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=KCyFpcy6QxhiSHK982Rpu/
 CQ2o7r4NhQl9L/tg8oTUI=; b=EmrtaG6C0VG2rwfAZbMpl8a2xgkyIuSc1FwoEZ
 4LaED8ZX+/J6iW/XkE8cTMGQ0zaHdQKGyN0xxhuVVNaM3TRMAzoF6aVqMV9FcUmi
 NDcRXhC+sHtWIp7z2HAf6rAujWBNUGfRIgg33KVYFBDSdCjdx8duzWmPxK6rqKuK
 AiE6aXFaD7+LUeRkHQEWOdQsrkUuRS2qdCiLVoteRZWPfveV1nmT6aDeBJZig11j
 6QvqNSgpg0h9NfEB1yQqfjZrB2zYvp91HKtpnLHEyTwBtDeSfKKGhlUYVQxIOD38
 VcQi9ApkzmuRFEHBNeYWBly94SIayNa88HvJdKMkhku4hChQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 436715htmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 13:50:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D986C40048;
 Fri, 29 Nov 2024 13:49:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5748629177E;
 Fri, 29 Nov 2024 13:49:00 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 29 Nov
 2024 13:49:00 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 Nov 2024 13:48:57 +0100
Message-ID: <20241129124857.443093-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] board: st: stm32mp1: Clean env_get_location()
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

ENV_IS_IN_EXT4 flag is no more used in any STM32 defconfig,
remove the related code.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index d5e5e776d2a..15fb9e4b062 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -751,8 +751,6 @@ enum env_location env_get_location(enum env_operation op, int prio)
 	case BOOT_FLASH_EMMC:
 		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
 			return ENVL_MMC;
-		else if (CONFIG_IS_ENABLED(ENV_IS_IN_EXT4))
-			return ENVL_EXT4;
 		else
 			return ENVL_NOWHERE;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
