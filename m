Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C25175A5C
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 13:22:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B988C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 12:22:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AF9AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 12:22:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022CDjbp031948; Mon, 2 Mar 2020 13:22:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=7JQ46RpdW9PixpGbBfCC0fi8GCFzoHwajfpoWj8s2gE=;
 b=MqyJWef7c4zPndhhR+CikoX9D/dqzKfshmaBTju++UNzPMGuy3dpUYuxB/5HbA7iwAiO
 G5I0jVpf7sN3/wuB8LuCf6flSDjT0S6wJ/jL1stFnVmzD6cICRlBEH9gq1rYOz0rT1aq
 2SEv9RUR5VcZH0xaE7Qt/CR/kyH0Q20Sd1khVkg7iKK2zUq3kLaqD9wg+yKi2LMQECds
 r68qp6TmCUMqLZejeMz37vsKR9OlRsmGsUw1rYruSeydPGUFVK2RYfutWXAoad/fD31I
 ABy7xqq8jeKjIDTN6tOjnmq9Dk1M2ZGBLBiGJdMajKZ5ZZZo+Y1V4Abrdb+aFTx+itaJ yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqpkau1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 13:22:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E38010003B;
 Mon,  2 Mar 2020 13:22:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 700192C2467;
 Mon,  2 Mar 2020 13:22:00 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 2 Mar 2020 13:22:00 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 2 Mar 2020 13:21:53 +0100
Message-ID: <20200302122153.20670-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-03-02,
 2020-03-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] tee: optee: use dev_info in print_os_revision
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

Display TEE version at information level; this patch replaces
debug() call to dev_info() in print_os_revision() function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/tee/optee/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 9fb5e658f9..5260dab3ac 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -512,7 +512,7 @@ static bool is_optee_api(optee_invoke_fn *invoke_fn)
 	       res.a2 == OPTEE_MSG_UID_2 && res.a3 == OPTEE_MSG_UID_3;
 }
 
-static void print_os_revision(optee_invoke_fn *invoke_fn)
+static void print_os_revision(struct udevice *dev, optee_invoke_fn *invoke_fn)
 {
 	union {
 		struct arm_smccc_res smccc;
@@ -527,11 +527,12 @@ static void print_os_revision(optee_invoke_fn *invoke_fn)
 		  &res.smccc);
 
 	if (res.result.build_id)
-		debug("OP-TEE revision %lu.%lu (%08lx)\n", res.result.major,
-		      res.result.minor, res.result.build_id);
+		dev_info(dev, "OP-TEE: revision %lu.%lu (%08lx)\n",
+			 res.result.major, res.result.minor,
+			 res.result.build_id);
 	else
-		debug("OP-TEE revision %lu.%lu\n", res.result.major,
-		      res.result.minor);
+		dev_info(dev, "OP-TEE: revision %lu.%lu\n",
+			 res.result.major, res.result.minor);
 }
 
 static bool api_revision_is_compatible(optee_invoke_fn *invoke_fn)
@@ -626,7 +627,7 @@ static int optee_probe(struct udevice *dev)
 		return -ENOENT;
 	}
 
-	print_os_revision(pdata->invoke_fn);
+	print_os_revision(dev, pdata->invoke_fn);
 
 	if (!api_revision_is_compatible(pdata->invoke_fn)) {
 		debug("%s: OP-TEE api revision mismatch\n", __func__);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
