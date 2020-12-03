Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4402CD249
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:16:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A3CC56630;
	Thu,  3 Dec 2020 09:16:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B15BCC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:16:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B393K6Z025898; Thu, 3 Dec 2020 10:16:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mG7voALpUSyalVzrOM1wkI+1Pnt0SFBTVdLZBg8f8Y4=;
 b=QYQ/HyjoNtQxXXxRnyDN2S1OnBnl6Sk0hVtwOCZxht75CHueD8xYKGbHjdUXOPnngOFx
 5GpJW8zCpUFVQyIC4srPgARkKC73f1XKtcreNYeofIr84So9Vf8qJyP8VvRtshqSbin2
 PXootFYnZrfjpAjAT9qv93oChgGxvFM0QLbCxGytUOHW+asnzVq22j1YdJ50QHePwLga
 LvgBkqZ8SZoRXw6+s0tc4/39fvvCsATKqSqFGW7raXRL7ZJQVO6jh+x/oHG1Qyygd6XA
 QOCZMtlctev/YQumgHgibzUc0RC2O1Hf2Lf9qtvJ4RNK1ZG77agvNh5JRBehLLCFLWaE fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e7ttt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:16:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C27BD10002A;
 Thu,  3 Dec 2020 10:16:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B56ED233FDA;
 Thu,  3 Dec 2020 10:16:07 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:16:07
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:15:44 +0100
Message-ID: <20201203101538.1.I3813d938e14b844437a4ed6addf3280d064b28fd@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203091549.7031-1-patrick.delaunay@st.com>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_03:2020-12-03,
 2020-12-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Soeren Moch <smoch@web.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/6] tbs2910: configs: remove VIDCONSOLE_AS_LCD
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

Remove the obsolete CONFIG_VIDCONSOLE_AS_LCD as vidconsole is used in
./include/configs/tbs2910.h since commit 513acd04452f ("tbs2910: migrate
to DM_VIDEO").

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/tbs2910_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/tbs2910_defconfig b/configs/tbs2910_defconfig
index e43fab208d..b5580abbfd 100644
--- a/configs/tbs2910_defconfig
+++ b/configs/tbs2910_defconfig
@@ -103,7 +103,6 @@ CONFIG_DM_VIDEO=y
 # CONFIG_VIDEO_ANSI is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
 # CONFIG_PANEL is not set
-CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_VIDEO_BMP_RLE8=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
