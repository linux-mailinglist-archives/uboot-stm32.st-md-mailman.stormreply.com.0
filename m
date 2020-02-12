Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC715B01E
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87C07C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4942C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIgmZj006928; Wed, 12 Feb 2020 19:45:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sRgTt+DNzZN4jbjX6YFukilKONIqSquaLUztZ68fCSY=;
 b=WiNm2oobZYM8pvu82Gv4KHzzkYLugXeZpLguq+JCG9znP7AGGiwH8FIleG+U12E8gIwI
 oV4MAUAUx8Os9CnySnylKr61pwsG/zJS3S9+qSv3Re0+Cc8T4DYjt9nwlU+lBqJuFTr0
 uhRDITRLIv+n3ByKTljlUFwFtUBhgmWBMyKcAzqSk8iozChdZUGt5v56XF2clH4N6EfQ
 s3m/yHwi/3/lB5nmvcXTMwfd9Xdi65nToLIvjaXtC5bqPRz8lrg/ksW/2BF+DzJq+/AD
 3FpMB89qvnAiEDK/BAz56/IjhNkNskpdqOIEhxtZ63eqnvdCZDdtodkV2/kvLH5P/Kmv 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhg7pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 661B4100048;
 Wed, 12 Feb 2020 19:45:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E5332C60B1;
 Wed, 12 Feb 2020 19:45:09 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:08 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:44:58 +0100
Message-ID: <20200212184501.5911-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 07/10] env: ext4: fix possible
	compilation issue
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

Fix possible compilation issue in env ext4 support when
CONFIG_CMD_SAVEENV is not activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/ext4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/env/ext4.c b/env/ext4.c
index e3bbf4a4e0..aa77261649 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -144,5 +144,7 @@ U_BOOT_ENV_LOCATION(ext4) = {
 	.location	= ENVL_EXT4,
 	ENV_NAME("EXT4")
 	.load		= env_ext4_load,
+#ifdef CONFIG_CMD_SAVEENV
 	.save		= env_save_ptr(env_ext4_save),
+#endif
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
