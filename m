Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF02135EF3
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 18:11:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A59FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 17:11:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9332C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 17:11:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009H3nQD002238; Thu, 9 Jan 2020 18:11:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Jgl6+5mxjHXUrcY0V/n2J65uhHlZAs23cpUZasIQ2BI=;
 b=QIQaNW5DeHutVOntYJ+JIgxCNCTQWyBGs+9t9pffYGTKxRAvtnDhWj+1z651AvVSZ5NF
 wWDlXlnEHMhewvV1ztLXuiId2GSXuxryuPylIrort5ip7Plf7/I4XrNkEnoT96cappfK
 csdFjXaybz0vWz9WGj2/8/k7G+q4HmLNhq2CDQo6ylcQaAFYbcZnpeT6jKGlHj0cLHi3
 EkL6u/qMPb0wd0DnuYwxtV/+SbpoZyG62PQ7HFbE9eVGYMwiJ3S5mx5ku0fOD6f0oJlm
 xFfpcNAJWwkjxRjX2ivUVjqmdaO3bT75T/CRPrfxB6Kb/7efqSdisaBNPVfN+vWEMuer 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur2vdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 18:11:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA17F10003A;
 Thu,  9 Jan 2020 18:11:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AABEE20F72E;
 Thu,  9 Jan 2020 18:11:33 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 9 Jan 2020 18:11:33 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Jan 2020 18:11:22 +0100
Message-ID: <20200109171123.16348-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200109171123.16348-1-patrick.delaunay@st.com>
References: <20200109171123.16348-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH 2/3] arm: set the relocated gd with gd->new_gd
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
