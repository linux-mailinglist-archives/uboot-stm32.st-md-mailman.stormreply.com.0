Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8411739A7
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:18:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 450B3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:18:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B876C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:18:49 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDA8p026254; Fri, 28 Feb 2020 15:18:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=o016MCT0cXu6Q8icx2nXqmigotC+2vRf73N7KH/Vtp0=;
 b=KMxUreSWxCOzmY6BXlhcWq343Ttfzp8sipv5nibKyiX4rF7lpm5kuU+d3DFml5HGwleX
 JCiQVVYNW+h1yphFZE1iRIltQYGNCUBrI5yqaMd5vfOoCchCdXu2vqoW3Z+ZLTdUFy46
 n4q/lMfFs1bo0sj+h1LNuZdZeUa4fb90sWv9d9IYxQJWD7ywWZB2w78g0N8pkkciFQfP
 921zaXTjlja+mOIhuvaEzbkRLXJ7UIjLo9KnzD9ObZ+sdUwcjZRNTRDh06PBHxvO0qN7
 GLPXvJBNG4P+cbJpEpQveh40Bx7ab8LoAB272OZF3768yQ8M1Aev6yQMso7wE4Bx05Xx sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvtvc69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 525D010003B;
 Fri, 28 Feb 2020 15:18:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30B802BF9D2;
 Fri, 28 Feb 2020 15:18:21 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:20 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:12 +0100
Message-ID: <20200228141816.1644-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228141816.1644-1-patrick.delaunay@st.com>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?q?Eddy=20Petri=C8=99or?= <eddy.petrisor@gmail.com>,
 Adrian Alonso <adrian.alonso@nxp.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Ian Ray <ian.ray@ge.com>,
 Stefano Babic <sbabic@denx.de>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Ye Li <ye.li@nxp.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Alison Wang <alison.wang@nxp.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Akshay Bhat <akshaybhat@timesys.com>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [Uboot-stm32] [PATCH 3/7] doc: update reference to README.imximage
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

Update reference in many files detected by
scripts/documentation-file-ref-check

README.imximage => imx/mkimage/imximage.txt

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/advantech/dms-ba16/dms-ba16_1g.cfg    | 2 +-
 board/advantech/dms-ba16/dms-ba16_2g.cfg    | 2 +-
 board/aristainetos/aristainetos2.cfg        | 2 +-
 board/bachmann/ot1200/mx6q_4x_mt41j128.cfg  | 2 +-
 board/barco/titanium/imximage.cfg           | 2 +-
 board/boundary/nitrogen6x/nitrogen6dl.cfg   | 2 +-
 board/boundary/nitrogen6x/nitrogen6dl2g.cfg | 2 +-
 board/boundary/nitrogen6x/nitrogen6q.cfg    | 2 +-
 board/boundary/nitrogen6x/nitrogen6q2g.cfg  | 2 +-
 board/boundary/nitrogen6x/nitrogen6s.cfg    | 2 +-
 board/boundary/nitrogen6x/nitrogen6s1g.cfg  | 2 +-
 board/ccv/xpress/imximage.cfg               | 2 +-
 board/freescale/mx25pdk/imximage.cfg        | 2 +-
 board/freescale/mx51evk/imximage.cfg        | 2 +-
 board/freescale/mx53ard/imximage_dd3.cfg    | 2 +-
 board/freescale/mx53evk/imximage.cfg        | 2 +-
 board/freescale/mx53loco/imximage.cfg       | 2 +-
 board/freescale/mx53smd/imximage.cfg        | 2 +-
 board/freescale/mx6qarm2/imximage.cfg       | 2 +-
 board/freescale/mx6qarm2/imximage_mx6dl.cfg | 2 +-
 board/freescale/mx6slevk/imximage.cfg       | 2 +-
 board/freescale/mx6ullevk/imximage.cfg      | 2 +-
 board/freescale/mx7dsabresd/imximage.cfg    | 2 +-
 board/freescale/s32v234evb/s32v234evb.cfg   | 2 +-
 board/freescale/vf610twr/imximage.cfg       | 2 +-
 board/ge/bx50v3/bx50v3.cfg                  | 2 +-
 board/ge/mx53ppd/imximage.cfg               | 2 +-
 board/menlo/m53menlo/imximage.cfg           | 2 +-
 board/phytec/pcm052/imximage.cfg            | 2 +-
 board/seco/mx6quq7/mx6quq7-2g.cfg           | 2 +-
 board/technexion/pico-imx6ul/imximage.cfg   | 2 +-
 board/toradex/colibri-imx6ull/imximage.cfg  | 2 +-
 board/toradex/colibri_imx7/imximage.cfg     | 2 +-
 board/toradex/colibri_vf/imximage.cfg       | 2 +-
 board/tqc/tqma6/clocks.cfg                  | 2 +-
 board/tqc/tqma6/tqma6dl.cfg                 | 2 +-
 board/tqc/tqma6/tqma6q.cfg                  | 2 +-
 board/tqc/tqma6/tqma6s.cfg                  | 2 +-
 board/warp/imximage.cfg                     | 2 +-
 board/warp7/imximage.cfg                    | 2 +-
 doc/imx/misc/sdp.txt                        | 2 +-
 41 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/board/advantech/dms-ba16/dms-ba16_1g.cfg b/board/advantech/dms-ba16/dms-ba16_1g.cfg
index c2624ddc3e..1c737baaf2 100644
--- a/board/advantech/dms-ba16/dms-ba16_1g.cfg
+++ b/board/advantech/dms-ba16/dms-ba16_1g.cfg
@@ -4,7 +4,7 @@
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/advantech/dms-ba16/dms-ba16_2g.cfg b/board/advantech/dms-ba16/dms-ba16_2g.cfg
index 4ce93ff74b..371a84eb7e 100644
--- a/board/advantech/dms-ba16/dms-ba16_2g.cfg
+++ b/board/advantech/dms-ba16/dms-ba16_2g.cfg
@@ -4,7 +4,7 @@
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/aristainetos/aristainetos2.cfg b/board/aristainetos/aristainetos2.cfg
index 965ad64b49..d088cc83ad 100644
--- a/board/aristainetos/aristainetos2.cfg
+++ b/board/aristainetos/aristainetos2.cfg
@@ -6,7 +6,7 @@
  * Based on:
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/bachmann/ot1200/mx6q_4x_mt41j128.cfg b/board/bachmann/ot1200/mx6q_4x_mt41j128.cfg
index ba5c074797..f4f605fc8d 100644
--- a/board/bachmann/ot1200/mx6q_4x_mt41j128.cfg
+++ b/board/bachmann/ot1200/mx6q_4x_mt41j128.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2011 Freescale Semiconductor, Inc.
  * Jason Liu <r64343@freescale.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/barco/titanium/imximage.cfg b/board/barco/titanium/imximage.cfg
index 101fc76de4..1fc26ed2c9 100644
--- a/board/barco/titanium/imximage.cfg
+++ b/board/barco/titanium/imximage.cfg
@@ -6,7 +6,7 @@
  * Copyright (C) 2011 Freescale Semiconductor, Inc.
  * Jason Liu <r64343@freescale.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/boundary/nitrogen6x/nitrogen6dl.cfg b/board/boundary/nitrogen6x/nitrogen6dl.cfg
index 56b3bcbb2f..9558e26a2f 100644
--- a/board/boundary/nitrogen6x/nitrogen6dl.cfg
+++ b/board/boundary/nitrogen6x/nitrogen6dl.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/boundary/nitrogen6x/nitrogen6dl2g.cfg b/board/boundary/nitrogen6x/nitrogen6dl2g.cfg
index 13f7a89232..f5a107c225 100644
--- a/board/boundary/nitrogen6x/nitrogen6dl2g.cfg
+++ b/board/boundary/nitrogen6x/nitrogen6dl2g.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/boundary/nitrogen6x/nitrogen6q.cfg b/board/boundary/nitrogen6x/nitrogen6q.cfg
index 1304b52d18..b0bbf0d797 100644
--- a/board/boundary/nitrogen6x/nitrogen6q.cfg
+++ b/board/boundary/nitrogen6x/nitrogen6q.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/boundary/nitrogen6x/nitrogen6q2g.cfg b/board/boundary/nitrogen6x/nitrogen6q2g.cfg
index e5e923d3cf..4999254329 100644
--- a/board/boundary/nitrogen6x/nitrogen6q2g.cfg
+++ b/board/boundary/nitrogen6x/nitrogen6q2g.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/boundary/nitrogen6x/nitrogen6s.cfg b/board/boundary/nitrogen6x/nitrogen6s.cfg
index e5f814b715..16d778491a 100644
--- a/board/boundary/nitrogen6x/nitrogen6s.cfg
+++ b/board/boundary/nitrogen6x/nitrogen6s.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/boundary/nitrogen6x/nitrogen6s1g.cfg b/board/boundary/nitrogen6x/nitrogen6s1g.cfg
index f3d754e23a..0320078a91 100644
--- a/board/boundary/nitrogen6x/nitrogen6s1g.cfg
+++ b/board/boundary/nitrogen6x/nitrogen6s1g.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Boundary Devices
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/ccv/xpress/imximage.cfg b/board/ccv/xpress/imximage.cfg
index be7e391ddb..b59dc842c1 100644
--- a/board/ccv/xpress/imximage.cfg
+++ b/board/ccv/xpress/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2015-2016 Stefan Roese <sr@denx.de>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx25pdk/imximage.cfg b/board/freescale/mx25pdk/imximage.cfg
index 209775f2fd..762ccd0ab3 100644
--- a/board/freescale/mx25pdk/imximage.cfg
+++ b/board/freescale/mx25pdk/imximage.cfg
@@ -3,7 +3,7 @@
  * (C) Copyright 2009
  * Stefano Babic DENX Software Engineering sbabic@denx.de.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx51evk/imximage.cfg b/board/freescale/mx51evk/imximage.cfg
index 75500e70f3..ff2ec4aa27 100644
--- a/board/freescale/mx51evk/imximage.cfg
+++ b/board/freescale/mx51evk/imximage.cfg
@@ -3,7 +3,7 @@
  * (C Copyright 2009
  * Stefano Babic DENX Software Engineering sbabic@denx.de.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx53ard/imximage_dd3.cfg b/board/freescale/mx53ard/imximage_dd3.cfg
index 9533dfb456..fd033187b7 100644
--- a/board/freescale/mx53ard/imximage_dd3.cfg
+++ b/board/freescale/mx53ard/imximage_dd3.cfg
@@ -3,7 +3,7 @@
  * (C) Copyright 2009
  * Stefano Babic DENX Software Engineering sbabic@denx.de.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx53evk/imximage.cfg b/board/freescale/mx53evk/imximage.cfg
index d4158daafe..ef103d6da7 100644
--- a/board/freescale/mx53evk/imximage.cfg
+++ b/board/freescale/mx53evk/imximage.cfg
@@ -3,7 +3,7 @@
  * (C Copyright 2009
  * Stefano Babic DENX Software Engineering sbabic@denx.de.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx53loco/imximage.cfg b/board/freescale/mx53loco/imximage.cfg
index db578b2cf2..d12801d19f 100644
--- a/board/freescale/mx53loco/imximage.cfg
+++ b/board/freescale/mx53loco/imximage.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2011 Freescale Semiconductor, Inc.
  * Jason Liu <r64343@freescale.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx53smd/imximage.cfg b/board/freescale/mx53smd/imximage.cfg
index 9533dfb456..fd033187b7 100644
--- a/board/freescale/mx53smd/imximage.cfg
+++ b/board/freescale/mx53smd/imximage.cfg
@@ -3,7 +3,7 @@
  * (C) Copyright 2009
  * Stefano Babic DENX Software Engineering sbabic@denx.de.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx6qarm2/imximage.cfg b/board/freescale/mx6qarm2/imximage.cfg
index b0608f3467..74a33c2503 100644
--- a/board/freescale/mx6qarm2/imximage.cfg
+++ b/board/freescale/mx6qarm2/imximage.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2011-2014 Freescale Semiconductor, Inc.
  * Jason Liu <r64343@freescale.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx6qarm2/imximage_mx6dl.cfg b/board/freescale/mx6qarm2/imximage_mx6dl.cfg
index 509c659649..0d1353119b 100644
--- a/board/freescale/mx6qarm2/imximage_mx6dl.cfg
+++ b/board/freescale/mx6qarm2/imximage_mx6dl.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2014 Freescale Semiconductor, Inc.
  * Jason Liu <r64343@freescale.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx6slevk/imximage.cfg b/board/freescale/mx6slevk/imximage.cfg
index fd71bef286..b97761a516 100644
--- a/board/freescale/mx6slevk/imximage.cfg
+++ b/board/freescale/mx6slevk/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Freescale Semiconductor, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx6ullevk/imximage.cfg b/board/freescale/mx6ullevk/imximage.cfg
index 40818d0a03..155503997d 100644
--- a/board/freescale/mx6ullevk/imximage.cfg
+++ b/board/freescale/mx6ullevk/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2016 Freescale Semiconductor, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/mx7dsabresd/imximage.cfg b/board/freescale/mx7dsabresd/imximage.cfg
index a0f39c4062..05446ac833 100644
--- a/board/freescale/mx7dsabresd/imximage.cfg
+++ b/board/freescale/mx7dsabresd/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2015 Freescale Semiconductor, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/s32v234evb/s32v234evb.cfg b/board/freescale/s32v234evb/s32v234evb.cfg
index 526b7d177f..7881512139 100644
--- a/board/freescale/s32v234evb/s32v234evb.cfg
+++ b/board/freescale/s32v234evb/s32v234evb.cfg
@@ -4,7 +4,7 @@
  */
 
 /*
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/freescale/vf610twr/imximage.cfg b/board/freescale/vf610twr/imximage.cfg
index b1a8e8ef06..e2fa1a582d 100644
--- a/board/freescale/vf610twr/imximage.cfg
+++ b/board/freescale/vf610twr/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2013 Freescale Semiconductor, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/ge/bx50v3/bx50v3.cfg b/board/ge/bx50v3/bx50v3.cfg
index f872ea24fc..de3955a94d 100644
--- a/board/ge/bx50v3/bx50v3.cfg
+++ b/board/ge/bx50v3/bx50v3.cfg
@@ -4,7 +4,7 @@
  * Copyright 2015 Timesys Corporation.
  * Copyright 2015 General Electric Company
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/ge/mx53ppd/imximage.cfg b/board/ge/mx53ppd/imximage.cfg
index 8dd1b0f979..1ee8198390 100644
--- a/board/ge/mx53ppd/imximage.cfg
+++ b/board/ge/mx53ppd/imximage.cfg
@@ -7,7 +7,7 @@
  * Copyright (C) 2011 Freescale Semiconductor, Inc.
  * Jason Liu <r64343@freescale.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/menlo/m53menlo/imximage.cfg b/board/menlo/m53menlo/imximage.cfg
index 68b3eb5c1c..282caf65e0 100644
--- a/board/menlo/m53menlo/imximage.cfg
+++ b/board/menlo/m53menlo/imximage.cfg
@@ -3,7 +3,7 @@
  * M53 DRAM init values
  * Copyright (C) 2012-2013 Marek Vasut <marex@denx.de>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/phytec/pcm052/imximage.cfg b/board/phytec/pcm052/imximage.cfg
index d25f611942..cf72b84e77 100644
--- a/board/phytec/pcm052/imximage.cfg
+++ b/board/phytec/pcm052/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2015 3ADEV <http://www.3adev.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/seco/mx6quq7/mx6quq7-2g.cfg b/board/seco/mx6quq7/mx6quq7-2g.cfg
index c48d64ba40..68d13cc92b 100644
--- a/board/seco/mx6quq7/mx6quq7-2g.cfg
+++ b/board/seco/mx6quq7/mx6quq7-2g.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Seco USA Inc
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/technexion/pico-imx6ul/imximage.cfg b/board/technexion/pico-imx6ul/imximage.cfg
index ad9cc5a8f1..993c1da670 100644
--- a/board/technexion/pico-imx6ul/imximage.cfg
+++ b/board/technexion/pico-imx6ul/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2015 Freescale Semiconductor, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/toradex/colibri-imx6ull/imximage.cfg b/board/toradex/colibri-imx6ull/imximage.cfg
index a11e288c6c..8d869d9f79 100644
--- a/board/toradex/colibri-imx6ull/imximage.cfg
+++ b/board/toradex/colibri-imx6ull/imximage.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2018 Toradex AG
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/toradex/colibri_imx7/imximage.cfg b/board/toradex/colibri_imx7/imximage.cfg
index 1b4f272bb6..bdce48b7ff 100644
--- a/board/toradex/colibri_imx7/imximage.cfg
+++ b/board/toradex/colibri_imx7/imximage.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2015 Freescale Semiconductor, Inc.
  *               2015 Toradex AG
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/toradex/colibri_vf/imximage.cfg b/board/toradex/colibri_vf/imximage.cfg
index 623371d069..7e629d2f9e 100644
--- a/board/toradex/colibri_vf/imximage.cfg
+++ b/board/toradex/colibri_vf/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright 2014 Toradex, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/tqc/tqma6/clocks.cfg b/board/tqc/tqma6/clocks.cfg
index a98b30bfe7..1f2001c75f 100644
--- a/board/tqc/tqma6/clocks.cfg
+++ b/board/tqc/tqma6/clocks.cfg
@@ -3,7 +3,7 @@
  * Copyright (C) 2013 Boundary Devices
  * Copyright (C) 2013, 2014 Markus Niebel <Markus.Niebel@tq-group.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  */
 
diff --git a/board/tqc/tqma6/tqma6dl.cfg b/board/tqc/tqma6/tqma6dl.cfg
index 84c38b470b..80c7150316 100644
--- a/board/tqc/tqma6/tqma6dl.cfg
+++ b/board/tqc/tqma6/tqma6dl.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2014 - 2015 Markus Niebel <Markus.Niebel@tq-group.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/tqc/tqma6/tqma6q.cfg b/board/tqc/tqma6/tqma6q.cfg
index 6141be673b..82a0a271d4 100644
--- a/board/tqc/tqma6/tqma6q.cfg
+++ b/board/tqc/tqma6/tqma6q.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013, 2014 Markus Niebel <Markus.Niebel@tq-group.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/tqc/tqma6/tqma6s.cfg b/board/tqc/tqma6/tqma6s.cfg
index 2d2d65ecc6..9cdbb3c767 100644
--- a/board/tqc/tqma6/tqma6s.cfg
+++ b/board/tqc/tqma6/tqma6s.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013, 2014 Markus Niebel <Markus.Niebel@tq-group.com>
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/warp/imximage.cfg b/board/warp/imximage.cfg
index dea331cab1..619f6aa7b0 100644
--- a/board/warp/imximage.cfg
+++ b/board/warp/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Freescale Semiconductor, Inc.
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/board/warp7/imximage.cfg b/board/warp7/imximage.cfg
index a4c2f677a1..9e7d4725e4 100644
--- a/board/warp7/imximage.cfg
+++ b/board/warp7/imximage.cfg
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2016 NXP Semiconductors
  *
- * Refer doc/README.imximage for more details about how-to configure
+ * Refer doc/imx/mkimage/imximage.txt for more details about how-to configure
  * and create imximage boot image
  *
  * The syntax is taken as close as possible with the kwbimage
diff --git a/doc/imx/misc/sdp.txt b/doc/imx/misc/sdp.txt
index 6ea6e41395..49b281234b 100644
--- a/doc/imx/misc/sdp.txt
+++ b/doc/imx/misc/sdp.txt
@@ -22,7 +22,7 @@ described in the manual. It is a replacement for Freescale's
 MFGTOOLS.
 
 The host side utilities are typically capable to interpret the i.MX
-specific image header (see doc/README.imximage). There are extensions
+specific image header (see doc/imx/mkimage/imximage.txt). There are extensions
 for imx_loader's imx_usb utility which allow to interpret the U-Boot
 specific legacy image format (see mkimage(1)). Also the U-Boot side
 support beside the i.MX specific header the U-Boot legacy header.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
