Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 384BB310B62
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:53:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 019E2C57B51;
	Fri,  5 Feb 2021 12:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6016CC57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CQqUQ028786; Fri, 5 Feb 2021 13:53:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Eu76jtzDVUgx+LgEukFxtkv4XTXs1qbmC/fWy6RkVhc=;
 b=Mr0kASV0VbxPWDc387rgymb0a3iMd2PHHDT0SVeJFIj6GUEO+1NFOEWYzYNrnDs4vcQx
 DjvqRU3Non3OMC972cQswxXD9EvJGuGyDHqYhtW3ngSsxfYWoFnlpVoNxYkR9z6C2q3X
 2Z3fRWR/7WBE2Vy26LhmKbeXmmADFFgx2Vvu7cSf3PSYAFJo7yeP2aWHQx0aSVxX272T
 Xui4QshocqrNRUog1uCqFAPc7Y7tNBTd0oTFVMn9iHk43oHojA+RPr3IuDn8F/8HI0Al
 gtwx+xmovdg07u3i+RtSLUC6J1uyyQ44FqDQhh+KKGZnyGi0upet7qftPS9TYeaoJjSN qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hgc3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73C13100038;
 Fri,  5 Feb 2021 13:53:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 636AE20A689;
 Fri,  5 Feb 2021 13:53:45 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:45
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:35 +0100
Message-ID: <20210205135332.4.Ic523a7db6fe8e4ee710cf77f0986c73bdb21b103@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 4/8] arm: cosmetic: align TTB_SECT define value
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

Align TTB_SECT define value with previous value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/include/asm/system.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 9db64dd69d..289b820a6d 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -475,7 +475,7 @@ enum dcache_option {
 #define TTB_SECT_XN_MASK	(1 << 4)
 #define TTB_SECT_C_MASK		(1 << 3)
 #define TTB_SECT_B_MASK		(1 << 2)
-#define TTB_SECT			(2 << 0)
+#define TTB_SECT		(2 << 0)
 
 /*
  * Short-descriptor format memory region attributes, without TEX remap
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
