Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5152CC7E
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 May 2022 09:07:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D184AC03FCC;
	Thu, 19 May 2022 07:07:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E7E0C03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 07:07:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J4ng1v025996;
 Thu, 19 May 2022 09:07:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=sfDBnlUldbeqa/A9baSJ95fFDPBru9HzbjAeIWGdPdw=;
 b=yoHTn0ZCkThbI66eEp7dRl7to8/9Uei0YUysZWDSU2slaLMVy879856uLcRybqV5OfYX
 YK7QXU3nphcE4v/gmCTOW9au2T3KMaqrrg44cpZ3E393XJl4ys7gU4TIAo2t8wqG9BvP
 hD0qhlkbURgWzevck+C41q+QSXlgTNeDeUhqkFi4y0RHSe9LTsI4Db7z+CM6QJ5xqVnf
 +sXRewSc1s3VFcoOLI7hPx07LDR1Yp6cm9dUgY88bk8+ZgpDMxc8HBp42BNjCuwQCFdz
 OlSIjzOFnsSr/k+htCVcql5NSratEzVYxPXm6IZ49qf8Ka5jrFicPl8tC4lsoTGypy7a pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j97cf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:07:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E6D610002A;
 Thu, 19 May 2022 09:07:44 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 402AE2122F5;
 Thu, 19 May 2022 09:07:44 +0200 (CEST)
Received: from localhost (10.75.127.49) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 19 May
 2022 09:07:34 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 May 2022 09:07:30 +0200
Message-ID: <20220519090726.2.I068deb9d25affb555ab29b06a0ff3a0ee9e94325@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519090726.1.I90e5b703cfebfe4c411fc13420155b9f9cfb0380@changeid>
References: <20220519090726.1.I90e5b703cfebfe4c411fc13420155b9f9cfb0380@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_01,2022-05-17_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>
Subject: [Uboot-stm32] [PATCH 2/2] board: engicam: stm32mp1: convert to
	livetree
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

Replace gd->fdt_blob access with fdt_getprop() function to the
function ofnode_get_property() to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/engicam/stm32mp1/stm32mp1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
index 20d8603c78..0a3e580f5b 100644
--- a/board/engicam/stm32mp1/stm32mp1.c
+++ b/board/engicam/stm32mp1/stm32mp1.c
@@ -14,8 +14,6 @@
 #include <asm/arch/sys_proto.h>
 #include <power/regulator.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 int checkboard(void)
 {
 	char *mode;
@@ -28,8 +26,8 @@ int checkboard(void)
 		mode = "basic";
 
 	printf("Board: stm32mp1 in %s mode", mode);
-	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-				 &fdt_compat_len);
+	fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
+					 &fdt_compat_len);
 	if (fdt_compat && fdt_compat_len)
 		printf(" (%s)", fdt_compat);
 	puts("\n");
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
