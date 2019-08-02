Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC37F7A4
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 14:58:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50B0DC35E04
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:58:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F2E5C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 12:58:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72Cv9G5021008; Fri, 2 Aug 2019 14:58:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PIHjPk9fiRq5IDIMsKp7ZxF62Fbt/Q46LD24q7oKcO4=;
 b=DJhbdG4tlWoaDWNSWLWVbSiuIpLi2IPCSe4Yt5rICXbUA5jSAWgDjdoes9MwZ+wHv5D8
 +BxJNcoaFTQbQspKvuN2+lS3jtHjhvU1CmuAnnGzbVyzIiBDft5E72eSE87Gwo2GDbHF
 AghtxlyAjurQFH10FUfX/hqa15Wy0j0244d9r8/j7NLbGwETXX7ufIKMQjM5Kwfwlkjc
 C2MLE5LSkmXCh5/nrPo5Kkt9WEaGwIEcrYoBCZc18awOixXj1CDia38By7WSN1ZnATve
 NVEwrcHaWxjmSiiZ3FcoXVrA02mmR13QO1O/zgCzaiGMNT8Mx/5lp45x+VDcOSSubq49 Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4uqq4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:58:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B699531;
 Fri,  2 Aug 2019 12:58:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE4D82C3271;
 Fri,  2 Aug 2019 14:58:14 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 14:58:14 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:58:13
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 14:58:09 +0200
Message-ID: <20190802125810.9808-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802125810.9808-1-patrice.chotard@st.com>
References: <20190802125810.9808-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] console: update silent tag after env load
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Update the "silent" property with the variable "silent" get from
saved environment, it solves the issue when:
- CONFIG_SILENT_CONSOLE and CONFIG_SYS_CONSOLE_IS_IN_ENV are activated
- silent is not defined in default environment
- silent is requested in saved environment with:
  > env set silent 1; env save

On next reboot the console is not disabled as expected after relocation
and the environment load from flash (the callback is not called when
the INSERT is requested in the created hash table)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 common/console.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/common/console.c b/common/console.c
index 0b0dd76256..7b45403bb3 100644
--- a/common/console.c
+++ b/common/console.c
@@ -793,6 +793,9 @@ int console_init_r(void)
 	int iomux_err = 0;
 #endif
 
+	/* update silent for env loaded from flash (initr_env) */
+	console_update_silent();
+
 	/* set default handlers at first */
 	gd->jt->getc  = serial_getc;
 	gd->jt->tstc  = serial_tstc;
@@ -884,6 +887,7 @@ int console_init_r(void)
 	struct list_head *pos;
 	struct stdio_dev *dev;
 
+	/* update silent for env loaded from flash (initr_env) */
 	console_update_silent();
 
 #ifdef CONFIG_SPLASH_SCREEN
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
