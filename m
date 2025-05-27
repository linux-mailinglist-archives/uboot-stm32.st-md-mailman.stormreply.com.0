Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D5AC4FCA
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 15:30:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2069C36B1E;
	Tue, 27 May 2025 13:30:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7F75C36B19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:30:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBEbIU029442;
 Tue, 27 May 2025 15:30:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zGwI53AkpJ9S31VDkzMN8KilNK6uMt7d+Hx1Nnol25w=; b=RvG1wBw/AUIDSW+Q
 u2dI/FKEiZnizVrEmdTa4Cs83vmV+kgS8I3VO679TXorFqjvfV3HObDF/OFIzHaG
 DT/yvdhdQJWU83r7w5+h6cEygguaZHidb2jEkuFqmHZtrvKEYgzEguGFON9DglD4
 v1GF5X+e4Ml3JghZXgrVlEvAGv28XkWsOd+hIcd0on2yX1p6/DDOEoVcUyU3r5a1
 xyMs7pp0Y/gLoUpjZdVT4nOJTwD+matCU0LR4fKOXMpzZ9IzadF/gl4ocrK0Wfx1
 Lu6MwQ8o6PxW7ddgljxy0ffXcdpmcrga9sX9ZqAkOwF8PdyRtitZ6t0RyJzEfDAD
 wXqemg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u388v3tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:30:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D97740054;
 Tue, 27 May 2025 15:29:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00482AEC722;
 Tue, 27 May 2025 15:28:11 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:28:10 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 27 May 2025 15:27:55 +0200
Message-ID: <20250527132755.2169508-14-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 13/13] configs: stm32mp25: increase
	SYS_MALLOC_F_LEN to 0x60000
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

Due activation of SCMI, we need to increase SYS_MALLOC_F_LEN value
to avoid following message:

U-Boot 2025.04-01224-g75b77a2a6d31-dirty (Apr 25 2025 - 11:23:30 +0200)

alloc space exhausted ptr 400040 limit 400000
alloc space exhausted ptr 400020 limit 400000
alloc space exhausted ptr 400060 limit 400000
alloc space exhausted ptr 400060 limit 400000

Set SYS_MALLOC_F_LEN to 0x60000 to fix this issue.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

(no changes since v1)

 configs/stm32mp25_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 317a6d5ecd6..acb48f4ec72 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -1,6 +1,6 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
-CONFIG_SYS_MALLOC_F_LEN=0x400000
+CONFIG_SYS_MALLOC_F_LEN=0x600000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x90000000
 CONFIG_ENV_OFFSET=0x900000
 CONFIG_ENV_SECT_SIZE=0x40000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
