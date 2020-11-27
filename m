Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 969752C62ED
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64B74C56630;
	Fri, 27 Nov 2020 10:21:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8320BC56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAIIeT019306; Fri, 27 Nov 2020 11:21:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=eM2g3/SHdnMTbmY5/XCiS4vTv62JdfGwh6urz+HWS0M=;
 b=jc7cO4gwaUTgSdg3Vq+h6tcbUMM4MeeiaxwCfyvNdJEvc+E7JPQK7WMqaegpdZtoiHYS
 0R5gRPao+UCmqbDnV5acxV+86T0TkBJXbqvNTRm0UDVvxuQfkG4tTaXh3w7uCavWMioR
 GnuKPaiWwncKrnLh3q4YmXO+dB7UmpOYRW9WmVQnZw9RA03+c4nNaNGmQA1EkF3JFYHD
 FSZwqnw9C27fLn5osCtP1ztdNMSq0vAHc3kJIX5ldZMQPZGLMGGLcsprELDEa74z6K/3
 FPnm7OmeA1+k69js+8AVsa89b3vr2ba5+F2KV7iIHJQ2NzIMBqMaNSFMrnd74nXV0k5b Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d1xaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07B62100039;
 Fri, 27 Nov 2020 11:21:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB944238DE6;
 Fri, 27 Nov 2020 11:21:08 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:08
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:54 +0100
Message-ID: <20201127112000.v2.4.I01167328d604e359d69c0d241754caeec1f65ebe@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 4/9] log: use console puts to output trace
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

Use the console puts functions to output the traces before
the log initialization (when CONFIG_LOG is not activated).

This patch allows to display the first U-Boot traces
(with macro debug) when CONFIG_DEBUG_UART is activated
and not only drop them.

For example for traces in board_f.c requested by the macro debug,
when LOG_DEBUG is defined and CONFIG_LOG is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- replace printascii by console puts, remove test on CONFIG_DEBUG_UART

 common/log.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/common/log.c b/common/log.c
index 212789d6b3..a4ed7d79f8 100644
--- a/common/log.c
+++ b/common/log.c
@@ -246,6 +246,15 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
 
 	if (!(gd->flags & GD_FLG_LOG_READY)) {
 		gd->log_drop_count++;
+
+		/* display dropped traces with console puts and DEBUG_UART */
+		if (rec.level <= CONFIG_LOG_DEFAULT_LEVEL || rec.force_debug) {
+			va_start(args, fmt);
+			vsnprintf(buf, sizeof(buf), fmt, args);
+			puts(buf);
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
