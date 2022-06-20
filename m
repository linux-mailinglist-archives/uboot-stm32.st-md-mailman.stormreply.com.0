Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF4551404
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:18:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2AE2C5EC6B;
	Mon, 20 Jun 2022 09:18:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 575F7C5EC56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:18:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8cIOP006900;
 Mon, 20 Jun 2022 11:18:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ZEdhBL3h1ifIGy7Y9jw9+XkhbCPcCtUS67QJ90+iESY=;
 b=zITzkC5WjcB/JzGzRZ6ECiHe8lQdBjASsUaLArdKldVSUqehVdB12hzTGUDyY0Tl1xi2
 AztJiJjZfpTbq6JkpAKixH7PtYMJPWMipxrwhjGW+HwxtDjpBkBBkoCgfIOatgISCyOU
 CkDsJpExP9ej7BUNM3LAOtAhO30nAyXao3tHff0qybVgsgMKJ7f7b4axhLMdoi6RzI5j
 87A/AdsIUMptZnARO5PJ17hWilRDNami2b7e8+pc1K0XCcG+TvWcUjTFQgWJ8oXRLaQx
 ln4NR5aIpSdWkWHaKCVN8NVWgu9FwUQlggXhBxkVnA/4/2JUkgzuO5vIX8mi+GcHpcOG yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtnj9rpjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:18:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5015510002A;
 Mon, 20 Jun 2022 11:18:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C2822171FB;
 Mon, 20 Jun 2022 11:18:28 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:18:28 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:17:09 +0200
Message-ID: <20220620111707.6.Ide5bc18fb9246988ca219eb5b44b865220215a96@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 06/10] configs: stm32mp13: Add support for
	baudrates higher than 115200
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

On STM32MP13x STMicroelectronics boards, the UART can reliably go up to
4000000 bauds when connected to the external ST-LINKV3.

This patch adds the support of higher baudrates on STMicroelectronics
STM32MP13x boards with ST-LINKV3.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/stm32mp13_st_common.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
index ec64b12f7ab..c51022b40d2 100644
--- a/include/configs/stm32mp13_st_common.h
+++ b/include/configs/stm32mp13_st_common.h
@@ -14,4 +14,9 @@
 
 #include <configs/stm32mp13_common.h>
 
+/* uart with on-board st-link */
+#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
+					 230400, 460800, 921600, \
+					 1000000, 2000000, 4000000}
+
 #endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
