Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C173D2A9B4C
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 18:55:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AD4DC36B36;
	Fri,  6 Nov 2020 17:55:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0741DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 17:55:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hm995026881; Fri, 6 Nov 2020 18:55:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NKJnkwI37CqYaEf3cv11ZIE2UwwdylOaOX+xLQMh5WU=;
 b=avMCKs5yFcLKyc1zp5NCrub/OGyQcRpwUfdwJsMY6P0qukW5WuBRBaKjiLDJOvuv1IPH
 A+eW8VYMa1YETQHttwrbQ6pQ/YHKwBknSy+EZdAfOc0dbzkMB5VfI9bUQikRTMmsYC4u
 us9w9nXzHJWw1aWVhGItltGWGetUURCfcrGjf6/Azxg9seBKe/VhrSGNvB3VkLoXsJ6i
 fGEGdmJS2TnRUvD7qA3upyuJIu/JeapRiZCESAatCBAA1xqz8wYon8Z/+o1+diEjbHYH
 2Kz57UEswLOI1/jvxOkzUwbozmegXaosYI2Y7uJmjcYyDPHACEmyuSksithpTIE5UjJ3 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xfdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 18:55:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A9E4100034;
 Fri,  6 Nov 2020 18:55:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A3702150F7;
 Fri,  6 Nov 2020 18:55:10 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 18:55:09
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 18:53:38 +0100
Message-ID: <20201106175339.30683-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106175339.30683-1-patrick.delaunay@st.com>
References: <20201106175339.30683-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] log: use debug uart to output trace
	before LOG init
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

Use the debug uart functions to output the traces before
the log initialization (when CONFIG_LOG is not activated)
as it is done in puts/putc function in console.c.

This patch allows to display the first U-Boot traces
(with macro debug) when CONFIG_DEBUG_UART is activated
and not only drop them.

For example for traces in board_f.c requested by the macro debug,
when LOG_DEBUG is defined and CONFIG_LOG is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/log.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/common/log.c b/common/log.c
index aadf533fb2..aa5505943f 100644
--- a/common/log.c
+++ b/common/log.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <debug_uart.h>
 #include <log.h>
 #include <malloc.h>
 #include <dm/uclass.h>
@@ -245,6 +246,16 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 
 	if (!(gd->flags & GD_FLG_LOG_READY)) {
 		gd->log_drop_count++;
+
+		/* manage droppped trace at default level with debug uart */
+		if (IS_ENABLED(CONFIG_DEBUG_UART) &&
+		    (rec.level <= CONFIG_LOG_DEFAULT_LEVEL || rec.force_debug)) {
+			va_start(args, fmt);
+			vsnprintf(buf, sizeof(buf), fmt, args);
+			printascii(buf);
+			va_end(args);
+		}
+
 		return -ENOSYS;
 	}
 	va_start(args, fmt);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
