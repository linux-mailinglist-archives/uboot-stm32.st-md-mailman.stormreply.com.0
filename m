Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 038731089C1
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 09:08:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3E26C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 08:08:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29649C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:08:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP7vINr017841; Mon, 25 Nov 2019 09:07:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=akw5T17kfYpZxV2czNEG7o3TMxzy9exhGUBGXDlJQu0=;
 b=T3tXAQJ2k1YPmABOAVUnbi3crfvRngwaLlDZHO65cXoMP8PblcddaWk7Ujpti0mmY/pD
 buD6zxN5wUfHv5guUbKt0n9daUesx7IBLnfl103Vna7UAskOL4XMr2Asacr80szbjZuN
 IlV5Rq01XsCS8Rekx2KopIa6mmbBWFhUAWY64yHRbXWYqY9ofcsv+aOB01a1G6+On/iC
 /QMv/gUK/IxXHP0WXJWT+5CuNWPrlgvUB5Xscw+UV3YzZgrzXpCBxRJttDN0e7HD9cTx
 SyikCqEteN4rAFjZBm2qwu4cWAbJtVjtQS4eets2oxQbDYge3ibX8hbP7lUzMFMBJHJc xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9fu88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:07:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8712100034;
 Mon, 25 Nov 2019 09:07:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 836862AC062;
 Mon, 25 Nov 2019 09:07:45 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 09:07:45 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 09:07:35 +0100
Message-ID: <20191125080741.2215-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ismael Luceno Cortes <ismael.luceno@silicon-gears.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 Frank Wunderlich <frank-w@public-files.de>, Adam Ford <aford173@gmail.com>,
 Anatolij Gustschin <agust@denx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <anup.patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Michael Walle <michael@walle.cc>, Faiz Abbas <faiz_abbas@ti.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 0/6] cmd: remove NET and CMD_NET dependency
	for CMD_PXE
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


It allows to use sysboot command on board which have no NET support.

Currently, sysboot command can't be used if CMD_NET and NET flags are
not set, while sysboot allows to load extlinux.conf file from local
filesystem, so it doesn't need to depend of CMD_NET and NET flags.

  - Move from_env() from pxe.c to nvedit.c.
  - As sysboot and pxe commands are sharing piece of code, put this common
    code into a new file pxe_utils.c.
  - Extract sysboot command's code outside pxe.c and create a new sysboot.c
    file.
  - Fix some checkpatch issues.


Patrice Chotard (6):
  cmd: Migrate from_env() from pxe.c to nvedit.c
  cmd: Prepare sysboot command independence
  cmd: sysboot: Create a sysboot command dedicated file
  cmd: pxe_utils: Fix checkpatch WARNING/CHECK
  cmd: sysboot: Fix checkpatch WARNING/CHECK
  cmd: pxe: Fix checkpatch WARNING/CHECK

 Kconfig         |    1 +
 cmd/Kconfig     |    6 +
 cmd/Makefile    |    3 +-
 cmd/nvedit.c    |   17 +
 cmd/pxe.c       | 1730 ++---------------------------------------------
 cmd/pxe_utils.c | 1413 ++++++++++++++++++++++++++++++++++++++
 cmd/pxe_utils.h |   90 +++
 cmd/sysboot.c   |  134 ++++
 include/env.h   |   10 +
 9 files changed, 1726 insertions(+), 1678 deletions(-)
 create mode 100644 cmd/pxe_utils.c
 create mode 100644 cmd/pxe_utils.h
 create mode 100644 cmd/sysboot.c

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
