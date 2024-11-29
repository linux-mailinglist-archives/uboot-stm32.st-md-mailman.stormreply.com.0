Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACDD9DE67D
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 13:29:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 410CFC78025;
	Fri, 29 Nov 2024 12:29:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A752C78024
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 12:29:10 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATB2nta002512;
 Fri, 29 Nov 2024 13:29:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HzkbsdOOTWj9BL8qFslAJEsDYMDdrMOchPbq/RFJtz8=; b=0OMYTa+TP+lcPdjo
 sUiZK4j5KQS4FETDZqXUyvjO2lipmnMit5p03cgMdY+KaAvLuGA0o/BryLCU5zq3
 A9UtmhWjbAi58A0c6PUG+4lRynwmiK78rvspw+7LhA6HMZJauOrYID5YWjkVA0Dh
 d3/UolCsym9JiDQKyuT5SVBF2PFCtyErGCvIhTtyQ272C25mAa3T0Ilfc1Wjvc8k
 9RNlwdAJGryuUR2J4QZ110XZgu9L5+AtEIkfwq/Hf5Mqc3O5XvTe+ZWbBt2rOd9A
 hpasfH98TQs9M3yAygFvqX721CNdTmbFWCXWqZYgBUdUF2zPohWf7US6fNodTpyt
 UlRDhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4367199nwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 13:29:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56EFE40048;
 Fri, 29 Nov 2024 13:28:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6067028C110;
 Fri, 29 Nov 2024 13:27:21 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 29 Nov
 2024 13:27:21 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 Nov 2024 13:27:09 +0100
Message-ID: <20241129122711.411917-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129122711.411917-1-patrice.chotard@foss.st.com>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 4/6] configs: stm32mp13: enable
	CONFIG_SYS_64BIT_LBA
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

In arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c, in init_device(),
in case of RAW_IMAGE, part->size = block_dev->lba * block_dev->blksz.

  _ part->size is declared as u64.
  _ block_dev->lba is declared as lbaint_t which is uint64_t
    if CONFIG_SYS_64BIT_LBA is enable, otherwise ulong.
  _ block_dev->blksz is declared as unsigned long.

For example, in case block_dev->lba = 0x1dacc00, block_dev->blksz = 0x200
then part->size 0x5980000 which is incorrect as both are declared as ulong.

To fix this overflow issue, enable CONFIG_SYS_64BIT_LBA, block_dev->lba is
then declared as uint64_t and part->size get the correct value 0x3b5980000.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 7f705808089..e4c92e851e1 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -54,6 +54,7 @@ CONFIG_SYS_MMC_ENV_DEV=-1
 CONFIG_ENV_MMC_USE_DT=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
+CONFIG_SYS_64BIT_LBA=y
 CONFIG_CLK_SCMI=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
