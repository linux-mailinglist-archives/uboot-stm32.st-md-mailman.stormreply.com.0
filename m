Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E1310B65
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:54:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A574C57B52;
	Fri,  5 Feb 2021 12:54:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1AA1C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CS7OT020646; Fri, 5 Feb 2021 13:53:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1bUGs9Z0e1sVYIW7zaIwrgpPnkWmUArn7B6iit+MXIY=;
 b=GZyH9DOn6cYgYL6eszvbzQYe/eoK7O4hTUY69W0ScyqaDcbLHQaVZ302fd6IKvFm3dm3
 A9l96wur52eMx7g0eADHBtwbn/5lz4tVEWRdguLwCvN1DVhCzMYvwsQeObT+p39bhuKJ
 8cfhH8e2H2+Cl5HewcKQ/LBCggF0CcYCDSnb3r/b0NxTQINaMb55oyeCxCgFLlFH5FXp
 IqTP089ZXy96U/x0OHd5BJuV0M3l1IDBmwXPU1FX5AsLqUta6qc30Qh1nuF0yzdgMoUi
 ZpbDjMvy/t4A63GkmdfWrU1GCtiAoGcR5iFBR0ayHAVAwSIYfYjtD02mGeYMPh4Mbe+0 Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fsetkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F1B810002A;
 Fri,  5 Feb 2021 13:53:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6107F20A689;
 Fri,  5 Feb 2021 13:53:44 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:44
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:34 +0100
Message-ID: <20210205135332.3.Ic60984b860abed150b9bead538770cd1b6d930fe@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 3/8] arm: remove TTB_SECT_XN_MASK in
	DCACHE_WRITETHROUGH
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

The normal memory (other that DCACHE_OFF) should be executable by default,
only the device memory (DCACHE_OFF) used for peripheral access should have
the bit execute never (TTB_SECT_XN_MASK).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/include/asm/system.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 5fe83699f4..9db64dd69d 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -489,7 +489,7 @@ enum dcache_option {
  */
 enum dcache_option {
 	DCACHE_OFF = TTB_SECT_DOMAIN(0) | TTB_SECT_XN_MASK | TTB_SECT,
-	DCACHE_WRITETHROUGH = DCACHE_OFF | TTB_SECT_C_MASK,
+	DCACHE_WRITETHROUGH = TTB_SECT_DOMAIN(0) | TTB_SECT | TTB_SECT_C_MASK,
 	DCACHE_WRITEBACK = DCACHE_WRITETHROUGH | TTB_SECT_B_MASK,
 	DCACHE_WRITEALLOC = DCACHE_WRITEBACK | TTB_SECT_TEX(1),
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
