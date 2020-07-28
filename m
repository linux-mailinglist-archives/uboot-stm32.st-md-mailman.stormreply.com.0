Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9D2306F6
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:51:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55E92C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:51:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21D1CC36B2C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:51:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S9nh3V000662; Tue, 28 Jul 2020 11:51:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=c2EW0DcG85PrnpWpXOypq0ARi0qitezqSmaW747I800=;
 b=XN7wJ1SHSRY3bTIzl741BXnHk9j1/gYyjcjLjf1SFTMMzvluOyu9/oAxRs3FahCJu8D6
 45wc1w1sznRNdgtkfbsq9uO2qcOlzfvEVQoF/BICzikbXKuDkQ+ZFvKpNYFhcddX3ttT
 SV8IIrW2m1gw0cBaH8rAQww3+02T6XsJGWqKuvT8+agrA6ZaJzd/R9lITMdxiTJ4vOAu
 JsctIlQP6/EUebTJp0uIHA/DyhrNcZI0xhSa9ZpuCTEwfLH3KDLz5z5aI6N069jGZj3N
 FQYsYKP/dGdZdqmQaM/PWmvFC/vLGNhnhRKiTkafQuZKr0CY9lk8/Q5bYRdBGUa6m3jT lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv5hsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:51:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECC0710002A;
 Tue, 28 Jul 2020 11:51:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2D4B2A70DA;
 Tue, 28 Jul 2020 11:51:38 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 11:51:38 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 11:51:18 +0200
Message-ID: <20200728095128.2363-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728095128.2363-1-patrick.delaunay@st.com>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 05/14] env: nowhere: add .load ops
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

Add the ops .load for nowhere ENV backend to load the
default environment.

This ops is needed for the command 'env load'

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4:
- don't use env_import in SPL to avoid to increase its size
  as it is only required for 'env load' command

Changes in v3:
- new: add load ops in nowhere

 env/nowhere.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/env/nowhere.c b/env/nowhere.c
index f5b0a17652..d33fdf27d0 100644
--- a/env/nowhere.c
+++ b/env/nowhere.c
@@ -27,8 +27,25 @@ static int env_nowhere_init(void)
 	return 0;
 }
 
+static int env_nowhere_load(void)
+{
+	/*
+	 * for SPL, set env_valid = ENV_INVALID is enougth as env_get_char()
+	 * return the default env if env_get is used
+	 * and SPL don't used env_import to reduce its size
+	 * For U-Boot proper, import the default environment to allow reload.
+	 */
+	if (!IS_ENABLED(CONFIG_SPL_BUILD))
+		env_set_default(NULL, 0);
+
+	gd->env_valid	= ENV_INVALID;
+
+	return 0;
+}
+
 U_BOOT_ENV_LOCATION(nowhere) = {
 	.location	= ENVL_NOWHERE,
 	.init		= env_nowhere_init,
+	.load		= env_nowhere_load,
 	ENV_NAME("nowhere")
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
