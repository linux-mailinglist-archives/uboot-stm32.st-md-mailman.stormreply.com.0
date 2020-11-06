Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB26E2A9B4D
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 18:55:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90332C3FAD5;
	Fri,  6 Nov 2020 17:55:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AEBEC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 17:55:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HlJ3F018848; Fri, 6 Nov 2020 18:55:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4Awi5vF9cPkyJlBy0OlAHmDBg5xgHUqdMWIof8hBf3U=;
 b=PlwyzQNZ2UhkfIzakNzh0+aC65ScohMytRiicnOV6agRWtbvtHkTwviU6CaN0EIZfQ1B
 HFYhuqLAo+pbEFCbeU7qrmDFMHiQXFVjtBb26pnGMmXjsSeAcbzd96iZVjIcGhSR2j00
 B64eOCRAuO4uopmaWeyR952w9bgLxlctlwk1oftI0PSDlhn4r4dVB9hSOfqGYoxQ1VOA
 7uPBPy9rmVk5kl1pKTGwxdsyZKDFzAbiCfUEIAx7uIlju2ipUnk89ApoRvVxDWcmcSvm
 eeWv4wVt7Tt7xy5bYZLSmRlb+sUkV0RZ6v6WBiVhiUM8bMEz6bmSBLN1ciZ3LbJqtgHD FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h0328r12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 18:55:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 062B510002A;
 Fri,  6 Nov 2020 18:55:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED4A22150F7;
 Fri,  6 Nov 2020 18:55:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 18:55:10
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 18:53:39 +0100
Message-ID: <20201106175339.30683-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106175339.30683-1-patrick.delaunay@st.com>
References: <20201106175339.30683-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] log: call vsnprintf only when it is
	needed to emit trace
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

Reduce the log overhead when the traces are filtered,
by moving the vsnprintf call from _log() to log_dispatch().

This patch avoids the printf treatment when LOG features is
activated, but trace is filtered, for example when
MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

# Conflicts:
#	common/log.c
---

 common/log.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/common/log.c b/common/log.c
index aa5505943f..e5681ab323 100644
--- a/common/log.c
+++ b/common/log.c
@@ -198,9 +198,10 @@ static bool log_passes_filters(struct log_device *ldev, struct log_rec *rec)
  * @rec:	log record to dispatch
  * Return:	0 msg sent, 1 msg not sent while already dispatching another msg
  */
-static int log_dispatch(struct log_rec *rec)
+static int log_dispatch(struct log_rec *rec, const char *fmt, va_list args)
 {
 	struct log_device *ldev;
+	char buf[CONFIG_SYS_CBSIZE];
 
 	/*
 	 * When a log driver writes messages (e.g. via the network stack) this
@@ -214,8 +215,13 @@ static int log_dispatch(struct log_rec *rec)
 	gd->processing_msg = true;
 	list_for_each_entry(ldev, &gd->log_head, sibling_node) {
 		if ((ldev->flags & LOGDF_ENABLE) &&
-		    log_passes_filters(ldev, rec))
+		    log_passes_filters(ldev, rec)) {
+			if (!rec->msg) {
+				vsnprintf(buf, sizeof(buf), fmt, args);
+				rec->msg = buf;
+			}
 			ldev->drv->emit(ldev, rec);
+		}
 	}
 	gd->processing_msg = false;
 	return 0;
@@ -224,7 +230,6 @@ static int log_dispatch(struct log_rec *rec)
 int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 	 int line, const char *func, const char *fmt, ...)
 {
-	char buf[CONFIG_SYS_CBSIZE];
 	struct log_rec rec;
 	va_list args;
 
@@ -243,13 +248,16 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 	rec.file = file;
 	rec.line = line;
 	rec.func = func;
+	rec.msg = NULL;
 
 	if (!(gd->flags & GD_FLG_LOG_READY)) {
 		gd->log_drop_count++;
 
-		/* manage droppped trace at default level with debug uart */
+		/* manage droppped traces at default level with debug uart */
 		if (IS_ENABLED(CONFIG_DEBUG_UART) &&
 		    (rec.level <= CONFIG_LOG_DEFAULT_LEVEL || rec.force_debug)) {
+			char buf[CONFIG_SYS_CBSIZE];
+
 			va_start(args, fmt);
 			vsnprintf(buf, sizeof(buf), fmt, args);
 			printascii(buf);
@@ -259,13 +267,11 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 		return -ENOSYS;
 	}
 	va_start(args, fmt);
-	vsnprintf(buf, sizeof(buf), fmt, args);
-	va_end(args);
-	rec.msg = buf;
-	if (!log_dispatch(&rec)) {
+	if (!log_dispatch(&rec, fmt, args)) {
 		gd->logc_prev = cat;
 		gd->logl_prev = level;
 	}
+	va_end(args);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
