Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE18B28AF72
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 09:48:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 869D5C3FAD5;
	Mon, 12 Oct 2020 07:48:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ECE4C35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 07:48:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09C7g2t6030543; Mon, 12 Oct 2020 09:48:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=I4oggeM+UVb3899JR/Vv1qMRcql0+KtWen/Smh7oxzM=;
 b=U9gwtGzaVdjSSwPl/2CdNxpXKP6h0R5z7+ZEcTcUJciEQhAvzIEuANi9dyytyfqTUz3N
 2V0FtvLXtw0l+EJudxLqEgRYoey72MQheo0c3QQ+DwYjN2EWmLst3plO28Xn/NdKQKEE
 q40dA0hktEtRN2j/RqGmjUKcEGp1Jf2v7uMJHWOSgkOsmNiRn9VjJv0sJcoX9aIjAgvT
 PfIrwXV2GrV/cmo8l37LX7xCN8E8I7GRtxTwIPJmYNKC4r/6hokfvdzDpqOskZuQsCFY
 mPJ/gMlsNJTFMX6A3vc1IY0U+N/DtofXwvdhittUvUS4C7NvbLtQj5SGjqi0atI+r1PP BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353vyq4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 09:48:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7331210002A;
 Mon, 12 Oct 2020 09:48:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6671D221787;
 Mon, 12 Oct 2020 09:48:16 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Oct 2020 09:47:52
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 12 Oct 2020 09:47:50 +0200
Message-ID: <20201012074750.15602-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_03:2020-10-12,
 2020-10-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] Remove default value of CONFIG_PREBOOT for
	CONFIG_USB_STORAGE
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

Remove the default value "usb start" for CONFIG_USB_STORAGE as the USB
storage boot initialization is correctly managed by  distro boot command
('usb_boot' defined in include/config_distro_bootcmd.h already include
the command 'usb  start').

Fixes: 324d77998ed6 ("Define default CONFIG_PREBOOT with right config option")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/Kconfig.boot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/Kconfig.boot b/common/Kconfig.boot
index 4191bfb34d..522f5f3d6a 100644
--- a/common/Kconfig.boot
+++ b/common/Kconfig.boot
@@ -880,7 +880,7 @@ config USE_PREBOOT
 config PREBOOT
 	string "preboot default value"
 	depends on USE_PREBOOT && !USE_DEFAULT_ENV_FILE
-	default "usb start" if USB_KEYBOARD || USB_STORAGE
+	default "usb start" if USB_KEYBOARD
 	default ""
 	help
 	  This is the default of "preboot" environment variable.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
