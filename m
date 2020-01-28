Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D014B1F5
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:44:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54806C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:44:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60D8EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:44:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9gaqp015643; Tue, 28 Jan 2020 10:44:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9eKOfZjfYePOJPnGG6hXwOr/DxWGQK2TJdFOe616Ao8=;
 b=jHaE8kqm+V7vJYpyFJTpzJnmaX3t/hTrIZbniEoxQBOSS4sFJi+LP1cDmetTu5noil/d
 027vRFUXudkvndeiZZ3WSFzzjJLXVg6vVN4fhBMRLUUUAatWXf7/appBZiSYlxwfouI+
 P/iypGOtXeCJCw96/+Az2pmMKVWfrdsZBK5d909Ga/xRJKl/vgy2XgGST04XL7hMeG0k
 5kVKYAbl1eRyH+Zl59+Jep6LMPiFuO2ae5yh57YEqqyX6jX/PUhQd3ismnG53n4938kM
 tHYPCS38kHDL92rjqUvM4wyIDlDUwJRixcd6QNk/0toe4zZlvq7QuEjBtpyHp4RWywpa NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekd10d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:44:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7653810003B;
 Tue, 28 Jan 2020 10:44:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 705A921CA8C;
 Tue, 28 Jan 2020 10:44:19 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:44:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:44:13 +0100
Message-ID: <20200128094415.5768-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128094415.5768-1-patrick.delaunay@st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/4] board: stm32mp1: change dfu function to
	static
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

Change the dfu functions dfu_otp_read and dfu_pmic_read to static,
this patch avoids warning when compiling with W=1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 2fecfc1b16..b6b70ce20f 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -1010,7 +1010,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
 #include <dfu.h>
 #include <power/stpmic1.h>
 
-int dfu_otp_read(u64 offset, u8 *buffer, long *size)
+static int dfu_otp_read(u64 offset, u8 *buffer, long *size)
 {
 	struct udevice *dev;
 	int ret;
@@ -1030,7 +1030,7 @@ int dfu_otp_read(u64 offset, u8 *buffer, long *size)
 	return 0;
 }
 
-int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
+static int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
 {
 	int ret;
 #ifdef CONFIG_PMIC_STPMIC1
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
