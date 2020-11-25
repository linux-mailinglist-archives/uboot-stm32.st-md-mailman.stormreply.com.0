Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D132C3F10
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 12:26:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C1FC424AF;
	Wed, 25 Nov 2020 11:26:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EA7AC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 11:26:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APBHqjV010076; Wed, 25 Nov 2020 12:26:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3dhO0r9L9nKihRuWhdhAOEkfcInq1olAUkeyx8/C0iM=;
 b=IyUn4encypl0Z6/nSOgmoNOO38bDHlUGnNlfoxPNTQzux7ACylUFufqUrtv35M2YCARi
 ABhlgVR0OebuESkLOXY7IrBwk0VIWfrvawGb6D+u6nHBRQvQ3ncAghpYGwkSrgyEpNTW
 XX6EXDazge+TmoCghqTa1YKa/nvk67KFgYUgs3r59lLBCfokQ5UvGzmTnAH0eJC2m/gf
 FAfOQZv7T5Dii/C8IGt/pHTBBcBC6qUq7m/pn5wbP3Zsc4GaK8QgHhfTdVYYYGUIhgJw
 Riv90aAOZxc72YpazD8F1cGUuzIzxAteZkaYtV3+Q1omCERDy3iWcpsEEbQSHEUY+9Yr MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjg44d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 12:26:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C100100039;
 Wed, 25 Nov 2020 12:26:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 815D0238DF3;
 Wed, 25 Nov 2020 12:26:17 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov 2020 12:26:17
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 25 Nov 2020 12:26:14 +0100
Message-ID: <20201125122610.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] string: Use memcpy() within memmove() when we
	can
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

A common use of memmove() can be handled by memcpy(). Also memcpy()
includes an optimization for large sizes: it copies a word at a time. So
we can get a speed-up by calling memcpy() to handle our move in this case.

Update memmove() to call also memcpy() if the source don't overlap
the destination (src + count <= dest).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
This patch allows to save 38ms for Kernel Image extraction (7327624 Bytes)
from FIT loaded at 0xC2000000 for ARMV7 board STM32MP157C-EV1,
and with kernel destination = Load Address: 0xc4000000,
located after the FIT without overlap, compared with
destination = Load Address: 0xc0008000.

-> 14,332 us vs 52,239 in bootstage report

In this case the memmove funtion is called in common/image.c::memmove_wd()
to handle overlap.


 lib/string.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/string.c b/lib/string.c
index ae7835f600..ef8ead976c 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -567,7 +567,7 @@ void * memmove(void * dest,const void *src,size_t count)
 {
 	char *tmp, *s;
 
-	if (dest <= src) {
+	if (dest <= src || (src + count) <= dest) {
 		memcpy(dest, src, count);
 	} else {
 		tmp = (char *) dest + count;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
