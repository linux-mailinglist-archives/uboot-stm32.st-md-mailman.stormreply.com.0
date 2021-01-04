Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E042E9959
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Jan 2021 17:01:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 562CCC56632;
	Mon,  4 Jan 2021 16:01:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5733AC32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 16:01:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104FviDr002906; Mon, 4 Jan 2021 17:00:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=vwxPnuAKsdOvKMyMNbKHaPHCSd6rrANQjaGbIDiDHp4=;
 b=ZLtJbbOvyFPwlqDvYiwVxJYnELRiv0+mo4VFc8OLjFK8DWItll++/hC0rnLpiMcQxUF7
 sUdPWB1xLTdPBo9eULnUS3Rtb2dD97ykq6MpI1mv+Ec/BIS8Lxpy4auxOK6/7ysO52fq
 7i2MpH1q1y+cfWF+FxtR25h6zi7oPjdVBccK8ZooQFdMcU6UM7qE+Sg/bHh9MW5Mr8nT
 jGFPvzDXogrAwbyVke4FVZBY6oUcgdwIFyjQbESSPj//QYvr9UY0eAUptiJDdaJqN8zp
 4XfsWuR6utdLeAXZAH/Z54LBOfxKvpWUa0iM79+bLVMVBD72g7KjP0DcOnd8bG9Tnx43 Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuuu7a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 17:00:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D85C510002A;
 Mon,  4 Jan 2021 17:00:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB709225EA4;
 Mon,  4 Jan 2021 17:00:58 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Jan 2021 17:00:58
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Jan 2021 17:00:56 +0100
Message-ID: <20210104160056.4271-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_10:2021-01-04,
 2021-01-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: Update STi and STM32 maintainers
	emails in remaining files
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

A previous series already update STMicroelectronics emails maintainers
but some files have been omitted (Makefile, .dts, .dtsi and .rst files).
Update Patrick and my email address with the one dedicated to upstream
activities.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stih410-b2260-u-boot.dtsi    | 2 +-
 arch/arm/dts/stih410-b2260.dts            | 2 +-
 arch/arm/dts/stm32429i-eval-u-boot.dtsi   | 2 +-
 arch/arm/dts/stm32f429-disco-u-boot.dtsi  | 2 +-
 arch/arm/dts/stm32f469-disco-u-boot.dtsi  | 2 +-
 arch/arm/dts/stm32h743i-disco.dts         | 2 +-
 board/st/common/MAINTAINERS               | 2 +-
 board/st/stih410-b2260/MAINTAINERS        | 2 +-
 board/st/stih410-b2260/Makefile           | 2 +-
 board/st/stm32f429-evaluation/MAINTAINERS | 2 +-
 board/st/stm32f429-evaluation/Makefile    | 2 +-
 board/st/stm32f469-discovery/MAINTAINERS  | 2 +-
 board/st/stm32f469-discovery/Makefile     | 2 +-
 board/st/stm32h743-disco/MAINTAINERS      | 2 +-
 board/st/stm32h743-disco/Makefile         | 2 +-
 board/st/stm32h743-eval/MAINTAINERS       | 2 +-
 board/st/stm32h743-eval/Makefile          | 2 +-
 board/st/stm32mp1/MAINTAINERS             | 2 +-
 doc/board/st/stm32mp1.rst                 | 2 +-
 doc/driver-model/bind.rst                 | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/dts/stih410-b2260-u-boot.dtsi b/arch/arm/dts/stih410-b2260-u-boot.dtsi
index 897c42146a..3b080ac7a1 100644
--- a/arch/arm/dts/stih410-b2260-u-boot.dtsi
+++ b/arch/arm/dts/stih410-b2260-u-boot.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  *
  */
 
diff --git a/arch/arm/dts/stih410-b2260.dts b/arch/arm/dts/stih410-b2260.dts
index 4fbd8e9eb5..8c4155b622 100644
--- a/arch/arm/dts/stih410-b2260.dts
+++ b/arch/arm/dts/stih410-b2260.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2016 STMicroelectronics (R&D) Limited.
- * Author: Patrice Chotard <patrice.chotard@st.com>
+ * Author: Patrice Chotard <patrice.chotard@foss.st.com>
  */
 /dts-v1/;
 #include "stih410.dtsi"
diff --git a/arch/arm/dts/stm32429i-eval-u-boot.dtsi b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
index e75cf99f8f..09d9d9ab9b 100644
--- a/arch/arm/dts/stm32429i-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <dt-bindings/memory/stm32-sdram.h>
diff --git a/arch/arm/dts/stm32f429-disco-u-boot.dtsi b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
index df99e01393..297cc56144 100644
--- a/arch/arm/dts/stm32f429-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <dt-bindings/memory/stm32-sdram.h>
diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index 7223ba4a60..9eda8f535b 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
  */
 
 #include <dt-bindings/memory/stm32-sdram.h>
diff --git a/arch/arm/dts/stm32h743i-disco.dts b/arch/arm/dts/stm32h743i-disco.dts
index 81007161e7..7927310d8e 100644
--- a/arch/arm/dts/stm32h743i-disco.dts
+++ b/arch/arm/dts/stm32h743i-disco.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+ OR X11
 /*
- * Copyright 2017 - Patrice Chotard <patrice.chotard@st.com>
+ * Copyright 2017 - Patrice Chotard <patrice.chotard@foss.st.com>
  *
  */
 
diff --git a/board/st/common/MAINTAINERS b/board/st/common/MAINTAINERS
index 3b02f4ab98..c4e0c5fd94 100644
--- a/board/st/common/MAINTAINERS
+++ b/board/st/common/MAINTAINERS
@@ -1,5 +1,5 @@
 ST BOARDS
-M:	Patrick Delaunay <patrick.delaunay@st.com>
+M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
diff --git a/board/st/stih410-b2260/MAINTAINERS b/board/st/stih410-b2260/MAINTAINERS
index 4f557ac7d9..6fa625507b 100644
--- a/board/st/stih410-b2260/MAINTAINERS
+++ b/board/st/stih410-b2260/MAINTAINERS
@@ -1,5 +1,5 @@
 STIH410-B2260 BOARD
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
 F:	board/st/stih410-b2260/
 F:	include/configs/stih410-b2260.h
diff --git a/board/st/stih410-b2260/Makefile b/board/st/stih410-b2260/Makefile
index dc3e1d3959..ea573ca145 100644
--- a/board/st/stih410-b2260/Makefile
+++ b/board/st/stih410-b2260/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
 # Copyright (C) 2017, STMicroelectronics - All Rights Reserved
-# Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+# Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
 
 obj-y	= board.o
diff --git a/board/st/stm32f429-evaluation/MAINTAINERS b/board/st/stm32f429-evaluation/MAINTAINERS
index 8b7b312eee..29d00ef27e 100644
--- a/board/st/stm32f429-evaluation/MAINTAINERS
+++ b/board/st/stm32f429-evaluation/MAINTAINERS
@@ -1,5 +1,5 @@
 STM32F429-EVALUATION BOARD
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
 F:	board/st/stm32f429-evaluation/
 F:	include/configs/stm32f429-evaluation.h
diff --git a/board/st/stm32f429-evaluation/Makefile b/board/st/stm32f429-evaluation/Makefile
index 8bf9e1f6d8..109fba876b 100644
--- a/board/st/stm32f429-evaluation/Makefile
+++ b/board/st/stm32f429-evaluation/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
 # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
-# Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+# Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
 
 obj-y	:= stm32f429-evaluation.o
diff --git a/board/st/stm32f469-discovery/MAINTAINERS b/board/st/stm32f469-discovery/MAINTAINERS
index d3c791a5f5..5a6a78b39e 100644
--- a/board/st/stm32f469-discovery/MAINTAINERS
+++ b/board/st/stm32f469-discovery/MAINTAINERS
@@ -1,5 +1,5 @@
 STM32F469-DISCOVERY BOARD
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
 F:	board/st/stm32f469-discovery/
 F:	include/configs/stm32f469-discovery.h
diff --git a/board/st/stm32f469-discovery/Makefile b/board/st/stm32f469-discovery/Makefile
index 249835b122..45480b72c5 100644
--- a/board/st/stm32f469-discovery/Makefile
+++ b/board/st/stm32f469-discovery/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
 # Copyright (C) STMicroelectronics SA 2017
-# Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+# Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
 
 obj-y	:= stm32f469-discovery.o
diff --git a/board/st/stm32h743-disco/MAINTAINERS b/board/st/stm32h743-disco/MAINTAINERS
index e5e0b5a6f2..60fbe344f8 100644
--- a/board/st/stm32h743-disco/MAINTAINERS
+++ b/board/st/stm32h743-disco/MAINTAINERS
@@ -1,5 +1,5 @@
 STM32H743 DISCOVERY BOARD
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
 F:	board/st/stm32h743-disco
 F:	include/configs/stm32h743-disco.h
diff --git a/board/st/stm32h743-disco/Makefile b/board/st/stm32h743-disco/Makefile
index 8fe7a2d6ff..b6c22be1ea 100644
--- a/board/st/stm32h743-disco/Makefile
+++ b/board/st/stm32h743-disco/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
 # Copyright (C) 2017, STMicroelectronics - All Rights Reserved
-# Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+# Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
 
 obj-y	:= stm32h743-disco.o
diff --git a/board/st/stm32h743-eval/MAINTAINERS b/board/st/stm32h743-eval/MAINTAINERS
index 3029c56023..fda93db777 100644
--- a/board/st/stm32h743-eval/MAINTAINERS
+++ b/board/st/stm32h743-eval/MAINTAINERS
@@ -1,5 +1,5 @@
 STM32H743 EVALUATION BOARD
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
 F:	board/st/stm32h743-eval
 F:	include/configs/stm32h743-eval.h
diff --git a/board/st/stm32h743-eval/Makefile b/board/st/stm32h743-eval/Makefile
index 88b59fda0d..86ef19fc36 100644
--- a/board/st/stm32h743-eval/Makefile
+++ b/board/st/stm32h743-eval/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
 # Copyright (C) 2017, STMicroelectronics - All Rights Reserved
-# Author(s): Patrice CHOTARD, <patrice.chotard@st.com> for STMicroelectronics.
+# Author(s): Patrice CHOTARD, <patrice.chotard@foss.st.com> for STMicroelectronics.
 
 obj-y	:= stm32h743-eval.o
diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index 96c4559033..bd5c07da34 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -1,5 +1,5 @@
 STM32MP1 BOARD
-M:	Patrick Delaunay <patrick.delaunay@st.com>
+M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index e74f7afdae..20f5c9e301 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -1,5 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-.. sectionauthor:: Patrick Delaunay <patrick.delaunay@st.com>
+.. sectionauthor:: Patrick Delaunay <patrick.delaunay@foss.st.com>
 
 STM32MP15x boards
 =================
diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
index e3e9cb4d3c..b19661b5fe 100644
--- a/doc/driver-model/bind.rst
+++ b/doc/driver-model/bind.rst
@@ -1,5 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0+
-.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
+.. sectionauthor:: Patrice Chotard <patrice.chotard@foss.st.com>
 
 Binding/unbinding a driver
 ==========================
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
