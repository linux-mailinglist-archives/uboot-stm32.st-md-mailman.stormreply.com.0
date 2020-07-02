Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A9212842
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 17:44:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 799B4C36B26
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 15:44:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A497CC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 15:43:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062Fc4KY031958; Thu, 2 Jul 2020 17:43:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hyvTs2nWOiFi/7iHt3W4JkyptACN8YvLJeppUgjbwtA=;
 b=kQsWDgIAc9y8WRvKbw41wGQa/kX9lyHLgSicKCip/9WFKffh2Yw2jLDqRIhEMkd+/fnX
 6xWHlycuExlokpZXHfrxJswCdsgQaZBB9vYVqHhKJQovhg4lGlq4ZFunpuHKNUxbapUQ
 KQ9jw35kNJtIQck97L8Q396HxeAgE/HIUmcxMIHNrvUhn5uI/d+kuCrr1AOx+GcAs29s
 qUfYHC9T4d1z4XSDezZpxwr1qheFKNSf2GdYs9f0oWhSnE84SwdE41AyB8gimkgZo65S
 WI92zwEPOcmTVeMCIeiqZTvtYGC3QzBLVKwlV2z7xNzPJN1eJm3zijaoe6yvswwwlqg2 iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1s2dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 17:43:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66BC110002A;
 Thu,  2 Jul 2020 17:43:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5476E2BF9DA;
 Thu,  2 Jul 2020 17:43:49 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 2 Jul 2020 17:43:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jul 2020 17:43:44 +0200
Message-ID: <20200702154345.8436-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] cmd: env: use ENV_IS_IN_DEVICE in env
	info
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---
Previously sent in serie
cmd: env: add option for quiet output on env info
http://patchwork.ozlabs.org/project/uboot/list/?series=158105

Resend as separate serie.

Changes in v2:
- correct commit message (commit-notes) and add review by Patrice

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
