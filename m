Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF3136886
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Jan 2020 08:50:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35342C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Jan 2020 07:50:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50862C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 07:50:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00A7m0i4012408; Fri, 10 Jan 2020 08:50:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=H1V/ZBZpVJ1S+Z/9hX/O7v2Mjqa9oxiznOOmBJNJc5c=;
 b=LldmaIsFpGsc2mA/p0BiJBoZzPX2uQBLP4SBlMjHRcsiIdsl8Qm3R+kFeXqq1W8Di8zv
 Z8QpIoUvy+XWASxAF+oFA+v1rvxczKEeXQMrxvFNsy7IKQocFCa8Hs+nyVH7s7l/sWUk
 8PhKShz5obJlkPcqk4o+KNiPveUbHB9VL29NNroD7dP2zD9TyWDBHNFDa7N0lIsJpF4v
 lGIOwYkH1lpquSUnK6FsVkEa2ZrUVAHaHgYxp55iMaeRzY49m4C/sROAt/CAzSF9NBhF
 O4plogkljc6QKLV9dF7OEnPvBAYTEG2EiCEVFuBi5bLzkNZHtOKIRuoorfKk+2JseiuO lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur5wrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 08:50:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A52E7100034;
 Fri, 10 Jan 2020 08:50:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 319FC211BB0;
 Fri, 10 Jan 2020 08:50:34 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Jan 2020 08:50:33 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Jan 2020 08:50:31 +0100
Message-ID: <20200110085027.1.I4a80e4d2935f07164868f198fe868a0999be777e@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] tools: ftdgrep: correct the find regions loop
	in do_fdtgrep
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

Update the loop executed in do_fdtgrep to find all the regions
and add a test for count > max_region only when the second passes
is executed.

This patch solve an issue if the number of region found (count)
is greater then the default value (max_region = count = 100):
the second pass is never executed, because the loop stops after
the first pass (i = 0, count > 100, max_regions = 100)
with error -1 and the error message
"Internal error with fdtgrep_find_region".

I also update the error message.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 tools/fdtgrep.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/fdtgrep.c b/tools/fdtgrep.c
index 8f44f599c1..bcf06b871d 100644
--- a/tools/fdtgrep.c
+++ b/tools/fdtgrep.c
@@ -823,8 +823,10 @@ static int do_fdtgrep(struct display_info *disp, const char *filename)
 		}
 		if (count <= max_regions)
 			break;
+	}
+	if (count > max_regions) {
 		free(region);
-		fprintf(stderr, "Internal error with fdtgrep_find_region)(\n");
+		fprintf(stderr, "Internal error with fdtgrep_find_region()\n");
 		return -1;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
