Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6748C1AF
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:53:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A13DC5F1FF;
	Wed, 12 Jan 2022 09:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07976C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:53:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7IKfX006161;
 Wed, 12 Jan 2022 10:53:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=GwQeGU1UCeOIS6xT8sBb4Ww24BvCvBf2MG/OzgFpj+8=;
 b=GtLnbd0r5tuNpYuxvBxKVU5Sf3ZyNDZvrq4LRlCxmfAWy0JtwVWw2vwErIZJRKtGxhKP
 CebQ9XHJDRk1My8f6Uzuobs46dYviYEaLa4MvmT1tZveP6fGAc4L9h7tEvnJBENMeWFE
 w1oTmKOHFu2YPPZCzulSH5ZaHNjVEjQyHxQXyFGhJjlJEESrgWBsaQRRda7FvIB3LS7J
 pgNZOVdQzCAYhhVKRy5PH/zM0FyOFujahSM8tMDYpRCEtr+Ro/TZF0+63maTyGfZGfaf
 7eV1BOXDz1as7GuO4W4NIf0xkjCNEr4M+rak8ftIUCQV2DY8ItlGAzrKYy9z3+omsJ+3 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtft123h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82EF210002A;
 Wed, 12 Jan 2022 10:53:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A91E2194F4;
 Wed, 12 Jan 2022 10:53:54 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:54
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:45 +0100
Message-ID: <20220112105327.4.I57d9b7ea4afd35a375b32822d44dc3fe60eaebd1@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 4/9] doc: add include/dm/platdata.h to the
	HTML documentation
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

Correct Sphinx style comments in include/dm/platdata.h
and add the associated API to the HTML documentation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst        | 1 +
 include/dm/platdata.h | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index 168d129250..6f72b0b620 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -9,3 +9,4 @@ Uclass and Driver
 .. kernel-doc:: include/dm/uclass.h
 .. kernel-doc:: include/dm/root.h
 .. kernel-doc:: include/dm/lists.h
+.. kernel-doc:: include/dm/platdata.h
diff --git a/include/dm/platdata.h b/include/dm/platdata.h
index 4efb1dfe12..47ba8aab7a 100644
--- a/include/dm/platdata.h
+++ b/include/dm/platdata.h
@@ -40,7 +40,7 @@ struct driver_info {
 #endif
 
 /**
- * driver_rt - runtime information set up by U-Boot
+ * struct driver_rt - runtime information set up by U-Boot
  *
  * There is one of these for every driver_info in the linker list, indexed by
  * the driver_info idx value.
@@ -51,7 +51,7 @@ struct driver_rt {
 	struct udevice *dev;
 };
 
-/**
+/*
  * NOTE: Avoid using these except in extreme circumstances, where device tree
  * is not feasible (e.g. serial driver in SPL where <8KB of SRAM is
  * available). U-Boot's driver model uses device tree for configuration.
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
