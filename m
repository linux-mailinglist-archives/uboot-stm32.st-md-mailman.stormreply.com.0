Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC32C62F0
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28E92C56635;
	Fri, 27 Nov 2020 10:21:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BED6C56637
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAH1WY000696; Fri, 27 Nov 2020 11:21:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=p4KFMaND6FC+jwZHxY3Cl8xCQmOqSiPysDTPD3R2Lc8=;
 b=u0USUlGx36gn0LlxlqVDmMfg0Cio7Rq/GOwOXURS+z4OTY2YkOF3fTSSRgW4ZEYhimRG
 TjEXnu3ITFVAFDvCI/ynOUDS915SKSeAP95hwVpaEb7q8+XBjs90OVxRXyUpMFL4kvuF
 etiHGGyU399Vl3kOC0bCEXOYZgnR6UdHUi7U0QN4/0yKZJoDed5ieNrqDMwhtraTnst7
 RUfP34p61bP6AFzx4Bba5bvAe0c0jJCQAgphVASiab7rqWqgk9dSuBtAS/gzrExMsmuo
 8TriE1ekK3PpmkZjTVvJXzo0zUrkGgy1rC4/gNmNMklmUjzgL17hV10hgN04LvTSS6/N Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fhcv55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 389A610002A;
 Fri, 27 Nov 2020 11:21:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D52E238DF9;
 Fri, 27 Nov 2020 11:21:13 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:12
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:59 +0100
Message-ID: <20201127102100.11721-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 9/9] log: call vsnprintf only when it is
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

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 common/log.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/common/log.c b/common/log.c
index a4ed7d79f8..767f0febc5 100644
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
 
@@ -243,12 +248,15 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 	rec.file = file;
 	rec.line = line;
 	rec.func = func;
+	rec.msg = NULL;
 
 	if (!(gd->flags & GD_FLG_LOG_READY)) {
 		gd->log_drop_count++;
 
 		/* display dropped traces with console puts and DEBUG_UART */
 		if (rec.level <= CONFIG_LOG_DEFAULT_LEVEL || rec.force_debug) {
+			char buf[CONFIG_SYS_CBSIZE];
+
 			va_start(args, fmt);
 			vsnprintf(buf, sizeof(buf), fmt, args);
 			puts(buf);
@@ -258,13 +266,11 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
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
