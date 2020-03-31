Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77081199ADA
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 420D6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 402F5C36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG3ERa025805; Tue, 31 Mar 2020 18:05:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JtSj17bsCF+XgUfNQOBZZTGXAvcIlE6dGlTRH2TcayQ=;
 b=T8n4UD+Bl3eIgHNjPbJjWdhIz4ZYTUnMXg727EljL1X90u73VgGxCgYxVa1msnFQWWHt
 WQnP3u4XHEI4EEYLXRC6iPd4LoIBGoRbs7Pa2Jx6cPyfrBtY9NuqKqJnRTbvPDNyHn5J
 T+weJ3kOmz/kSN3DX9IWYsFrZB/7gvctb1E6MckXPGBIQau/u8khfbEeiEK0hjBPG9/p
 6APa6zLPZ1VCOJqTF11ZSeE/wrmoFKDse3yuwtoW35WIq8M8+Gm8Ty/EsF7ncX5cjL1Z
 rxa7fftFusJErtA2OUrzoH/auXYQiM/iYm0eGohenNdXxkrYcG3lYiLKxnus0UTW2Zmq nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdrd58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F621100034;
 Tue, 31 Mar 2020 18:05:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 986572BEC70;
 Tue, 31 Mar 2020 18:05:06 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:06 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:33 +0200
Message-ID: <20200331180330.16.Ie45c9b3aed36a3a582774fa1dffcea89d2c4bcf4@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 16/16] configs: stm32mp1: activate
	CONFIG_ERRNO_STR
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

Add support of errno_str, used in command pmic and regulator.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 30cfb8d8e1..8a6201bc48 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -144,4 +144,5 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index aefad2b109..394df39d0a 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -127,4 +127,5 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
