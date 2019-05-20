Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C009A236A8
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88848C0D2B0
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5889BC0D2A8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCfBc3021280; Mon, 20 May 2019 15:00:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=95DBH2RubnFhuJUz28UYLtFELaoKDndK10ojj9M2Cqc=;
 b=LQeVZfw0dBpm//MXI/c+g6+YUqBzbj66DeyNVwbhPQ1m2tGRxQGqDVtLv6FfQ28L6csI
 kgaXkagLVqKVQY5+uFzP2N+Lx9XYNHQJDPiGQ3Ipt1Iq4b0JYr9XMWj0uI2flEuGilgs
 4HI+vHMX/nhqvruJffMjsyp04pdRpteSWxO7iNez2XgH/ScGnjdR3Aubf2vSPasxxWvE
 n9wEWhvfw2I6D0E+AERiTxK7qaJ2pdnp7SlHwN5H3e4soM7u5fnV0YkWyMh4j0WNlK5J
 R8/UIiZO3Oc4rekzuGHZ691fwpSjcaupmnPAdeEaKRSaVqTqiCzeJYGX6+FgxrdwBGgB qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttukvr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8D4C31;
 Mon, 20 May 2019 13:00:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A11E3288F;
 Mon, 20 May 2019 13:00:18 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:18 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:18
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:03 +0200
Message-ID: <1558357207-7345-5-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Igor Opaniuk <igor.opaniuk@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Paul Burton <paul.burton@mips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 4/8] test: py: add option to select device
	tree used during compilation
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

Only used for spl compilation which include the device tree
(with platdata or embedded device tree).
For U-boot, test use config.dtb, by default :
   "build_dir + '/arch/sandbox/dts/test.dtb'"

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
I need to force o_dt = 'all' to avoid make error:

make: *** empty string invalid as file name.  Stop.

But, I don't sure that it is the better solution for pytest.


Changes in v2:
- add a new test option: device tree used for compilation

 test/py/conftest.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/test/py/conftest.py b/test/py/conftest.py
index 00d8ef8..c1fe2a8 100644
--- a/test/py/conftest.py
+++ b/test/py/conftest.py
@@ -74,6 +74,8 @@ def pytest_addoption(parser):
         help='U-Boot board identity/instance')
     parser.addoption('--build', default=False, action='store_true',
         help='Compile U-Boot before running tests')
+    parser.addoption('--device-tree', default=None,
+        help='Device tree used to compile U-Boot')
     parser.addoption('--gdbserver', default=None,
         help='Run sandbox under gdbserver. The argument is the channel '+
         'over which gdbserver should communicate, e.g. localhost:1234')
@@ -101,6 +103,8 @@ def pytest_configure(config):
     board_identity = config.getoption('board_identity')
     board_identity_filename = board_identity.replace('-', '_')
 
+    device_tree = config.getoption('device_tree')
+
     build_dir = config.getoption('build_dir')
     if not build_dir:
         build_dir = source_dir + '/build-' + board_type
@@ -128,9 +132,15 @@ def pytest_configure(config):
             o_opt = 'O=%s' % build_dir
         else:
             o_opt = ''
+
+        if device_tree:
+            o_dt = 'DEVICE_TREE=%s' % device_tree
+        else:
+            o_dt = 'all'
+
         cmds = (
             ['make', o_opt, '-s', board_type + '_defconfig'],
-            ['make', o_opt, '-s', '-j8'],
+            ['make', o_opt, o_dt, '-s', '-j8'],
         )
         with log.section('make'):
             runner = log.get_runner('make', sys.stdout)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
