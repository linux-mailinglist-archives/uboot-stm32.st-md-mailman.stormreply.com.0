Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799615B01C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEEB8C36B10
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8156BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIgifm017922; Wed, 12 Feb 2020 19:45:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Eau3pLj/S13wvwqTjRgoQ0QUxIGH4WX+a5RizJiIf2g=;
 b=of62diUvXr1IFWfg2ZZ1mNN5EVYYOQ3OG6PWtxoa0H9Vv9fRL8oxPrleN7m5K6qIk1Pl
 DXqbDYLtkuf9YdDWqBlqB5DbaEZzFVC7rG/w9M1rPmW2fMO3LEs/OU68lBISewotUh8L
 Kyc3+88andsnRoavL5lN4G/oSmbTfpCYBDvbmNee9NxBWtRxaWHoO1BhDNWAtCTRyfle
 hO+ufJTZ3a695c+6yiMYYatWpBBG478A7/nsFKO7jsQSef678iq0Asai7Pv8MbIpOHV7
 vJoNl8juQoxnEp1CP3idRX3/01nBQntYT4INROKbcrFoDkptXG8RjEP11Cq9fwHRQ8Gj xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhgc8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84FC710003E;
 Wed, 12 Feb 2020 19:45:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D2302C60B1;
 Wed, 12 Feb 2020 19:45:05 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:04 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:44:53 +0100
Message-ID: <20200212184501.5911-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 02/10] env: ext4: set gd->env_valid
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

Add a missing initialization of gd->env_valid in env_ext4_load
as it is already done in some other env device.

Set gd->env_valid = ENV_VALID in env_ext4_save() and env_ext4_load().

This patch allows to have a correct information in 'env info' command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/ext4.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/env/ext4.c b/env/ext4.c
index 1f6b1b5bd8..e3bbf4a4e0 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -31,6 +31,8 @@
 #include <ext4fs.h>
 #include <mmc.h>
 
+DECLARE_GLOBAL_DATA_PTR;
+
 __weak const char *env_ext4_get_intf(void)
 {
 	return (const char *)CONFIG_ENV_EXT4_INTERFACE;
@@ -79,6 +81,7 @@ static int env_ext4_save(void)
 			CONFIG_ENV_EXT4_FILE, ifname, dev, part);
 		return 1;
 	}
+	gd->env_valid = ENV_VALID;
 
 	puts("done\n");
 	return 0;
@@ -125,7 +128,11 @@ static int env_ext4_load(void)
 		goto err_env_relocate;
 	}
 
-	return env_import(buf, 1);
+	err = env_import(buf, 1);
+	if (!err)
+		gd->env_valid = ENV_VALID;
+
+	return err;
 
 err_env_relocate:
 	env_set_default(NULL, 0);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
