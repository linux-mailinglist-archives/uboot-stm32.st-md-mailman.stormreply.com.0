Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2D17F33A
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 10:15:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C6EEC36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 09:15:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78BA3C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 09:15:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02A9EsF6013955; Tue, 10 Mar 2020 10:15:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=a5v0doQAKv2QSiMq6fsRq4xipeLTbGWtafCpXyMf6PI=;
 b=EYZm2OE0WHBld3hntMVuS0j8LYQUcR/m9VAGDmUH0SYreUCPIhHmmtfOCJkJGnOu4ZL5
 8xhjKb6LOx2Zo80Ttxot4KRro/EzEVf20zE0iyFZG09p7Ox/t1Jbc21s+tbQEqO6aTMz
 TGbkd8iE8JIZPDbw4y3PIHd0eRNMOhtEXxvcJwyH29P7GzB1LvIGqsCF1+MHlS6xMDkf
 EXNUjGUGdHxVA0sXd02Ac6ya+kGF8nvex8EFQ+u4xNoZ29+8W8Bp2XEJciy1qcSwU9hF
 eY6urkI63cDV/Jn4bhdva6iD9qby8trQ4VRsx5PCEGvPsqe1bwbXfoNCYf570rdDWWZh kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym292a5n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 10:15:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E282410002A;
 Tue, 10 Mar 2020 10:15:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D528421FE92;
 Tue, 10 Mar 2020 10:15:12 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 10 Mar 2020 10:15:12 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 Mar 2020 10:15:02 +0100
Message-ID: <20200310091505.24862-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310091505.24862-1-patrick.delaunay@st.com>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_04:2020-03-09,
 2020-03-10 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v4 1/4] board_f.c: Ensure gd->new_bootstage
	alignment
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

From: Patrice Chotard <patrice.chotard@st.com>

In reserve_bootstage(), in case size is odd, gd->new_bootstage
is not aligned. In bootstage_relocate(), the platform hangs when
getting access to data->record[i].name.
To avoid this issue, make gd->new_bootstage 16 byte aligned.

To ensure that new_bootstage is 16 byte aligned (at least needed for
x86_64 and ARMv8) and new_bootstage starts down to get enough space,
ALIGN_DOWN macro is used.

Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4:
- replace insure by ensure in comment

Changes in v3: None
Changes in v2:
- import: [U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment

 common/board_f.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/common/board_f.c b/common/board_f.c
index 82a164752a..0427b7b096 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -564,6 +564,11 @@ static int reserve_bootstage(void)
 	int size = bootstage_get_size();
 
 	gd->start_addr_sp -= size;
+	/*
+	 * Ensure that start_addr_sp is aligned down to reserve enough
+	 * space for new_bootstage
+	 */
+	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
 	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
 	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
 	      gd->start_addr_sp);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
