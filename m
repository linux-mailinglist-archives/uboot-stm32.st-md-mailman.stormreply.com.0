Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861B1BDBE5
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 14:20:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D4D8C36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 12:20:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC4B5C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 12:20:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TCIW9w007777; Wed, 29 Apr 2020 14:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DKjonccCA9lFhR2lBdQoFF7+YqU/s6SV0LC67L/yc/E=;
 b=YDL+8u7GDdUvyoWo34H3VNapgIt5HJQbIB1i5INi06AmwvlX/yLgQALEvGjwtCYXDY0j
 MI++Y1RkkkjFin6ALZss7xFoL3jjXAL2AFERTh8o4c2SjQUmiSZh4VodgRos/0CsldVb
 oCdiPskUumyeDwhCw3TEitHK0vhzrlZQLaY26jqD3N2jP3ireebBSU+d4PmEvWnpUYk7
 NVou18w29Cgxvliay0pxKPEZIGYV1E3XCB+VTsU+Sxk+SGY5ISRxTh/fZj1SqxJACmnu
 whxCh9hd05UObXhIBy4zj16IA99XQLTurmDQUEkG+c4LbcW7eHSOe/GQ0KmgIjCY+12d ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6695r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:20:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 635AB100039;
 Wed, 29 Apr 2020 14:20:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B30A212A73;
 Wed, 29 Apr 2020 14:20:38 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 29 Apr 2020 14:20:37 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 29 Apr 2020 14:20:30 +0200
Message-ID: <20200429122031.31279-5-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429122031.31279-1-patrice.chotard@st.com>
References: <20200429122031.31279-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_05:2020-04-29,
 2020-04-29 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 4/5] test/py: Update test_bind
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
"dm tree" output, but can be located everywwhere in the tree, so
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
---

Changes in v2: None

 test/py/tests/test_bind.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/test/py/tests/test_bind.py b/test/py/tests/test_bind.py
index 0b7cd9a808..4753c7ea7b 100644
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
