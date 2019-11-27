Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8710AC6C
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 10:11:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15E70C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 09:11:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23152C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 09:11:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR92Yve016971; Wed, 27 Nov 2019 10:11:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=jJWsuC7taIm2ElM+6rTARqh4iC3wSZ12TJurPUB2Sbo=;
 b=TKQSpSDibHK656QQOXuO6AQ2MfqOFyApEylXaslf09UXO7G6SySdcl/eQgZJhNHUqbsZ
 X4mlqNhpGDoTENkktb/ky2FfvdMeNJFcslaKxanEnMfw0iA6eknrT0he+oVJrJnnUXuT
 cIOy5xgSkfOPGoiTW2eOpxQrKNutmsrkhzi7ZQ4c/qyCoKB2hYh5dHHhnr3Oa76lmvL9
 KqRKiVQm8loZr3uVQoW0OTVt7c2goH0A8iGHnkBZbfyjiUYenrkuApRAfzSkURH9h1JO
 MiAc94/8DvITcNAVNjY+veargEMUJevtbB93nJ5T7/QYNL/C6VEAcPj8el3PiGforY/k 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxkjhyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 10:11:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E080010002A;
 Wed, 27 Nov 2019 10:11:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CADD12AA076;
 Wed, 27 Nov 2019 10:11:40 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 Nov 2019 10:11:39 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Nov 2019 10:11:38 +0100
Message-ID: <20191127091138.29223-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Trevor Woerner <trevor@toganlabs.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v3] board_f.c: Insure gd->new_bootstage
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

In reserve_bootstage(), in case size is odd, gd->new_bootstage
is not aligned. In bootstage_relocate(), the platform hangs when
getting access to data->record[i].name.
To avoid this issue, make gd->new_bootstage 16 byte aligned.

To insure that new_bootstage is 16 byte aligned (at least needed for
x86_64 and ARMv8) and new_bootstage starts down to get enough space,
ALIGN_DOWN macro is used.

Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>

---

Changes in v3:
  - Add Patrick Reviewed-by and Tested-by.

Changes in v2:
  - Update comment to explain the ALIGN_DOWN() usage.

 common/board_f.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/common/board_f.c b/common/board_f.c
index e3591cbaeb..d367f6b044 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -559,6 +559,11 @@ static int reserve_bootstage(void)
 	int size = bootstage_get_size();
 
 	gd->start_addr_sp -= size;
+	/*
+	 * Insure that start_addr_sp is aligned down to reserve enough
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
