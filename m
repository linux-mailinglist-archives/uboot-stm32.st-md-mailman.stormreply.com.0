Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7F4E9D6B
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 19:25:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90FD8C5E2CC;
	Mon, 28 Mar 2022 17:25:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A673C5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:25:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDU7lM021069;
 Mon, 28 Mar 2022 19:25:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=lM7W6ulUK3NgZZbB5glpqTpvb1wZSMLtO8SrOklhrYE=;
 b=8bhaAr7xmQ3kFvVcY4NkN7tgxKO1W/wcncy1rBvHrdrFTfYnMXP1wJ976wXT6WfQj1vz
 o24ksjBr64GZv648R33Uj/rb/PoAg6ICPofK8aDFdbV48l/Ne96Nv82rXpwEPonv+jib
 wX4vkI/gC5j5TKNIkzLRCut5B+K0eSvAGDXjjInWC5hW+pXJ3AykAnCiQ1xXR80nlPFc
 bAH5Rug2NGWY44x6GOBrUkkhILRQiiC/g3eJWfO08lTmUsL2rTOiNsz7NEjQ/h3juN5r
 QFDDG898rm3g1n9ew+ZlBsDzI3BxeOB53zVA2evJOpdqOuc4oG8C2ol1/VIaFcF9Uho8 lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1u242qpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 19:25:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC831100034;
 Mon, 28 Mar 2022 19:25:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B68F924B88F;
 Mon, 28 Mar 2022 19:25:37 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 19:25:37
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 19:25:26 +0200
Message-ID: <20220328192520.1.I18450aeeff35907b6868f7a48a012237d3752386@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_08,2022-03-28_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/8] stm32mp: stm32prog: fix comment
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

Fix "partition" in comment.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 61cba157fd..d513a60efb 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -46,7 +46,7 @@
 	EFI_GUID(0xFD58F1C7, 0xBE0D, 0x4338, \
 		 0x88, 0xE9, 0xAD, 0x8F, 0x05, 0x0A, 0xEB, 0x18)
 
-/* RAW parttion (binary / bootloader) used Linux - reserved UUID */
+/* RAW partition (binary / bootloader) used Linux - reserved UUID */
 #define LINUX_RESERVED_UUID "8DA63339-0007-60C0-C436-083AC8230908"
 
 /*
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
