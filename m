Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E02181B4524
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E4FC36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0FB3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCPIg015790; Wed, 22 Apr 2020 14:29:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=i56gbzQh3kvAk7Vh2SfNeGFjMKwcw25Nr0SGMfpTpuM=;
 b=ud4gqNfSzMG4W0h8GhxBdM7zOWe7pu/BScUkaFjULVQD5T8BgcHr8ykLj4bpyosQDj2y
 YWSHxtss5wRNEvDaUcSNcexaxamerD49j24KmWwxq+8g7OA8PbSdPBT6rk5AaVZxAK4Z
 zraJ/7CZxhg5XcTRJRri3JlmjFz3OsMipNonP+0Otv12oOMfoec3hEb0cR68s8yznntg
 9D2V6htubyWsCFdW3b0/uqohQLxAZW/rBmrBM36Qh6w9p1TaCnYcN+WTXMEq1GZ632b/
 jkkKjU/V8Hl1F9vOKnpcgc8JUpQbSnwf1uJ9VmX8olrwUBxKVB0uzJ6oiqmAAGiEF4Xv 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregpatw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7368910002A;
 Wed, 22 Apr 2020 14:29:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B3842AE6C5;
 Wed, 22 Apr 2020 14:29:26 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:25 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:14 +0200
Message-ID: <20200422142834.v2.6.If6131518ee15d3299da69d674674ec03978eb58b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 06/12] board: stm32mp1: set environment
	variable fdtfile
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

For booting Linux in the generic distro mechanism and support of
FDTDIR in extlinux.conf , cmd/pxe.c retrieves the FDT file name
from "fdtfile" environment variable.

Dynamically build this variable with compatible of STMicroelectronics
boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 board/st/stm32mp1/stm32mp1.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 8e247bbc87..280c5b7ae4 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -704,10 +704,19 @@ int board_late_init(void)
 	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
 				 &fdt_compat_len);
 	if (fdt_compat && fdt_compat_len) {
-		if (strncmp(fdt_compat, "st,", 3) != 0)
+		if (strncmp(fdt_compat, "st,", 3) != 0) {
 			env_set("board_name", fdt_compat);
-		else
+		} else {
+			char dtb_name[256];
+			int buf_len = sizeof(dtb_name);
+
 			env_set("board_name", fdt_compat + 3);
+
+			strncpy(dtb_name, fdt_compat + 3, buf_len);
+			buf_len -= strlen(fdt_compat + 3);
+			strncat(dtb_name, ".dtb", buf_len);
+			env_set("fdtfile", dtb_name);
+		}
 	}
 	ret = uclass_get_device_by_driver(UCLASS_MISC,
 					  DM_GET_DRIVER(stm32mp_bsec),
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
