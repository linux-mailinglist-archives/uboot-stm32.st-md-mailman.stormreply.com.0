Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8420E284B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Oct 2020 13:54:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47E46C36B37;
	Tue,  6 Oct 2020 11:54:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8AFEC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 11:54:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 096BmLPR027484; Tue, 6 Oct 2020 13:54:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=btqMeTAFQb+M7xw3ZOXnWiRjBi74uC8BAYyBwSt9A6A=;
 b=OkgX+FLv7PnjUQijkm/5aUQjDvv34rhc5aNIlJ+PRGLEmfPq0xtzg8Z7HPe5mxmxcXBj
 VGgkjksYJ6Pb96WiG0vrkjdkFscdbEe5OJf0vOZ9ste1tNDj8Gbz/5GivrxlaKf++VBR
 HYSWzKzUlSjvumA/ch4s1KhI9G5A4+A5yxYi8ii6QHRKR2QbhYZH8t7CNlc8Po6YWGvF
 laMLKH6Xul0/wCe7U46FxNgn2wFCCwcM7TtD89PgGx52Iwkvy2weq37jYG7XCqAStI1K
 qXEjvSGPRz8R8htbIW9rLWXPHz/2kJn/x9Yww5l/2foyKu9BRSnZaVb43hZimqgqI4J/ 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjebv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 13:54:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F31910002A;
 Tue,  6 Oct 2020 13:54:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D623F2AD2BC;
 Tue,  6 Oct 2020 13:54:00 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct 2020 13:53:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Oct 2020 13:52:26 +0200
Message-ID: <20201006115227.19060-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_03:2020-10-06,
 2020-10-06 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Jway Lin <jway.lin@cortina-access.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: Add STM32MP1 RNG driver in
	stm32mp platform
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

Add the STM32MP1 RNG driver in the list of drivers supported by
the STMicroelectronics STM32MP15x series.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85babd1908..8628ffd2a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -430,6 +430,7 @@ F:	drivers/power/regulator/stpmic1.c
 F:	drivers/ram/stm32mp1/
 F:	drivers/remoteproc/stm32_copro.c
 F:	drivers/reset/stm32-reset.c
+F:	drivers/rng/stm32mp1_rng.c
 F:	drivers/rtc/stm32_rtc.c
 F:	drivers/serial/serial_stm32.*
 F:	drivers/spi/stm32_qspi.c
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
