Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D084282D906
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 13:48:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95181C6DD74;
	Mon, 15 Jan 2024 12:48:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC195C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 12:48:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F7YPas017045; Mon, 15 Jan 2024 13:48:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=np1sFR3rJjJ/lGpjaJ6BnV7B2HDIQ0gS9npztCJ3d4s=; b=OI
 5f3eKyxfWj07MLVIUeabrBC7WNOyU16sYwH6AV5VyKVCIKV+0o1B5LHKcMf5hBxD
 3PMY/9trxGuGf8FBMcWhC1X2B9Wc/04MZQuAdYinWX1ueK0KmEvC7+zaZCWj47n/
 Lf/Ybg5Vr+UaplvLHkbODVsbmM+sqcUExO4+Vw+pG6w4mmyPuOywkOeczjYLUy/7
 bYz4fxXSjSsuR1HlafHucZNtAKHK5fIKsgkIVUJIML2gY4dIJVPL9fb6h0eeyR1T
 5CehpUsOmIIf0kauf9I1t4o5RCYYQzhDis9WqMk88twfkyybPi5OZWqsCXJynBjs
 DRJqEGQXxxDR1HH2k9zA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfy8mff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 13:48:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 708FD10002A;
 Mon, 15 Jan 2024 13:48:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A5272721D5;
 Mon, 15 Jan 2024 13:48:22 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 13:48:22 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 13:46:50 +0100
Message-ID: <20240115134642.5.I3c66d36ce7ac148b8d78855c73ea5f75ddde9b4f@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 05/12] configs: stm32mp25: add support of fuse
	command
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

Add support of the command fuse with CONFIG_CMD_FUSE to allow access
on OTP with command line.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp25_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 75f27c98b441..9fbd7eb15755 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -21,6 +21,7 @@ CONFIG_CMD_ADTIMG=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_CLK=y
+CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
 # CONFIG_CMD_LOADB is not set
 CONFIG_CMD_CACHE=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
