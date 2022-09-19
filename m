Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A15BCF44
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 16:39:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73007C640FB;
	Mon, 19 Sep 2022 14:39:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A5A6C640F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 14:39:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JE7QbV009381;
 Mon, 19 Sep 2022 16:39:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=WZi6kKRAsZf4pPnKAU2O4wAWjpItRgT4r2lPjluaVkQ=;
 b=ORo3/2RW5sKGHjiYXNB0uGI4GxG/QeGm0JOHRE4c3JtynUp5iF2EZpMFaHGjgGqO6/Gz
 VeVUW8P1E2umMc3TJkxd7N3FpzPcvD1WLl3SwtnAhiI/IbWatZ8Tt3fSrGtmL0GmsKrU
 U1wjdQKpMdXedFrtnZUFrNToor0WKYaG2c57JsAhfi2JA82j8j9gcNXyNWqxnNK9aS1c
 1Mze67qisDMrnPmCyNB7yLNtmNcsWS97NHcQJ2jvyOMzH40VKv7mHSnmQ6d9T+w0+fWf
 45yJQDXvro1vAI9kuLIMJ28UJbNLJLLL65c6MTcUAelqvhu2Ev9LshHOwJIv9wc4pqE/ 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6g53eeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 16:39:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CDF110002A;
 Mon, 19 Sep 2022 16:39:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62FA0236936;
 Mon, 19 Sep 2022 16:39:38 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 16:39:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Sep 2022 16:38:29 +0200
Message-ID: <20220919143830.1165894-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919143830.1165894-1-patrice.chotard@foss.st.com>
References: <20220919143830.1165894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 5/6] configs: stm32746g-eval: Fix
	CONFIG_SYS_SPL_ARGS_ADDR
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

STM32F746 embeds 1 MB of internal flash [0x08000000-0x080fffff],
fix CONFIG_SYS_SPL_ARGS_ADDR accordingly
It solves hard fault when jumping from SPL to U-Boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32746g-eval_spl_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
index d8d55c2d3c..28f522b15e 100644
--- a/configs/stm32746g-eval_spl_defconfig
+++ b/configs/stm32746g-eval_spl_defconfig
@@ -36,7 +36,7 @@ CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_XIP_SUPPORT=y
-CONFIG_SYS_SPL_ARGS_ADDR=0x81c0000
+CONFIG_SYS_SPL_ARGS_ADDR=0x80c0000
 CONFIG_SPL_DM_RESET=y
 CONFIG_SYS_PBSIZE=1050
 CONFIG_CMD_GPT=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
