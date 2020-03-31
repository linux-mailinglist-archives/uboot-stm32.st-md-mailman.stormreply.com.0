Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B1199AD5
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC02C36B20
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12858C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG3Ebd025798; Tue, 31 Mar 2020 18:05:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1CQFRstFSFQTGQwTnls+qZIRkuZGfYxt++5n7YvATyc=;
 b=RShsu0hIXgBWUEIYcb09xxJaTaN9C0DU+Vs4htSXzLVEvkFCKYqSkTSydSMWd+sKPiH1
 OlnP3rt5O/5AlxtelVFHXF+EBeMIBSp9xJ3NP9muiJvlOO9b2jtrGTidGMi24OIcPtJm
 C2SKAgfjl26LKxZqUL1TNVOcmXcL/4MSZut3hKNFKJVspBPGKOgqZmctg5RMPijw55xf
 eskLLq2rmFiIsSuDqvXkrtBYuFyXwpiqxFGg//X6g8FUgM69oUV8zGyr/L9zq2rX1ZGX
 WjJQB6elb3MxQsY0VMvXaBvFwZoOraH1G94y2WCGbAiyyRn05DCWAWM+RfIQiNTv7dss Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdrd4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1678510003A;
 Tue, 31 Mar 2020 18:05:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F8F62BEC6D;
 Tue, 31 Mar 2020 18:05:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:01 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:27 +0200
Message-ID: <20200331180330.10.If6131518ee15d3299da69d674674ec03978eb58b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 10/16] board: stm32mp1: set environment
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
---

 board/st/stm32mp1/stm32mp1.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 52881adef7..89a088cd28 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -715,10 +715,19 @@ int board_late_init(void)
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
