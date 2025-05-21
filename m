Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2FABF676
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:43:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ACC0C7A826;
	Wed, 21 May 2025 13:43:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E3D3C7A825
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:43:53 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LD9Qgh019398;
 Wed, 21 May 2025 15:43:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Q0wOfnsDt30vmK1YnodQHfQb9Kp9ehPLaoSBeZtwD7E=; b=cnOV52UFb+2j1mgw
 gted2uDMtZ46zuUF/RNQAcjDqSJRdDztaj7nvhDSfSE/hzS+1/w4ic/8V4S75DdQ
 ACtXol7xI7TjWB9PlmcSRw7FkRgAbRhI/aWoss/U0x1lZdAgxDmKNbEMyxCKx6eS
 aGvIv8JBJMX2cnPBYHJJrhSIzWD0e9+JZ8X2+U8IhsAmMzlBICDkwhC3ML9U2JOI
 r8IGjufuj3nbqc/FaWHlTN/3zW033rE5/VhnapWTrd90Lq7RZMRzQa83yTNSr1rx
 ext257x/eSOQh0uFEXBseS9xoSkzcqzR9R2LR6GnzmQq0bYDym3MnfC+tFAusJTi
 gAhwxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwface7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:43:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7E6940053;
 Wed, 21 May 2025 15:42:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7BB2B2CB7D;
 Wed, 21 May 2025 15:41:41 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:41 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:17 +0200
Message-ID: <20250521134117.2828335-14-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 13/13] configs: stm32mp25: increase
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
