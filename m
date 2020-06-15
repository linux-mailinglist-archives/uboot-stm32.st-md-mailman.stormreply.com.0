Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B750B1F9436
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 12:03:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CB60C36B11
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 10:03:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B524BC36B11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 10:03:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F9vohh000522; Mon, 15 Jun 2020 12:02:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=80HcLSYRoilyrOInT09Tc8weQRWXw4JHGmbjomUPfy4=;
 b=dm7CgHP+ogAA+xeBuvPOlwVeBOhYdZn1Ccl/rkgzh0P9k5xN3pT0t/ycoT3W5F6M1VLR
 LBc4mWGCJZkMyZdaT+LDP0H+P1AINFgfB67TCbKKF8j3h8eu6vt+ThFZ5kAil5J9sKz3
 5s29MQ0LtCUSXpV7YjqO3RkrM4KGUvXitg8k5IC+g9qArgteRa/6Bxf7nv81EwFI+zOq
 SvDnqHzkQEF/Bt99FoJ94uEsTgtxnUsk5+5tMwBGAsFJw8H691EsnWox4ZtUf4e35SHC
 m2E5vCFBkTwu2schz5JoisyQB9ahNq1F+q4aCVWDJXotMFgDE+qXLYdlTuiad9cWibiw Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx914em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:02:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7085C10002A;
 Mon, 15 Jun 2020 12:02:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 552082C38CA;
 Mon, 15 Jun 2020 12:02:48 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 12:02:47 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 12:02:45 +0200
Message-ID: <20200615100246.19616-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] cmd: env: use ENV_IS_IN_DEVICE in env info
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

Use the define ENV_IS_IN_DEVICE to test if one the
CONFIG_ENV_IS_IN_...  is defined and correct the detection of
persistent storage support in the command "env info"
if CONFIG_ENV_IS_NOWHERE is activated.

Since commit 60d5ed2593c9 ("env: allow ENV_IS_NOWHERE with
other storage target") test CONFIG_ENV_IS_NOWHERE is not
enough; see also commit 953db29a1e9c6 ("env: enable saveenv
command when one CONFIG_ENV_IS_IN is activated").

This patch avoids issue for this command in stm32mp1 platform.

Previously sent in serie
cmd: env: add option for quiet output on env info
http://patchwork.ozlabs.org/project/uboot/list/?series=158105

Resend as separate serie.

END

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

 cmd/nvedit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 08d49df220..49338b4d36 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1265,7 +1265,7 @@ static int do_env_info(struct cmd_tbl *cmdtp, int flag,
 
 	/* evaluate whether environment can be persisted */
 	if (eval_flags & ENV_INFO_IS_PERSISTED) {
-#if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
 		printf("Environment can be persisted\n");
 		eval_results |= ENV_INFO_IS_PERSISTED;
 #else
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
