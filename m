Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F84C2C62EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5D11C56630;
	Fri, 27 Nov 2020 10:21:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47410C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAII8N019318; Fri, 27 Nov 2020 11:21:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PfXuoRTRMrd4iRExoOs/txhJsDLRxcei1mwgdaa7opg=;
 b=QmDqcIrIPCFO+kirwnlIz51d1lCDTXbxz0AHnDbi3GYicQklHKTty6GiH/PsdaUek+6E
 MjhaU+ctGWCtDbPbT5Ie37ZbiQvRuXvgLx+XuLrH4JN712c83+8cvrvz4tg+zEbc1qXg
 lLCTAYNECurs7kTrP4mUQVtooUWWXJwLqduxVFU0oO0MIDZET5Iqw3o+MD+TiQzVDGpq
 6YIP2kPPRMRXBA49OtSKomfT0hoIC6ld7C2X63UEx3JPaSpDOz47bbEpDxeE624fBObj
 QBqV9dOq3cKO5dtUJ/cI63MXsbgl56nRSz1lFZf7df9+X9ULsLgv56BqFVBsudb9Do9A 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d1xak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1914B10002A;
 Fri, 27 Nov 2020 11:21:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BBE8236CB6;
 Fri, 27 Nov 2020 11:21:07 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:06
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:52 +0100
Message-ID: <20201127102100.11721-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/9] log: don't build the trace buffer when
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

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 common/log.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/common/log.c b/common/log.c
index ce39918e04..212789d6b3 100644
--- a/common/log.c
+++ b/common/log.c
@@ -228,6 +228,9 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 	struct log_rec rec;
 	va_list args;
 
+	if (!gd)
+		return -ENOSYS;
+
 	/* Check for message continuation */
 	if (cat == LOGC_CONT)
 		cat = gd->logc_prev;
@@ -240,15 +243,15 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
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
