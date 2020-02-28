Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B71739A0
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:18:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60FBCC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:18:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB1A3C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:18:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDOrh025961; Fri, 28 Feb 2020 15:18:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=swTxmX9QuXVrTK4Ds5nwbIF+WKeqyi8ip+C6eAGkbTU=;
 b=LikhtfiLLep5y1AYhh6k/EB5hJtWdFigflolwDACLAoQOL5KmGXgBbngK5zWEWQWfIVk
 jc5wNJiPuJ05/nt7KFd0ysbug6afhGtjQde05dN9jHZjrqOkaDPUfg4Fkez+Ip6yH9Ik
 lxH9DiKrCCN4tf5kE5TEOIyGbJPsDPHZIznoTiztd5Q1JI3bOJfsAjOQrQwLu3hZdLGe
 2ZvNMEeu+UTXNhbI6dDOtt7hT9HzFBIInJeF+oORkq+kmPDhzAI4ItBAJTmG3QwHvP43
 Cvc1Alb/w9ic1lRxTRoa3ZOXlfooN9Skz2pt9GLrlzwhR7SPhTLZSL6llYI0hMHFxDHC hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvvcc4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A8F210003D;
 Fri, 28 Feb 2020 15:18:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAF9A2BF9D3;
 Fri, 28 Feb 2020 15:18:21 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:21 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:13 +0100
Message-ID: <20200228141816.1644-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228141816.1644-1-patrick.delaunay@st.com>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Stefano Babic <sbabic@denx.de>
Subject: [Uboot-stm32] [PATCH 4/7] doc: update reference to README.imx8image
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

Update reference in many files detected by
scripts/documentation-file-ref-check

README.imx8image  => imx/mkimage/imx8image.txt

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/freescale/imx8qxp_mek/imximage.cfg                 | 2 +-
 board/siemens/capricorn/imximage.cfg                     | 2 +-
 board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg     | 2 +-
 board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imx8qxp_mek/imximage.cfg b/board/freescale/imx8qxp_mek/imximage.cfg
index 259a1646bf..cd747d2eee 100644
--- a/board/freescale/imx8qxp_mek/imximage.cfg
+++ b/board/freescale/imx8qxp_mek/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2018 NXP
  *
- * Refer doc/README.imx8image for more details about how-to configure
+ * Refer doc/imx/mkimage/imx8image.txt for more details about how-to configure
  * and create imx8image boot image
  */
 
diff --git a/board/siemens/capricorn/imximage.cfg b/board/siemens/capricorn/imximage.cfg
index 8660e50cbd..9f9df68e64 100644
--- a/board/siemens/capricorn/imximage.cfg
+++ b/board/siemens/capricorn/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2018 NXP
  *
- * Refer doc/README.imx8image for more details about how-to configure
+ * Refer doc/imx/mkimage/imx8image.txt for more details about how-to configure
  * and create imx8image boot image
  */
 
diff --git a/board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg b/board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg
index 71981f8c55..b8f0f3dc10 100644
--- a/board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg
+++ b/board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2019 Toradex
  *
- * Refer doc/README.imx8image for more details about how-to configure
+ * Refer doc/imx/mkimage/imx8image.txt for more details about how-to configure
  * and create imx8image boot image
  */
 
diff --git a/board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg b/board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg
index 1dcd13271d..44f6c0c455 100644
--- a/board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg
+++ b/board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2019 Toradex
  *
- * Refer doc/README.imx8image for more details about how-to configure
+ * Refer doc/imx/mkimage/imx8image.txt for more details about how-to configure
  * and create imx8image boot image
  */
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
