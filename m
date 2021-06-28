Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BC3B5E84
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:56:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E287C597AA;
	Mon, 28 Jun 2021 12:56:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90EE1C597B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:56:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCqsRR000415; Mon, 28 Jun 2021 14:56:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=udZx0N7zCxmXMdwwtqsETQmF+qYXV+35ev9oSctMCMc=;
 b=KlrvLX8zCJ1nUo3kTEF5ydL+eWVHs9nF9lEsNFFAhTJNJOsml9V1sbny4++rZ0J+//xb
 ICl8l+uYWv1GwPnmV29IiWoy7c9GURgCYdG18UOxNhwiGasYZlsNWRCtiqC5P/loBhYM
 pk204WLPRKS98Kjaa6yM8EOf1Wujm6M+yPjpija6Wvsk5dmuAENRC9sF2lQC7UWGqPwh
 B679QIFrkwDpVslZx1WnMPc5etSSWH9xQROfUsaa0mN6Bq3gP1SQlmH4yVNemQUv28s3
 APp4voTsOrWLiRGmppQxWXIUzC85Uto+fu2NpgOp+LW8+7kl26ILgVjFK4egTmYjlHQi Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39f1xsktwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:56:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E38B10002A;
 Mon, 28 Jun 2021 14:56:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 058E221ED37;
 Mon, 28 Jun 2021 14:56:15 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:56:14
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:56:03 +0200
Message-ID: <20210628145519.7.Ice24ec3430539077cefa5a43cb6245847db3871e@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 7/7] stm32mp: cmd_stm32key: add subcommand
	close
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

The expected sequence to close the device

1/ Load key in DDR with any supported load command
2/ Update OTP with key: STM32MP> stm32key read <addr>

At this point the device is able to perform image authentication but
non-authenticated images can still be used and executed.
So it is the last moment to test boot with signed binary and
check that the ROM code accepts them.

3/ Close the device: only signed binary will be accepted !!
   STM32MP> stm32key close

Warning: Programming these OTP is an irreversible operation!
         This may brick your system if the HASH of key is invalid

This command should be deactivated by default in real product.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32key.c | 54 ++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 8c8d476b65..50840b0f38 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -210,10 +210,60 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 	return CMD_RET_SUCCESS;
 }
 
+static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
+{
+	bool yes, lock, closed;
+	struct udevice *dev;
+	u32 val;
+	int ret;
+
+	yes = false;
+	if (argc == 2) {
+		if (strcmp(argv[1], "-y"))
+			return CMD_RET_USAGE;
+		yes = true;
+	}
+
+	ret = read_hash_otp(!yes, &lock, &closed);
+	if (ret) {
+		if (ret == -ENOENT)
+			printf("Error: OTP not programmed!\n");
+		return CMD_RET_FAILURE;
+	}
+
+	if (closed) {
+		printf("Error: already closed!\n");
+		return CMD_RET_FAILURE;
+	}
+
+	if (!lock)
+		printf("Warning: OTP not locked!\n");
+
+	if (!yes && !confirm_prog())
+		return CMD_RET_FAILURE;
+
+	ret = get_misc_dev(&dev);
+	if (ret)
+		return CMD_RET_FAILURE;
+
+	val = STM32_OTP_CLOSE_MASK;
+	ret = misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4);
+	if (ret != 4) {
+		printf("Error: can't update OTP\n");
+		return CMD_RET_FAILURE;
+	}
+
+	printf("Device is closed !\n");
+
+	return CMD_RET_SUCCESS;
+}
+
 static char stm32key_help_text[] =
 	"read [<addr>]: Read the hash stored at addr in memory or in OTP\n"
-	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n";
+	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n"
+	"stm32key close [-y] : Close the device, the hash stored in OTP\n";
 
 U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text,
 	U_BOOT_SUBCMD_MKENT(read, 2, 0, do_stm32key_read),
-	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse));
+	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse),
+	U_BOOT_SUBCMD_MKENT(close, 2, 0, do_stm32key_close));
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
