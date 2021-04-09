Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E135A282
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 18:02:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31816C56639;
	Fri,  9 Apr 2021 16:02:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B843DC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 16:02:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139FrA6e010247; Fri, 9 Apr 2021 18:02:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=EJ67oEj1DFb1UYdGMvyDX3VLKkuDweQbVyWdIbCtADA=;
 b=6+RfAcHf7mOI8F+G/qcukJWx2Gy48DZTa/12UC2H8C9WGnbzyA6EKyjxI4eUa4FuMFf3
 Dsbq8Pj/fmxvIiZXWYs9tO6D/mFzna0voAvMTLF5vr7A953wIJQvqOA1qTPvkEVEuKV0
 rqvc9EON2jX1H+ZrZUK6igW67umiXlAu+cunYVBgGMveHsgCIpi2td1+lpYCMXoeTxaL
 gUbcaI0S3HtpLm4MGMPJ6vSHRDZ6nHyFShKfV78uMEiIk2KBiglJCrWHBHoMIi3c4YmS
 5iniNCH4IDZRszvVjULe+YDDIh/38Gara8eKhrrqGYzhT/SQIp4CZdlA8ci9VpphrJMA +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4db14d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 18:02:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5AD710002A;
 Fri,  9 Apr 2021 18:02:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 776E6241547;
 Fri,  9 Apr 2021 18:02:10 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 18:02:10
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Apr 2021 18:02:06 +0200
Message-ID: <20210409180126.1.I120ba9a4276e42538cae6f1f1aac51221c63f6ad@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_06:2021-04-09,
 2021-04-09 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] board_f: cosmetic: change the debug trace to
	KB in reserve_video
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

Update the debug trace for the reserved video memory to KB as indicated
in the message with "%luk"; before the patch the computed size
gd->relocaddr - addr is in bytes.

This patch aligns the debug trace in reserve_video() with others
functions, for example on stm32mp157c-dk2:

  - Reserving 3080192k for video at: dfd00000
  + Reserving 3008k for video at: dfd00000
    Reserving 873k for U-Boot at: dfc25000
    Reserving 32776k for malloc() at: ddc23000
    Reserving 72 Bytes for Board Info at: ddc22fb0
    Reserving 280 Bytes for Global Data at: ddc22e90
    Reserving 119072 Bytes for FDT at: ddc05d70
    Reserving 0x278 Bytes for bootstage at: ddc05af0

Fixes: 5630d2fbc50f3035 ("board: Show memory for frame buffers")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/board_f.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/board_f.c b/common/board_f.c
index 0cddf0359d..203e965799 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -394,7 +394,7 @@ static int reserve_video(void)
 	if (ret)
 		return ret;
 	debug("Reserving %luk for video at: %08lx\n",
-	      (unsigned long)gd->relocaddr - addr, addr);
+	      ((unsigned long)gd->relocaddr - addr) >> 10, addr);
 	gd->relocaddr = addr;
 #elif defined(CONFIG_LCD)
 #  ifdef CONFIG_FB_ADDR
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
