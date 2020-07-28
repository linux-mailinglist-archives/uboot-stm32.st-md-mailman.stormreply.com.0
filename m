Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4923039A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:13:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47E63C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 07:13:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84D02C36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:13:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7CF0h012904; Tue, 28 Jul 2020 09:13:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0Q0FtfZhjks3Zo/UTc04WLyKLm3mIZqwkc6P4rK5YK4=;
 b=ktcY8yGdZGdEGt/UfoyGt3a9nvrVgdYlWtjGw7fMyvSx5Dd7RIUCR5+d2qJkjZJ9zaUS
 BrnwpOrAIAtY6J0ym6oUWTxEZ5KhhaiD+HX6+Xlo2M7BJCpRw/odlJOviY1zL1nC4g60
 vgRz3RHEOHppGfO49ze+Y5c5r1ATIAZ7pXOEBNhFwfz0Et6AtC8hb2iVWoZ8vqj/FTqM
 WT3nAUzte5qP5vzQIXvd8Tpcuob64TOFDSFUip1Zv/yMMLx3Qqw11GaNUyL/gF+IGs+v
 Ccn6XQcCoWIo4ZvQ96A0thvnc8KIxyRYQvnwXJ0ACiKKpjpuZc98FXRG5zBilB8Uc1tN gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71vvfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:13:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CAE9B10002A;
 Tue, 28 Jul 2020 09:13:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0D4021E690;
 Tue, 28 Jul 2020 09:13:43 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 09:13:43 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 09:13:34 +0200
Message-ID: <20200728071335.5840-5-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728071335.5840-1-patrice.chotard@st.com>
References: <20200728071335.5840-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Walter Lozano <walter.lozano@collabora.com>
Subject: [Uboot-stm32] [PATCH v5 4/5] test/py: Update test_bind
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

As bind-test is now binded at sandbox startup and no more by
test_bind.py, bind-test nodes are not located at the end of
"dm tree" output, but can be located everywhere in the tree, so
bind-test output could either be:

 simple_bus    0  [   ]   generic_simple_bus    |-- bind-test
 phy           0  [   ]   phy_sandbox           |   |-- bind-test-child1
 simple_bus    1  [   ]   generic_simple_bus    |   `-- bind-test-child2

or:

 simple_bus    5  [   ]   generic_simple_bus    `-- bind-test
 phy           2  [   ]   phy_sandbox               |-- bind-test-child1
 simple_bus    6  [   ]   generic_simple_bus        `-- bind-test-child2

in_tree() function need to be updated to take care of that change.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

(no changes since v3)

Changes in v3:
  - fix typo

 test/py/tests/test_bind.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/test/py/tests/test_bind.py b/test/py/tests/test_bind.py
index 1de125ce45..5e73d40361 100644
--- a/test/py/tests/test_bind.py
+++ b/test/py/tests/test_bind.py
@@ -7,13 +7,16 @@ import re
 
 def in_tree(response, name, uclass, drv, depth, last_child):
 	lines = [x.strip() for x in response.splitlines()]
-	leaf = ' ' * 4 * depth;
-	if not last_child:
-		leaf = leaf + r'\|'
-	else:
-		leaf = leaf + '`'
+	leaf = ''
+	if depth != 0:
+		leaf = '   ' + '    ' * (depth - 1) ;
+		if not last_child:
+			leaf = leaf + r'\|'
+		else:
+                        leaf = leaf + '`'
+
 	leaf = leaf + '-- ' + name
-	line = (r' *{:10.10}    [0-9]*  \[ [ +] \]   {:20.20}  {}$'
+	line = (r' *{:10.10}    [0-9]*  \[ [ +] \]   {:20.20}  [` |]{}$'
 	        .format(uclass, drv, leaf))
 	prog = re.compile(line)
 	for l in lines:
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
