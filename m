Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193D728372
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:16:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D759C65E58;
	Thu,  8 Jun 2023 15:16:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A1A9C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:16:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358Dj5Km007671; Thu, 8 Jun 2023 17:16:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=RxwyA9nk2yq3JdBYLWpKZpxRSuZz897/KF25PGY8e6c=;
 b=zZpoA9b9MAAsZe+Zi3riNrUUlyVoEzdeDyvHpoTUKUEOc8xP0j7neLU4UJUrdnTzOUKv
 2/KSRI1c6tNXa1QHKuvq4/puvBigYXSzF/PyGIHs9IiuhprXnV813U+31U7NwP4zHxyU
 op5Zq1oNmy87zx5/Yk8GEcpV+hlDNiFjwGdsavY2RdFMfW1nUr7ZE0chzY2540mZcEb9
 V/MNTqbzzM2BKsO+uN7DJUzKN24fD9Av2KXoGiso9+GUwFWB8iVU5S3ZPAlyIJ32kGtT
 AZn6HOymM6jqiUxcHtq0mcbOzHyKB8fMG2p4xwf7iQE6xYWZOkYXFYhYflGaVinIav+r uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3cax2aht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:16:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5166D10003D;
 Thu,  8 Jun 2023 17:16:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BD3621A231;
 Thu,  8 Jun 2023 17:16:54 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:16:53 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:37 +0200
Message-ID: <20230608171614.1.I21f10cd5db605f5c0fbdfd04328958518fa508aa@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 01/12] fdt_support: include dm/ofnode.h
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

This patch is a preliminary patch to use ofnode function
is fdt_support to read the U-Boot device tree with livetree
compatible functions.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/fdt_support.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 2053fe3bad83..ffc59fd8b36a 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -13,6 +13,7 @@
 #include <mapmem.h>
 #include <net.h>
 #include <stdio_dev.h>
+#include <dm/ofnode.h>
 #include <linux/ctype.h>
 #include <linux/types.h>
 #include <asm/global_data.h>
@@ -1065,7 +1066,6 @@ void fdt_del_node_and_alias(void *blob, const char *alias)
 
 /* Max address size we deal with */
 #define OF_MAX_ADDR_CELLS	4
-#define OF_BAD_ADDR	FDT_ADDR_T_NONE
 #define OF_CHECK_COUNTS(na, ns)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS && \
 			(ns) > 0)
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
