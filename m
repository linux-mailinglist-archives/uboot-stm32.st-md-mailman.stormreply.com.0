Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A462A9B4E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 18:55:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CCB7C3FAE2;
	Fri,  6 Nov 2020 17:55:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95A70C3FAD9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 17:55:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hm993026881; Fri, 6 Nov 2020 18:55:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Q/FuSe6MrF9sAEIINJEgq2sS6l/2AW8JVAHeDqsIyP8=;
 b=GSJL3bC3mVPuPgq8Z+WK9yJ1YXP4xfsU8gQaObSByk7ZJL0ymKX7MPOkm8JhSr7phXqd
 NiaQt7D13GvFJu10ioV4c66GeuZloudC6KdPH+phAnVqse7xxP3r5rO6effjKEROKZKt
 ALCuMoiv6GD10p1AB3CC5DrZgk6L8zn8DDxnDZBl37JmiNhCcVVrObyyWpJiqKBwhdO+
 6U0tWOI6e/51TyZDwmiN7Jqnnn7kQ48nO0RAZdsTbPYGQyqyyRItowWYq2K9wCAFHvHh
 4cIZqXgYWwyROwQZgu9vh1wtuId+QwP2jOs/twR0YDwwEC+TfkmobJbajNG0S8Bq4SVN 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xfdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 18:55:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 039BC10002A;
 Fri,  6 Nov 2020 18:55:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECA402150F7;
 Fri,  6 Nov 2020 18:55:08 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 18:55:08
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 18:53:37 +0100
Message-ID: <20201106175339.30683-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] log: don't build the trace buffer when
	log is not ready
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

Update _log function to drop any traces when log is yet initialized:
vsnprintf is no more executed in this case.

This patch allows to reduce the cost for the dropped early debug trace.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/log.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/common/log.c b/common/log.c
index 4b6f3fcd04..aadf533fb2 100644
--- a/common/log.c
+++ b/common/log.c
@@ -227,6 +227,9 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 	struct log_rec rec;
 	va_list args;
 
+	if (!gd)
+		return -ENOSYS;
+
 	/* Check for message continuation */
 	if (cat == LOGC_CONT)
 		cat = gd->logc_prev;
@@ -239,15 +242,15 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 	rec.file = file;
 	rec.line = line;
 	rec.func = func;
+
+	if (!(gd->flags & GD_FLG_LOG_READY)) {
+		gd->log_drop_count++;
+		return -ENOSYS;
+	}
 	va_start(args, fmt);
 	vsnprintf(buf, sizeof(buf), fmt, args);
 	va_end(args);
 	rec.msg = buf;
-	if (!gd || !(gd->flags & GD_FLG_LOG_READY)) {
-		if (gd)
-			gd->log_drop_count++;
-		return -ENOSYS;
-	}
 	if (!log_dispatch(&rec)) {
 		gd->logc_prev = cat;
 		gd->logl_prev = level;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
