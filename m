Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544B10FA00
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2019 09:38:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B6D4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2019 08:38:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFD21C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2019 08:38:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB38aq5P004482; Tue, 3 Dec 2019 09:38:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Z9HNoPl6fyZR2xcfWdHUSHYt9ahcUkC5x3cqKkJjpAA=;
 b=xsSDXeo9WuceFgnT05a/ZrZac14JTGFguH3gv1FSfvZRl0xTE0WdhLoqElcMIOwDEQFI
 8SWfZht1yFHuzZ+eirn4umKxOODKza3hW+6MSyRH7S7AvdMQ2gNCb5oD8Zif5ohv/7HL
 oY5OorLlIN2eQD/IRh29VKgzHa5EQrfB5zFtcXLff8MBUNP83P+a9JHPpxt0MXkwLhFe
 E6VH6IQYlZ2NkMr1DlzgDjryM1oKZ6mrjOn9hjTw1uAHK8AV5SMZz5h9xfUzF5rkIWSH
 y1WKAewh71KTy6b7mmt5EUd7wt0BuuNQ1nbg2UIDcprGG47yDp8WhZGbmdYjxHXiyByh XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkee9xcm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 09:38:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C1FE100034;
 Tue,  3 Dec 2019 09:38:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 912C32A8D1E;
 Tue,  3 Dec 2019 09:38:41 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 3 Dec 2019 09:38:41 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Dec 2019 09:38:35 +0100
Message-ID: <20191203083835.6898-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_01:2019-11-29,2019-12-03 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] cmd: pxe: execute the cls command only when
	supported
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

Execute the command cls (for clear screen), when the "menu background"
keyword is present in extlinux.conf file, only if the command is supported.

This patch avoid the warning "Unknown command 'cls'"
with "menu background" in extlinux.conf when CONFIG_CMD_BMP is activated
and CONFIG_CMD_CLS not activated (default for CONFIG_DM_VIDEO).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/pxe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cmd/pxe.c b/cmd/pxe.c
index 2059975446..b62cb79b3a 100644
--- a/cmd/pxe.c
+++ b/cmd/pxe.c
@@ -1592,7 +1592,8 @@ static void handle_pxe_menu(cmd_tbl_t *cmdtp, struct pxe_menu *cfg)
 	/* display BMP if available */
 	if (cfg->bmp) {
 		if (get_relfile(cmdtp, cfg->bmp, load_addr)) {
-			run_command("cls", 0);
+			if (CONFIG_IS_ENABLED(CMD_CLS))
+				run_command("cls", 0);
 			bmp_display(load_addr,
 				    BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
 		} else {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
