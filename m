Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971C17C53E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 19:18:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F076C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 18:18:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ADA7C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 18:18:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026IEVI5028317; Fri, 6 Mar 2020 19:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IQSK0Hyp6eRubnKypcQ5qZPIv7a/PYNS7XXGw4FE97E=;
 b=CG36WrYTsmCKkEjIO06vZ8PiSjWeZlzyXD/eOLO19prjRt90r42yx0kE1n35fza4EEy0
 9HKu0RObZiQWQT5/bs1s7wdiHfbhETHmOWMu1Vo8nXUqmUQwDn2a8RUwwm/7zDb3IxKg
 uxHDY9qBcqekNDkbNf/rcD+eChUlecDNZeJPmnf2kP7BhkQWt5nJkz+tI2ZUvMWH4JX4
 h2o7pQMDIqS+qad6Nie+K9TDP1byjY8vjZTcBNxB09sau9vLvYFp4ZnSF+5gFgrGpwKn
 iEaYgw/4uEkKMWDA7c/voM/eiy0Hvx3GQ7DkFDHSu1+ypWFRx74gwKM7hLYSM5U9wi7b fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7h3n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 19:18:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 478CF10002A;
 Fri,  6 Mar 2020 19:18:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37CB92AA9FB;
 Fri,  6 Mar 2020 19:18:01 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 19:18:00 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 19:17:55 +0100
Message-ID: <20200306181758.12336-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306181758.12336-1-patrick.delaunay@st.com>
References: <20200306181758.12336-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_06:2020-03-06,
 2020-03-06 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v3 1/4] board_f.c: Insure gd->new_bootstage
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

To insure that new_bootstage is 16 byte aligned (at least needed for
x86_64 and ARMv8) and new_bootstage starts down to get enough space,
ALIGN_DOWN macro is used.

Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- import: [U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment

 common/board_f.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/common/board_f.c b/common/board_f.c
index 82a164752a..99154f5759 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -564,6 +564,11 @@ static int reserve_bootstage(void)
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
