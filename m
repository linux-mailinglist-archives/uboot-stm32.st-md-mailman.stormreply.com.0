Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCC5A09B3
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Aug 2022 09:15:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DDD0C5EC6B;
	Thu, 25 Aug 2022 07:15:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BC2EC08D1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 07:15:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P1fdUx029237;
 Thu, 25 Aug 2022 09:15:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=9CtUFE4T8l5UBcmp1y2dOx9L0q/pz+3VNxDW/Uc1bVs=;
 b=6KewZMi9KUIoYXVySnBHQuWSTI4aqrbQvwal+QfettoZx65I5WtYmIU53yd0JlW9GDGx
 /GOc78kVrlyjoZVQt1tFMaml1vUaOh+SeJnDOhDsUg2+pYeuCXkonFioQpGbK0chTtVM
 GfyusDUfvzGsZ8mCRgbidGcM22IxplC27faNJp9HXcKLPjzfANpAJh+a6L3s3zweJ31w
 U6KhcxXEbBQdioTmjqenh/VPq+0I+gSUljFJaxxQuiezY41Ce7hnn/56f+//d1x+Zscd
 qETxp6g2jQ+7ouNqXy2C51Q6upj8srViYYZttMFlJIJnMR24XaKqwePLxtNZJSQclUJs /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j4w3dcn3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 09:15:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3668F100034;
 Thu, 25 Aug 2022 09:15:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D12021513E;
 Thu, 25 Aug 2022 09:15:01 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 25 Aug
 2022 09:15:01 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Aug 2022 09:14:57 +0200
Message-ID: <20220825071457.1136386-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_03,2022-08-22_02,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2] configs: stih410-b2260: Fix SYS_HZ_CLOCK
	value
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

SYS_HZ_CLOCK was wrongly set to 1GHz whereas it's set to 750MHz
by default by bootrom.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>

---

Changes in v2:
   - Replace 1MHz by 1GHz in commit description

 include/configs/stih410-b2260.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index b1a011bacb..1e966a2322 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -14,7 +14,7 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 #define PHYS_SDRAM_1_SIZE		0x3E000000
 
-#define CONFIG_SYS_HZ_CLOCK		1000000000	/* 1 GHz */
+#define CONFIG_SYS_HZ_CLOCK		750000000	/* 750 MHz */
 
 /* Environment */
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
