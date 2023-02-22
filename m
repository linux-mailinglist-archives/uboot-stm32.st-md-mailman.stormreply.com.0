Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB169FBE7
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Feb 2023 20:20:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A77DC65E58;
	Wed, 22 Feb 2023 19:20:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E77CC65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Feb 2023 19:20:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MEN1gM020179; Wed, 22 Feb 2023 20:20:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=DCBWuuKITigLKtKfe97rvBCYg0KsDN1F4KZpN4hVpJE=;
 b=W40W49K/Dx6cyRTSmvtPyZqa55ePsOYsW2d60XTKb4d+j7WjQLMEtRz+Ju3zOoxedK1b
 /7Cy1sjpOTA8ZblzbCSv/49mVVO+J5SLCS+M2fjoO/LMQmVP+RKaLa7WenCEAq9cBsUK
 Gb/IJk6gFnvmC3i+LKw2/qnlXBvqP4QjQq2aihvxfcaYQ/wtipE7AJ7s42dHfZ0ttm6B
 RLeBpcmi7MX8NuJgmrUtXQRQxhVWCqCIhah3IPbVtST1nWEfNzXSXpULQHdAy5UjErKh
 PLF0rZcm9rerjyeJJMN8Wq5AFfi+mb0E+fOJsXTGdgsNewpA19gG1HGIs1sRNbvWHQZu 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ntmyqarwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Feb 2023 20:20:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 024E810002A;
 Wed, 22 Feb 2023 20:20:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E015522A6F8;
 Wed, 22 Feb 2023 20:20:10 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Feb
 2023 20:20:10 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Feb 2023 20:19:58 +0100
Message-ID: <20230222201943.1.I901beb8819b481b6a9b55b2c00768225e5e12649@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_08,2023-02-22_02,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] ARM: remove SPEAR entry in makefile
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

As the lastest spear directories are removed, delete the associated entry
in Makefile.

Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/cpu/arm926ejs/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/cpu/arm926ejs/Makefile b/arch/arm/cpu/arm926ejs/Makefile
index 7e7ad4f35d7e..8cfe3f0fbbc2 100644
--- a/arch/arm/cpu/arm926ejs/Makefile
+++ b/arch/arm/cpu/arm926ejs/Makefile
@@ -13,7 +13,6 @@ endif
 endif
 
 obj-$(if $(filter mxs,$(SOC)),y) += mxs/
-obj-$(if $(filter spear,$(SOC)),y) += spear/
 obj-$(CONFIG_ARCH_SUNXI) += sunxi/
 
 # some files can only build in ARM or THUMB2, not THUMB1
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
