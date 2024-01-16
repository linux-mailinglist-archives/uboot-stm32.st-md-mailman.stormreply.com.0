Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFB082F208
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jan 2024 16:59:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E41C6B476;
	Tue, 16 Jan 2024 15:59:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81FB2C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 15:59:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GBQWFR027685
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jan 2024 16:59:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=WfIgy9u
 GT3218cTFQtUs2UmViIejqsFqE+CAFcqENPs=; b=nNPyyrPvaRiXHKPRc9Lny5h
 MQTI93XfX6pCZKy6S9FbxxeYD0d9TgzMVkmWrFnCV4dvoQ9vtG7YweY5NCNWXzUH
 qxm+++ta541z/HlVfLUVn3Xkblw0G88GbzMMczroVa90ItVjCr7cQh2keOv3eyf9
 biXKgrPjviB4mAX0MHyYOSM7BhJL5dTNE5e0z4xxmtlVPCpev9JSXVds8pSFvQZ0
 CARpspPK6q6IA+R3YG2j1dt8S0EjggupA/DV1eNoXzObD15GkaFaqIyBS63pA6rr
 C7HQGsaZH2E8g7JrrOElHZZb516/mgCZyweMwqKmlelCOW8B5lmLSssJHbMFPyQ=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddy4u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:59:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B050410002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:59:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 219AD2747B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:59:52 +0100 (CET)
Received: from localhost (10.201.20.205) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 16 Jan
 2024 16:59:51 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Date: Tue, 16 Jan 2024 16:59:49 +0100
Message-ID: <20240116155949.735390-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [U-BOOT internal][PATCH] common: console: Fix print
	complete stdio device list
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

In case CONSOLE_MUX and SYS_CONSOLE_IS_IN_ENV are on and
stdin or stdout or stderr are missing in environment, as fallback, get
these either from stdio_devices[std] or stdio_devices[std]->name.

Fixes: 6b343ab38d ("console: Print out complete stdio device list")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 common/console.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/common/console.c b/common/console.c
index cad65891fc9..a5406124c98 100644
--- a/common/console.c
+++ b/common/console.c
@@ -1049,6 +1049,11 @@ int console_clear(void)
 	return 0;
 }
 
+static char *get_stdio(const u8 std)
+{
+	return stdio_devices[std] ? stdio_devices[std]->name : "No devices available!";
+}
+
 static void stdio_print_current_devices(void)
 {
 	char *stdinname, *stdoutname, *stderrname;
@@ -1060,19 +1065,13 @@ static void stdio_print_current_devices(void)
 		stdoutname = env_get("stdout");
 		stderrname = env_get("stderr");
 
-		stdinname = stdinname ? : "No input devices available!";
-		stdoutname = stdoutname ? : "No output devices available!";
-		stderrname = stderrname ? : "No error devices available!";
+		stdinname = stdinname ? : get_stdio(stdin);
+		stdoutname = stdoutname ? : get_stdio(stdout);
+		stderrname = stderrname ? : get_stdio(stderr);
 	} else {
-		stdinname = stdio_devices[stdin] ?
-			stdio_devices[stdin]->name :
-			"No input devices available!";
-		stdoutname = stdio_devices[stdout] ?
-			stdio_devices[stdout]->name :
-			"No output devices available!";
-		stderrname = stdio_devices[stderr] ?
-			stdio_devices[stderr]->name :
-			"No error devices available!";
+		stdinname = get_stdio(buf, stdin);
+		stdoutname = get_stdio(buf, stdout);
+		stderrname = get_stdio(buf, stderr);
 	}
 
 	/* Print information */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
