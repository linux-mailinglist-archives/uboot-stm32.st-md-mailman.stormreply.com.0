Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F64636C5
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 15:34:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A17D8C597BA;
	Tue, 30 Nov 2021 14:34:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5A3DC06F81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 14:33:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AUDtaSW013252;
 Tue, 30 Nov 2021 15:33:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=cFMlgOY5+l5BtY4Gs2XodW4BgLMUqoxSaqs8MMy6cgU=;
 b=P2Es2E0KIl9wT4aniFnwlL99mvlB2SPlmjOX6zgMNZK1H2hyuKGnYQ5PWNsP3XiOUpsW
 WJkZ2KI5chlDtV+z/1kghj3hjiONyC5SG6Et0GQA9hSe1rLkOk9b1U/gBTOwi62VfJVU
 O/ZM1rgQNdMLdLDtJu+7hBuS4NKe9fRx5ZZDhfg+txRHXguVlJrKoz6O+y15QFcio5oX
 wLfZ89006Uw3lDNp6TpESCzxM+7YTX0IJX6s/AofTDiACqFUArRe+TXXKhuMcu81kYOO
 2s0RsBPd5v+FDLg8trI6Gt1pGcyk4vdR5JfCrSv136siTCQJW2z6kZTANUIS0BE+HgNd 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cn9y7uspd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 15:33:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D3AE10002A;
 Tue, 30 Nov 2021 15:33:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 776AD2A4D85;
 Tue, 30 Nov 2021 15:33:57 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov 2021 15:33:57
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Nov 2021 15:33:53 +0100
Message-ID: <20211130153342.1.I72cfa7337b8feb65ef2354983f4acd710ce57232@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_08,2021-11-28_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] test: test_lsblk: Mark as sandbox specific
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

This test checks for output specific to the sandbox blk device
"sandbox_host_blk", mark it as sandbox specific.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 test/py/tests/test_lsblk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/py/tests/test_lsblk.py b/test/py/tests/test_lsblk.py
index 40ffe01263..a719a48e6e 100644
--- a/test/py/tests/test_lsblk.py
+++ b/test/py/tests/test_lsblk.py
@@ -4,6 +4,7 @@
 
 import pytest
 
+@pytest.mark.boardspec('sandbox')
 @pytest.mark.buildconfigspec('blk')
 @pytest.mark.buildconfigspec('cmd_lsblk')
 def test_lsblk(u_boot_console):
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
