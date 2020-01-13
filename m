Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B377B138CF2
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 09:34:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6038CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 08:34:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D348AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 08:34:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D8WVxB031968; Mon, 13 Jan 2020 09:33:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=KKrRnUeQFch1cECDMMqbptuZkbCLlkhrhXwNCCwCNYU=;
 b=Lksrnuda+UJGlvVWzD/ggu3z4J5Hj+TREUKqLYyPQCyaje5141owrt8qG0kKQe/uai+0
 ARVdzZZPEhTp/Yo4gZC9TzbXxMrZ0/M2/9uEA0E+vWxT7zZnOaUeoeZPf1YtKQT3gmZe
 kX+MbEYPO46tBpKJ5w93pPdT0fFXJWPI5PyDJkTHnajrU6I/3EvF1MyeUJ3V2ezwld9V
 mdDszL3WzNYe6l5595OXXvqiSo8zdSbB+dYLeDGZYuQmw8ycqkt3+VO1EeXUQax3K9dS
 PHM58WawgFtPutjw2gwRjtzWraeYF9JuWLT5Cjwxu0XDpKqLquSuuptRfUZVffQRHAGw 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jp6yur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 09:33:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14E04100039;
 Mon, 13 Jan 2020 09:33:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CFBF2A4D97;
 Mon, 13 Jan 2020 09:33:56 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 09:33:55 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 09:33:51 +0100
Message-ID: <20200113093339.v2.1.I4a80e4d2935f07164868f198fe868a0999be777e@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2] tools: ftdgrep: correct the find regions
	loop in do_fdtgrep
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

Use realloc and update the loop executed in do_fdtgrep to find all
the regions: only test count > max_region after the second pass.

This patch solve an issue if the number of region found (count)
is greater then the default value (max_region = count = 100):
the second pass is never executed, because the loop stops after
the first pass (i = 0, count > 100, max_regions = 100)
with error -1 and the error message
"Internal error with fdtgrep_find_region".

I also update the error message.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Change malloc to realloc to avoid memory leak.

 tools/fdtgrep.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/fdtgrep.c b/tools/fdtgrep.c
index 8f44f599c1..2a8058f57f 100644
--- a/tools/fdtgrep.c
+++ b/tools/fdtgrep.c
@@ -805,7 +805,7 @@ static int do_fdtgrep(struct display_info *disp, const char *filename)
 	 * we do another pass to actually record them.
 	 */
 	for (i = 0; i < 2; i++) {
-		region = malloc(count * sizeof(struct fdt_region));
+		region = realloc(region, count * sizeof(struct fdt_region));
 		if (!region) {
 			fprintf(stderr, "Out of memory for %d regions\n",
 				count);
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
