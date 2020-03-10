Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F400F17F33D
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 10:15:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEC50C36B0F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 09:15:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6906DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 09:15:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02A9EHCI024376; Tue, 10 Mar 2020 10:15:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XPtZ/3sK/AvcMRAYuhs3KiiquEyJLyYzfFR+94omgQM=;
 b=Mxc6Oe4swhGKgMAjduI7CTvh7nzkMxrsWGFy2NpRNSDrN0FwzQivyxOrXswqpvCqbQTv
 +7rrwjOMPMAViNCkFOXxn8Tl4ivut3b+qbLOownDrdd6VfrGmQltH2V09GRNiD8+XFib
 XTyB1SrItVd9w5xrOqmEyQoSKj9yaRlN75PnLIInX45EcOj2F2/+yaqRphBb66aaUpfe
 eew1QCqzYUiBCE90D1fDQ9fexKIuAaEkq7SDYErp/B0AbDZrV1HX3ua9KQVx5fn3zIp6
 qfsJwBUk+TAD04gEkv69cuLThrABEg6ceiYp+Ekg2h/0dMJvwOaya4xVNommEOgYRS5L fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1mgt9x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 10:15:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B4F3100034;
 Tue, 10 Mar 2020 10:15:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CEF621FE96;
 Tue, 10 Mar 2020 10:15:14 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 10 Mar 2020 10:15:13 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 Mar 2020 10:15:04 +0100
Message-ID: <20200310091505.24862-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310091505.24862-1-patrick.delaunay@st.com>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_04:2020-03-09,
 2020-03-10 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH v4 3/4] arm: set the relocated gd with
	gd->new_gd
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

Simplify the arm relocation behavior and get gd directly form new_gd,
as it is already done in crt0_64.S:

	ldr	x18, [x18, #GD_NEW_GD]		/* x18 <- gd->new_gd */

This patch avoid assumption on new GD location (new GD is below bd -
with #GD_SIZE offset).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm/lib/crt0.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/lib/crt0.S b/arch/arm/lib/crt0.S
index fb6c37cf51..df9dd83e40 100644
--- a/arch/arm/lib/crt0.S
+++ b/arch/arm/lib/crt0.S
@@ -127,8 +127,7 @@ ENTRY(_main)
 	ldr	r0, [r9, #GD_START_ADDR_SP]	/* sp = gd->start_addr_sp */
 	bic	r0, r0, #7	/* 8-byte alignment for ABI compliance */
 	mov	sp, r0
-	ldr	r9, [r9, #GD_BD]		/* r9 = gd->bd */
-	sub	r9, r9, #GD_SIZE		/* new GD is below bd */
+	ldr	r9, [r9, #GD_NEW_GD]		/* r9 <- gd->new_gd */
 
 	adr	lr, here
 	ldr	r0, [r9, #GD_RELOC_OFF]		/* r0 = gd->reloc_off */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
