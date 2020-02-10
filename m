Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907D158059
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 18:01:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC9D4C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 17:01:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CDE5C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 17:01:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AGvu1Z015443; Mon, 10 Feb 2020 18:01:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Y0KRAb9B0rTTmmK6MQvN4AAXGdYvSrnOAbCTQN5f/v4=;
 b=Vhrsmcl/jQPC9noMiEs1RjAe8Eb4JFVgaUxFVefCbSTflU/2908Ajx8XwkAo3dbmYT5k
 G/xPkwy5pdqV71Rzhw2lX3k857CUNnXFh7pfZ24DVRJ6feMALovmBMD5sYHk7ffTT/Rp
 jZ3P7Of6j0zuzThof0CILZ5YthDmVk3bA7c6NGnQh2/guvTA+IYCPMPV1g//TC0yn7em
 gHZ6pkVdrbNuFlEM0lq88E+UQHPtKq7rxcWAGS0L4t3rriPcCaiiR+G7fjhOXIwuOhAi
 95Z1p2twHpxbpD+/pChyr2CTYgw3gBcgIMkrlfo1cdUZ35R7kq13ae0xOHlaQCBRfvD6 Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufgv1x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 18:01:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DBA710003E;
 Mon, 10 Feb 2020 18:01:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C77C22B8527;
 Mon, 10 Feb 2020 18:01:35 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 10 Feb 2020 18:01:35 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Feb 2020 18:01:27 +0100
Message-ID: <20200210180110.v2.5.I046b0e4545c19bc694c49987cc149b47c4816c09@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210170129.8405-1-patrick.delaunay@st.com>
References: <20200210170129.8405-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 5/7] stm32mp1: configs: activate
	CMD_ERASEENV
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

Activate the command env erase to reset the environment with the command:
> env erase

it is simpler than:
> env default -a
> env save

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_optee_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index f691306800..1fffffd23a 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -26,6 +26,7 @@ CONFIG_SYS_PROMPT="STM32MP> "
 # CONFIG_CMD_XIMG is not set
 # CONFIG_CMD_EXPORTENV is not set
 # CONFIG_CMD_IMPORTENV is not set
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_ADC=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 521b24e2cb..c2006291f1 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -15,6 +15,7 @@ CONFIG_SYS_PROMPT="STM32MP> "
 # CONFIG_CMD_XIMG is not set
 # CONFIG_CMD_EXPORTENV is not set
 # CONFIG_CMD_IMPORTENV is not set
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_ADC=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index c8b328d01a..fc6e6a555e 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -14,6 +14,7 @@ CONFIG_SYS_PROMPT="STM32MP> "
 # CONFIG_CMD_XIMG is not set
 # CONFIG_CMD_EXPORTENV is not set
 # CONFIG_CMD_IMPORTENV is not set
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_ADC=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
