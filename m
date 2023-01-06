Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C075660028
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 13:20:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08F85C6905D;
	Fri,  6 Jan 2023 12:20:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B70FAC640EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 12:20:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3068MJ2B022820; Fri, 6 Jan 2023 13:20:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=jMMFvlNRGsE23yGpWv7g958+LTa7WpPxhES7+CGUXVM=;
 b=25tp5ngka6e02Kcrimj5QKvP+royrM5h1Qe8kRiwmK5Yh+jIuNZ6nRnphaMq3sEwYo3X
 g9ScSWJNc2ef12HJT0UCZgMVlCysaGsxUFTiJwm9/xKZXEJ8a2PYwO3yqn1Vp/JvRbOu
 dZ+p18zOh6AlXBHdYBrJrZdSgiqzGlpjMjK32mb5Nw0Im9hB8KihL4Nc2m3uMVGMnsWT
 6aQYgZfqdkwJ5x/F/gur+xCiq1Dw7qf2LePkByjmjB3woi4YgaBZrLHhMIke8XFWnZpo
 yhRcGaHXlkhFPcQdCNk+WOdZ6ZKPCnGPeILeXQo6TK4FDcJ5qDjpM0H4upXXmDeMOp3I Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda6q7yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 13:20:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D338510002A;
 Fri,  6 Jan 2023 13:20:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDAB92105A3;
 Fri,  6 Jan 2023 13:20:30 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 6 Jan
 2023 13:20:30 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Jan 2023 13:20:17 +0100
Message-ID: <20230106131952.4.I582a6a1b443ccf0fda42be911f52e814d4ddb616@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_06,2023-01-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 4/6] configs: stm32mp13: Activate
	CONFIG_CMD_FUSE
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

Activate the command fuse to access on STM32MP13x OTP with
the BSEC driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index af6b1839d039..f3d5e9812c6c 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_UNZIP=y
 CONFIG_CMD_CLK=y
+CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_LSBLK=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
